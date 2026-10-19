// Script thường (không phải module): các hàm top-level được gọi từ onclick/onchange trong HTML.

interface Question {
    id: number;
    question: string | null;
    option_a: string | null;
    option_b: string | null;
    option_c: string | null;
    option_d: string | null;
    option_e: string | null;
    option_f: string | null;
    correct_answer: string | null;
}

type Status = 'correct' | 'wrong' | 'partial';
type OptionKey = 'option_a' | 'option_b' | 'option_c' | 'option_d' | 'option_e' | 'option_f';

let questions: Question[] = [];
let results: Record<number, Status> = {}; // qId -> trạng thái
let courses: Course[] = [];
let courseId: number | null = null;
let attemptSaved = false;

function setStatus(qId: number, value: Status | null): void {
    if (value) results[qId] = value; else delete results[qId];
    const card = $(`card-${qId}`);
    card.classList.toggle('is-correct', value === 'correct');
    card.classList.toggle('is-wrong', value === 'wrong');
    const nav = document.getElementById(`nav-${qId}`);
    if (nav) nav.className = 'nav-btn' + (value ? ' ' + value : '');
    updateStats();
}

function updateStats(): void {
    const total = questions.length;
    const vals = Object.values(results);
    const correct = vals.filter(v => v === 'correct').length;
    const wrong = vals.filter(v => v === 'wrong').length;
    const done = correct + wrong;
    const set = (id: string, v: string | number) => { $(id).textContent = String(v); };
    set('done-count', done);
    set('total-count', total);
    set('stat-correct', correct);
    set('stat-wrong', wrong);
    set('stat-left', total - done);
    set('progress-pct', (total ? Math.round(done / total * 100) : 0) + '%');
    $('bar-correct').style.width = (total ? correct / total * 100 : 0) + '%';
    $('bar-wrong').style.width = (total ? wrong / total * 100 : 0) + '%';
    renderSummary(total, correct, done);
}

function renderSummary(total: number, correct: number, done: number): void {
    let el = document.getElementById('summary');
    if (!total || done < total) { el?.remove(); return; }
    if (!el) {
        el = document.createElement('div');
        el.id = 'summary';
        el.className = 'summary';
        $('quiz-container').appendChild(el);
    }
    el.innerHTML = `<h3>🎉 Hoàn thành bài thi</h3>
        <div class="big">${correct}/${total}</div>
        <p>${Math.round(correct / total * 100)}% câu trả lời đúng</p>
        <button class="btn" onclick="refreshQuiz()">🔄 Làm lại</button>
        <div id="save-note" class="save-note"></div>`;
    saveAttempt();
}

// Lưu kết quả lên server (chỉ khi đã đăng nhập, mỗi lần làm chỉ lưu một lần)
async function saveAttempt(): Promise<void> {
    if (attemptSaved || courseId === null) return;
    const note = $('save-note');
    if (!currentUser) {
        note.textContent = 'Đăng nhập để lưu kết quả vào lịch sử.';
        return;
    }
    attemptSaved = true;
    const answers = questions.map(q => {
        const picked = Array.from(document.querySelectorAll<HTMLInputElement>(`input[name="q${q.id}"]:checked`));
        return { qId: q.id, answer: picked.map(i => i.value).sort().join('') };
    });
    try {
        await api('/api/attempts', 'POST', { courseId, answers });
        note.innerHTML = '✅ Đã lưu vào <a href="/history.html">lịch sử</a>.';
    } catch (e) {
        attemptSaved = false;
        note.textContent = 'Không lưu được kết quả: ' + (e as Error).message;
    }
}

function renderNav(): void {
    $('nav-grid').innerHTML = questions.map((q, i) =>
        `<button class="nav-btn" id="nav-${q.id}" onclick="goTo(${q.id})" aria-label="Câu ${i + 1}">${i + 1}</button>`
    ).join('');
}

function goTo(qId: number): void {
    $(`card-${qId}`).scrollIntoView({ block: 'start' });
}

// Tải môn học, tài khoản, rồi câu hỏi của môn đang chọn
async function load(): Promise<void> {
    try {
        [courses] = await Promise.all([api<Course[]>('/api/courses'), fetchMe()]);
        renderAuthArea();
        const nonEmpty = courses.filter(c => c.question_count > 0);
        const wanted = Number(new URLSearchParams(location.search).get('course'));
        const initial = courses.find(c => c.id === wanted) ?? nonEmpty[0] ?? courses[0];
        renderCourseSelect(initial?.id ?? null);
        if (initial) await selectCourse(initial.id);
        else render();
    } catch (e) {
        $('quiz-container').innerText = 'Lỗi tải dữ liệu!';
    }
}

function renderCourseSelect(selected: number | null): void {
    const sel = $<HTMLSelectElement>('course-select');
    sel.innerHTML = courses.map(c =>
        `<option value="${c.id}">${escapeHtml(c.code)} – ${escapeHtml(c.name)} (${c.question_count})</option>`).join('');
    if (selected !== null) sel.value = String(selected);
}

