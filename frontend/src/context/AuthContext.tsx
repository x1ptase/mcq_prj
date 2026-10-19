import { createContext, ReactNode, useCallback, useContext, useEffect, useState } from 'react';
import { api } from '../lib/api';
import { User } from '../types';

interface AuthState {
    user: User | null;
    loading: boolean;
    login: (username: string, password: string) => Promise<void>;
    register: (username: string, password: string) => Promise<void>;
    logout: () => Promise<void>;
}

const AuthContext = createContext<AuthState | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<User | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        api<User | null>('/api/auth/me')
            .then(setUser)
            .catch(() => setUser(null))
            .finally(() => setLoading(false));
    }, []);

    const login = useCallback(async (username: string, password: string) => {
        setUser(await api<User>('/api/auth/login', 'POST', { username, password }));
    }, []);

    const register = useCallback(async (username: string, password: string) => {
        setUser(await api<User>('/api/auth/register', 'POST', { username, password }));
    }, []);

    const logout = useCallback(async () => {
        await api('/api/auth/logout', 'POST');
        setUser(null);
    }, []);

    return <AuthContext.Provider value={{ user, loading, login, register, logout }}>{children}</AuthContext.Provider>;
}

export function useAuth(): AuthState {
    const ctx = useContext(AuthContext);
    if (!ctx) throw new Error('useAuth phải dùng trong AuthProvider');
    return ctx;
}
