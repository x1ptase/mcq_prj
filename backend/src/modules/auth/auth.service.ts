import { badRequest, conflict, unauthorized } from '../../shared/http';
import { hashPassword, verifyPassword } from './auth.crypto';
import * as repo from './auth.repository';
import { AuthUser } from './auth.types';

const USERNAME_RE = /^[A-Za-z0-9_.-]{3,30}$/;

export async function register(username: unknown, password: unknown): Promise<AuthUser> {
    if (typeof username !== 'string' || !USERNAME_RE.test(username)) {
        throw badRequest('Tên đăng nhập 3-30 ký tự (chữ, số, _ . -).');
    }
    if (typeof password !== 'string' || password.length < 6 || password.length > 100) {
        throw badRequest('Mật khẩu phải từ 6 đến 100 ký tự.');
    }
    if (await repo.findByUsername(username)) throw conflict('Tên đăng nhập đã tồn tại.');
    const id = await repo.insertUser(username, hashPassword(password));
    return { id, username, role: 'user' };
}

export async function login(username: unknown, password: unknown): Promise<AuthUser> {
    if (typeof username !== 'string' || typeof password !== 'string') {
        throw badRequest('Thiếu tên đăng nhập hoặc mật khẩu.');
    }
    const user = await repo.findByUsername(username);
    if (!user || !verifyPassword(password, user.password_hash)) {
        throw unauthorized('Sai tên đăng nhập hoặc mật khẩu.');
    }
    return { id: user.id, username: user.username, role: user.role };
}

// Tạo tài khoản admin lúc khởi động nếu chưa có admin nào
export async function ensureAdmin(): Promise<void> {
    const username = process.env.ADMIN_USERNAME;
    const password = process.env.ADMIN_PASSWORD;
    if (await repo.hasAdmin()) return;
    if (!username || !password) {
        console.warn('[WARN] Chưa có admin. Đặt ADMIN_USERNAME và ADMIN_PASSWORD để tạo tài khoản admin đầu tiên.');
        return;
    }
    await repo.upsertAdmin(username, hashPassword(password));
    console.log(`[INFO] Đã tạo/nâng quyền admin: ${username}`);
}
