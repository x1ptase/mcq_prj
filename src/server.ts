import express, { NextFunction, Request, Response } from 'express';
import { ensureAdmin, loadUser } from './auth';
import { PORT } from './config';
import { getPool } from './db';
import adminRoutes from './routes/admin';
import attemptRoutes from './routes/attempts';
import authRoutes from './routes/auth';
import courseRoutes from './routes/courses';

const app = express();

app.use(express.json());
app.use(express.static('public'));
app.use('/api', loadUser);

app.use('/api/auth', authRoutes);
app.use('/api/courses', courseRoutes);
app.use('/api/attempts', attemptRoutes);
app.use('/api/admin', adminRoutes);

// Giữ route cũ: lấy toàn bộ câu hỏi
app.get('/get-questions', async (_req: Request, res: Response) => {
    const pool = await getPool();
    const result = await pool.request().query('SELECT * FROM QuizQuestions ORDER BY id ASC');
    res.json(result.recordset);
});

app.use((err: unknown, _req: Request, res: Response, _next: NextFunction) => {
    const message = err instanceof Error ? err.message : String(err);
    console.error('Lỗi server:', message);
    res.status(500).json({ message });
});

app.listen(PORT, () => {
    console.log(`>>> Server chạy tại http://localhost:${PORT}`);
    ensureAdmin().catch(err => console.error('Không thể khởi tạo admin:', err.message));
});
