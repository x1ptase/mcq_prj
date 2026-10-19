import { useCallback, useEffect, useMemo, useState } from 'react';
import { useOutletContext, useSearchParams } from 'react-router-dom';
import { LayoutContext } from '../../components/Layout';
import { useAuth } from '../../context/AuthContext';
import { api, errorMessage } from '../../lib/api';
import { Course, Letter, Question } from '../../types';
import { Navigator } from './Navigator';
import { QuestionCard } from './QuestionCard';
import { ScoreSeal } from './ScoreSeal';
import { statusOf } from './quizLogic';

type SaveState = 'idle' | 'saving' | 'saved' | 'error';

export function QuizPage() {
    const { user } = useAuth();
    const { openLogin } = useOutletContext<LayoutContext>();
    const [params, setParams] = useSearchParams();

    const [courses, setCourses] = useState<Course[]>([]);
    const [questions, setQuestions] = useState<Question[]>([]);
    const [answers, setAnswers] = useState<Record<number, Letter[]>>({});
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const [saveState, setSaveState] = useState<SaveState>('idle');
    const [saveError, setSaveError] = useState('');

    useEffect(() => {
        api<Course[]>('/api/courses').then(setCourses).catch(e => { setError(errorMessage(e)); setLoading(false); });
    }, []);

    const wanted = Number(params.get('course'));
    const courseId = useMemo(() => {
        if (courses.length === 0) return null;
        return (courses.find(c => c.id === wanted) ?? courses.find(c => c.question_count > 0) ?? courses[0]).id;
    }, [courses, wanted]);

    const restart = useCallback(() => {
        setAnswers({});
        setSaveState('idle');
        setSaveError('');
    }, []);

    useEffect(() => {
        if (courseId === null) { if (courses.length === 0) return; setLoading(false); return; }
        setLoading(true);
        setError('');
        restart();
        api<Question[]>(`/api/questions?courseId=${courseId}`)
            .then(setQuestions)
            .catch(e => setError(errorMessage(e)))
            .finally(() => setLoading(false));
    }, [courseId, courses.length, restart]);

    const statuses = questions.map(q => statusOf(q, answers[q.id]));
    const correct = statuses.filter(s => s === 'correct').length;
    const wrong = statuses.filter(s => s === 'wrong').length;
    const done = correct + wrong;
    const total = questions.length;
    const allDone = total > 0 && done === total;

    // Tự lưu kết quả khi làm xong (chỉ khi đã đăng nhập)
    useEffect(() => {
        if (!allDone || !user || saveState !== 'idle' || courseId === null) return;
        setSaveState('saving');
        const payload = questions.map(q => ({ qId: q.id, answer: [...(answers[q.id] ?? [])].sort().join('') }));
        api('/api/attempts', 'POST', { courseId, answers: payload })
            .then(() => setSaveState('saved'))
            .catch(e => { setSaveError(errorMessage(e)); setSaveState('error'); });
    }, [allDone, user, saveState, courseId, questions, answers]);

    function requestRestart() {
        if (done === 0 || confirm('Bạn có muốn xóa hết kết quả và làm lại từ đầu không?')) {
            restart();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    }

    const pct = total ? (done / total) * 100 : 0;

    return (
        <>
            <div className="sticky top-0 z-20 border-b border-rule bg-paper/95 backdrop-blur">
                <div className="mx-auto flex max-w-6xl flex-wrap items-center gap-x-5 gap-y-2 px-5 py-3">
                    <select aria-label="Chọn môn" className="input !w-auto max-w-full font-semibold sm:max-w-xs"
                        value={courseId ?? ''} onChange={e => setParams({ course: e.target.value })}>
                        {courses.map(c => <option key={c.id} value={c.id}>{c.code} – {c.name} ({c.question_count})</option>)}
                    </select>

                    <div className="min-w-48 flex-1">
                        <div className="mb-1 flex justify-between text-xs italic text-muted">
                            <span>Đã làm <b className="not-italic text-ink">{done}</b>/{total}</span>
                            <span>{Math.round(pct)}%</span>
                        </div>
                        <div role="progressbar" aria-label="Tiến độ làm bài" aria-valuenow={Math.round(pct)}
                            className="flex h-2.5 overflow-hidden border border-rule bg-surface-2">
                            <div className="bg-forest transition-all" style={{ width: `${total ? (correct / total) * 100 : 0}%` }} />
                            <div className="bg-oxblood transition-all" style={{ width: `${total ? (wrong / total) * 100 : 0}%` }} />
                        </div>
                    </div>

                    <button className="btn" onClick={requestRestart}>Làm mới</button>
                </div>
            </div>

            <main className="mx-auto grid max-w-6xl gap-8 px-5 py-8 lg:grid-cols-[minmax(0,1fr)_17rem]">
                <div className="flex flex-col gap-6">
                    {loading && <p className="py-16 text-center italic text-muted">Đang tải câu hỏi…</p>}
                    {!loading && error && <p className="py-16 text-center text-oxblood" role="alert">{error}</p>}
                    {!loading && !error && total === 0 && <p className="py-16 text-center italic text-muted">Không có câu hỏi nào để hiển thị.</p>}

                    {!loading && !error && questions.map((q, i) => (
                        <QuestionCard key={q.id} index={i} question={q} selected={answers[q.id] ?? []}
                            onChange={next => setAnswers(a => ({ ...a, [q.id]: next }))} />
                    ))}

                    {!loading && allDone && (
                        <ScoreSeal score={correct} total={total} saveState={saveState} saveError={saveError}
                            loggedIn={!!user} onRestart={requestRestart} onLogin={openLogin} />
                    )}
                </div>

                <div className="max-lg:order-first">
                    {total > 0 && <Navigator questions={questions} answers={answers} correct={correct} wrong={wrong} />}
                </div>
            </main>
        </>
    );
}
