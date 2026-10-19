// Script dùng chung cho mọi trang (nạp trước app/history/admin). Không phải module.

interface User {
    id: number;
    username: string;
    role: 'user' | 'admin';
}

interface Course {
    id: number;
    code: string;
    name: string;
    question_count: number;
}

function $<T extends HTMLElement = HTMLElement>(id: string): T {
    const el = document.getElementById(id);
    if (!el) throw new Error(`Missing element #${id}`);
    return el as T;
}

function escapeHtml(value: unknown): string {
    return String(value ?? '').replace(/[&<>"']/g, c =>
        ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c] as string));
}

async function api<T = any>(path: string, method = 'GET', body?: unknown): Promise<T> {
    const res = await fetch(path, {
        method,
        headers: body !== undefined ? { 'Content-Type': 'application/json' } : undefined,
        body: body !== undefined ? JSON.stringify(body) : undefined
    });
    const data = await res.json().catch(() => null);
    if (!res.ok) throw new Error((data && data.message) || `Lỗi ${res.status}`);
    return data as T;
}

function toggleTheme(): void {
    const next = document.documentElement.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', next);
    try { localStorage.setItem('theme', next); } catch (e) { /* storage không khả dụng */ }
}

let currentUser: User | null = null;

async function fetchMe(): Promise<User | null> {
    try {
        currentUser = await api<User | null>('/api/auth/me');
    } catch (e) {
        currentUser = null;
    }
    return currentUser;
}

async function logout(): Promise<void> {
    await api('/api/auth/logout', 'POST');
    location.href = '/';
}

// Vẽ khu vực tài khoản trong thanh trên cùng (#auth-area)
function renderAuthArea(): void {
    const area = $('auth-area');
    if (!currentUser) {
        area.innerHTML = `<button class="btn" onclick="openLogin()">👤 <span class="label">Đăng nhập</span></button>`;
        return;
    }
    const links = [
        `<a class="btn" href="/history.html">📊 <span class="label">Lịch sử</span></a>`,
        currentUser.role === 'admin' ? `<a class="btn" href="/admin.html">⚙️ <span class="label">Quản trị</span></a>` : '',
        `<button class="btn" onclick="logout()" title="Đăng xuất">${escapeHtml(currentUser.username)} ⏏</button>`
    ];
    area.innerHTML = links.join('');
}