async function selectCourse(id: number): Promise<void> {
    courseId = id;
    $<HTMLSelectElement>('course-select').value = String(id);
    history.replaceState(null, '', `?course=${id}`);
    $('quiz-container').innerHTML = '<div class="loading-state"><div class="spinner"></div><p>Đang tải câu hỏi...</p></div>';
    try {
        questions = await api<Question[]>(`/api/courses/${id}/questions`);
        render();
    } catch (e) {
        $('quiz-container').innerText = 'Lỗi tải dữ liệu!';
    }
}

// ===== Đăng nhập / đăng ký =====
let authMode: 'login' | 'register' = 'login';

function openLogin(): void {
    setAuthMode('login');
    $<HTMLDialogElement>('auth-dialog').showModal();
}

function setAuthMode(mode: 'login' | 'register'): void {
    authMode = mode;
    $('auth-title').textContent = mode === 'login' ? 'Đăng nhập' : 'Tạo tài khoản';
    $('auth-submit').textContent = mode === 'login' ? 'Đăng nhập' : 'Đăng ký';
    $('auth-switch').textContent = mode === 'login' ? 'Chưa có tài khoản? Đăng ký' : 'Đã có tài khoản? Đăng nhập';
    $('auth-error').textContent = '';
}

async function submitAuth(ev: Event): Promise<void> {
    ev.preventDefault();
    const username = $<HTMLInputElement>('auth-username').value.trim();
    const password = $<HTMLInputElement>('auth-password').value;
    try {
        await api(`/api/auth/${authMode}`, 'POST', { username, password });
        $<HTMLDialogElement>('auth-dialog').close();
        $<HTMLInputElement>('auth-password').value = '';
        await fetchMe();
        renderAuthArea();
        // Nếu vừa làm xong bài khi chưa đăng nhập thì lưu luôn
        if (document.getElementById('summary') && currentUser) saveAttempt();
    } catch (e) {
        $('auth-error').textContent = (e as Error).message;
    }
}

