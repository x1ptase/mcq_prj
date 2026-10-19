import { useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { AuthDialog } from '../features/auth/AuthDialog';
import { useTheme } from '../lib/useTheme';

export interface LayoutContext {
    openLogin: () => void;
}

const link = ({ isActive }: { isActive: boolean }) =>
    `border-b-2 px-1 pb-0.5 text-sm font-semibold no-underline transition ${
        isActive ? 'border-burgundy text-burgundy' : 'border-transparent text-ink hover:text-burgundy'
    }`;

export function Layout() {
    const { user, logout } = useAuth();
    const [theme, toggleTheme] = useTheme();
    const [authOpen, setAuthOpen] = useState(false);

    return (
        <>
            <header className="border-b-4 border-double border-rule bg-surface/70">
                <div className="mx-auto max-w-6xl px-5 pt-5 pb-3">
                    <div className="flex items-center justify-between gap-3">
                        <span className="eyebrow hidden sm:block">Sổ luyện trắc nghiệm</span>
                        <div className="flex items-center gap-3 sm:ml-auto">
                            {user ? (
                                <>
                                    <span className="text-sm italic text-muted">Xin chào, <b className="not-italic text-ink">{user.username}</b></span>
                                    <button className="btn" onClick={logout}>Đăng xuất</button>
                                </>
                            ) : (
                                <button className="btn btn-primary" onClick={() => setAuthOpen(true)}>Đăng nhập</button>
                            )}
                            <button className="btn" onClick={toggleTheme} aria-label="Đổi giao diện sáng/tối"
                                title={theme === 'dark' ? 'Chế độ sáng' : 'Chế độ tối'}>
                                {theme === 'dark' ? '☀' : '☾'}
                            </button>
                        </div>
                    </div>

                    <div className="py-3 text-center">
                        <NavLink to="/" className="no-underline">
                            <h1 className="text-4xl font-extrabold italic text-burgundy sm:text-5xl">Multiple Choice Quiz</h1>
                        </NavLink>
                    </div>

                    <nav className="flex justify-center gap-7 border-t border-rule pt-3">
                        <NavLink to="/" end className={link}>Làm bài</NavLink>
                        {user && <NavLink to="/history" className={link}>Lịch sử</NavLink>}
                        {user?.role === 'admin' && <NavLink to="/admin" className={link}>Quản trị</NavLink>}
                    </nav>
                </div>
            </header>

            <Outlet context={{ openLogin: () => setAuthOpen(true) } satisfies LayoutContext} />

            <footer className="py-10 text-center text-xs italic text-muted">❦</footer>
            <AuthDialog open={authOpen} onClose={() => setAuthOpen(false)} />
        </>
    );
}
