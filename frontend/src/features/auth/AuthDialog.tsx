import { FormEvent, useState } from 'react';
import { Dialog, Field } from '../../components/Dialog';
import { useAuth } from '../../context/AuthContext';
import { errorMessage } from '../../lib/api';

export function AuthDialog({ open, onClose }: { open: boolean; onClose: () => void }) {
    const { login, register } = useAuth();
    const [mode, setMode] = useState<'login' | 'register'>('login');
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [busy, setBusy] = useState(false);

    async function submit(e: FormEvent) {
        e.preventDefault();
        setBusy(true);
        setError('');
        try {
            await (mode === 'login' ? login : register)(username.trim(), password);
            setPassword('');
            onClose();
        } catch (err) {
            setError(errorMessage(err));
        } finally {
            setBusy(false);
        }
    }

    return (
        <Dialog open={open} onClose={onClose} title={mode === 'login' ? 'Đăng nhập' : 'Tạo tài khoản'}>
            <form onSubmit={submit}>
                <Field label="Tên đăng nhập">
                    <input className="input" value={username} onChange={e => setUsername(e.target.value)}
                        autoComplete="username" required minLength={3} maxLength={30} />
                </Field>
                <Field label="Mật khẩu">
                    <input className="input" type="password" value={password} onChange={e => setPassword(e.target.value)}
                        autoComplete={mode === 'login' ? 'current-password' : 'new-password'} required minLength={6} />
                </Field>
                <p role="alert" className="min-h-6 text-sm text-oxblood">{error}</p>
                <div className="mt-2 flex flex-wrap items-center justify-between gap-2">
                    <button type="button" className="text-sm italic text-burgundy underline underline-offset-4"
                        onClick={() => { setMode(mode === 'login' ? 'register' : 'login'); setError(''); }}>
                        {mode === 'login' ? 'Chưa có tài khoản? Đăng ký' : 'Đã có tài khoản? Đăng nhập'}
                    </button>
                    <div className="flex gap-2">
                        <button type="button" className="btn" onClick={onClose}>Hủy</button>
                        <button type="submit" className="btn btn-primary" disabled={busy}>
                            {mode === 'login' ? 'Đăng nhập' : 'Đăng ký'}
                        </button>
                    </div>
                </div>
            </form>
        </Dialog>
    );
}