// Hàm Reset toàn bộ bài
function refreshQuiz(): void {
    if (Object.keys(results).length === 0 || confirm('Bạn có muốn xóa hết kết quả và làm lại từ đầu không?')) {
        render();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

function getCorrectAns(q: Question): string {
    return (q.correct_answer || '').toString().replace(/[^a-zA-Z]/g, '').trim().toUpperCase();
}

function render(): void {
    const container = $('quiz-container');
    results = {};
    attemptSaved = false;
    if (!questions || questions.length === 0) {
        container.innerHTML = '<div class="loading-state"><p>Không có câu hỏi nào để hiển thị.</p></div>';
        return;
    }

    container.innerHTML = questions.map((q, i) => {
        const correctAns = getCorrectAns(q);
        const isMulti = correctAns.length > 1;
        const inputType = isMulti ? 'checkbox' : 'radio';

        // Kiểm tra an toàn trước khi match regex
        const questionText = q.question || '';
        const isImageQuestion = typeof questionText === 'string' && questionText.match(/\.(jpeg|jpg|gif|png|svg)$/i);

        const questionContent = isImageQuestion
            ? `<div class="image-question">
                <p class="q-num">Question ${i + 1}</p>
                <img src="/img/${questionText}" alt="Question Image" class="main-q-img">
               </div>`
            : `<div class="question-header">
                <p class="q-num">Question ${i + 1}</p>
                <div class="q-text">${questionText || ' (Nội dung câu hỏi trống)'}</div>
               </div>`;

        // Badge cho câu multi-answer
        const multiBadge = isMulti
            ? `<div class="multi-badge" id="badge-${q.id}">
                   <span class="badge-icon">☑</span>
                   Chọn <b>${correctAns.length}</b> đáp án &nbsp;·&nbsp;
                   <span id="sel-count-${q.id}" class="sel-count">0/${correctAns.length}</span> đã chọn
               </div>`
            : '';

        return `
        <div class="quiz-card" id="card-${q.id}" style="animation-delay: ${i * 0.08}s">
            ${questionContent}
            ${multiBadge}

            <div class="options">
                ${['A', 'B', 'C', 'D', 'E', 'F'].map(l => {
                    const optionText = q[('option_' + l.toLowerCase()) as OptionKey];
                    if (optionText === null || optionText === undefined || optionText === '') {
                        if (l === 'C' || l === 'D' || l === 'E' || l === 'F') return '';
                    }
                    return `
                    <label class="opt" id="opt-${q.id}-${l}">
                        <input type="${inputType}"
                            name="q${q.id}"
                            value="${l}"
                            id="inp-${q.id}-${l}"
                            onchange="checkInstant(${q.id}, '${l}')">
                        <div class="box">
                            <b>${l}.</b>
                            <span>${optionText || ''}</span>
                        </div>
                    </label>`;
                }).join('')}
            </div>
            <div id="msg-${q.id}" class="feedback-msg"></div>
        </div>`;
    }).join('');
    renderNav();
    updateStats();
}

// Ô .box nằm ngay sau <input> trong mỗi lựa chọn
function boxOf(input: Element | null): HTMLElement | null {
    return input ? input.nextElementSibling as HTMLElement | null : null;
}

function checkInstant(qId: number, _label: string): void {
    const question = questions.find(q => q.id === qId);
    if (!question) return;
    const card = $(`card-${qId}`);
    const msg = $(`msg-${qId}`);
    const correctAns = getCorrectAns(question);

    const selectedInputs = Array.from(card.querySelectorAll<HTMLInputElement>(`input[name="q${qId}"]:checked`));
    const selectedStr = selectedInputs.map(i => i.value).sort().join('');

    // Reset trạng thái visual
    card.querySelectorAll('.box').forEach(b => b.classList.remove('correct', 'wrong', 'correct-missed'));

    if (correctAns.length === 1) {
        // === CÂU ĐƠN (radio) ===
        const selectedInput = card.querySelector<HTMLInputElement>(`input[name="q${qId}"]:checked`);
        if (!selectedInput) return;
        setStatus(qId, selectedStr === correctAns ? 'correct' : 'wrong');
        const box = boxOf(selectedInput);
        if (selectedStr === correctAns) {
            box?.classList.add('correct');
            msg.innerHTML = '<span class="icon">✨</span> Chính xác! Bạn làm rất tốt.';
            msg.className = 'feedback-msg msg-success';
        } else {
            box?.classList.add('wrong');
            // Highlight đáp án đúng
            boxOf(card.querySelector(`input[value="${correctAns}"]`))?.classList.add('correct-missed');
            msg.innerHTML = `<span class="icon">❌</span> Sai rồi. Đáp án đúng là <b>${correctAns}</b>`;
            msg.className = 'feedback-msg msg-error';
        }
        card.querySelectorAll<HTMLInputElement>('input').forEach(i => i.disabled = true);

    } else {
        // === CÂU NHIỀU ĐÁP ÁN (checkbox) ===

        // Cập nhật counter hiển thị
        const counter = document.getElementById(`sel-count-${qId}`);
        if (counter) counter.textContent = `${selectedInputs.length}/${correctAns.length}`;

        if (selectedInputs.length < correctAns.length) {
            // Mở khoá lại tất cả các ô trong trường hợp người dùng bỏ chọn
            card.querySelectorAll<HTMLInputElement>('input').forEach(i => i.disabled = false);
            const badge = document.getElementById(`badge-${qId}`);
            if (badge) badge.classList.remove('badge-done');
            setStatus(qId, selectedInputs.length ? 'partial' : null);

            // Chưa chọn đủ → chỉ thông báo
            const remaining = correctAns.length - selectedInputs.length;
            msg.innerHTML = `<span class="icon">🔔</span> Hãy chọn thêm <b>${remaining}</b> đáp án nữa...`;
            msg.className = 'feedback-msg msg-warning';
            return;
        }

        // Đã chọn đủ số lượng → kiểm tra kết quả
        setStatus(qId, selectedStr === correctAns ? 'correct' : 'wrong');
        if (selectedStr === correctAns) {
            // Tất cả đều đúng
            selectedInputs.forEach(i => boxOf(i)?.classList.add('correct'));
            msg.innerHTML = `<span class="icon">✨</span> Tuyệt vời! Bạn đã chọn đúng cả ${correctAns.length} đáp án.`;
            msg.className = 'feedback-msg msg-success';
        } else {
            // Sai → tô đỏ lựa chọn sai, tô xanh đáp án đúng bị bỏ sót
            selectedInputs.forEach(inp => {
                const box = boxOf(inp);
                if (correctAns.includes(inp.value)) {
                    box?.classList.add('correct'); // Đúng và đã chọn
                } else {
                    box?.classList.add('wrong');   // Sai và đã chọn
                }
            });
            // Highlight các đáp án đúng bị bỏ lỡ
            [...correctAns].forEach(letter => {
                if (!selectedStr.includes(letter)) {
                    boxOf(card.querySelector(`input[value="${letter}"]`))?.classList.add('correct-missed');
                }
            });
            msg.innerHTML = `<span class="icon">❌</span> Chưa đúng. Đáp án đúng là: <b>${correctAns}</b>`;
            msg.className = 'feedback-msg msg-error';
        }

        // CHỈ KHOÁ CÁC Ô CHƯA CHỌN (để không chọn quá số lượng được phép)
        // Các ô đã chọn VẪN ĐƯỢC GIỮ ENABLE để người dùng có thể click lần 2 để hủy chọn
        card.querySelectorAll<HTMLInputElement>('input').forEach(i => {
            if (!i.checked) i.disabled = true;
        });

        // Cập nhật badge
        const badge = document.getElementById(`badge-${qId}`);
        if (badge) badge.classList.add('badge-done');
    }
}

window.onload = load;
