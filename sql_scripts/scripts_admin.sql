USE quiz_db;
GO

CREATE TABLE UserResponses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    selected_option CHAR(1),
    created_at DATETIME DEFAULT GETDATE()
);

DROP TABLE QuizQuestions
CREATE TABLE QuizQuestions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    question NVARCHAR(MAX),
    option_a NVARCHAR(255),
    option_b NVARCHAR(255),
    option_c NVARCHAR(255),
    option_d NVARCHAR(255),
    correct_answer CHAR(1)
);

-- 1. Cho phép cột đáp án chứa tối đa 10 ký tự (để chứa 'AB')
ALTER TABLE QuizQuestions ALTER COLUMN correct_answer VARCHAR(10);
ALTER TABLE UserResponses ALTER COLUMN selected_option VARCHAR(10);
GO

-- 2. Xóa sạch dữ liệu cũ để tránh lỗi ID hoặc lỗi logic
TRUNCATE TABLE UserResponses;
TRUNCATE TABLE QuizQuestions;
GO

SELECT * FROM QuizQuestions;