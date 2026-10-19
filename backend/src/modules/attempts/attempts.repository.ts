import { getPool, sql } from '../../shared/db';
import { AttemptAnswerRow, AttemptRow, GradedAnswer } from './attempts.types';

export async function correctAnswers(courseId: number): Promise<{ id: number; correct_answer: string }[]> {
    const pool = await getPool();
    const r = await pool.request().input('c', sql.Int, courseId)
        .query<{ id: number; correct_answer: string }>('SELECT id, correct_answer FROM QuizQuestions WHERE course_id = @c');
    return r.recordset;
}

// Lưu một lần làm bài cùng các câu trả lời trong một transaction
export async function save(userId: number, courseId: number, score: number, total: number, answers: GradedAnswer[]): Promise<number> {
    const pool = await getPool();
    const tx = new sql.Transaction(pool);
    await tx.begin();
    try {
        const attempt = await tx.request()
            .input('u', sql.Int, userId).input('c', sql.Int, courseId)
            .input('s', sql.Int, score).input('t', sql.Int, total)
            .query<{ id: number }>('INSERT INTO Attempts (user_id, course_id, score, total) OUTPUT INSERTED.id VALUES (@u, @c, @s, @t)');
        const attemptId = attempt.recordset[0].id;
        for (const a of answers) {
            await tx.request()
                .input('a', sql.Int, attemptId).input('q', sql.Int, a.questionId)
                .input('sel', sql.VarChar, a.selected).input('cor', sql.VarChar, a.correct)
                .input('ok', sql.Bit, a.ok)
                .query('INSERT INTO AttemptAnswers (attempt_id, question_id, selected_option, correct_answer, is_correct) VALUES (@a, @q, @sel, @cor, @ok)');
        }
        await tx.commit();
        return attemptId;
    } catch (err) {
        await tx.rollback();
        throw err;
    }
}

export async function listByUser(userId: number): Promise<AttemptRow[]> {
    const pool = await getPool();
    const r = await pool.request().input('u', sql.Int, userId).query<AttemptRow>(`
        SELECT a.id, a.course_id, c.code, c.name AS course_name, a.score, a.total, a.created_at
        FROM Attempts a JOIN Courses c ON c.id = a.course_id
        WHERE a.user_id = @u ORDER BY a.created_at DESC, a.id DESC`);
    return r.recordset;
}

export async function findOwned(id: number, userId: number): Promise<Omit<AttemptRow, 'code'> | undefined> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).input('u', sql.Int, userId)
        .query<Omit<AttemptRow, 'code'>>(`
            SELECT a.id, a.course_id, c.name AS course_name, a.score, a.total, a.created_at
            FROM Attempts a JOIN Courses c ON c.id = a.course_id
            WHERE a.id = @id AND a.user_id = @u`);
    return r.recordset[0];
}

export async function answersOf(attemptId: number): Promise<AttemptAnswerRow[]> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, attemptId).query<AttemptAnswerRow>(`
        SELECT aa.question_id, aa.selected_option, aa.correct_answer, aa.is_correct, q.question
        FROM AttemptAnswers aa LEFT JOIN QuizQuestions q ON q.id = aa.question_id
        WHERE aa.attempt_id = @id ORDER BY aa.question_id`);
    return r.recordset;
}
