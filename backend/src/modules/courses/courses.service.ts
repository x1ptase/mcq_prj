import { badRequest, conflict, notFound } from '../../shared/http';
import * as repo from './courses.repository';
import { Course, CourseInput, CourseSummary } from './courses.types';

function parse(body: any): CourseInput {
    const code = typeof body?.code === 'string' ? body.code.trim().toUpperCase() : '';
    const name = typeof body?.name === 'string' ? body.name.trim() : '';
    if (!/^[A-Z0-9_-]{2,50}$/.test(code)) throw badRequest('Mã môn 2-50 ký tự (chữ, số, _ -).');
    if (!name || name.length > 200) throw badRequest('Tên môn không được để trống (tối đa 200 ký tự).');
    return { code, name };
}

export const list = (): Promise<CourseSummary[]> => repo.list();
export const exists = (id: number): Promise<boolean> => repo.exists(id);

export async function create(body: unknown): Promise<Course> {
    const input = parse(body);
    if (await repo.codeTaken(input.code)) throw conflict('Mã môn đã tồn tại.');
    return repo.insert(input);
}

export async function update(id: number, body: unknown): Promise<Course> {
    const input = parse(body);
    if (await repo.codeTaken(input.code, id)) throw conflict('Mã môn đã tồn tại.');
    if (!(await repo.update(id, input))) throw notFound('Không tìm thấy môn.');
    return { id, ...input };
}

// Chỉ xóa được môn chưa có câu hỏi và chưa có lịch sử làm bài
export async function remove(id: number): Promise<void> {
    const { questions, attempts } = await repo.usage(id);
    if (questions > 0 || attempts > 0) {
        throw conflict(`Môn còn ${questions} câu hỏi và ${attempts} lượt làm bài, không thể xóa.`);
    }
    if (!(await repo.remove(id))) throw notFound('Không tìm thấy môn.');
}
