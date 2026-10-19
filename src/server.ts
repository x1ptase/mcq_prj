import express, { Request, Response } from 'express';
import sql from 'mssql';

const app = express();

app.use(express.json());
app.use(express.static('public'));

const config: sql.config = {
    user: 'sa',
    password: '12345Aa@',
    server: 'localhost',
    database: 'quiz_db',
    options: { encrypt: true, trustServerCertificate: true }
};

interface QuizQuestionRow {
    id: number;
    question: string | null;
    option_a: string | null;
    option_b: string | null;
    option_c: string | null;
    option_d: string | null;
    option_e: string | null;
    option_f: string | null;
    correct_answer: string;
    _db: string;
    _srv: string;
}

interface UserAnswer {
    qId: number;
    answer: string;
}

// Route lấy câu hỏi
app.get('/get-questions', async (_req: Request, res: Response) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request().query<QuizQuestionRow>(
            'SELECT *, DB_NAME() AS _db, @@SERVERNAME AS _srv FROM QuizQuestions ORDER BY id ASC'
        );

        // Logs quan trọng để debug
        if (result.recordset.length > 0) {
            console.log(`[DEBUG] Kết nối tới DB: ${result.recordset[0]._db} trên Server: ${result.recordset[0]._srv}`);
        }
        console.log(`[DEBUG] Số lượng câu hỏi tìm thấy: ${result.recordset.length}`);

        res.json(result.recordset);
    } catch (err) {
        const message = err instanceof Error ? err.message : String(err);
        console.error('Lỗi GET:', message);
        res.status(500).send(message);
    }
});

// Route nộp bài
app.post('/submit-all', async (req: Request, res: Response) => {
    try {
        const userAnswers = req.body as UserAnswer[];
        console.log('Dữ liệu nhận được:', userAnswers);

        const pool = await sql.connect(config);
        const dbData = await pool.request().query<Pick<QuizQuestionRow, 'id' | 'correct_answer'>>(
            'SELECT id, correct_answer FROM QuizQuestions'
        );
        const dbAnswers = dbData.recordset;

        let score = 0;
        const submittedAnswers = [];
        for (const uAns of userAnswers) {
            const q = dbAnswers.find(item => item.id === uAns.qId);

            // So sánh chuẩn hóa (Xóa khoảng trắng, viết hoa)
            const correctStr = q!.correct_answer.trim().toUpperCase();
            const userStr = uAns.answer.trim().toUpperCase();

            let isCorrect = false;
            if (q && userStr === correctStr) {
                score++;
                isCorrect = true;
            }

            submittedAnswers.push({
                question_id: uAns.qId,
                selected_answer: userStr,
                correct_answer: correctStr,
                is_correct: isCorrect
            });

            // Lưu lịch sử
            await pool.request()
                .input('qId', sql.Int, uAns.qId)
                .input('ans', sql.VarChar, userStr)
                .query('INSERT INTO UserResponses (question_id, selected_option) VALUES (@qId, @ans)');
        }
        res.json({ success: true, score, total: dbAnswers.length, data: submittedAnswers });
    } catch (err) {
        const message = err instanceof Error ? err.message : String(err);
        console.error('Lỗi POST (Kiểm tra cột SQL!):', message);
        res.status(500).json({ success: false, message });
    }
});

app.listen(3000, () => console.log('>>> Server chạy tại http://localhost:3000'));
