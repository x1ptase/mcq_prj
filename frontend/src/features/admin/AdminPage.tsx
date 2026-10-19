import { useCallback, useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { api, errorMessage } from '../../lib/api';
import { Course, Question } from '../../types';
import { CourseDialog } from './CourseDialog';
import { QuestionDialog } from './QuestionDialog';

export function AdminPage() {
    const { user, loading } = useAuth();
    const [courses, setCourses] = useState<Course[]>([]);
    const [active, setActive] = useState<number | null>(null);
    const [questions, setQuestions] = useState<Question[]>([]);
    const [error, setError] = useState('');
    const [courseDlg, setCourseDlg] = useState<{ open: boolean; course: Course | null }>({ open: false, course: null });
    const [questionDlg, setQuestionDlg] = useState<{ open: boolean; question: Question | null }>({ open: false, question: null });

    const loadCourses = useCallback(async (select?: number) => {
        try {
            const list = await api<Course[]>('/api/courses');
            setCourses(list);
            setActive(cur => {
                const want = select ?? cur;
                return list.some(c => c.id === want) ? want! : list[0]?.id ?? null;
            });
        } catch (e) { setError(errorMessage(e)); }
    }, []);

    const loadQuestions = useCallback(async (courseId: number | null) => {
        if (courseId === null) { setQuestions([]); return; }
        try { setQuestions(await api<Question[]>(`/api/questions?courseId=${courseId}`)); }
        catch (e) { setError(errorMessage(e)); }
    }, []);

    useEffect(() => { if (user?.role === 'admin') loadCourses(); }, [user, loadCourses]);
    useEffect(() => { if (user?.role === 'admin') loadQuestions(active); }, [user, active, loadQuestions]);

    if (loading) return null;
    if (!user) return <Navigate to="/" replace />;
    if (user.role !== 'admin') {
        return <p className="py-24 text-center italic text-muted">Chỉ dành cho quản trị viên.</p>;
    }

    const course = courses.find(c => c.id === active) ?? null;

    async function remove(label: string, path: string, after: () => void) {
        if (!confirm(`Xóa ${label}?`)) return;
        try { await api(path, 'DELETE'); setError(''); after(); }
        catch (e) { setError(errorMessage(e)); }
    }

    return (
        <main className="mx-auto max-w-5xl px-5 py-10">
            <h2 className="text-3xl font-bold">Quản trị</h2>
            <p className="mb-6 italic text-muted">Quản lý môn học và ngân hàng câu hỏi</p>

            <div className="mb-5 flex flex-wrap items-center gap-2">
                <select aria-label="Chọn môn" className="input !w-auto max-w-full font-semibold" value={active ?? ''}
                    onChange={e => setActive(Number(e.target.value))}>
                    {courses.map(c => <option key={c.id} value={c.id}>{c.code} – {c.name} ({c.question_count})</option>)}
                </select>
                <button className="btn" onClick={() => setCourseDlg({ open: true, course: null })}>＋ Môn mới</button>
                {course && <>
                    <button className="btn" onClick={() => setCourseDlg({ open: true, course })}>Sửa môn</button>
                    <button className="btn btn-danger" onClick={() => remove(`môn ${course.code}`, `/api/courses/${course.id}`, () => loadCourses())}>Xóa môn</button>
                    <button className="btn btn-primary ml-auto" onClick={() => setQuestionDlg({ open: true, question: null })}>＋ Thêm câu hỏi</button>
                </>}
            </div>

            {error && <p className="mb-4 border-l-4 border-oxblood bg-oxblood-soft px-4 py-2 text-oxblood" role="alert">{error}</p>}

            {course ? (
                <div className="paper overflow-x-auto">
                    <table className="table-classic w-full text-[0.95rem]">
                        <thead><tr><th className="w-12">#</th><th>Câu hỏi</th><th>Đáp án</th><th /></tr></thead>
                        <tbody>
                            {questions.length === 0 && <tr><td colSpan={4} className="py-10 text-center italic text-muted">Môn này chưa có câu hỏi.</td></tr>}
                            {questions.map((q, i) => (
                                <tr key={q.id}>
                                    <td className="text-muted">{i + 1}</td>
                                    <td className="max-w-xl whitespace-pre-line [overflow-wrap:anywhere]">{q.question}</td>
                                    <td><b className="font-display">{q.correct_answer}</b></td>
                                    <td className="whitespace-nowrap text-right">
                                        <button className="btn mr-1.5" onClick={() => setQuestionDlg({ open: true, question: q })}>Sửa</button>
                                        <button className="btn btn-danger" onClick={() => remove('câu hỏi này', `/api/questions/${q.id}`, () => { loadQuestions(active); loadCourses(); })}>Xóa</button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            ) : (
                <p className="paper py-12 text-center italic text-muted">Chưa có môn nào. Hãy tạo môn mới.</p>
            )}

            <CourseDialog open={courseDlg.open} course={courseDlg.course}
                onClose={() => setCourseDlg(d => ({ ...d, open: false }))}
                onSaved={id => { setCourseDlg(d => ({ ...d, open: false })); loadCourses(id); }} />
            {active !== null && (
                <QuestionDialog open={questionDlg.open} courseId={active} question={questionDlg.question}
                    onClose={() => setQuestionDlg(d => ({ ...d, open: false }))}
                    onSaved={() => { setQuestionDlg(d => ({ ...d, open: false })); loadQuestions(active); loadCourses(); }} />
            )}
        </main>
    );
}
