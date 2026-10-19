import { badRequest, notFound } from '../../shared/http';
import { courseExists } from '../courses';
import * as repo from './questions.repository';
import { LETTERS, Letter, Question, QuestionInput } from './questions.types';

function parse(body: any): QuestionInput {
    const courseId = body?.course_id;
    const question = typeof body?.question === 'string' ? body.question.trim() : '';
    if (!Number.isInteger(courseId)) throw badRequest('Thiếu môn học.');
    if (!question) throw badRequest('Nội dung câu hỏi không được để trống.');

    const options = {} as Record<Letter, string>;
    for (const l of LETTERS) {
        const v = body?.[`option_${l}`];
        options[l] = typeof v === 'string' ? v.trim() : '';
    }

    const correct = [...new Set(String(body?.correct_answer ?? '').toUpperCase().replace(/[^A-F]/g, ''))].sort();
    if (correct.length === 0) throw badRequest('Chọn ít nhất một đáp án đúng.');
    if (options.a === '' || options.b === '') throw badRequest('Cần ít nhất hai đáp án A và B.');
    for (const letter of correct) {
        if (options[letter.toLowerCase() as Letter] === '') throw badRequest(`Đáp án đúng ${letter} đang để trống.`);
    }
    return { course_id: courseId, question, options, correct_answer: correct.join('') };
}

async function parseForCourse(body: unknown): Promise<QuestionInput> {
    const input = parse(body);
    if (!(await courseExists(input.course_id))) throw notFound('Không tìm thấy môn.');
    return input;
}

export const listByCourse = (courseId: number): Promise<Question[]> => repo.listByCourse(courseId);

export async function create(body: unknown): Promise<{ id: number }> {
    return { id: await repo.insert(await parseForCourse(body)) };
}

export async function update(id: number, body: unknown): Promise<void> {
    if (!(await repo.update(id, await parseForCourse(body)))) throw notFound('Không tìm thấy câu hỏi.');
}

export async function remove(id: number): Promise<void> {
    if (!(await repo.remove(id))) throw notFound('Không tìm thấy câu hỏi.');
}
