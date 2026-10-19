import { Router } from 'express';
import { getPool, sql } from '../db';

const router = Router();

router.get('/', async (_req, res) => {
    const pool = await getPool();
    const r = await pool.request().query(`
        SELECT c.id, c.code, c.name, COUNT(q.id) AS question_count
        FROM Courses c LEFT JOIN QuizQuestions q ON q.course_id = c.id
        GROUP BY c.id, c.code, c.name
        ORDER BY c.name`);
    res.json(r.recordset);
});

router.get('/:id/questions', async (req, res) => {
    const id = Number(req.params.id);
    if (!Number.isInteger(id)) { res.status(400).json({ message: 'id không hợp lệ.' }); return; }
    const pool = await getPool();
    const r = await pool.request().input('c', sql.Int, id)
        .query('SELECT * FROM QuizQuestions WHERE course_id = @c ORDER BY id ASC');
    res.json(r.recordset);
});

export default router;
