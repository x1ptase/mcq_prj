import { useCallback, useState } from 'react';

type Theme = 'light' | 'dark';

export function useTheme(): [Theme, () => void] {
    const [theme, setTheme] = useState<Theme>(
        () => (document.documentElement.getAttribute('data-theme') as Theme) || 'light'
    );
    const toggle = useCallback(() => {
        const next: Theme = theme === 'dark' ? 'light' : 'dark';
        document.documentElement.setAttribute('data-theme', next);
        try { localStorage.setItem('theme', next); } catch { /* storage không khả dụng */ }
        setTheme(next);
    }, [theme]);
    return [theme, toggle];
}
