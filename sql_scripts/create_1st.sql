CREATE DATABASE quiz_db;
GO
USE quiz_db;
GO
CREATE TABLE UserResponses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    selected_option CHAR(1),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE QuizQuestions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    question NVARCHAR(MAX),
    option_a NVARCHAR(255),
    option_b NVARCHAR(255),
    option_c NVARCHAR(255),
    option_d NVARCHAR(255),
    correct_answer CHAR(1)
);

INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
('The complexity of heap sort is', 'O(nlogn)', 'O(logn)', 'O(n)', 'O(n^2)', 'A'),
('Select the statement that is most correct
Basically, the commplexity of inserting a node before a given node in a doubly linked lists is', 'O(1)', 'O(n)', 'O(logn)', 'O(n^2)', 'A');





USE quiz_db;
SELECT * FROM UserResponses;

TRUNCATE TABLE QuizQuestions;

SELECT * FROM QuizQuestions;