const express = require('express');
const sql = require('mssql');
const app = express();

app.use(express.json());
app.use(express.static('public'));

const config = {
    user: 'sa',
    password: '12345Aa@',
    server: 'localhost',
    database: 'quiz_db',
    options: { encrypt: true, trustServerCertificate: true }
};

// Route lấy câu hỏi
app.get('/get-questions', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request().query('SELECT *, DB_NAME() AS _db, @@SERVERNAME AS _srv FROM QuizQuestions ORDER BY id ASC');
        
        // Logs quan trọng để debug
        if (result.recordset.length > 0) {
            console.log(`[DEBUG] Kết nối tới DB: ${result.recordset[0]._db} trên Server: ${result.recordset[0]._srv}`);
        }
        console.log(`[DEBUG] Số lượng câu hỏi tìm thấy: ${result.recordset.length}`);
        
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
        let submittedAnswers = [];
        for (const uAns of userAnswers) {
            const q = dbAnswers.find(item => item.id === uAns.qId);
            
            // So sánh chuẩn hóa (Xóa khoảng trắng, viết hoa)
            const correctStr = q.correct_answer.trim().toUpperCase();
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
        console.error("Lỗi POST (Kiểm tra cột SQL!):", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

app.listen(3000, () => console.log('>>> Server chạy tại http://localhost:3000'));