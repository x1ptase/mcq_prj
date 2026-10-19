import { Link } from 'react-router-dom';

interface Props {
    score: number;
    total: number;
    saveState: 'idle' | 'saving' | 'saved' | 'error';
    saveError: string;
    loggedIn: boolean;
    onRestart: () => void;
    onLogin: () => void;
}

export function ScoreSeal({ score, total, saveState, saveError, loggedIn, onRestart, onLogin }: Props) {
    const pct = total ? Math.round((score / total) * 100) : 0;
    return (
        <section className="paper animate-rise flex flex-col items-center px-6 py-10 text-center">
            <p className="eyebrow mb-5">Hoàn thành bài thi</p>
            <div className="animate-stamp grid h-36 w-36 place-items-center rounded-full border-4 border-double border-burgundy text-burgundy shadow-[0_0_0_6px_var(--surface),0_0_0_7px_var(--burgundy)]">
                <div>
                    <div className="font-display text-4xl font-extrabold leading-none">{score}/{total}</div>
                    <div className="mt-1 text-sm italic">{pct}%</div>
                </div>
            </div>
            <p className="mt-6 max-w-sm italic text-muted">
                {pct >= 80 ? 'Xuất sắc — kiến thức rất vững!' : pct >= 50 ? 'Khá tốt, ôn thêm vài câu nữa nhé.' : 'Đừng nản, hãy xem lại và làm lại lần nữa.'}
            </p>

            <p className="mt-3 min-h-6 text-sm" aria-live="polite">
                {!loggedIn && <button className="italic text-burgundy underline underline-offset-4" onClick={onLogin}>Đăng nhập để lưu kết quả vào lịch sử</button>}
                {loggedIn && saveState === 'saving' && <span className="text-muted">Đang lưu kết quả…</span>}
                {loggedIn && saveState === 'saved' && <span className="text-forest">✓ Đã lưu vào <Link to="/history" className="underline underline-offset-4">lịch sử</Link></span>}
                {loggedIn && saveState === 'error' && <span className="text-oxblood">Không lưu được kết quả: {saveError}</span>}
            </p>
            <button className="btn btn-primary mt-4" onClick={onRestart}>Làm lại</button>
        </section>
    );
}
