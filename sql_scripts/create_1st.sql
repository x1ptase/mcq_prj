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
('State True or False:
Definition of a balanced tree: "A balanced tree is one whose root has many more left descendants than right descendants, or vice versa.', 'True', 'False', '','', 'B'),
('State True or False: "Recursion bears substantial overhead. Each time the program calls a method, the system must assign space for all of the method local variables and parameters. This can consume considerable memory and requires extra time to manage the additional space',
'True', 'False', '','','A'),
('In a linked list, the tail node is introduced for performance purpose only.', 'True', 'False', '', '', 'A'),
('State True or False: In a singly-linked list every element contains some data and a link to the next element, which allows to keep the structure.', 'True', 'False', '', '', 'A');





USE quiz_db;
SELECT * FROM UserResponses;

TRUNCATE TABLE QuizQuestions;

SELECT * FROM QuizQuestions;