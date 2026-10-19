-- Migration: nhiều môn/đề thi + tài khoản + lịch sử làm bài.
-- Chạy được nhiều lần (idempotent). Các script nạp câu hỏi cũ vẫn dùng được:
-- câu hỏi chèn không có course_id sẽ thuộc môn mặc định (code = 'DEFAULT').
USE quiz_db;
GO

IF OBJECT_ID('Courses', 'U') IS NULL
CREATE TABLE Courses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    code NVARCHAR(50) NOT NULL UNIQUE,
    name NVARCHAR(200) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);
GO

IF NOT EXISTS (SELECT 1 FROM Courses WHERE code = 'DEFAULT')
INSERT INTO Courses (code, name) VALUES (N'DEFAULT', N'Môn mặc định');
GO

-- Đảm bảo cột đủ rộng cho đáp án nhiều chữ cái và nội dung dài
ALTER TABLE QuizQuestions ALTER COLUMN correct_answer VARCHAR(10);
GO

IF COL_LENGTH('QuizQuestions', 'course_id') IS NULL
BEGIN
    DECLARE @def INT = (SELECT id FROM Courses WHERE code = 'DEFAULT');
    EXEC('ALTER TABLE QuizQuestions ADD course_id INT NOT NULL
          CONSTRAINT DF_QuizQuestions_course DEFAULT ' + @def + ' WITH VALUES');
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_QuizQuestions_Courses')
ALTER TABLE QuizQuestions ADD CONSTRAINT FK_QuizQuestions_Courses
    FOREIGN KEY (course_id) REFERENCES Courses(id);
GO

IF OBJECT_ID('Users', 'U') IS NULL
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(10) NOT NULL DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);
GO

IF OBJECT_ID('Attempts', 'U') IS NULL
CREATE TABLE Attempts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL REFERENCES Users(id),
    course_id INT NOT NULL REFERENCES Courses(id),
    score INT NOT NULL,
    total INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- question_id không có FK để các script nạp dữ liệu cũ (TRUNCATE QuizQuestions) vẫn chạy được
IF OBJECT_ID('AttemptAnswers', 'U') IS NULL
CREATE TABLE AttemptAnswers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    attempt_id INT NOT NULL REFERENCES Attempts(id) ON DELETE CASCADE,
    question_id INT NOT NULL,
    selected_option VARCHAR(10) NOT NULL,
    correct_answer VARCHAR(10) NOT NULL,
    is_correct BIT NOT NULL
);
GO
