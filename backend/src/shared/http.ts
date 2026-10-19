import { NextFunction, Request, Response } from 'express';

export class HttpError extends Error {
    constructor(public status: number, message: string) {
        super(message);
    }
}

export const badRequest = (m: string) => new HttpError(400, m);
export const unauthorized = (m = 'Bạn cần đăng nhập.') => new HttpError(401, m);
export const forbidden = (m = 'Chỉ dành cho quản trị viên.') => new HttpError(403, m);
export const notFound = (m: string) => new HttpError(404, m);
export const conflict = (m: string) => new HttpError(409, m);

export function parseId(value: unknown, label = 'id'): number {
    const n = Number(value);
    if (!Number.isInteger(n) || n <= 0) throw badRequest(`${label} không hợp lệ.`);
    return n;
}

export function errorHandler(err: unknown, _req: Request, res: Response, _next: NextFunction): void {
    if (err instanceof HttpError) {
        res.status(err.status).json({ message: err.message });
        return;
    }
    const message = err instanceof Error ? err.message : String(err);
    console.error('Lỗi server:', message);
    res.status(500).json({ message: 'Lỗi máy chủ.' });
}
