import { getPool, sql } from '../../shared/db';
import { LETTERS, Question, QuestionInput } from './questions.types';

function bind(request: sql.Request, q: QuestionInput): sql.Request {
    request.input('c', sql.Int, q.course_id)
        .input('q', sql.NVarChar(sql.MAX), q.question)
        .input('ans', sql.VarChar, q.correct_answer);
    for (const l of LETTERS) request.input(`o${l}`, sql.NVarChar(sql.MAX), q.options[l]);
    return request;
}

export async function listByCourse(courseId: number): Promise<Question[]> {
    const pool = await getPool();
    const r = await pool.request().input('c', sql.Int, courseId)
        .query<Question>('SELECT * FROM QuizQuestions WHERE course_id = @c ORDER BY id ASC');
    return r.recordset;
}

export async function insert(q: QuestionInput): Promise<number> {
    const pool = await getPool();
    const r = await bind(pool.request(), q).query<{ id: number }>(`
        INSERT INTO QuizQuestions (course_id, question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer)
        OUTPUT INSERTED.id
        VALUES (@c, @q, @oa, @ob, @oc, @od, @oe, @of, @ans)`);
    return r.recordset[0].id;
}

export async function update(id: number, q: QuestionInput): Promise<boolean> {
    const pool = await getPool();
    const r = await bind(pool.request(), q).input('id', sql.Int, id).query(`
        UPDATE QuizQuestions SET course_id = @c, question = @q, option_a = @oa, option_b = @ob, option_c = @oc,
            option_d = @od, option_e = @oe, option_f = @of, correct_answer = @ans
        WHERE id = @id`);
    return r.rowsAffected[0] > 0;
}

export async function remove(id: number): Promise<boolean> {
    const pool = await getPool();
    const r = await pool.request().input('id', sql.Int, id).query('DELETE FROM QuizQuestions WHERE id = @id');
    return r.rowsAffected[0] > 0;
}
