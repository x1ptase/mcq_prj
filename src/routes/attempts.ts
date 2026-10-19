import { Router } from 'express';
import { currentUser, requireAuth } from '../auth';
import { getPool, sql } from '../db';

const router = Router();
router.use(requireAuth);

interface AnswerInput { qId: number; answer: string }

// Chuẩn hóa đáp án: chỉ giữ chữ cái, viết hoa, sắp xếp ("ba" -> "AB")
function normalize(value: unknown): string {
    return [...new Set(String(value ?? '').replace(/[^a-zA-Z]/g, '').toUpperCase())].sort().join('');
}

router.post('/', async (req, res) => {
    const user = currentUser(res)!;
    const { courseId, answers } = req.body ?? {};
    if (!Number.isInteger(courseId) || !Array.isArray(answers)) {
        res.status(400).json({ message: 'Dữ liệu nộp bài không hợp lệ.' });
        return;
    }

    const pool = await getPool();
    const qs = await pool.request().input('c', sql.Int, courseId)
        .query<{ id: number; correct_answer: string }>('SELECT id, correct_answer FROM QuizQuestions WHERE course_id = @c');
    const correctById = new Map(qs.recordset.map(q => [q.id, normalize(q.correct_answer)]));
    if (correctById.size === 0) { res.status(404).json({ message: 'Môn không có câu hỏi.' }); return; }

    // Mỗi câu chỉ tính một lần, bỏ qua câu không thuộc môn này
    const graded = new Map<number, { selected: string; correct: string; ok: boolean }>();
    for (const a of answers as AnswerInput[]) {
        const correct = correctById.get(a?.qId);
        if (correct === undefined || graded.has(a.qId)) continue;
        const selected = normalize(a.answer);
        if (!selected) continue;
        graded.set(a.qId, { selected, correct, ok: selected === correct });
    }
    const score = [...graded.values()].filter(g => g.ok).length;
    const total = correctById.size;

    const tx = new sql.Transaction(pool);
    await tx.begin();
    try {
        const attempt = await tx.request()
            .input('u', sql.Int, user.id).input('c', sql.Int, courseId)
            .input('s', sql.Int, score).input('t', sql.Int, total)
            .query<{ id: number }>('INSERT INTO Attempts (user_id, course_id, score, total) OUTPUT INSERTED.id VALUES (@u, @c, @s, @t)');
        const attemptId = attempt.recordset[0].id;
        for (const [qId, g] of graded) {
            await tx.request()
                .input('a', sql.Int, attemptId).input('q', sql.Int, qId)
                .input('sel', sql.VarChar, g.selected).input('cor', sql.VarChar, g.correct)
                .input('ok', sql.Bit, g.ok)
                .query('INSERT INTO AttemptAnswers (attempt_id, question_id, selected_option, correct_answer, is_correct) VALUES (@a, @q, @sel, @cor, @ok)');
        }
        await tx.commit();
        res.status(201).json({ id: attemptId, score, total });
    } catch (err) {
        await tx.rollback();
        throw err;
    }
});

router.get('/', async (_req, res) => {
    const user = currentUser(res)!;
    const pool = await getPool();
    const r = await pool.request().input('u', sql.Int, user.id).query(`
        SELECT a.id, a.course_id, c.code, c.name AS course_name, a.score, a.total, a.created_at
        FROM Attempts a JOIN Courses c ON c.id = a.course_id
        WHERE a.user_id = @u ORDER BY a.created_at DESC, a.id DESC`);
    res.json(r.recordset);
});

// Chi tiết một lần làm: chỉ những câu đã trả lời, kèm nội dung câu hỏi (nếu còn trong DB)
router.get('/:id', async (req, res) => {
    const user = currentUser(res)!;
    const id = Number(req.params.id);
    if (!Number.isInteger(id)) { res.status(400).json({ message: 'id không hợp lệ.' }); return; }
    const pool = await getPool();
    const head = await pool.request().input('id', sql.Int, id).input('u', sql.Int, user.id).query(`
        SELECT a.id, a.course_id, c.name AS course_name, a.score, a.total, a.created_at
        FROM Attempts a JOIN Courses c ON c.id = a.course_id
        WHERE a.id = @id AND a.user_id = @u`);
    if (!head.recordset[0]) { res.status(404).json({ message: 'Không tìm thấy lần làm bài.' }); return; }
    const answers = await pool.request().input('id', sql.Int, id).query(`
        SELECT aa.question_id, aa.selected_option, aa.correct_answer, aa.is_correct, q.question
        FROM AttemptAnswers aa LEFT JOIN QuizQuestions q ON q.id = aa.question_id
        WHERE aa.attempt_id = @id ORDER BY aa.question_id`);
    res.json({ ...head.recordset[0], answers: answers.recordset });
});

export default router;
