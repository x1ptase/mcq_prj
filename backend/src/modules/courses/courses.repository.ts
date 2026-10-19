import { getPool, sql } from '../../shared/db';
import { Course, CourseInput, CourseSummary } from './courses.types';

export async function list(): Promise<CourseSummary[]> {
    const pool = await getPool();
    const r = await pool.request().query<CourseSummary>(`
        SELECT c.id, c.code, c.name, COUNT(q.id) AS question_count
        FROM Courses c LEFT JOIN QuizQuestions q ON q.course_id = c.id
        GROUP BY c.id, c.code, c.name
        ORDER BY c.name`);
    return r.recordset;
}

export async function exists(id: number): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).query('SELECT 1 FROM Courses WHERE id = @id');
    return r.recordset.length > 0;
}

export async function codeTaken(code: string, exceptId = 0): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request().input('code', sql.NVarChar, code).input('id', sql.Int, exceptId)
        .query('SELECT 1 FROM Courses WHERE code = @code AND id <> @id');
    return r.recordset.length > 0;
}

export async function insert(c: CourseInput): Promise<Course> {
    const pool = await getPool();
    const r = await pool.request().input('code', sql.NVarChar, c.code).input('name', sql.NVarChar, c.name)
        .query<{ id: number }>('INSERT INTO Courses (code, name) OUTPUT INSERTED.id VALUES (@code, @name)');
    return { id: r.recordset[0].id, ...c };
}

export async function update(id: number, c: CourseInput): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request()
        .input('code', sql.NVarChar, c.code).input('name', sql.NVarChar, c.name).input('id', sql.Int, id)
        .query('UPDATE Courses SET code = @code, name = @name WHERE id = @id');
    return r.rowsAffected[0] > 0;
}

// Số câu hỏi và lượt làm bài đang tham chiếu tới môn
export async function usage(id: number): Promise<{ questions: number; attempts: number }> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).query<{ q: number; a: number }>(`
        SELECT (SELECT COUNT(*) FROM QuizQuestions WHERE course_id = @id) AS q,
               (SELECT COUNT(*) FROM Attempts WHERE course_id = @id) AS a`);
    return { questions: r.recordset[0].q, attempts: r.recordset[0].a };
}

export async function remove(id: number): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).query('DELETE FROM Courses WHERE id = @id');
    return r.rowsAffected[0] > 0;
}
