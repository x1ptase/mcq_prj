import { NextFunction, Request, Response } from 'express';
import { SESSION_DAYS } from '../../config/env';
import { forbidden, unauthorized } from '../../shared/http';
import { createToken, readToken } from './auth.crypto';
import * as repo from './auth.repository';
import { AuthUser } from './auth.types';

const COOKIE = 'sid';

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

// Gắn res.locals.user nếu có phiên hợp lệ (không chặn request)
export async function loadUser(req: Request, res: Response, next: NextFunction): Promise<void> {
    const token = parseCookies(req.headers.cookie)[COOKIE];
    const uid = token ? readToken(token) : null;
    if (uid !== null) {
        const user = await repo.findById(uid);
        if (user) res.locals.user = user;
    }
    next();
}

export function currentUser(res: Response): AuthUser | undefined {
    return res.locals.user;
}

export function requireAuth(_req: Request, res: Response, next: NextFunction): void {
    if (!currentUser(res)) throw unauthorized();
    next();
}

export function requireAdmin(_req: Request, res: Response, next: NextFunction): void {
    const user = currentUser(res);
    if (!user) throw unauthorized();
    if (user.role !== 'admin') throw forbidden();
    next();
}
