interface AttemptRow {
    id: number;
    course_id: number;
    code: string;
    course_name: string;
    score: number;
    total: number;
    created_at: string;
}

interface AttemptDetail extends Omit<AttemptRow, 'code'> {
    answers: { question_id: number; selected_option: string; correct_answer: string; is_correct: boolean; question: string | null }[];
}

function fmtDate(iso: string): string {
    return new Date(iso).toLocaleString('vi-VN');
}

async function initHistory(): Promise<void> {
    await fetchMe();
    if (!currentUser) { location.href = '/'; return; }
    renderAuthArea();
    const rows = await api<AttemptRow[]>('/api/attempts');
    if (rows.length === 0) {
        $('content').innerHTML = '<div class="empty">Bạn chưa có lần làm bài nào. <a href="/">Làm bài ngay</a></div>';
        return;
    }
    $('content').innerHTML = `<div class="table-wrap"><table class="table">
        <thead><tr><th>Thời gian</th><th>Môn</th><th>Điểm</th><th></th></tr></thead>
        <tbody>${rows.map(r => `
            <tr>
                <td>${escapeHtml(fmtDate(r.created_at))}</td>
                <td>${escapeHtml(r.code)} – ${escapeHtml(r.course_name)}</td>
                <td><b>${r.score}/${r.total}</b> (${r.total ? Math.round(r.score / r.total * 100) : 0}%)</td>
                <td><button class="btn" onclick="toggleDetail(${r.id})">Chi tiết</button></td>
            </tr>
            <tr class="detail-row" id="detail-${r.id}" hidden><td colspan="4"></td></tr>`).join('')}
        </tbody></table></div>`;
}

async function toggleDetail(id: number): Promise<void> {
    const row = $(`detail-${id}`);
    if (!row.hidden) { row.hidden = true; return; }
    row.hidden = false;
    const cell = row.firstElementChild as HTMLElement;
    cell.textContent = 'Đang tải...';
    try {
        const d = await api<AttemptDetail>(`/api/attempts/${id}`);
        const wrong = d.answers.filter(a => !a.is_correct);
        cell.innerHTML = wrong.length === 0
            ? '🎉 Tất cả câu trả lời đều đúng.'
            : `<div class="detail-title">${wrong.length} câu sai</div>` + wrong.map(a => `
                <div class="detail-item">
                    <div class="detail-q">${escapeHtml(a.question ?? `(Câu #${a.question_id} đã bị xóa)`)}</div>
                    <div>Bạn chọn: <b class="bad">${escapeHtml(a.selected_option)}</b> · Đáp án đúng: <b class="good">${escapeHtml(a.correct_answer)}</b></div>
                </div>`).join('');
    } catch (e) {
        cell.textContent = (e as Error).message;
    }
}

initHistory().catch(e => { $('content').textContent = (e as Error).message; });
