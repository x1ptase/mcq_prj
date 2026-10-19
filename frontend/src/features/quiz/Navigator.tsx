import { Question, Letter } from '../../types';
import { QStatus, statusOf } from './quizLogic';

const tab: Record<QStatus, string> = {
    idle: 'border-rule text-muted hover:border-burgundy hover:text-burgundy',
    partial: 'border-gold bg-gold-soft text-gold',
    correct: 'border-forest bg-forest-soft text-forest',
    wrong: 'border-oxblood bg-oxblood-soft text-oxblood'
};

interface Props {
    questions: Question[];
    answers: Record<number, Letter[]>;
    correct: number;
    wrong: number;
}

export function Navigator({ questions, answers, correct, wrong }: Props) {
    const left = questions.length - correct - wrong;
    return (
        <aside className="paper p-5 lg:sticky lg:top-24">
            <h2 className="mb-3 text-lg font-bold">Bảng điểm</h2>
            <div className="mb-5 grid grid-cols-3 divide-x divide-rule border-y border-rule text-center">
                {[
                    ['Đúng', correct, 'text-forest'],
                    ['Sai', wrong, 'text-oxblood'],
                    ['Còn lại', left, 'text-ink']
                ].map(([label, value, color]) => (
                    <div key={label as string} className="py-2">
                        <div className={`font-display text-2xl font-bold ${color}`}>{value}</div>
                        <div className="eyebrow !tracking-wider">{label}</div>
                    </div>
                ))}
            </div>

            <h2 className="mb-3 text-lg font-bold">Mục lục</h2>
            <div className="grid max-h-[46vh] grid-cols-5 gap-1.5 overflow-y-auto p-0.5 max-lg:max-h-40 max-lg:grid-cols-8 max-sm:grid-cols-6">
                {questions.map((q, i) => (
                    <button key={q.id} aria-label={`Câu ${i + 1}`}
                        onClick={() => document.getElementById(`q-${q.id}`)?.scrollIntoView({ block: 'start' })}
                        className={`aspect-square rounded-sm border text-xs font-semibold transition ${tab[statusOf(q, answers[q.id])]}`}>
                        {i + 1}
                    </button>
                ))}
            </div>
        </aside>
    );
}
