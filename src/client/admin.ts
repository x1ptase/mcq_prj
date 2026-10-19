interface AdminQuestion {
    id: number;
    question: string | null;
    option_a: string | null; option_b: string | null; option_c: string | null;
    option_d: string | null; option_e: string | null; option_f: string | null;
    correct_answer: string | null;
}

const LETTERS = ['A', 'B', 'C', 'D', 'E', 'F'] as const;
type OptionField = 'option_a' | 'option_b' | 'option_c' | 'option_d' | 'option_e' | 'option_f';

let adminCourses: Course[] = [];
let activeCourse: number | null = null;
let adminQuestions: AdminQuestion[] = [];
let editingCourse: number | null = null; // null = tạo mới
let editingQuestion: number | null = null;

async function initAdmin(): Promise<void> {
    await fetchMe();
    if (!currentUser) { location.href = '/'; return; }
    renderAuthArea();
    if (currentUser.role !== 'admin') {
        $('admin-root').innerHTML = '<div class="empty">Chỉ dành cho quản trị viên.</div>';
        return;
    }
    await reloadCourses();
}

async function reloadCourses(): Promise<void> {
    adminCourses = await api<Course[]>('/api/courses');
    if (activeCourse === null || !adminCourses.some(c => c.id === activeCourse)) activeCourse = adminCourses[0]?.id ?? null;
    adminQuestions = activeCourse === null ? [] : await api<AdminQuestion[]>(`/api/admin/questions?course_id=${activeCourse}`);
    renderAdmin();
}

function renderAdmin(): void {
    const course = adminCourses.find(c => c.id === activeCourse);
    $('admin-root').innerHTML = `
        <div class="toolbar">
            <select class="select" onchange="pickCourse(Number(this.value))" aria-label="Chọn môn">
                ${adminCourses.map(c => `<option value="${c.id}" ${c.id === activeCourse ? 'selected' : ''}>${escapeHtml(c.code)} – ${escapeHtml(c.name)} (${c.question_count})</option>`).join('')}
            </select>
            <button class="btn" onclick="openCourse(null)">➕ Môn mới</button>
            ${course ? `<button class="btn" onclick="openCourse(${course.id})">✏️ Sửa môn</button>
                        <button class="btn" onclick="deleteCourse(${course.id})">🗑 Xóa môn</button>` : ''}
            <div class="spacer"></div>
            ${course ? `<button class="btn btn-primary" onclick="openQuestion(null)">➕ Thêm câu hỏi</button>` : ''}
        </div>
        ${course ? `<div class="table-wrap"><table class="table">
            <thead><tr><th>#</th><th>Câu hỏi</th><th>Đáp án</th><th></th></tr></thead>
            <tbody>${adminQuestions.map((q, i) => `
                <tr>
                    <td>${i + 1}</td>
                    <td class="cell-q">${escapeHtml(q.question)}</td>
                    <td><b>${escapeHtml(q.correct_answer)}</b></td>
                    <td class="cell-actions">
                        <button class="btn" onclick="openQuestion(${q.id})">Sửa</button>
                        <button class="btn" onclick="deleteQuestion(${q.id})">Xóa</button>
                    </td>
                </tr>`).join('') || '<tr><td colspan="4" class="empty">Môn này chưa có câu hỏi.</td></tr>'}
            </tbody></table></div>` : '<div class="empty">Chưa có môn nào. Hãy tạo môn mới.</div>'}`;
}

async function pickCourse(id: number): Promise<void> {
    activeCourse = id;
    await reloadCourses();
}

// ===== Môn học =====
function openCourse(id: number | null): void {
    editingCourse = id;
    const c = adminCourses.find(x => x.id === id);
    $('course-title').textContent = c ? 'Sửa môn học' : 'Môn học mới';
    $<HTMLInputElement>('course-code').value = c?.code ?? '';
    $<HTMLInputElement>('course-name').value = c?.name ?? '';
    $('course-error').textContent = '';
    $<HTMLDialogElement>('course-dialog').showModal();
}

async function saveCourse(ev: Event): Promise<void> {
    ev.preventDefault();
    const body = { code: $<HTMLInputElement>('course-code').value, name: $<HTMLInputElement>('course-name').value };
    try {
        const saved = editingCourse === null
            ? await api<{ id: number }>('/api/admin/courses', 'POST', body)
            : await api<{ id: number }>(`/api/admin/courses/${editingCourse}`, 'PUT', body);
        activeCourse = saved.id;
        $<HTMLDialogElement>('course-dialog').close();
        await reloadCourses();
    } catch (e) {
        $('course-error').textContent = (e as Error).message;
    }
}

async function deleteCourse(id: number): Promise<void> {
    if (!confirm('Xóa môn này?')) return;
    try {
        await api(`/api/admin/courses/${id}`, 'DELETE');
        await reloadCourses();
    } catch (e) {
        alert((e as Error).message);
    }
}

// ===== Câu hỏi =====
function openQuestion(id: number | null): void {
    editingQuestion = id;
    const q = adminQuestions.find(x => x.id === id);
    const correct = q?.correct_answer ?? '';
    $('question-title').textContent = q ? 'Sửa câu hỏi' : 'Câu hỏi mới';
    $<HTMLTextAreaElement>('q-question').value = q?.question ?? '';
    $('q-options').innerHTML = LETTERS.map(l => {
        const value = q ? (q[`option_${l.toLowerCase()}` as OptionField] ?? '') : '';
        return `<div class="opt-row">
            <label class="opt-correct" title="Đáp án đúng"><input type="checkbox" id="q-correct-${l}" ${correct.includes(l) ? 'checked' : ''}> ${l}</label>
            <input class="input" id="q-opt-${l}" value="${escapeHtml(value)}" placeholder="Đáp án ${l}${l > 'B' ? ' (tùy chọn)' : ''}">
        </div>`;
    }).join('');
    $('question-error').textContent = '';
    $<HTMLDialogElement>('question-dialog').showModal();
}

async function saveQuestion(ev: Event): Promise<void> {
    ev.preventDefault();
    const body: Record<string, unknown> = {
        course_id: activeCourse,
        question: $<HTMLTextAreaElement>('q-question').value,
        correct_answer: LETTERS.filter(l => $<HTMLInputElement>(`q-correct-${l}`).checked).join('')
    };
    for (const l of LETTERS) body[`option_${l.toLowerCase()}`] = $<HTMLInputElement>(`q-opt-${l}`).value;
    try {
        if (editingQuestion === null) await api('/api/admin/questions', 'POST', body);
        else await api(`/api/admin/questions/${editingQuestion}`, 'PUT', body);
        $<HTMLDialogElement>('question-dialog').close();
        await reloadCourses();
    } catch (e) {
        $('question-error').textContent = (e as Error).message;
    }
}

async function deleteQuestion(id: number): Promise<void> {
    if (!confirm('Xóa câu hỏi này?')) return;
    try {
        await api(`/api/admin/questions/${id}`, 'DELETE');
        await reloadCourses();
    } catch (e) {
        alert((e as Error).message);
    }
}

initAdmin().catch(e => { $('admin-root').textContent = (e as Error).message; });
