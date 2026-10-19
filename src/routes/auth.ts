import { Router } from 'express';
import { clearSession, currentUser, hashPassword, setSession, verifyPassword } from '../auth';
import { getPool, sql } from '../db';

const router = Router();

const USERNAME_RE = /^[A-Za-z0-9_.-]{3,30}$/;

router.post('/register', async (req, res) => {
    const { username, password } = req.body ?? {};
    if (typeof username !== 'string' || !USERNAME_RE.test(username)) {
        res.status(400).json({ message: 'Tên đăng nhập 3-30 ký tự (chữ, số, _ . -).' });
        return;
    }
    if (typeof password !== 'string' || password.length < 6 || password.length > 100) {
        res.status(400).json({ message: 'Mật khẩu phải từ 6 đến 100 ký tự.' });
        return;
    }

    const pool = await getPool();
    const exists = await pool.request().input('u', sql.NVarChar, username)
        .query('SELECT 1 FROM Users WHERE username = @u');
    if (exists.recordset.length > 0) {
        res.status(409).json({ message: 'Tên đăng nhập đã tồn tại.' });
        return;
    }

    const created = await pool.request()
        .input('u', sql.NVarChar, username)
        .input('p', sql.VarChar, hashPassword(password))
        .query<{ id: number }>("INSERT INTO Users (username, password_hash) OUTPUT INSERTED.id VALUES (@u, @p)");
    const id = created.recordset[0].id;
    setSession(res, id);
    res.status(201).json({ id, username, role: 'user' });
});

router.post('/login', async (req, res) => {
    const { username, password } = req.body ?? {};
    if (typeof username !== 'string' || typeof password !== 'string') {
        res.status(400).json({ message: 'Thiếu tên đăng nhập hoặc mật khẩu.' });
        return;
    }
    const pool = await getPool();
    const r = await pool.request().input('u', sql.NVarChar, username)
        .query<{ id: number; username: string; role: string; password_hash: string }>(
            'SELECT id, username, role, password_hash FROM Users WHERE username = @u');
    const user = r.recordset[0];
    if (!user || !verifyPassword(password, user.password_hash)) {
        res.status(401).json({ message: 'Sai tên đăng nhập hoặc mật khẩu.' });
        return;
    }
    setSession(res, user.id);
    res.json({ id: user.id, username: user.username, role: user.role });
});

router.post('/logout', (_req, res) => {
    clearSession(res);
    res.json({ success: true });
});

router.get('/me', (_req, res) => {
    res.json(currentUser(res) ?? null);
});

export default router;
