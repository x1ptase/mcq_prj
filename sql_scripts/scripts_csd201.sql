

---TRUE FALSE QUESTION---
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
('State True or False: 
Definition of a balanced tree: "A balanced tree is one whose root has many more left descendents than right descendents, or vice versa."', 'True', 'False', '','','B'),
('State True or False:
"Recursion bears substantial overhead. Each time the program calls a method, the system must assign space for all of the methods local variables and parameters. This can consume considerable memory and requires extra time to manage the additional space"', 'True', 'False', '', '', 'A'),
('In a linked list, the tail node is introduced for performance purpose only.', 'False', 'True', '', '', 'B'),
('State True or False:
In a singly-linked list every element contains some data and a link to the next element, which allows to keep the structure.', 'True', 'False', '', '', 'A'),
('Run length encoding is a lossless compression method in which repeated occurrences of a symbol are replaced by one occurrence of the symbol followed by the number of occurrences', 'True', 'False', '', '', 'A'),
('State True or False:
In a singly-linked list, there is no efficient way to insert a node before a given node in the middle or at the end of the list, but we can insert a node after a given node or at the beginning of the list with time complexity O(1)', 'False', 'True', '', '', 'B'),
('In Huffman coding, both the sender and receiver must have a copy of the same code in order for the decoded file to match the encoded file.', 'True', 'False', '', '', 'A'),
('State True or False:
"In a binary search tree, all the nodes that are left descendants of node A have key values greater than A; all the nodes that are A"s right descendants have key values less than (or equal to) A."', 'True', 'False', '', '', 'B'),
('State True or False: In circular linked-list, it is always required to define both head and tail nodes.', 'True', 'False', '', '', 'B');


---ALGORITHM QUESTION---
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 



---COMPLEXITY OF ALGORITHMS---
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
('The complexity of heap sort is', 'O(nlog n)', 'O(log n)', 'O(n)', 'O(n^2)', 'A'),
('Select the statement that is most correct.
Basically, the complexity of inserting a node before a given node in a doubly linked lists is', 'O(1)', 'O(n)', 'O(log n)', 'O(n^2)', 'A'),
('Select the statement that is most correct.
Basically, the complexity of inserting new element before a given node in the middle of a singly linked lists is', 'O(n^2)', 'O(1)', 'O(log n)', 'O(n)', 'D'),
(N'Given a search() method in a binary search tree:
Node search(int x) {
  Node p = root;
  while(p != null && p.info != x)
    if(x < p.info) p = p.left;
    else p = p.right;
  return(p);
}
The complexity of this algorithm is:', 
'O(n^2)', 'O(n)', 'O(log n)', 'O(nlog n)', 'C'),
('Select the most correct statement:',
'In all cases the insertion sort is O(n^2).', 'The complexity of insertion sort is O(n^2), in the best case it is O(n)', 'The complexity of insertion sort is O(nlog n), in the best case it is O(n).', 'The complexity of insertion sort is O(n^2), in the best case it is O(nlog n).', 'B'),
('Select the most correct statement:',
'In all cases the selection sort is O(n^2).', 'In the worst case the selection sort is O(n^2), in the best case it is O(n).', 'In the worst case the selection sort is O(n^2), in the best case it is O(nlog n).', 'In the average case the selection sort is O(n^2), in the best case it is O(nlog n).', 'A'),
('Select the most correct statement about the complexity of insertion sort',
'Both best and worst cases are O(n^2)', 'The best case is O(n), and the worst case is O(nlogn)', 'The best case is O(nlogn), and the worst case is O(n^2)', 'The best case is O(n), and the worst case is O(n^2)', 'D'),
('Select the most correct statement about the complexity of selection sort', 
'Both best and worst cases are O(n^2)', 'The best case is O(n), and the worst case is O(n^2)', 'The best case is O(n), and the average case is O(nlog n)', 'The best case is O(n), and the average case is O(n^2)', 'A'),
('Select the most correct statement about the complexity of heapsort',
'The best case is O(n), and the worst case is O(n^2)', 'The best case is O(n), and the worst case is O(nlog n)', 'Best case is O(nlog n), the worst case is O(n^2)', 'Both best and worst cases are O(nlog n)', 'D'),
('Select the correct statement.
(full binary tree = proper binary tree = 2-tree)', 'Every complete binary tree is also a full binary tree.', 'Every binary tree is either complete or full.', 'Every full binary tree is also a complete binary tree.', 'No binary tree is both complete and full.', 'A'),
(N'Which statements are true (select two):', 
N'In a singly-linked list there is no efficient way to insert a node before a given node in the middle of the list (O(1)).', 
N'In a singly-linked list we can insert a node after a given node with time complexity O(1)', 
N'In a singly-linked list we can insert a node after a given node with time complexity O(n)', 
N'In a singly-linked list we can insert a node before a given node in the middle of the list with time complexity O(1)', 
'AB');

---ARRAY---
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES  
('pic134.png', '(2)', '(4)', '(3)', '(1)', 'A'),
('pic135.png', '(2)', '(4)', '(3)', '(1)', 'D'),
('pic136.png', '(4)', '(3)', '(1)', '(2)', 'A'),
('pic137.png', '(3)', '(1)', '(2)', '(4)', 'B'),
('pic138.png', '(2)', '(1)', '(3)', '(4)', 'A'),
('pic139.png', '(3)', '(4)', '(1)', '(2)', 'D'),
('pic140.png', '(3)', '(4)', '(2)', '(1)', 'D'),
('pic141.png', '(4)', '(3)', '(2)', '(1)', 'D'),
('pic142.png', '(3)', '(1)', '(4)', '(2)', 'B'),
('pic143.png', '(1)', '(2)', '(3)', '(4)', 'C'),
('pic144.png', '(1)', '(3)', '(2)', '(4)', 'B'),
('pic145.png', '(4)', '(2)', '(1)', '(3)', 'D'),
('pic146.png', '(3)', '(4)', '(2)', '(1)', 'D'),
('pic147.png', '(3)', '(1)', '(4)', '(2)', 'C'),
('pic148.png', '(2)', '(1)', '(3)', '(4)', 'D'),
('pic149.png', '(1)', '(4)', '(2)', '(3)', 'C');


--GRAPH QUESTION---
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
('pic151.png', '4', '2', '5', '3', 'B'),
('pic152.png', '5', '3', '2', '1', 'D'),
('pic153.png', '4', '5', '2', '3', 'D'),
('pic154.png', '2', '4', '1', '5', 'C'),
('pic155.png', '3', '4', '1', '5', 'A'),
('pic156.png', '4', '2', '5', '1', 'B'),
('pic157.png', '26', '18', '24', '27', 'D'),
('pic158.png', '38', '24', '40', '18', 'A'),
('pic159.png', '43', '42', '44', '39', 'B'),
('pic160.png', '37', '42', '40', '43', 'B'),
('pic161.png', '45', '40', '42', '39', 'D');

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
