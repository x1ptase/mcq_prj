import { Router } from 'express';
import { requireAdmin } from '../auth';
import { getPool, sql } from '../db';

const router = Router();
router.use(requireAdmin);

const LETTERS = ['a', 'b', 'c', 'd', 'e', 'f'] as const;

// ===== Môn học =====
function parseCourse(body: any): { code: string; name: string } | string {
    const code = typeof body?.code === 'string' ? body.code.trim().toUpperCase() : '';
    const name = typeof body?.name === 'string' ? body.name.trim() : '';
    if (!/^[A-Z0-9_-]{2,50}$/.test(code)) return 'Mã môn 2-50 ký tự (chữ, số, _ -).';
    if (!name || name.length > 200) return 'Tên môn không được để trống (tối đa 200 ký tự).';
    return { code, name };
}

router.post('/courses', async (req, res) => {
    const c = parseCourse(req.body);
    if (typeof c === 'string') { res.status(400).json({ message: c }); return; }
    const pool = await getPool();
    const dup = await pool.request().input('code', sql.NVarChar, c.code).query('SELECT 1 FROM Courses WHERE code = @code');
    if (dup.recordset.length) { res.status(409).json({ message: 'Mã môn đã tồn tại.' }); return; }
    const r = await pool.request().input('code', sql.NVarChar, c.code).input('name', sql.NVarChar, c.name)
        .query<{ id: number }>('INSERT INTO Courses (code, name) OUTPUT INSERTED.id VALUES (@code, @name)');
    res.status(201).json({ id: r.recordset[0].id, ...c });
});

router.put('/courses/:id', async (req, res) => {
    const id = Number(req.params.id);
    const c = parseCourse(req.body);
    if (!Number.isInteger(id)) { res.status(400).json({ message: 'id không hợp lệ.' }); return; }
    if (typeof c === 'string') { res.status(400).json({ message: c }); return; }
    const pool = await getPool();
    const dup = await pool.request().input('code', sql.NVarChar, c.code).input('id', sql.Int, id)
        .query('SELECT 1 FROM Courses WHERE code = @code AND id <> @id');
    if (dup.recordset.length) { res.status(409).json({ message: 'Mã môn đã tồn tại.' }); return; }
    const r = await pool.request().input('code', sql.NVarChar, c.code).input('name', sql.NVarChar, c.name).input('id', sql.Int, id)
        .query('UPDATE Courses SET code = @code, name = @name WHERE id = @id');
    if (!r.rowsAffected[0]) { res.status(404).json({ message: 'Không tìm thấy môn.' }); return; }
    res.json({ id, ...c });
});

// Chỉ xóa được môn chưa có câu hỏi và chưa có lịch sử làm bài
router.delete('/courses/:id', async (req, res) => {
    const id = Number(req.params.id);
    if (!Number.isInteger(id)) { res.status(400).json({ message: 'id không hợp lệ.' }); return; }
    const pool = await getPool();
    const used = await pool.request().input('id', sql.Int, id).query(`
        SELECT (SELECT COUNT(*) FROM QuizQuestions WHERE course_id = @id) AS q,
               (SELECT COUNT(*) FROM Attempts WHERE course_id = @id) AS a`);
    const { q, a } = used.recordset[0];
    if (q > 0 || a > 0) {
        res.status(409).json({ message: `Môn còn ${q} câu hỏi và ${a} lượt làm bài, không thể xóa.` });
        return;
    }
    const r = await pool.request().input('id', sql.Int, id).query('DELETE FROM Courses WHERE id = @id');
    if (!r.rowsAffected[0]) { res.status(404).json({ message: 'Không tìm thấy môn.' }); return; }
    res.json({ success: true });
});

// ===== Câu hỏi =====
interface QuestionInput {
    course_id: number;
    question: string;
    options: Record<(typeof LETTERS)[number], string>;
    correct_answer: string;
}

