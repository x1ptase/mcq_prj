USE quiz_db;
GO

-- 2. Xóa sạch dữ liệu cũ để tránh lỗi ID hoặc lỗi logic
TRUNCATE TABLE UserResponses;
TRUNCATE TABLE QuizQuestions;
GO

SELECT * FROM QuizQuestions;

INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
(N'Beta testing is performed at developing organizations site where as Alpha testing is performed by people at their own locations', N'True', N'False', '', '', 'B');