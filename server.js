const express = require('express');
const sql = require('mssql');
const app = express();

app.use(express.json());
app.use(express.static('public'));

const config = {
    user: 'sa',
    password: '12345',
    server: 'localhost',
    database: 'quiz_db',
    options: { encrypt: true, trustServerCertificate: true }
};

// Route lấy câu hỏi
app.get('/get-questions', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request().query('SELECT * FROM QuizQuestions ORDER BY id ASC');
        res.json(result.recordset);
    } catch (err) {
        console.error("Lỗi GET:", err.message);
        res.status(500).send(err.message);
    }
});

// Route nộp bài
app.post('/submit-all', async (req, res) => {
    try {
        const userAnswers = req.body;
        console.log("Dữ liệu nhận được:", userAnswers);

        let pool = await sql.connect(config);
        let dbData = await pool.request().query('SELECT id, correct_answer FROM QuizQuestions');
        const dbAnswers = dbData.recordset;

        let score = 0;
        for (const uAns of userAnswers) {
            const q = dbAnswers.find(item => item.id === uAns.qId);
            
            // So sánh chuẩn hóa (Xóa khoảng trắng, viết hoa)
            const correctStr = q.correct_answer.trim().toUpperCase();
            const userStr = uAns.answer.trim().toUpperCase();

            if (q && userStr === correctStr) {
                score++;
            }

            // Lưu lịch sử
            await pool.request()
                .input('qId', sql.Int, uAns.qId)
                .input('ans', sql.VarChar, userStr)
                .query('INSERT INTO UserResponses (question_id, selected_option) VALUES (@qId, @ans)');
        }
        res.json({ success: true, score, total: dbAnswers.length });
    } catch (err) {
        console.error("Lỗi POST (Kiểm tra cột SQL!):", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

app.listen(3000, () => console.log('>>> Server chạy tại http://localhost:3000'));