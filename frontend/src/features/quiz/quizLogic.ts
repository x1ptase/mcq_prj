import { LETTERS, Letter, Question } from '../../types';

export type QStatus = 'idle' | 'partial' | 'correct' | 'wrong';
export type OptionState = 'neutral' | 'chosen' | 'right' | 'wrong' | 'missed';

export function correctLetters(q: Question): Letter[] {
    const set = new Set((q.correct_answer ?? '').toUpperCase().replace(/[^A-F]/g, ''));
    return LETTERS.filter(l => set.has(l));
}

export function optionText(q: Question, l: Letter): string {
    return (q[`option_${l.toLowerCase()}` as keyof Question] as string | null) ?? '';
}

// Hiển thị A, B luôn; C-F chỉ khi có nội dung
export function visibleLetters(q: Question): Letter[] {
    return LETTERS.filter(l => l === 'A' || l === 'B' || optionText(q, l) !== '');
}

export function statusOf(q: Question, selected: Letter[] = []): QStatus {
    const correct = correctLetters(q);
    if (selected.length === 0) return 'idle';
    if (selected.length < correct.length) return 'partial';
    return correct.length === selected.length && correct.every(l => selected.includes(l)) ? 'correct' : 'wrong';
}

export function optionState(q: Question, selected: Letter[] = [], l: Letter): OptionState {
    const status = statusOf(q, selected);
    const isSel = selected.includes(l);
    if (status === 'idle' || status === 'partial') return isSel ? 'chosen' : 'neutral';
    const isCorrect = correctLetters(q).includes(l);
    if (isSel) return isCorrect ? 'right' : 'wrong';
    return isCorrect ? 'missed' : 'neutral';
}

// Câu đơn: khóa sau lần chọn đầu. Câu nhiều đáp án: khóa các ô chưa chọn khi đã đủ số lượng
export function isDisabled(q: Question, selected: Letter[] = [], l: Letter): boolean {
    const need = correctLetters(q).length;
    if (need <= 1) return selected.length > 0;
    return selected.length >= need && !selected.includes(l);
}

export function nextSelection(q: Question, selected: Letter[] = [], l: Letter): Letter[] {
    if (isDisabled(q, selected, l)) return selected;
    if (correctLetters(q).length <= 1) return [l];
    return selected.includes(l) ? selected.filter(x => x !== l) : [...selected, l];
}
