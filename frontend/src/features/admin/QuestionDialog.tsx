import { FormEvent, useEffect, useState } from 'react';
import { Dialog, Field } from '../../components/Dialog';
import { api, errorMessage } from '../../lib/api';
import { LETTERS, Letter, Question } from '../../types';
import { optionText } from '../quiz/quizLogic';

interface Props {
    open: boolean;
    courseId: number;
    question: Question | null; // null = tạo mới
    onClose: () => void;
    onSaved: () => void;
}

export function QuestionDialog({ open, courseId, question, onClose, onSaved }: Props) {
    const [text, setText] = useState('');
    const [options, setOptions] = useState<Record<Letter, string>>({ A: '', B: '', C: '', D: '', E: '', F: '' });
    const [correct, setCorrect] = useState<Letter[]>([]);
    const [error, setError] = useState('');

    useEffect(() => {
        if (!open) return;
        setText(question?.question ?? '');
        setOptions(Object.fromEntries(LETTERS.map(l => [l, question ? optionText(question, l) : ''])) as Record<Letter, string>);
        setCorrect(LETTERS.filter(l => (question?.correct_answer ?? '').includes(l)));
        setError('');
    }, [open, question]);

    async function submit(e: FormEvent) {
        e.preventDefault();
        const body: Record<string, unknown> = {
            course_id: courseId,
            question: text,
            correct_answer: correct.join('')
        };
        for (const l of LETTERS) body[`option_${l.toLowerCase()}`] = options[l];
        try {
            if (question) await api(`/api/questions/${question.id}`, 'PUT', body);
            else await api('/api/questions', 'POST', body);
            onSaved();
        } catch (err) {
            setError(errorMessage(err));
        }
    }

    return (
        <Dialog open={open} onClose={onClose} title={question ? 'Sửa câu hỏi' : 'Câu hỏi mới'} wide>
            <form onSubmit={submit}>
                <Field label="Nội dung (hoặc tên file ảnh trong /img, vd pic134.png)">
                    <textarea className="input" rows={3} value={text} onChange={e => setText(e.target.value)} required />
                </Field>
                <span className="eyebrow mb-1 block">Các đáp án — tích ô vuông cho đáp án đúng</span>
                {LETTERS.map(l => (
                    <div key={l} className="mb-2 flex items-center gap-3">
                        <label className="flex w-12 flex-none cursor-pointer items-center gap-1.5 font-display font-bold italic">
                            <input type="checkbox" className="h-4 w-4 accent-[var(--burgundy)]" checked={correct.includes(l)}
                                onChange={() => setCorrect(c => (c.includes(l) ? c.filter(x => x !== l) : [...c, l]))} />
                            {l}
                        </label>
                        <input className="input" value={options[l]} onChange={e => setOptions(o => ({ ...o, [l]: e.target.value }))}
                            placeholder={`Đáp án ${l}${l > 'B' ? ' (tùy chọn)' : ''}`} />
                    </div>
                ))}
                <p role="alert" className="min-h-6 text-sm text-oxblood">{error}</p>
                <div className="mt-2 flex justify-end gap-2">
                    <button type="button" className="btn" onClick={onClose}>Hủy</button>
                    <button type="submit" className="btn btn-primary">Lưu</button>
                </div>
            </form>
        </Dialog>
    );
}
