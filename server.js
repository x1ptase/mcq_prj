const express = require('express');
const sql = require('mssql');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// Cấu hình SQL Server (Thay pass và user nếu cần)
const config = {
    user: 'sa',
    password: '12345',
    server: 'localhost', 
    database: 'quiz_db',
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

// Route 1: Lấy danh sách toàn bộ câu hỏi
app.get('/get-questions', async (req, res) => {
    try {
        let pool = await sql.connect(config);
        // Sắp xếp theo ID để không bao giờ mất câu 1
        let result = await pool.request().query('SELECT * FROM QuizQuestions ORDER BY id ASC');
        res.json(result.recordset);
    } catch (err) {
        console.error("Lỗi API lấy câu hỏi:", err);
        res.status(500).send("Lỗi Server");
    }
});

// Route 2: Lưu đáp án người dùng chọn
app.post('/submit', async (req, res) => {
    const { questionId, answer } = req.body;
    try {
        let pool = await sql.connect(config);
        await pool.request()
            .input('qId', sql.Int, questionId)
            .input('ans', sql.Char(1), answer)
            .query('INSERT INTO UserResponses (question_id, selected_option) VALUES (@qId, @ans)');
        console.log(`Đã lưu câu ${questionId} - Đáp án: ${answer}`);
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false });
    }
});

app.listen(port, () => {
    console.log(`>>> Server đang chạy tại: http://localhost:${port}`);
});