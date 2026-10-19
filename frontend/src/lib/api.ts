export async function api<T = unknown>(path: string, method = 'GET', body?: unknown): Promise<T> {
    const res = await fetch(path, {
        method,
        headers: body !== undefined ? { 'Content-Type': 'application/json' } : undefined,
        body: body !== undefined ? JSON.stringify(body) : undefined
    });
    const data = await res.json().catch(() => null);
    if (!res.ok) throw new Error((data && data.message) || `Lỗi ${res.status}`);
    return data as T;
}

export const errorMessage = (e: unknown): string => (e instanceof Error ? e.message : String(e));
