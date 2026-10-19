import sql from 'mssql';

export const dbConfig: sql.config = {
    user: process.env.DB_USER ?? 'sa',
    password: process.env.DB_PASSWORD ?? '12345Aa@',
    server: process.env.DB_SERVER ?? 'localhost',
    database: process.env.DB_NAME ?? 'quiz_db',
    options: { encrypt: true, trustServerCertificate: true }
};

export const PORT = Number(process.env.PORT ?? 3000);

// Không đặt SESSION_SECRET thì mọi phiên đăng nhập sẽ mất khi restart server.
export const SESSION_SECRET = process.env.SESSION_SECRET ?? '';
export const SESSION_DAYS = 7;

// Thư mục build của frontend (phục vụ ở production). Bỏ trống để chỉ chạy API.
export const FRONTEND_DIST = process.env.FRONTEND_DIST ?? '';
