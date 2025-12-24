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






--LINH TINH---
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
('Arrays are best data structures', 'for relatively permanent collections of data', 'for the size of the structure and the data in the structure are constantly changing', '', '', 'A'),
('Select the statement that is most correct.', 'Tail recursion is a special case of recursion in which the first operation of the function, is a recursive call', 'Tail recursion is a special case of recursion in which the last operation of the function, the tail call, is a recursive call', '', '', 'B'),
('Linked lists are best suited', 'for relatively permanent collections of data', 'for the size of the structure and the data in the structure are constantly changing', '', '', 'B'),
('Consider the following 2 definitions about graph:
An undirected graph is called connected when there is a path between any two vertices of the graph. If every node u in undirected graph G is adjacent to every other node v in G, A graph is said to be complete.
Which of the following statements is correct:', 'The connected graph is always complete', 'The complete graph is always connected', 'The complete graph is always connected and vise versa', 'None of others', 'B'),
('In a map heap tree,______', 'Values in a node is greater than every value in left sub tree and smaller than right sub tree', 'Values in a node is greater than every value in children of it', 'Both of other conditions applies', '', 'B'),
('In a real computer, what will happen if you make a recursive call without making the problem smaller?', 'The program keeps running until you press Ctrl-C', 'The run-time stack overflows, halting the program', 'The operating system detects the infinite recursion because of the "repeated state"', 'The results are nondeterministic', 'B'),
('Select the statement that is most correct.
Which of the following applications may not use a queue?', 'Store a waiting list of printing jobs', 'Multi-programing', 'Auxiliary data structure for algorithms', 'Undo sequence in a text editor', 'D'),
('Select the most correct statement:', 'In a linked list, the tail node is introduced for performance purpose only', 'In a linked list, there must be the tail node', 'The tail node is necessary for inserting a node after the last node', 'The tail node is necessary for inserting a node before the last node', 'A'),
('Select the statement that is most correct', 'There is no difference between a recursive method and a non-recursive method', 'For a recursive method to terminate there must be one or more steps', 'For a recursive method to terminate there must be one or more limit conditions', 'A recursive method is a method that invokes itself directly or indirectly. For a recursive method to terminate there must be one or more base case', 'D'),
('Specify the reason for data compression (select the best answer):','Saving network band-width', 'Saving data storage', 'Increasing system performance', 'Just compress data for individual hobby', 'B'),
('Specify the disadvantage of hashing algorithm (select the best answer):', 'In most cases the collision is unsolvable', 'It is hard to retrieve an item from the hash table', 'It is difficult to expand hash tables because they are based on arrays', 'It is impossible to delete an item from a hash tables', 'C'),
('Specify the statement that is most correct about a circular linked list','Circular linked list is a normal doubly-linked list', 'In circular linked-list, it is required to define both head and tail nodes', 'Circular linked list is a normal singly linked list', 'Circular linked list is a linked list in which the last node of the list points to the first node in the list', 'D'),
('Specify the correct statement about bucket addressing method for handling collision (select the best answer)', 'Bucket is a linked list which holds items in the hash table.', 'A bucket is a block of space which is large enough to store all colliding items.', 'Colliding elements in the same position in the hash table are placed on a bucket associated with that position.', 'All of the statements are incorrect.', 'C'),
('Specify the correct statement about chaining method for handling collision.', 'In chaining, some positions of the table is associated with a linked list or chain of structures whose info fields store keys or references to keys.', 'In this method, the table can never overflow if free memory is available, because the linked list is extendible.', 'In chaining, the linked-list is used instead of array for a hash table.', 'None of others.',  'B'),
('Specify the correct statement about the open addressing method.', 'Each position of the table is associated with a linked list or chain of structures whose info fields store keys or references to keys', 'The collision is resolved by finding an available table entry other than the position to which the colliding key is originally hashed.', 'The collision is resolved by finding a free memory area to store any collision.', 'A free memory area is opened for storing keys.', 'B'),
('Select the most suitable statement about a binary search tree.', 'It is necessary to build a tree with optimized height to stimulate searching operation.', 'In a BST, all nodes that are left descendants of node A have values greater than A; all the nodes that are As right descendants have key values less than (or equal to) A', 'The main purpose of balancing a tree is to keep the tree in good shape.', 'For better searching performance, a tree should be in back-bone shape', 'A'),
('Specify the correct statement about the coalesced chaining method for handling collision (select the best answer).', 'In coalesced hashing, the linked list is created inside the hash table and a colliding key is put in the first available position if the table', 'In coalesced hashing, the linked list is created outside the hash table and a colliding key is put in the list connected to the colliding position if the table', 'Because in coalesced hashing, the linked list is created inside the hash table, thus the searching must be carried out sequentially', 'In coalesced hashing, the linked list is created inside the hash table and a colliding key is put in the last available position of the table.', 'A'),
('Select the statement about recursive functions that is most correct.', 'Every recursive function must have exactly one base case.', 'Every recursive function must have at least one base case.', 'In recursive function the base cases may be absent.', 'In recursive function only the general (recursive) case must be appeared', 'B');


USE quiz_db;
SELECT * FROM UserResponses;

TRUNCATE TABLE QuizQuestions;

SELECT * FROM QuizQuestions;