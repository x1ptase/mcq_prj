import { Fragment, useEffect, useState } from 'react';
import { Link, Navigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { api, errorMessage } from '../../lib/api';
import { AttemptDetail, AttemptRow } from '../../types';

const fmt = (iso: string) => new Date(iso).toLocaleString('vi-VN');

function Detail({ id }: { id: number }) {
    const [data, setData] = useState<AttemptDetail | null>(null);
    const [error, setError] = useState('');

    useEffect(() => {
        api<AttemptDetail>(`/api/attempts/${id}`).then(setData).catch(e => setError(errorMessage(e)));
    }, [id]);

    if (error) return <p className="text-oxblood">{error}</p>;
    if (!data) return <p className="italic text-muted">Đang tải…</p>;
    const wrong = data.answers.filter(a => !a.is_correct);
    if (wrong.length === 0) return <p className="italic text-forest">Tất cả câu trả lời đều đúng.</p>;
    return (
        <div>
            <p className="eyebrow mb-2">{wrong.length} câu sai</p>
            {wrong.map(a => (
                <div key={a.question_id} className="border-t border-rule py-3">
                    <p className="whitespace-pre-line font-semibold [overflow-wrap:anywhere]">
                        {a.question ?? `(Câu #${a.question_id} đã bị xóa)`}
                    </p>
                    <p className="mt-1 text-sm">
                        Bạn chọn: <b className="text-oxblood">{a.selected_option}</b> · Đáp án đúng: <b className="text-forest">{a.correct_answer}</b>
                    </p>
                </div>
            ))}
        </div>
    );
}

export function HistoryPage() {
    const { user, loading } = useAuth();
    const [rows, setRows] = useState<AttemptRow[] | null>(null);
    const [open, setOpen] = useState<number | null>(null);
    const [error, setError] = useState('');

    useEffect(() => {
        if (!user) return;
        api<AttemptRow[]>('/api/attempts').then(setRows).catch(e => setError(errorMessage(e)));
    }, [user]);

    if (loading) return null;
    if (!user) return <Navigate to="/" replace />;

    return (
        <main className="mx-auto max-w-4xl px-5 py-10">
            <h2 className="text-3xl font-bold">Lịch sử làm bài</h2>
            <p className="mb-6 italic text-muted">Những lần thi gần đây của {user.username}</p>

            {error && <p className="text-oxblood" role="alert">{error}</p>}
            {rows && rows.length === 0 && (
                <p className="paper py-12 text-center italic text-muted">
                    Bạn chưa có lần làm bài nào. <Link to="/" className="text-burgundy underline underline-offset-4">Làm bài ngay</Link>
                </p>
            )}
            {rows && rows.length > 0 && (
                <div className="paper overflow-x-auto">
                    <table className="table-classic w-full text-[0.95rem]">
                        <thead><tr><th>Thời gian</th><th>Môn</th><th>Điểm</th><th /></tr></thead>
                        <tbody>
                            {rows.map(r => (
                                <Fragment key={r.id}>
                                    <tr>
                                        <td className="whitespace-nowrap">{fmt(r.created_at)}</td>
                                        <td>{r.code} – {r.course_name}</td>
                                        <td className="whitespace-nowrap"><b className="font-display text-lg">{r.score}/{r.total}</b>{' '}
                                            <span className="text-muted">({r.total ? Math.round((r.score / r.total) * 100) : 0}%)</span></td>
                                        <td className="text-right">
                                            <button className="btn" onClick={() => setOpen(open === r.id ? null : r.id)}>
                                                {open === r.id ? 'Ẩn' : 'Chi tiết'}
                                            </button>
                                        </td>
                                    </tr>
                                    {open === r.id && <tr><td colSpan={4} className="bg-surface-2/60"><Detail id={r.id} /></td></tr>}
                                </Fragment>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}
        </main>
    );
}
