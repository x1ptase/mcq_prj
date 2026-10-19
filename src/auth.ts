import crypto from 'crypto';
import { NextFunction, Request, Response } from 'express';
import { getPool, sql } from './db';
import { SESSION_DAYS, SESSION_SECRET } from './config';

export interface AuthUser {
    id: number;
    username: string;
    role: 'user' | 'admin';
}

const COOKIE = 'sid';
const secret = SESSION_SECRET || crypto.randomBytes(32).toString('hex');
if (!SESSION_SECRET) {
    console.warn('[WARN] Chưa đặt SESSION_SECRET: phiên đăng nhập sẽ mất khi restart server.');
}

// ===== Mật khẩu (scrypt) =====
export function hashPassword(password: string): string {
    const salt = crypto.randomBytes(16);
    const key = crypto.scryptSync(password, salt, 64);
    return `${salt.toString('hex')}:${key.toString('hex')}`;
}

export function verifyPassword(password: string, stored: string): boolean {
    const [saltHex, keyHex] = stored.split(':');
    if (!saltHex || !keyHex) return false;
    const expected = Buffer.from(keyHex, 'hex');
    const actual = crypto.scryptSync(password, Buffer.from(saltHex, 'hex'), expected.length);
    return crypto.timingSafeEqual(actual, expected);
}

// ===== Token phiên: base64url(payload).hmac =====
function sign(data: string): string {
    return crypto.createHmac('sha256', secret).update(data).digest('base64url');
}

function createToken(userId: number): string {
    const payload = Buffer.from(JSON.stringify({
        uid: userId,
        exp: Date.now() + SESSION_DAYS * 24 * 3600 * 1000
    })).toString('base64url');
    return `${payload}.${sign(payload)}`;
}

function readToken(token: string): number | null {
    const [payload, sig] = token.split('.');
    if (!payload || !sig) return null;
    const expected = Buffer.from(sign(payload));
    const given = Buffer.from(sig);
    if (expected.length !== given.length || !crypto.timingSafeEqual(expected, given)) return null;
    try {
        const { uid, exp } = JSON.parse(Buffer.from(payload, 'base64url').toString());
        return typeof uid === 'number' && typeof exp === 'number' && exp > Date.now() ? uid : null;
    } catch {
        return null;
    }
}

function parseCookies(header: string | undefined): Record<string, string> {
    const out: Record<string, string> = {};
    for (const part of (header ?? '').split(';')) {
        const i = part.indexOf('=');
        if (i > 0) out[part.slice(0, i).trim()] = decodeURIComponent(part.slice(i + 1).trim());
    }
    return out;
}

export function setSession(res: Response, userId: number): void {
    res.cookie(COOKIE, createToken(userId), {
        httpOnly: true,
        sameSite: 'lax',
        maxAge: SESSION_DAYS * 24 * 3600 * 1000
    });
}

export function clearSession(res: Response): void {
    res.clearCookie(COOKIE);
}

// ===== Middleware =====
// Gắn res.locals.user nếu có phiên hợp lệ (không chặn request)
export async function loadUser(req: Request, res: Response, next: NextFunction): Promise<void> {
    const token = parseCookies(req.headers.cookie)[COOKIE];
    const uid = token ? readToken(token) : null;
    if (uid !== null) {
        const pool = await getPool();
        const r = await pool.request().input('id', sql.Int, uid)
            .query<AuthUser>('SELECT id, username, role FROM Users WHERE id = @id');
        if (r.recordset[0]) res.locals.user = r.recordset[0];
    }
    next();
}

export function currentUser(res: Response): AuthUser | undefined {
    return res.locals.user;
}

export function requireAuth(_req: Request, res: Response, next: NextFunction): void {
    if (!currentUser(res)) { res.status(401).json({ message: 'Bạn cần đăng nhập.' }); return; }
    next();
}

export function requireAdmin(_req: Request, res: Response, next: NextFunction): void {
    const user = currentUser(res);
    if (!user) { res.status(401).json({ message: 'Bạn cần đăng nhập.' }); return; }
    if (user.role !== 'admin') { res.status(403).json({ message: 'Chỉ dành cho quản trị viên.' }); return; }
    next();
}

// Tạo tài khoản admin lúc khởi động nếu chưa có admin nào
export async function ensureAdmin(): Promise<void> {
    const username = process.env.ADMIN_USERNAME;
    const password = process.env.ADMIN_PASSWORD;
    const pool = await getPool();
    const has = await pool.request().query("SELECT TOP 1 id FROM Users WHERE role = 'admin'");
    if (has.recordset.length > 0) return;
    if (!username || !password) {
        console.warn('[WARN] Chưa có admin. Đặt ADMIN_USERNAME và ADMIN_PASSWORD để tạo tài khoản admin đầu tiên.');
        return;
    }
    await pool.request()
        .input('u', sql.NVarChar, username)
        .input('p', sql.VarChar, hashPassword(password))
        .query(`IF EXISTS (SELECT 1 FROM Users WHERE username = @u)
                    UPDATE Users SET role = 'admin' WHERE username = @u
                ELSE
                    INSERT INTO Users (username, password_hash, role) VALUES (@u, @p, 'admin')`);
    console.log(`[INFO] Đã tạo/nâng quyền admin: ${username}`);
}
