import { getPool, sql } from '../../shared/db';
import { AuthUser, UserRecord } from './auth.types';

export async function findById(id: number): Promise<AuthUser | undefined> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id)
        .query<AuthUser>('SELECT id, username, role FROM Users WHERE id = @id');
    return r.recordset[0];
}

export async function findByUsername(username: string): Promise<UserRecord | undefined> {
    const pool = await getPool();
    const r = await pool.request().input('u', sql.NVarChar, username)
        .query<UserRecord>('SELECT id, username, role, password_hash FROM Users WHERE username = @u');
    return r.recordset[0];
}

export async function insertUser(username: string, passwordHash: string): Promise<number> {
    const pool = await getPool();
    const r = await pool.request()
        .input('u', sql.NVarChar, username).input('p', sql.VarChar, passwordHash)
        .query<{ id: number }>('INSERT INTO Users (username, password_hash) OUTPUT INSERTED.id VALUES (@u, @p)');
    return r.recordset[0].id;
}

export async function hasAdmin(): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request().query("SELECT TOP 1 id FROM Users WHERE role = 'admin'");
    return r.recordset.length > 0;
}

// Tạo admin mới, hoặc nâng quyền nếu username đã tồn tại
export async function upsertAdmin(username: string, passwordHash: string): Promise<void> {
    const pool = await getPool();
    await pool.request()
        .input('u', sql.NVarChar, username).input('p', sql.VarChar, passwordHash)
        .query(`IF EXISTS (SELECT 1 FROM Users WHERE username = @u)
                    UPDATE Users SET role = 'admin' WHERE username = @u
                ELSE
                    INSERT INTO Users (username, password_hash, role) VALUES (@u, @p, 'admin')`);
}