function parseQuestion(body: any): QuestionInput | string {
    const courseId = body?.course_id;
    const question = typeof body?.question === 'string' ? body.question.trim() : '';
    if (!Number.isInteger(courseId)) return 'Thiếu môn học.';
    if (!question) return 'Nội dung câu hỏi không được để trống.';

    const options = {} as QuestionInput['options'];
    for (const l of LETTERS) {
        const v = body?.[`option_${l}`];
        options[l] = typeof v === 'string' ? v.trim() : '';
    }

    const correct = [...new Set(String(body?.correct_answer ?? '').toUpperCase().replace(/[^A-F]/g, ''))].sort();
    if (correct.length === 0) return 'Chọn ít nhất một đáp án đúng.';
    if (options.a === '' || options.b === '') return 'Cần ít nhất hai đáp án A và B.';
    for (const letter of correct) {
        if (options[letter.toLowerCase() as (typeof LETTERS)[number]] === '') return `Đáp án đúng ${letter} đang để trống.`;
    }
    return { course_id: courseId, question, options, correct_answer: correct.join('') };
}

router.get('/questions', async (req, res) => {
    const courseId = Number(req.query.course_id);
    if (!Number.isInteger(courseId)) { res.status(400).json({ message: 'Thiếu course_id.' }); return; }
    const pool = await getPool();
    const r = await pool.request().input('c', sql.Int, courseId)
        .query('SELECT * FROM QuizQuestions WHERE course_id = @c ORDER BY id');
    res.json(r.recordset);
});

function bindQuestion(request: sql.Request, q: QuestionInput): sql.Request {
    request.input('c', sql.Int, q.course_id).input('q', sql.NVarChar(sql.MAX), q.question).input('ans', sql.VarChar, q.correct_answer);
    for (const l of LETTERS) request.input(`o${l}`, sql.NVarChar(sql.MAX), q.options[l]);
    return request;
}

async function courseExists(id: number): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).query('SELECT 1 FROM Courses WHERE id = @id');
    return r.recordset.length > 0;
}

router.post('/questions', async (req, res) => {
    const q = parseQuestion(req.body);
    if (typeof q === 'string') { res.status(400).json({ message: q }); return; }
    if (!(await courseExists(q.course_id))) { res.status(404).json({ message: 'Không tìm thấy môn.' }); return; }
    const pool = await getPool();
    const r = await bindQuestion(pool.request(), q).query<{ id: number }>(`
        INSERT INTO QuizQuestions (course_id, question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer)
        OUTPUT INSERTED.id
        VALUES (@c, @q, @oa, @ob, @oc, @od, @oe, @of, @ans)`);
    res.status(201).json({ id: r.recordset[0].id });
});

router.put('/questions/:id', async (req, res) => {
    const id = Number(req.params.id);
    const q = parseQuestion(req.body);
    if (!Number.isInteger(id)) { res.status(400).json({ message: 'id không hợp lệ.' }); return; }
    if (typeof q === 'string') { res.status(400).json({ message: q }); return; }
    if (!(await courseExists(q.course_id))) { res.status(404).json({ message: 'Không tìm thấy môn.' }); return; }
    const pool = await getPool();
    const r = await bindQuestion(pool.request(), q).input('id', sql.Int, id).query(`
        UPDATE QuizQuestions SET course_id = @c, question = @q, option_a = @oa, option_b = @ob, option_c = @oc,
            option_d = @od, option_e = @oe, option_f = @of, correct_answer = @ans
        WHERE id = @id`);
    if (!r.rowsAffected[0]) { res.status(404).json({ message: 'Không tìm thấy câu hỏi.' }); return; }
    res.json({ success: true });
});

router.delete('/questions/:id', async (req, res) => {
    const id = Number(req.params.id);
    if (!Number.isInteger(id)) { res.status(400).json({ message: 'id không hợp lệ.' }); return; }
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).query('DELETE FROM QuizQuestions WHERE id = @id');
    if (!r.rowsAffected[0]) { res.status(404).json({ message: 'Không tìm thấy câu hỏi.' }); return; }
    res.json({ success: true });
});

export default router;
