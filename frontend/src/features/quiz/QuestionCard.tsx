import { Letter, Question } from '../../types';
import { Ornament } from '../../components/Ornament';
import { correctLetters, isDisabled, nextSelection, optionState, OptionState, optionText, statusOf, visibleLetters } from './quizLogic';

interface Props {
    index: number;
    question: Question;
    selected: Letter[];
    onChange: (next: Letter[]) => void;
}

const optionStyle: Record<OptionState, string> = {
    neutral: 'border-rule bg-surface hover:border-burgundy hover:bg-surface-2',
    chosen: 'border-burgundy bg-burgundy-soft',
    right: 'border-forest bg-forest-soft',
    wrong: 'border-oxblood bg-oxblood-soft',
    missed: 'border-dashed border-forest bg-forest-soft/50'
};

const badgeStyle: Record<OptionState, string> = {
    neutral: 'border-rule text-muted',
    chosen: 'border-burgundy bg-burgundy text-paper',
    right: 'border-forest bg-forest text-paper',
    wrong: 'border-oxblood bg-oxblood text-paper',
    missed: 'border-forest text-forest'
};

const IMAGE_RE = /\.(jpe?g|gif|png|svg)$/i;

export function QuestionCard({ index, question: q, selected, onChange }: Props) {
    const correct = correctLetters(q);
    const need = correct.length;
    const status = statusOf(q, selected);
    const text = q.question ?? '';
    const resolved = status === 'correct' || status === 'wrong';

    return (
        <article id={`q-${q.id}`} className="paper animate-rise p-7 sm:p-8" style={{ animationDelay: `${Math.min(index, 8) * 60}ms` }}>
            <div className="mb-1 flex items-baseline justify-between gap-3">
                <span className="eyebrow">Câu {index + 1}</span>
                {need > 1 && (
                    <span className={`rounded-sm border px-2.5 py-0.5 text-xs font-semibold ${
                        resolved ? 'border-forest text-forest' : 'border-gold text-gold'
                    }`}>
                        Chọn {need} đáp án · {selected.length}/{need}
                    </span>
                )}
            </div>
            <Ornament className="mb-4" />

            {IMAGE_RE.test(text) ? (
                <img src={`/img/${text}`} alt={`Hình câu ${index + 1}`}
                    className="mb-5 block max-w-full rounded-sm border border-rule bg-white" />
            ) : (
                <p className="mb-5 whitespace-pre-line text-[1.12rem] font-semibold leading-relaxed [overflow-wrap:anywhere]">
                    {text || '(Nội dung câu hỏi trống)'}
                </p>
            )}

            <div className="flex flex-col gap-2.5">
                {visibleLetters(q).map(l => {
                    const state = optionState(q, selected, l);
                    const disabled = isDisabled(q, selected, l);
                    return (
                        <label key={l}
                            className={`flex items-start gap-3.5 rounded-sm border-[1.5px] px-4 py-3 transition focus-within:outline-2 focus-within:outline-gold ${optionStyle[state]} ${disabled ? 'cursor-not-allowed' : 'cursor-pointer'}`}>
                            <input type={need > 1 ? 'checkbox' : 'radio'} name={`q${q.id}`} className="peer sr-only"
                                checked={selected.includes(l)} disabled={disabled}
                                onChange={() => onChange(nextSelection(q, selected, l))} />
                            <span className={`mt-0.5 grid h-7 w-7 flex-none place-items-center rounded-full border-[1.5px] font-display text-sm font-bold italic ${badgeStyle[state]}`}>
                                {l}
                            </span>
                            <span className="flex-1 pt-0.5 [overflow-wrap:anywhere]">{optionText(q, l)}</span>
                            {state === 'right' && <span className="font-display text-xl leading-none text-forest" aria-label="đúng">✓</span>}
                            {state === 'wrong' && <span className="font-display text-xl leading-none text-oxblood" aria-label="sai">✗</span>}
                        </label>
                    );
                })}
            </div>

            <div aria-live="polite">
                {status === 'partial' && (
                    <p className="mt-4 border-l-4 border-gold bg-gold-soft px-4 py-2 italic">
                        Hãy chọn thêm <b>{need - selected.length}</b> đáp án nữa…
                    </p>
                )}
                {status === 'correct' && (
                    <p className="mt-4 border-l-4 border-forest bg-forest-soft px-4 py-2 italic text-forest">
                        {need > 1 ? `Tuyệt vời! Bạn đã chọn đúng cả ${need} đáp án.` : 'Chính xác! Bạn làm rất tốt.'}
                    </p>
                )}
                {status === 'wrong' && (
                    <p className="mt-4 border-l-4 border-oxblood bg-oxblood-soft px-4 py-2 italic text-oxblood">
                        {need > 1 ? 'Chưa đúng.' : 'Sai rồi.'} Đáp án đúng là <b className="not-italic">{correct.join('')}</b>
                    </p>
                )}
            </div>
        </article>
    );
}
