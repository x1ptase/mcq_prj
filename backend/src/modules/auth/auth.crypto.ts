import crypto from 'crypto';
import { SESSION_DAYS, SESSION_SECRET } from '../../config/env';

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

export function createToken(userId: number): string {
    const payload = Buffer.from(JSON.stringify({
        uid: userId,
        exp: Date.now() + SESSION_DAYS * 24 * 3600 * 1000
    })).toString('base64url');
    return `${payload}.${sign(payload)}`;
}

export function readToken(token: string): number | null {
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
