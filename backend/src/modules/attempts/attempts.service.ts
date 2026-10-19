import { badRequest, notFound } from '../../shared/http';
import * as repo from './attempts.repository';
import { GradedAnswer } from './attempts.types';

// Chuẩn hóa đáp án: chỉ giữ chữ cái, viết hoa, sắp xếp ("ba" -> "AB")
function normalize(value: unknown): string {
    return [...new Set(String(value ?? '').replace(/[^a-zA-Z]/g, '').toUpperCase())].sort().join('');
}

export async function submit(userId: number, courseId: unknown, answers: unknown): Promise<{ id: number; score: number; total: number }> {
    if (!Number.isInteger(courseId) || !Array.isArray(answers)) throw badRequest('Dữ liệu nộp bài không hợp lệ.');

    const questions = await repo.correctAnswers(courseId as number);
    const correctById = new Map(questions.map(q => [q.id, normalize(q.correct_answer)]));
    if (correctById.size === 0) throw notFound('Môn không có câu hỏi.');

    // Mỗi câu chỉ tính một lần, bỏ qua câu không thuộc môn này
    const graded = new Map<number, GradedAnswer>();
    for (const a of answers as { qId: number; answer: unknown }[]) {
        const correct = correctById.get(a?.qId);
        if (correct === undefined || graded.has(a.qId)) continue;
        const selected = normalize(a.answer);
        if (!selected) continue;
        graded.set(a.qId, { questionId: a.qId, selected, correct, ok: selected === correct });
    }

    const list = [...graded.values()];
    const score = list.filter(g => g.ok).length;
    const total = correctById.size;
    const id = await repo.save(userId, courseId as number, score, total, list);
    return { id, score, total };
}

export const listMine = (userId: number) => repo.listByUser(userId);

export async function detail(id: number, userId: number) {
    const head = await repo.findOwned(id, userId);
    if (!head) throw notFound('Không tìm thấy lần làm bài.');
    return { ...head, answers: await repo.answersOf(id) };
}
