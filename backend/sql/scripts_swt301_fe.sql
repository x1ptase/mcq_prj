CREATE DATABASE quiz_db;
USE quiz_db;
GO

IF OBJECT_ID('UserResponses', 'U') IS NULL
BEGIN
    CREATE TABLE UserResponses (
        id INT IDENTITY(1,1) PRIMARY KEY,
        question_id INT,
        selected_option VARCHAR(10),
        created_at DATETIME DEFAULT GETDATE()
    );
END

IF OBJECT_ID('QuizQuestions', 'U') IS NULL
BEGIN
    CREATE TABLE QuizQuestions (
        id INT IDENTITY(1,1) PRIMARY KEY,
        question NVARCHAR(MAX),
        option_a NVARCHAR(255),
        option_b NVARCHAR(255),
        option_c NVARCHAR(255),
        option_d NVARCHAR(255),
        option_e NVARCHAR(255),
        correct_answer VARCHAR(10)
    );
END
GO

TRUNCATE TABLE UserResponses;
TRUNCATE TABLE QuizQuestions;
GO

SELECT * FROM QuizQuestions;

--TRUE/FALSE
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, option_e, correct_answer) VALUES 
(N'Beta testing is performed at developing organizations site where as Alpha testing is performed by people at their own locations', N'True', N'False', '', '', '', 'B'),
(N'Configuration and compatibility testing are typically good choices for outsourcing', N'True', N'False', '', '', '', 'A'),
(N'Drivers are tools used to control and operate the software being tested', N'True', N'False', '', '', '', 'A'),
(N'Defects are recorded into three major purposes. They are:
1. To correct the defect
2. To report status of the application
3. To improve the software development process', 'True', 'False', '', '', '', 'A'),
(N'Exhaustive testing is possible', N'True', N'False', '', '', '', 'B'),
(N'Quality Assurance is the process by which product quality is compared with the application standards and the action taken when nonconformance is detected.', N'True', N'False', '', '', '', 'A'),
(N'Verification can be termed as "Are we building the product right?"', N'True', N'False', '', '', '', 'A'),
(N'The number of tests to test all control statements equals the cyclomatic complexity', N'True', N'False', '', '', '', 'A'),
(N'The goal of a software tester is to find bugs, find them as early as possible and make sure they get fixed', N'True', N'False', '', '', '', 'A');


---000
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, option_e, correct_answer) VALUES 
(N'A typical commercial test execution tool would be able to perform all of the following EXCEPT:', N'Generating expected outputs', N'Replaying inputs according to a programmed script',
N'Comparison of expected outcomes with actual outcomes', N'Recording test inputs', N'Reading test values from a data file', 'A');

--NOT QUESTION
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES 
(N'What is NOT typically a feature of a test management tool?',
 N'Scheduling tests',
 N'Generating test data',
 N'Logging test results',
 N'Managing testing activities',
 N'', N'B'),
(N'What is not a test type?',
 N'Structural testing',
 N'Functional testing',
 N'Non-functional testing',
 N'Performance testing',
 N'Change-related testing',
 N'D'),
(N'What is an example that is NOT a risk?',
 N'Member takes 3 days off sick, delays deadline.',
 N'In the team, there is a member who has developed a library, helping to improve work performance.',
 N'Member lacks technical skills.',
 N'The assignment schedule must exclude days off and holidays.',
 N'Whenever we cross the road, there is some risk that we''ll be injured by a car.',
 N'B'),
(N'What information need not be included in a test incident report?',
 N'How to fix the fault',
 N'How to reproduce the fault',
 N'Test environment details',
 N'Severity, priority',
 N'The actual and expected outcomes',
 N'A'),
(N'What can static analysis NOT find?',
 N'The use of a variable before it has been defined',
 N'Unreachable (dead) code',
 N'Memory leaks',
 N'Array bound violations',
 N'', N'C'),
(N'Which of the following is not a type of incremental testing approach?',
 N'Top down',
 N'Big-bang',
 N'Bottom up',
 N'Functional incrementation',
 N'', N'B'),
(N'Which of the following is NOT a type of non-functional test?',
 N'State-Transition',
 N'Usability',
 N'Performance',
 N'Security',
 N'', N'A'),
(N'Which of the following is NOT part of configuration management?',
 N'Status accounting of configuration items',
 N'Auditing conformance to ISO9001',
 N'Identification of test versions',
 N'Record of changes to documentation over time',
 N'Controlled library access',
 N'B'),
(N'Which of the following is NOT a main principle for tool selection?',
 N'Understanding of the technologies used by competitors',
 N'Evaluation of tools against clear requirements and objective criteria',
 N'Estimation of a cost-benefit ratio',
 N'Assessment of the maturity of the organization',
 N'', N'A'),
(N'Which of the following is NOT a standard related to testing?',
 N'IEEE829',
 N'IEEE610',
 N'BS7925-1',
 N'BS7925-2',
 N'', N'B'),
(N'Which of the following is NOT a characteristic of User Acceptance Testing?',
 N'Use of automated test execution tools',
 N'Testing performed by users',
 N'Testing against acceptance test criteria',
 N'Integration of system with user documentation',
 N'', N'A'),
(N'Which of the following is NOT included in the Test Plan document?',
 N'Test items (software versions)',
 N'What is not to be tested',
 N'Test environments',
 N'Quality plans',
 N'Schedules and deadlines',
 N'D'),
(N'Which of the following would you NOT usually find on a software incident report?',
 N'The name of the person raising the problem',
 N'Version of the Software Under Test',
 N'Suggestions on how to fix the problem',
 N'Actual and expected results',
 N'', N'C'),
(N'Which of the following is not a static testing technique?',
 N'Error guessing',
 N'Walkthrough',
 N'Data flow analysis',
 N'Inspections',
 N'', N'A'),
(N'Which is not a project risk?',
 N'Supplier issues',
 N'Organization factors',
 N'Technical issues',
 N'Error-prone software delivered',
 N'', N'D'),
(N'Which is not a testing objective?',
 N'Finding defects',
 N'Gaining confidence about quality',
 N'Preventing defects',
 N'Debugging defects',
 N'', N'D'),
(N'Which is not a black box testing technique?',
 N'Equivalence partition',
 N'Decision tables',
 N'Transaction diagrams',
 N'Decision testing',
 N'', N'D'),
(N'Which is not part of the fundamental test process?',
 N'Planning and control',
 N'Test closure activities',
 N'Analysis and design',
 N'None of the others',
 N'', N'D'),
(N'Which is not a software characteristic?',
 N'Reliability',
 N'Usability',
 N'Development cost',
 N'Maintainability',
 N'', N'C'),
(N'Which is not a testing principle?',
 N'Early testing',
 N'Defect clustering',
 N'Pesticide paradox',
 N'Exhaustive testing',
 N'', N'D'),

(N'Which is not true about a black box tester?',
 N'Understands requirements',
 N'Understands source code',
 N'Is motivated to find faults',
 N'Is creative in finding weaknesses',
 N'', N'B'),
(N'Which of the following is NOT a benefit of static testing?',
 N'Improving communication',
 N'Reducing testing cost and time',
 N'Reducing development cost and time',
 N'Reducing the need for documentation',
 N'', N'D'),
(N'Which of the following is not included in a Test Plan?',
 N'Features to be tested',
 N'Environmental needs',
 N'Suspension criteria',
 N'Expected results',
 N'', N'D'),
(N'Which of the following techniques is NOT a white-box technique?',
 N'Statement coverage',
 N'Decision coverage',
 N'Condition coverage',
 N'Boundary value analysis',
 N'', N'D'),
(N'Which of the following is NOT part of system testing?',
 N'Business process testing',
 N'Performance testing',
 N'Requirements-based testing',
 N'Usability testing',
 N'Top-down integration testing',
 N'E'),
(N'Which of the following is not part of Test Execution Phase?',
 N'Creating test suites',
 N'Executing test cases',
 N'Comparing actual results',
 N'Designing tests',
 N'', N'D'),
(N'Which one is not an international standard?',
 N'IEC',
 N'IEEE',
 N'ISO',
 N'All of the others',
 N'', N'B'),
(N'Which test may not mimic real-world situations?',
 N'Functional testing',
 N'Structural testing',
 N'Both',
 N'None',
 N'', N'B'),
(N'Which rule should not be followed for reviews?',
 N'Defects are identified and corrected',
 N'Review product not producer',
 N'All members responsible for result',
 N'Each review has objective',
 N'', N'C'),
(N'Defect Management process does not include?',
 N'Defect prevention',
 N'Deliverable base-lining',
 N'Management reporting',
 N'None of the others',
 N'', N'B'),
(N'If an expected result is not specified then:',
 N'We cannot run the test',
 N'Difficult to repeat test',
 N'Difficult to determine pass/fail',
 N'Cannot automate inputs',
 N'', N'C');

--TRUE QUESTION LONG
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
(N'Which of the following is true?',
 N'Component testing should be black box, system testing should be white box',
 N'If you find a lot of bugs in testing, you should not be very confident about the quality of software',
 N'The fewer bugs you find, the better your testing was',
 N'The more tests you run, the more bugs you will find',
 N'', N'B'),
(N'Which of the following statements is true of static analysis?',
 N'Compiling code is not a form of static analysis',
 N'Static analysis need not be performed before code execution',
 N'Static analysis can find faults that are hard to find with dynamic testing',
 N'Extensive statistical analysis will not be needed if white-box testing is performed',
 N'', N'C'),
(N'A field failure occurs when multiple users access a system. Which is true?',
 N'This is an acceptable risk of a multi-user system',
 N'Insufficient functional testing has been performed',
 N'This indicates an important non-functional requirement was not specified and tested',
 N'It is not possible to test such events before release',
 N'', N'C'),
(N'A typical formal review process consists of five main steps. What is the correct order?',
 N'Planning → Individual review → Initiate review → Issue communication → Fixing & Reporting',
 N'Planning → Initiate review → Individual review → Issue communication → Fixing & Reporting',
 N'Initiate review → Planning → Individual review → Issue communication → Fixing & Reporting',
 N'Planning → Issue communication → Initiate review → Individual review → Fixing & Reporting',
 N'', N'B'),
(N'Which statement is CORRECT about decision coverage?',
 N'Decision coverage measures percentage of possible paths',
 N'Decision coverage measures business flows',
 N'Decision coverage measures if-statements executed with true/false',
 N'Decision coverage measures proportion of decision outcomes exercised',
 N'', N'D');

 --DAU _____
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
(N'______ is a very early build intended for limited distribution to a few key customers and for marketing demonstration purposes.',
 N'Alpha release',
 N'Beta release',
 N'Test release document',
 N'Build',
 N'', N'A'),
(N'______ is the process of testing a single unit of code in an isolated manner.',
 N'Integration Testing',
 N'Unit Testing',
 N'Acceptance Testing',
 N'System Testing',
 N'', N'B'),
(N'A ______ consists of a set of test cases covering the end-to-end functionality of a software application.',
 N'Test Case',
 N'Test Scenario',
 N'Test Scripts',
 N'None of the mentioned',
 N'', N'B'),
(N'Reviews, walkthroughs, and inspections are part of ______.',
 N'Design process',
 N'Validation process',
 N'Verification process',
 N'Management process',
 N'', N'C');

--- NGAN
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
(N'What is the normal order of activities in which software testing is organized?',
 N'Unit, Integration, System, Validation',
 N'System, Integration, Unit, Validation',
 N'Unit, Integration, Validation, System',
 N'None of the above',
 N'', N'A'),
(N'What is a characteristic feature of a test harness?',
 N'Schedules tests',
 N'Supplies inputs to the software being tested',
 N'Manages software incidents',
 N'Analyzes software performance',
 N'', N'B'),
(N'What is a key feature of static analysis tools?',
 N'Executing the code',
 N'Checking coding standards',
 N'Testing system performance',
 N'Automating user feedback',
 N'', N'B'),

(N'What is a key reason that software testing is necessary?',
 N'To increase complexity',
 N'To identify defects',
 N'To reduce features',
 N'To speed development',
 N'', N'B'),

(N'What is the final step in incident management?',
 N'Logging',
 N'Reviewing',
 N'Closing report',
 N'Assigning',
 N'', N'C'),

(N'What does change-related testing include?',
 N'Performance testing',
 N'Confirmation & regression testing',
 N'Usability testing',
 N'Security testing',
 N'', N'B'),

(N'What is used to call a function and pass test data?',
 N'Stub',
 N'Driver',
 N'Proxy',
 N'None',
 N'', N'B'),

(N'Which defects are best found by static testing?',
 N'Performance defects',
 N'UI defects',
 N'Runtime errors',
 N'Missing requirements/design defects',
 N'', N'D'),

(N'Which tools are used for regression testing?',
 N'Performance tools',
 N'Record/Playback tools',
 N'Both',
 N'None',
 N'', N'B'),

(N'What type of testing for internet banking?',
 N'System integration',
 N'Functional',
 N'Non-functional',
 N'Requirements',
 N'', N'C'),

(N'What does defect severity indicate?',
 N'Tester skill',
 N'Impact on system',
 N'Cost',
 N'Timeline',
 N'', N'B'),

(N'Which is NOT a testability characteristic?',
 N'Operability',
 N'Observability',
 N'Simplicity',
 N'Robustness',
 N'', N'D'),

(N'Least important in test management?',
 N'Estimation',
 N'Incident management',
 N'Configuration management',
 N'Debugging',
 N'', N'D'),

(N'Key characteristic of walkthrough?',
 N'Scenario, dry run, peer group',
 N'Preparation',
 N'Follow-up',
 N'Metrics',
 N'', N'A'),

(N'Regression automation tool?',
 N'Data tester',
 N'Boundary tester',
 N'Capture/Playback',
 N'Output comparator',
 N'', N'C'),
(N'Black box technique?',
 N'Statement testing',
 N'Equivalence partitioning',
 N'Error guessing',
 N'Usability testing',
 N'', N'B'),
(N'Memory leak detection tool?',
 N'State analysis',
 N'Coverage analysis',
 N'Dynamic analysis',
 N'Memory analysis',
 N'', N'C'),
(N'What defines expected results?',
 N'Test case specification',
 N'Test design specification',
 N'Test procedure specification',
 N'Test results',
 N'', N'A'),
(N'Which is static test?',
 N'Code inspection',
 N'Coverage analysis',
 N'Usability',
 N'Installation',
 N'', N'A'),
(N'Odd one out?',
 N'White box',
 N'Glass box',
 N'Clear box',
 N'Black box',
 N'Transparent box',
 N'D'),
(N'Entry criteria for testing (choose 2)',
 N'Test environment ready',
 N'All test cases done',
 N'PM approval',
 N'Resources available',
 N'', N'AD'),
(N'Non-functional testing type?',
 N'Usability',
 N'Statement coverage',
 N'Dataflow',
 N'Cause-effect',
 N'', N'A'),
(N'Biggest cost saving from CAST?',
 N'Test management',
 N'Test design',
 N'Test planning',
 N'Test execution',
 N'', N'D'),
(N'Which is non-functional testing?',
 N'Performance',
 N'Unit',
 N'Regression',
 N'Sanity',
 N'', N'A'),
(N'Activity creating test suites?',
 N'Implementation & execution',
 N'Planning',
 N'Analysis',
 N'Closure',
 N'', N'A'),
(N'Component level testing?',
 N'System',
 N'Integration',
 N'Unit',
 N'Acceptance',
 N'', N'C'),
(N'Testing under extreme conditions?',
 N'Stress',
 N'Load',
 N'Performance',
 N'Volume',
 N'', N'A'),
(N'Static code analysis technique?',
 N'Error guessing',
 N'Equivalence partitioning',
 N'Code review',
 N'Decision table',
 N'', N'C'),
(N'Requirements management tool?',
 N'Incident tool',
 N'Requirements tool',
 N'Config tool',
 N'None',
 N'', N'B'),
(N'Tool for memory leak?',
 N'Dynamic analysis',
 N'Static analysis',
 N'Maintenance',
 N'Config',
 N'', N'A'),
(N'Which verifies business requirements?',
 N'Unit testing',
 N'System testing',
 N'Integration testing',
 N'Acceptance testing',
 N'', N'D'),
(N'Input combination technique?',
 N'Error guessing',
 N'Decision table',
 N'Boundary value',
 N'Equivalence partition',
 N'', N'B'),
(N'Test case creation tool?',
 N'Test design',
 N'Test execution',
 N'Static analysis',
 N'Test management',
 N'', N'A'),
(N'Experience-based technique?',
 N'Black-box testing',
 N'White-box testing',
 N'Experience-based testing',
 N'Specification-based testing',
 N'', N'C'),
(N'White-box branch coverage?',
 N'Basis path coverage testing',
 N'Statement coverage testing',
 N'Branch coverage testing',
 N'Condition coverage testing',
 N'', N'C'),
(N'Retesting after fix?',
 N'Regression',
 N'Maintenance',
 N'Confirmation',
 N'None',
 N'', N'C'),
(N'When should configuration management procedures be implemented?',
 N'During test planning',
 N'Druring test Analysis',
 N'During test Execution',
 N'When evaluating exit criteria',
 N'', N'A'),
(N'Error guessing belongs to?',
 N'Specification-based',
 N'Structure-based',
 N'Experience-based',
 N'Reference-based',
 N'', N'C'),
(N'Visible deviation is called?',
 N'An Error',
 N'A Fault',
 N'A Failure',
 N'A Defect',
 N'A Mistake',
 N'C'),
(N'Who records review issues?',
 N'Moderator',
 N'Scribe',
 N'Reviewer',
 N'Author',
 N'', N'B'),
(N'Who debugs?',
 N'Developers',
 N'Analysts',
 N'Testers',
 N'Managers',
 N'', N'A'),
(N'How does usability testing differ from performance testing?',
 N'Usability testing focuses on user-friendliness, while performance testing measures operational capabilities',
 N'Usability testing measures how fast the system responds to requests, while performance testing checks for user-friendliness',
 N'They do not differ, both terms describe the same tests',
 N'Usability testing is a type of performance testing',
 N'', N'A');


-- 9999
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
('A______ is the step-by-step method followed to ensure that standards are met', 
 'SDLC', 'Project Plan', 'Policy', 'Procedure', '', 'D'),

('A formal assessment of a work product conducted by one or more qualified independent reviewer to detect defects.', 
 'Inspection', 'Walkthrough', 'Review', 'Non Conformance', '', 'A'),

('A tool that supports traceability, recording of incidents or scheduling of tests is called:', 
 'A dynamic analysis tool', 'A test execution tool', 'A debugging tool', 'A test management tool', 'A configuration management tool', 'D'),

('A person who documents all the issues, problems and open points that were identified during a formal review', 
 'Moderator', 'Scribe', 'Author', 'Manager', '', 'B'),

('A common test technique during component test is', 
 'Statement and branch testing', 'Usability testing', 'Security testing', 'Performance testing', '', 'A'),

('A software model that can''t be used in functional testing', 
 'Process flow model', 'State transaction model', 'Menu structure model', 'Plain language specification model', '', 'D'),

('A program with high cyclometic complexity is almost likely to be:', 
 'Large', 'Small', 'Difficult to write', 'Difficult to test', '', 'D'),

('A white box testing technique that measures the number of or percentage of decision directions executed by the test case designed is called', 
 'Condition coverage', 'Decision/Condition coverage', 'Decision Coverage', 'Branch coverage', '', 'C'),
('As part of which test process do you determine the exit criteria?', 
 'Test planning', 'Evaluating exit criteria and reporting', 'Test closure', 'Test control', '', 'A'),

('Cyclomatic Complexity method comes under which testing method?', 
 'White box', 'Black box', 'Green box', 'Yellow box', '', 'A'),

('Capture and replay facilities are least likely to be used to', 
 'Performance testing', 'Recovery testing', 'GUI testing', 'User requirements', '', 'D'),

('CAST stands for', 
 'Computer Aided Software Testing', 'Computer Aided Software Tools', 'Computer Analysis Software Techniques', 'None of the others', '', 'A'),

('Contract and regulation testing is a part of', 
 'System testing', 'Acceptance testing', 'Integration testing', 'Smoke testing', '', 'B'),

('Cost of the reviews will not include', 
 'Review process itself', 'Metrics analysis', 'Tool support', 'Process improvement', '', 'D'),

('During which test activity could faults be found most cost effectively?', 
 'Execution', 'Design', 'Planning', 'Check exit criteria completion', '', 'B'),

('Defect Management process does not include', 
 'Defect prevention', 'Deliverable base-lining', 'Management reporting', 'None of the others', '', 'D'),

('Designing the test environment set-up and identifying any required infrastructure and tools are a part of which phase?', 
 'Test Implementation and execution', 'Test Analysis and Design', 'Evaluating the Exit Criteria and reporting', 'Test Closure Activities', '', 'B'),
('EULA stands for', 
 'End Usability License Agreement', 'End User License Agreement', 'End User License Arrangement', 'End User License Attachment', '', 'B'),
('Exhaustive Testing is', 
 'Impractical but possible', 'Practically possible', 'Impractical and impossible', 'Always possible', '', 'C'),
('Find the correct flow of the phases of a formal review', 
 'Planning, Review meeting, Rework, Kick off', 
 'Planning, Individual preparation, Kick off, Rework', 
 'Planning, Review meeting, Rework, Follow up', 
 'Planning, Individual preparation, Follow up, Kick off', 
 '', 'C'),
('Faults found by users are due to', 
 'Insufficient time for testing', 'Poor software and poor testing', 'Bad luck', '', '', 'B'),
('Function/Test matrix is a type of', 
 'Interim Test report', 'Final test report', 'Project status report', 'Management report', '', 'C'),
('Unreachable code would best be found using', 
 'Code reviews', 'Code inspections', 'A coverage tool', 'A test management tool', 'A static analysis tool', 'E'),
('Handover of Testware is a part of which phase', 
 'Test Analysis and Design', 'Test Planning and control', 'Test Closure Activities', 'Evaluating exit criteria and reporting', '', 'C'),
('Majority of system errors occur in the ____ phase', 
 'Requirements Phase', 'Analysis and Design Phase', 'Development Phase', 'Testing Phase', '', 'A'),
('Handover of Testware is a part of which phase?', 
 'Test Analysis and Design', 'Test Planning and control', 'Test Closure Activities', 'Evaluating exit criteria and reporting', '', 'C'),
('Maintenance releases and technical assistance centers are examples of which of the following quality?', 
 'External failure', 'Internal failure', 'Appraisal', 'Prevention', '', 'A'),
('One key reason why developers have difficulty testing their own work is', 
 'Lack of technical documentation', 'Lack of test tools on the market for developers', 'Lack of training', 'Lack of objectivity', '', 'D'),
('One of the following is not a part of white box testing as per BS7925-II standards', 
 'Random testing', 'Data flow testing', 'Statement testing', 'Syntax testing', '', 'D'),

('Incorrect form of logic coverage is', 
 'Statement coverage', 'Pole coverage', 'Condition coverage', 'Path coverage', '', 'B'),

('In which phase are static tests used?', 
 'Requirements', 'Design', 'Coding', 'All of the others', '', 'D'),

('Increasing the quality of the software by better development methods will affect the time needed for testing by', 
 'Reducing test time', 'No change', 'Increasing test time', 'Can''t say', '', 'A'),
('In a review meeting a moderator is a person who', 
 'Takes minutes of the meeting', 'Mediates between people', 'Takes telephone calls', 'Writes the documents to be reviewed', '', 'B'),
('In which testing level would you test for defects in the interfaces and interaction between integrated components?', 
 'Component testing', 'Integration testing', 'System testing', 'Acceptance testing', '', 'B'),
('Reviewing the test basis is a part of which phase?', 
 'Test Analysis and Design', 'Test Implementation and execution', 'Test Closure Activities', 'Evaluating exit criteria and reporting', '', 'A'),
('Peer reviews are also called as', 
 'Inspection', 'Walkthrough', 'Technical Review', 'Formal Review', '', 'C'),
('People who do not participate in technical reviews', 
 'Analysts', 'Management', 'Developers', 'Testers', '', 'B'),
('Performs sufficient testing to evaluate every possible path and condition in the application system. The only test method that guarantees proper functioning is called', 
 'Regression Testing', 'Exhaustive Testing', 'Basic Path Testing', 'Branch Testing', '', 'B'),
('PDCA is known as', 
 'Plan, Do, Check, Act', 'Plan, Do, Correct, Act', 'Plan, Debug, Check, Act', 'Plan, Do, Check, Accept', '', 'A'),
('Pick the best definition of quality', 
 'Quality is job one', 'Zero defects', 'Conformance to requirements', 'Work as designed', '', 'C'),
('Poor software characteristics are', 
 'Only Project risks', 'Only Product risks', 'Project risks and Product risks', 'Project risks or Product risks', '', 'B'),
('Use cases can be performed to test', 
 'Performance testing', 'Unit testing', 'Business scenarios', 'Static testing', '', 'C'),
('Unreachable code would best be found using', 
 'Code reviews', 'Code inspections', 'A coverage tool', 'A test management tool', 'A static analysis tool', 'E'),
('Static analysis tools are typically used by', 
 'Testers', 'Developers', 'Testers & Developers', 'None of the others', '', 'C'),
('Software quality is not relevant to', 
 'Correctness', 'Usability', 'Viability', 'Reusability', '', 'C'),
('The IEEE 829 test plan documentation standard contains all of the following, EXCEPT', 
 'Test items', 'Test deliverables', 'Test tasks', 'Test environment', 'Test specification', 'E'),
('The ____ will be performed by the people at client own locations', 
 'Alpha testing', 'Field testing', 'Performance testing', 'System testing', '', 'B'),
('The _____ and _____ are used within individual workbenches to produce the right output products', 
 'Tools and techniques', 'Procedures and standards', 'Processes and walkthroughs', 'Reviews and update', '', 'A'),
('The principal attributes of tools and automation are (choose one answer)', 
 'Speed & efficiency', 'Accuracy & precision', 'Both of (1) and (2)', 'None of (1) nor (2)', '', 'C'),
('The person who leads the review of the documents, planning the review, running the meeting and follow-up after the meeting is called', 
 'Reviewer', 'Author', 'Moderator', 'Auditor', '', 'C'),
('Testing activity which is performed to expose defects in the interfaces and in the interaction between integrated components is', 
 'System level testing', 'Integration level testing', 'Unit level testing', 'Component testing', '', 'B'),
('Testing wherein we subject the system to varying workloads to measure and evaluate performance and behavior under different workloads is called', 
 'Load Testing', 'Integration Testing', 'System Testing', 'Usability Testing', '', 'A'),
('Test cases are grouped into manageable (and scheduled) units called', 
 'Test Harness', 'Test Suite', 'Test Cycle', 'Test Driver', '', 'B'),
('The provision and management of a controlled library containing all the configuration items is called', 
 'Configuration Control', 'Status Accounting', 'Configuration Identification', '', '', 'A'),
('Test conditions are derived from', 
 'Specifications', 'Test Cases', 'Test Data', 'Test Design', '', 'A'),
('Which of the following is NOT typically done by a vendor contractor writing initial scripts', 
 'Measuring response time', 'Measuring transaction rates', 'Recovery testing', 'Simulating many users', 'Generating many transactions', 'E'),
('The process starting with the terminal modules is called', 
 'Top-down integration', 'Bottom-up integration', 'None of the others', 'Module integration', '', 'B'),
('The planning phase of a formal review includes which of the following', 
 'Explaining the objectives', 'Selecting personnel and allocating roles', 'Follow up', 'Individual meeting preparations', '', 'B');


-- 0000
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
('Tool which stores requirement statements, checks for consistency, allows prioritization and enables traceability of tests to requirements, functions and features is called', 
 'Incident management tools', 'Requirements management tools', 'Configuration management tools', 'None of the others', '', 'B'),
('The purpose of requirement phase is', 
 'To freeze requirements', 'To understand user needs', 'To define the scope of testing', 'All of the others', '', 'D'),
('The inputs for developing a test plan are taken from', 
 'Project plan', 'Business plan', 'Support plan', 'None of the others', '', 'A'),
('White box techniques are also called as', 
 'Structural testing', 'Design based testing', 'Error guessing technique', 'Experience based technique', '', 'A'),
('We use the output of requirement analysis (requirement specification) as input for writing', 
 'User acceptance test cases', 'Integration level test cases', 'Unit level test cases', 'Program specifications', '', 'A'),
('With thorough testing it is possible to remove all defects from a program prior to delivery to the customer', 
 'True', 'False', '', '', '', 'B');


 --- SO AND MULTIPLE CHOICE
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
('What is the smallest number of test cases required to provide 100% branch coverage for the following code:
if (x > y)
    x = x + 1;
else
    y = y + 1;
while (x > y) {
    y = x * y;
    x = x + 1;
}', 
 '1', '2', '3', '4', '', 'B'),
 ('How many tests are required to achieve 100% branch/decision coverage for the following code:
if (width > length)
    biggest_dimension = width
else
    biggest_dimension = length
end_if
print "Biggest dimension is " & biggest_dimension
print "Width: " & width
print "Length: " & length', 
 '1', '2', '3', '4', '', 'B'),
 ('Which of the following is the component test standard?', 
 'IEEE 829', 'IEEE 610', 'BS7925-1', 'BS7925-2', '', 'D'),
('Which of the following is the standard for software product quality?', 
 'ISO 9126', 'ISO 829', 'ISO 1012', 'ISO 1028', '', 'A'),
('For the password field (8-12 alphanumeric characters), which of the following is a valid boundary value?', 
 '7 characters', '8 characters', '13 characters', '10 characters', '', 'B'),
('If a candidate is given an exam of 40 questions, must get 25 marks to pass (61%) and 80% for distinction, what is the equivalence class?', 
 '23, 24, 25', '0, 12, 25', '30, 36, 39', '32, 37, 40', '', 'D'),
 ('If the pseudo code below were a programming language, how many tests are required to achieve 100% statement coverage?
1. If x = 3 then
2.     Display_messageX;
3.     If y = 2 then
4.         Display_messageY;
5.     Else
6.         Display_messageZ;
7. Else
8.     Display_messageZ;', 
 '1', '2', '3', '4', '', 'B'),
('Values less than 10 are rejected, values between 10 and 21 are accepted, values greater than or equal to 22 are rejected. Which input values cover all equivalence partitions?', 
 '10,11,21', '3,20,21', '3,10,22', '10,21,22', '', 'C'),
('A thermometer measures temperature in whole degrees only. If temperature falls below 18 degrees, heating is switched off. It is switched on again when temperature reaches 21 degrees. 
Which values cover all equivalence partitions?', 
 '15, 19 and 25', '17, 18 and 19', '18, 20 and 22', '16, 26 and 32', '', 'A'),
('A wholesaler sells printer cartridges. Minimum order quantity is 5. There is a 20% discount for orders of 100 or more printer catridges. 
Which group represents Boundary Value Analysis?', 
 '5, 6, 20', '4, 5, 80', '4, 5, 99', '1, 20, 100', '', 'C'),
('Software testing accounts for what percentage of software development costs?', 
 '10-20%', '40-50%', '70-80%', '5-10%', '', 'B'),
('A program validates a numeric field: 
Value less than 10 rejected, values between 10 and 21 are accepted, values greater
than or equal to 22 are rejected. Which covers the MOST boundary values?', 
 '9,10,11,22', '9,10,21,22', '10,11,21,22', '10,11,20,21', '', 'B'),
('An input field takes year of birth between 1900 and 2004. Boundary values are', 
 '0, 1900, 2004, 2005', '1900, 2004', '1899, 1900, 2004, 2005', '1899, 1900, 1901, 2003, 2004, 2005', '', 'C'),
('Design test cases using Equivalence Partitioning for customer age discount function (select all that apply)', 
 '1-12 years: 50% discount', '13-64 years: 20% discount', '65 years and above: 30% discount', 'None of the others', '', 'ABC'),

('Order numbers range between 10000 and 99999 inclusive. Which inputs represent valid equivalence classes and valid boundaries?', 
 '1000, 5000, 99999', '9999, 50000, 100000', '10000, 50000, 99999', '10000, 99999', '9999, 10000, 50000, 99999, 100000', 'C'),

('The Switch is switched off once the temperature falls below 18 and then it is turned on when the temperature
is more than 21 .Identify the Equivalence values which belong to the same class. When the temperature is more 
than 21', 
 '12, 16, 22', '24, 27, 17', '22, 23, 24', '14, 15, 19', '', 'C'),

('Which of the following could be a reason for a failure?
1. Testing fault 
2. Software fault 
3.Design fault 
4. Environment Fault 
5. Documentation Fault', 
 '2 is valid reason; 1, 3, 4 & are not', 
 '1,2,3,4 are valid reasons; 5 is not', 
 '1,2,3 are valid reasons; 4 & 5 are not', 
 'All of them are valid reasons for failure', '', 'D'),

('Which of the following types of defects is use case testing MOST LIKELY to uncover?
i) Defects in the process flows during real-world use of the system. 
ii) Defects in the interface parameters in integration testing. 
iii) Integration defects caused by the interaction and interference of different components. 
iv) Defects in the system as it transitions between one state and another.', 
 'ii, iii', 
 'i, iii', 
 'iii, iv', 
 'i, ii', '', 'B'),

('Which of the following are the main activities of the work product review process? 
1. Planning 
2. Initiate review 
3. Select reviewers 
4. Individual review 
5. Review meeting 
6.Evaluating review findings against exit criteria 
7.Issue communication and analysis 
8. Fixing and reporting', 
 '1, 2, 4, 7, 8', 
 '2, 3, 4, 5, 8', 
 '1, 2, 3, 5, 7', 
 '1, 4, 5, 6, 7', '', 'A'),

('Which of the following statements are TRUE for Technical Review? 
I. Reviewers should be technical peers of the author, and technical experts in the same or other area 
II. Review meeting is typically led by the author 
III. Purposes gaining consensus, detecting potential defects 
IV. Scribe is mandatory 
V. Individual preparation before the review meeting is optional', 
 'I, II and III', 
 'II, III and IV', 
 'I, III and IV', 
 'II and V', '', 'A'),

('Which of the following activities should be performed during the selection and implementation of a testing 
tool? 
i) Investigate the organisation”s test process. 
ii) Conduct a proof of concept. 
iii) Implement the selected tool on a project behind schedule to save time. 
iv) Identify coaching and mentoring requirements for the use of the selected tool.', 
 'i, ii, iii', 
 'ii, iii, iv', 
 'i, iii, iv', 
 'i, ii, iv', '', 'D'),

('Which of the following benefits are MOST likely to be achieved by using test tools? 
i) Easy to access information about tests and testing. 
ii) Reduced maintenance of testware. 
iii) Easy and cheap to implement. 
iv) Greater consistency of tests', 
 'ii and iv', 
 'ii and iii', 
 'i and iv', 
 'i and iii', '', 'C'),

('Which of the following are characteristic of regression testing? 
i) Regression testing is run ONLY once 
ii) Regression testing is used after fixes have been made 
iii) Regression testing is often automated 
iv) Regression tests need not be maintained', 
 'ii, iv', 
 'ii, iii', 
 'i, iii, iv', 
 'iii', '', 'B'),
('Which of the following types of defects is use case testing MOST LIKELY to uncover? 
i) Defects in the process flows during real-world use of the system. 
ii) Defects in the interface parameters in integration testing. 
iii) Integration defects caused by the interaction and interference of different components. 
iv) Defects in the system as it transitions between one state and another.', 
 'ii, iii', 
 'i, iii', 
 'iii, iv', 
 'i, ii', '', 'B'),
('Which of the following helps in monitoring test progress?
i. Percentage of test case execution
ii. Percentage of work done in test environment preparation
iii. Defect information (e.g. defect density, defects found and fixed)
iv. Size of the testing team and skills of the engineers', 
 'iv is correct and i, ii, iii are incorrect', 
 'i, ii, iii are correct and iv is incorrect', 
 'i, ii are correct and iii, iv are incorrect', 
 'i, iv are correct and ii, iii are incorrect', 
 '', 'B'),
('Which of the following are tasks of a Test Lead / Leader?
i. Interaction with the test tool vendor to leverage tools
ii. Write test summary reports based on testing results
iii. Decide what should be automated, to what degree and how
iv. Create test specifications', 
 'i, ii, iii are true and iv is false', 
 'ii, iii, iv are true and i is false', 
 'i is true and ii, iii, iv are false', 
 'iii and iv are true and i and ii are false', 
 '', 'A'),
('Which of the following is a part of Test Closure Activities?
i. Checking which planned deliverables have been delivered
ii. Defect report analysis
iii. Finalizing and archiving testware
iv. Analyzing lessons learned', 
 'i, ii, iv are true and iii is false', 
 'i, ii, iii are true and iv is false', 
 'i, iii, iv are true and ii is false', 
 'All of them are true', 
 '', 'B');
---204 - 224
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES

('Which of the following is the task of a Tester?
i) Interaction with the Test Tool Vendor to identify best ways to leverage test tool on the project.
il) Prepare and acquire Test Data
ili) Implement Tests on all test levels, execute and log the tests.
iv) Create the Test Specifications', 
 'i, il, ill is true and iv is false', 
 'ii, ili, iv is true and i is false', 
 'i is true and ii, ili, iv are false', 
 'ili and iv is correct and i and ii are incorrect', 
 '', 'B'),

('Which of the following is true about Formal Review or Inspection:
i) Led by Trained Moderator (not the author).
ii) No Pre Meeting Preparations
ili) Formal Follow up process.
iv) Main Objective is to find defects', 
 'ii is true and i,ili, iv are false', 
 'i,ili, iv are true and ii is false', 
 'i,ili, iv are false and il is true', 
 'ili is true and i,ii,iv are false', 
 '', 'B'),

('Which activities form part of test planning?
i) Developing test cases.
ii) Defining the overall approach to testing.
iii) Assigning resources.
iv) Building the test environment
v) Writing test conditions.', 
 'i, ii & iv are true, ili & v are false.', 
 'ii & ili are true, i, iv & v are false.', 
 'iv & v are true, i, ii & ili are false.', 
 'i, ii & ili are true iv & v are false.', 
 '', 'B'),

('Who are the persons involved in a Formal Review
i) Manager
ii) Moderator
ili) Scribe / Recorder
iv) Assistant Manager', 
 'i, ii, ill, iv are true', 
 'i, ii, ill are true and iv is false.', 
 'ii, ili, iv are true and i is false.', 
 'i, iv are true and ii, ili are false.', 
 '', 'B'),

('A Test Plan Outline contains which of the following:
i. Test Items
ii. Test Scripts
ili. Test Deliverables
iv. Responsibilities', 
 'i, ii, ill are true and iv is false', 
 'i, ili, iv are true and il is false', 
 'ii, ili are true and i and iv are false', 
 'i, ii are false and ill, iv are true', 
 '', 'B'),

('Consider the following statements about early test design:
i. Early test design can prevent fault multiplication
il. Faults found during early test design are more expensive to fix
iii. Early test design can find faults
iv. Early test design can cause changes to the requirements
v. Early test design takes more effort', 
 'i, ill & iv are true, ii & V are false', 
 'ili is true, i, ii, iv & V are false', 
 'ili & iv are true, i, ii & V are false', 
 'i, iii, iv & V are true, ii is false', 
 'i & ili are true, ii, iv & v are false', 'A'),

('Deciding How much testing is enough should take into account:
i. Level of Risk including Technical and Business product and project risk
ii. Project constraints such as time and budget
ili. Size of Testing Team
iv. Size of the Development Team', 
 'i, ii, ili are true and iv is false', 
 'i, iv are true and ii is false', 
 'i, ii are true and ili, iv are false', 
 'ii, ili, iv are true and i is false', 
 '', 'C'),

('Defects discovered by static analysis tools include:
i. Variables that are never used.
ii. Security vulnerabilities.
ill. Programming Standard Violations
iv. Uncalled functions and procedures', 
 'i, ii, iii, iv is correct', 
 'ill is correct i, ii, iv are incorrect', 
 'i, ii, ili and iv are incorrect', 
 'iv, il is correct', 
 '', 'A'),

('Exit Criteria may consist of
i. Thoroughness measures, such as coverage of code, functionality or risk
ii. Estimates of Defect density or reliability measures.
ili. Residual risk such as defects not fixed or lack of test coverage in certain areas
iv. Verifying the Test Environment.', 
 'iv is correct and i, ii, ili are incorrect', 
 'i, il, ill is correct and iv is incorrect', 
 'il is correct and i, ili, iv are incorrect', 
 'ili and iv are correct and i, ii are incorrect', 
 '', 'B'),

('From a Testing perspective, what are the MAIN purposes of Configuration Management?
i. Identifying the version of software under test.
ii. Controlling the version of testware items.
ill. Developing new testware items.
iv. Tracking changes to testware items.
v. Analysing the need for new testware items.', 
 'ii, iv and v', 
 'ii, ill and iv', 
 'i, ii and iv', 
 'i, ill and v', 
 '', 'C'),

('Features of White Box Testing Technique:
i. We use explicit knowledge of the internal workings of the item being tested to select the test data.
ii. Uses specific knowledge of programming code to examine outputs and assumes that the tester knows the path of logic in a unit or a program.
ili. Checking for the performance of the application
iv. Also checks for functionality', 
 'i, ii are true and ili and iv are false', 
 'ill is true and i, ii, iv are false', 
 'ii, ill is true and i, iv is false', 
 'ill and iv are true and i, ii are false', 
 '', 'A'),

('Match every stage of the software Development Life cycle with the Testing Life cycle:
i. Hi-level design
ii. Code
ill. Low-level design
iv. Business requirements

a. Unit tests
b. Acceptance tests
c. System tests
d. Integration tests', 
 'i-d, ii-a, ili-c, iv-b', 
 'i-c, ii-d, ili-a, iv-b', 
 'i-b, ii-a, ili-d, iv-c', 
 'i-c, ii-a, iii-d, iv-b', 
 '', 'D'),

('Validation involves which of the following
i. Helps to check the Quality of the Built Product
ii. Helps to check that we have built the right product
iii. Helps in developing the product
iv. Monitoring tool wastage and obsoleteness', 
 'Options i, ii, ili, iv are true', 
 'il is true and i, ill, iv are false', 
 'i, ii, ill are true and iv is false', 
 'ill is true and i, ii, iv are false', 
 '', 'B'),

('Verification involves which of the following
i. Helps to check the Quality of the built product
ii. Helps to check that we have built the right product
ili. Helps in developing the product
iv. Monitoring tool wastage and obsoleteness', 
 'Options i, ii, iii, iv are true', 
 'i is true and ii, iii, iv are false', 
 'i, ii, ill are true and iv is false', 
 'il is true and i, ili, iv are false', 
 '', 'B'),

('Success Factors for a review include:
i. Each Review does not have a predefined objective
ii. Defects found are welcomed and expressed objectively
iii. Management supports a good review process
iv. There is an emphasis on learning and process improvement', 
 'ii, ili, iv are correct and i is incorrect', 
 'ill, i, iv is correct and il is incorrect', 
 'i, iii, iv, ii is incorrect', 
 'ii is correct', 
 '', 'A'),

('Some tools are geared more for developer use. For the 5 tools listed, which statement BEST details those for developers.
i. Performance testing tools
ii. Coverage measurement tools
iii. Test comparators
iv. Dynamic analysis tools
V. Incident management tools', 
 'i, ili and iv are more for developers', 
 'ii and iv are more for developers', 
 'ii, ill and iv are more for developers', 
 'ii and ill are more for developers', 
 '', 'B'),

('Testing should be stopped when:', 
 '(i) All the defined tests have been executed', 
 '(ii) Time has run out', 
 '(iii) All faults have been fixed correctly', 
 'Both (i) and (iii)', 
 'It depends on the risks for the system being tested', 'E'),

('Test planning has which of the following major tasks?
i. Determining the scope and risks, and identifying the objectives of testing.
il. Determining the test approach.
iii. Reviewing the Test Basis.
iv. Determining the exit criteria.', 
 'i, ii, iv are true and ill is false', 
 'i, iv are true and ii is false', 
 'i, ii are true and ili, iv are false', 
 'ii, ili, iv are true and i is false', 
 '', 'A'),

('The selection of a test approach should consider the context:
i. Risk of Failure of the Project
ii. Skills and experience
ili. The objective of the testing endeavor
iv. The size of the testing Team', 
 'i, ii, ili, iv are true', 
 'i, ii, ill are true and iv is false', 
 'ii, ili, iv are true and i is false', 
 'i, iv are true and ii, ill are false', 
 '', 'B'),

('Test Implementation and execution has which of the following major tasks?
i. Developing and prioritizing test cases
ii. Creating the test suite
ili. Verifying test environment
iv. Determining the exit criteria', 
 'i, ii, ill are true and iv is false', 
 'i, iv are true and il is false', 
 'i, ii are true and ili, iv are false', 
 'ii, iii, iv are true i is false', 
 '', 'A'),

('The Phases of formal review process is mentioned below arrange them in the correct order
i) Planning
ii) Review Meeting
iii) Rework
iv) Individual Preparations
v) Kick Off
vi) Follow Up', 
 'i, ii, iii, iv, v, vi', 
 'vi, i, ii, ili, iv, v', 
 'i, v, iv, ii, iii, vi', 
 'i, ii, ili, v, iv, vi', 
 '', 'C');


--- 226 - 240
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
('The principle of Cyclomatic complexity, considering L as edges or links, N as nodes, P as independent paths', 
 'L-N+ 2P', 
 'N- L+ 2P', 
 'N- -L+P', 
 'N- L+P', 
 '', 'B'),

('Match the following terms and statements.
1. Decision Table Testing
2. Decision Testing
3. State Transition Testing
4. Exploratory Testing

W. Testing carried out with boxes to achieve specific test objectives, possibly to complement structured testing.
X. A test technique used which may be used to verify different system responses depending on current conditions or previous history.
Y. A test technique which combines combinations of inputs that might not otherwise have been exercised during testing.
Z. A form of control flow testing based on decision outcomes.', 
 '1Y, 2Z, 3X, 4W', 
 '1X, 2W, 3Z, 4Y', 
 '1Z, 2X, 3W, 4Y', 
 '1Z, 2Y, 3X, 4W', 
 '', 'A'),
('Consider the following:
Pick up and read the newspaper
Look at what is on television

If there is a program that you are interested in watching then
    Switch the television on and watch the program
Otherwise
    Continue reading the newspaper

If there is a crossword in the newspaper then
    try and complete the crossword', 
 'SC = 1 and DC = 1', 
 'SC = 1 and DC = 2', 
 'SC = 1 and DC = 3', 
 'SC = 2 and DC = 2', 
 'SC = 2 and DC = 3', 'E'),
 ('Considering the code provided, which is true about the minimal quantity of test cases necessary
 for complete statement and branch/decision coverage?
Read A
Read B
IF A + B > 50 THEN
    Print "Sum two age"
ENDIF
IF B > 20 THEN
    Print "B is of adult age"
ENDIF', 
 '1 test for statement coverage, 3 for branch coverage', 
 '1 test for statement coverage, 1 for branch coverage', 
 '1 test for statement coverage, 2 for branch coverage', 
 '2 tests for statement coverage, 2 for branch coverage', 
 '', 'C'),

('A piece of software has been given_____what tests in the following will you perform?', 
 '1) Test the area''s most critical to business processes', 
 '2) Test the areas where faults will be maximum', 
 '3) Test the easiest functionalities', 
 '1 & 2 are false, 3 is true', 
 '', 'A'),
('Regression testing should be performed:
v) Every week
w) After the software has changed
x) As often as possible
y) When the environment has changed
z) When the project manager says', 
 'v & w are true, X - z are false', 
 'w, X & y are true, v & z are false', 
 'w & y are true, v, x & z are false', 
 'w is true, v, x, y and z are false', 
 'All of them are true', 'C'),

('Match the following:
1. Test estimation
2. Test control
3. Test monitoring

a. Measures of tracking process
b. Effort required to perform activities
c. Reallocation of resources', 
 '1-b, 2-c, 3-a', 
 '1-b, 2-a, 3-c', 
 '1-c, 2-a, 3-b', 
 '1-a, 2-b, 3-c', 
 '', 'B'),
('Which expression best matches the following characteristics of review processes:
1. Led by author
2. Undocumented
3. No management participation
4. Led by a trained moderator or leader
5. Uses entry exit criteria

s) Inspection
t) Peer review
u) Informal review
v) Walkthrough', 
 'S = 4, t = 3, U = 2 and 5, V= 1', 
 's = 4 and 5, t = 3, U = 2, V= 1', 
 's = 1 and 5, t = 3, u = 2, V = 4', 
 's = 5, t = 4, u = 3, V = 1 and 2', 
 'S = 4 and 5, t= 1, U = 2, V= 3', 'B'),

('Minimum Test Required for Statement Coverage:
Disc = 0
Order-qty = 0

Read Order-qty
If Order-qty >= 20 then
    Disc = 0.05
If Order-qty >= 100 then
    Disc = 0.1
End if
End if', 
 'Statement coverage is 4', 
 'Statement coverage is 1', 
 'Statement coverage is 3', 
 'Statement coverage is 2', 
 '', 'B'),

('Given the following:
Switch PC on
Start "outlook"

IF outlook appears THEN
    Send an email
Close outlook', 
 '1 test for statement coverage, 1 for branch coverage', 
 '1 test for statement coverage, 2 for branch coverage', 
 '1 test for statement coverage, 3 for branch coverage', 
 '2 tests for statement coverage, 2 for branch coverage', 
 '2 tests for statement coverage, 3 for branch coverage', 'B'),

('Given the following code, which is true:
IF A > B THEN
    C=A- B
ELSE
    C= A + B
ENDIF

Read D
IF C = D Then
    Print "Error"
ENDIF', 
 '1 test for statement coverage, 3 for branch coverage', 
 '2 tests for statement coverage, 2 for branch coverage', 
 '2 tests for statement coverage, 3 for branch coverage', 
 '3 tests for statement coverage, 3 for branch coverage', 
 '3 tests for statement coverage, 2 for branch coverage', 'D'),

('The above diagram represents the following paths through the code.
A. VWy
B. vwz
C. vxy
D. VXZ

What is the MINIMUM combination of paths required to provide full statement coverage?
Exhibit: (Pic 4_39)', 
 'ABCD', 
 'ABD', 
 'A', 
 'ACD', 
 '', 'C'),

('Consider the following state transition diagram of a switch.
Which of the following represents an invalid state transition?
(Pic 4_276)', 
 'ON to OFF', 
 'OFF to ON', 
 'FAULT to ON', 
 '', 
 '', 'C'),

('Given the following state transition diagram.
Which of the following series of state transitions contains an INVALID transition which may indicate a fault in the system design?
Exhibit:', 
 'Login Browse Basket Checkout Basket Logout', 
 'Login Browse Basket Checkout Pay Logout', 
 'Login Browse Basket Checkout Basket Checkout Pay Logout', 
 'Login Browse Basket Browse Basket Checkout Pay Logout', 
 '', 'A'),

('What is the expected result for each of the following test cases?
(Pic 4_272)

A. Citibank card member, holding a Silver room
B. Non Citibank-member, holding a Platinum room', 
 'A - Don''t offer any upgrade, B - Don''t offer any upgrade', 
 'A - Offer upgrade to Silver, B - Offer upgrade to Silver', 
 'A - Don''t offer any upgrade, B - Offer upgrade to Gold', 
 'A - Offer upgrade to Gold, B - Don''t offer any upgrade', 
 '', 'D');

-- DAI
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
('What is the main goal of static testing?', 
 'To execute the software and identify defects', 
 'To review documents and source code without executing the software', 
 'To test the software with a focus on its user interface', 
 'To validate the software performance under stress', 
 '', 'B'),

('What is an advantage of using data-driven scripts in test automation?', 
 'They do not require external data', 
 'They separate test data from scripts, enhancing flexibility', 
 'They are simpler to maintain than linear scripts', 
 'They eliminate the need for scripting knowledge', 
 '', 'B'),

('What is the main purpose of use case testing?', 
 'To identify defects in process flows related to typical use of the system', 
 'To identify defects in the connections between components', 
 'To identify defects in extreme scenarios', 
 'To identify defects related to unapproved programming practices', 
 '', 'A'),

('What is the main purpose of specification-based testing techniques?', 
 'To evaluate the system behavior from an external perspective', 
 'To assess the internal structure of the software', 
 'To improve software design', 
 'To test without formal requirements', 
 '', 'A'),

('What is a primary difference between static and dynamic testing techniques?', 
 'Static testing involves executing code, dynamic does not', 
 'Static testing does not execute code, dynamic does', 
 'Static testing is only for developers', 
 'Static testing cannot find defects', 
 '', 'B'),

('What is static testing?', 
 'Software work products are examined without execution', 
 'Software is executed and outputs are compared', 
 'Execution is used to detect defects', 
 'Testing starts after dynamic testing', 
 '', 'A'),

('What is dynamic testing?', 
 'Software is examined without execution', 
 'Software is executed and outputs are verified', 
 'Testing starts early in lifecycle', 
 'Validation of requirements only', 
 '', 'B'),

('What is the typical sequence of testing activities in the Waterfall model?', 
 'System → Integration → Acceptance', 
 'Acceptance → System → Integration', 
 'Integration → System → Acceptance', 
 'Component → System → Integration', 
 '', 'C'),

('What is the role of performance testing in system testing?', 
 'To verify system behavior under load', 
 'To ensure functional requirements', 
 'To check data accuracy', 
 'To confirm system is bug-free', 
 '', 'A'),
('What is the main advantage of using the V-model in software development?', 
 'It eliminates the need for testing.', 
 'It integrates testing throughout the development phases.', 
 'It is less costly and time-consuming compared to other models.', 
 'It focuses on post-development testing only.', 
 '', 'B'),
('What is the purpose of unit testing in software development?', 
 'To test the entire system as a whole', 
 'To test individual units or components in isolation', 
 'To validate the software against user requirements', 
 'To perform performance testing', 
 '', 'B'),

('What is a characteristic of non-functional testing?', 
 'It is always performed after functional testing.', 
 'It focuses on how well the system performs certain actions.', 
 'It is concerned solely with what the system does.', 
 'It does not include performance testing.', 
 '', 'B'),

('What is an effect of poor communication between testers and developers?', 
 'It enhances the efficiency of the development and testing processes.', 
 'It may lead to misunderstandings and reduced software quality.', 
 'It improves the independence of the testing function.', 
 'It has no effect as long as testing is done independently.', 
 '', 'B'),

('What is the significance of context in testing according to the principles?', 
 'It is irrelevant since all testing follows the same standard.', 
 'It is critical as testing approaches should vary based on the specific context.', 
 'It suggests that testing should always follow the same international standards.', 
 'Context is only important in large, complex systems.', 
 '', 'B'),

('What is the significance of defining scope in a test plan?', 
 'It outlines the geographical areas where the product will be sold', 
 'It determines who the end-users will be', 
 'It clarifies what is included and excluded from testing', 
 'It sets the price points for various market segments', 
 '', 'C'),

('What is the key focus of state transition testing?', 
 'The changes in state within an application based on varying input conditions', 
 'The visual aspects of the user interface', 
 'The stability of application under peak load', 
 'The compatibility of the software with various operating systems', 
 '', 'A'),

('What is Integration testing?', 
 'It tests interfaces between components, interactions to different parts of a system such as an operating system, file system and hardware or interfaces between systems.', 
 'It is unit, module and program testing, searches for defects in, and verifies the functioning of software that are separately testable.', 
 'It is concerned with the behavior of the whole system/product as defined by the scope of a development project or product.', 
 'The system will be delivered to the user or customer for testing', 
 '', 'A'),

('What is the purpose of a walkthrough?', 
 'To finalize the document under review', 
 'To educate participants and gather feedback', 
 'To detect critical defects', 
 'To automate review processes', 
 '', 'B'),

('What is the ''Pesticide Paradox'' in testing?', 
 'Testing all combinations is impossible.', 
 'Same tests over time detect fewer issues', 
 'Testing must be exhaustive to find all bugs', 
 'Defects tend to cluster in specific modules:', 
 '', 'B'),
('What is the primary objective of functional testing?', 
 'To assess the system''s non-functional characteristics like performance.', 
 'To verify that the software functions according to the specified requirements.', 
 'To evaluate the system''s capacity to handle high loads.', 
 'To check the internal code structure of the software.', 
 '', 'B'),

('What is the role of regression testing in maintenance testing?', 
 'To ensure that new features disrupt existing functionalities.', 
 'To verify that bug fixes and enhancements do not introduce new defects into existing functionalities.', 
 'To check the functionality of new hardware only.', 
 'To focus testing solely on new features.', 
 '', 'B'),

('What is the most effective way to use testing to improve quality?', 
 'By focusing on areas of the software most likely to have defects', 
 'By performing minimal testing on all features', 
 'By only testing the new features of the software', 
 'By outsourcing testing to reduce costs', 
 '', 'A'),

('What is the primary benefit of understanding the psychological factors in testing?', 
 'It allows for complete automation of the testing process.', 
 'It enhances the interaction and effectiveness of the testing team.', 
 'It eliminates the need for quality assurance.', 
 'It simplifies compliance with software standards.', 
 '', 'B'),

('What is the main purpose of Informal review?', 
 'Inexpensive way to get some benefit', 
 'Find defects', 
 'Learning, gaining understanding, effect finding', 
 'Discuss, make decisions, solve technical problems', 
 '', 'A'),

('What is an equivalence partition (also known as an equivalence class)?', 
 'A set of test cases for testing classes of objects', 
 'An input or output range of values such that only one value in the range becomes a test case', 
 'An input or output range of values such that each value in the range becomes a test case', 
 'An input or output range of values such that every tenth value in the range becomes a test case', 
 '', 'B'),

('What is the main reason for testing software before releasing it?', 
 'To show that system will work after release', 
 'To decide when the software is of sufficient quality to release', 
 'To find as many bugs as possible before release', 
 'To give information for a risk based decision about release', 
 '', 'B'),

('What is the purpose of test completion criteria in a test plan?', 
 'To know when a specific test has finished its execution', 
 'To ensure that the test case specification is complete', 
 'To set the criteria used in generating test inputs', 
 'To know when test planning is complete', 
 'To plan when to stop testing', 'E'),

('What is the KEY difference between preventative and reactive approaches to testing?', 
 'Preventative tests and reactive tests are designed as early as possible.', 
 'Preventative tests are designed early; reactive tests are designed after the software has been produced.', 
 'Preventative testing is always analytical; reactive testing is always heuristic.', 
 'Preventative tests are designed after the software has been produced; reactive tests are designed early in response to review comments.', 
 '', 'B'),
('What is the difference between testing software developed by contractor outside your country, versus testing software developed by a contractor within your country?', 
 'Does not meet people needs', 
 'Cultural difference', 
 'Loss of control over reallocation of resources', 
 'Relinquishments of control', 
 '', 'B'),
('What is the MAIN objective when reviewing a software deliverable?', 
 'To identify potential application failures by use of a test specification.', 
 'To identify defects in any software work product.', 
 'To identify spelling mistakes in a requirements specification.', 
 'To identify standards inconsistencies in the code.', 
 '', 'B'),

('What is the MAIN benefit of designing tests early in the life cycle?', 
 'It is cheaper than designing tests during the test phases.', 
 'It helps prevent defects from being introduced into the code.', 
 'Tests designed early are more effective than tests designed later.', 
 'It saves time during the testing phases when testers are busy.', 
 '', 'B'),

('What does the term "failure" mean in the context of testing?', 
 'A mistake made by a developer.', 
 'A defect in the software that is found during testing.', 
 'An incorrect behavior of the system in operation.', 
 'A missed requirement during design.', 
 '', 'C'),

('What does the term "Big-bang model" imply about the approach to software development?', 
 'Detailed and extensive planning', 
 'Integration of all components at once without prior testing', 
 'Regular testing from the beginning of the project', 
 'User involvement is mandatory', 
 '', 'B'),

('What determines the level of risk?', 
 'The cost of dealing with an adverse event if it occurs.', 
 'The probability that an adverse event will occur.', 
 'The amount of testing planned before release of a system.', 
 'The likelihood of an adverse event and the impact of the event.', 
 '', 'D'),

('What should be a key outcome of the evaluating exit criteria and reporting phase?', 
 'Decisions regarding the continuation or stoppage of testing', 
 'Finalizing the software release without further review', 
 'Planning for the next development cycle', 
 'Developing new test tools and methods', 
 '', 'A'),

('What essential skill does exploratory testing require from a tester?', 
 'Ability to strictly adhere to test scripts', 
 'Specialization in performance and stress testing', 
 'Proficiency in programming and automated tools', 
 'Capacity to plan and execute tests simultaneously', 
 '', 'D'),

('What factor influences the structure of a test organization within a project?', 
 'The personal preferences of the test team', 
 'The social dynamics of the development team', 
 'The risk level and complexity of the project', 
 'The geographical location of the company', 
 '', 'C'),

('Which of the following sequences BEST shows the main activities of the work product review process?', 
 'Initiate review - Reviewer selection - Individual review - Issue communication and analysis - Rework', 
 'Planning & preparation - Overview meeting - Individual review - Fixing and Reporting', 
 'Preparation - Issue detection - Issue communication and analysis - Rework - Report', 
 'Planning - Initiate review - Individual review - Issue communication and analysis - Fixing and Reporting', 
 '', 'D'),

('Which of the following is correct?', 
 'Impact analysis assesses the effect on the system of a defect found in regression testing.', 
 'Impact analysis assesses the effect of a new person joining the regression test team.', 
 'Impact analysis assesses whether or not a defect found in regression testing has been fixed correctly. to do.', 
 'Impact analysis assesses the effect of a change to the system to determine how much regression testing', 
 '', 'D');

-- 319 - 330
 INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, correct_answer) 
VALUES
('A reliable system will be one that:', 
 'Is unlikely to be completed on schedule', 
 'Is unlikely to cause a failure', 
 'Is likely to be fault-free', 
 'Is likely to be liked by the users', 
 '', 'B'),

('A test design technique is:', 
 'A process for selecting test cases', 
 'A process for determining expected outputs', 
 'A way to measure the quality of software', 
 'A way to measure in a test plan what has to be done', 
 '', 'A'),

('A company recently purchased a commercial off-the-shelf application to automate their bill-paying process. They now plan to run an acceptance test against the package prior to putting it into production. Which of the following is their most likely reason for testing?', 
 'To build confidence in the application.', 
 'To detect bugs in the application.', 
 'To gather evidence for a lawsuit.', 
 'To train the users', 
 '', 'A'),

('A project that is in the implementation phase is six weeks behind schedule. The delivery date for the product is four months away. The project is not allowed to slip the delivery date or compromise on the quality standards established for his product. Which of the following actions would bring this project back on schedule?', 
 'Eliminate some of the requirements that have not yet been implemented.', 
 'Add more engineers to the project to make up for lost work.', 
 'Ask the current developers to work overtime until the lost work is recovered.', 
 'Hire more software quality assurance personnel.', 
 '', 'A'),

('An incident logging system', 
 'Only records defects', 
 'Is of limited value', 
 'Is a valuable source of project information during testing if it contains all incidents', 
 'Should be used only by the test team.', 
 '', 'C'),

('Benefits of Independent Testing', 
 'Independent testers are much more qualified than Developers', 
 'Independent testers see other and different defects and are unbiased.', 
 'Independent Testers cannot identify defects.', 
 'Independent Testers can test better than developers', 
 '', 'B'),

('Coverage measurement', 
 'Is nothing to do with testing', 
 'Is a partial measure of test thoroughness', 
 'Branch coverage should be mandatory for all software', 
 'Can only be applied at unit or module testing, not at system testing', 
 '', 'B'),

('During the software development process, at what point can the test process start?', 
 'When the code is complete.', 
 'When the design is complete.', 
 'When the software requirements have been approved.', 
 'When the first code module is ready for unit testing', 
 '', 'C'),

('Error guessing is', 
 'An appropriate way of deriving system tests.', 
 'Only used if good requirements are not available.', 
 'Only used when good requirements are available.', 
 'The most appropriate way of deriving system tests.', 
 '', 'D'),

('Error guessing is best used', 
 'As the first approach to deriving test cases', 
 'After more formal techniques have been applied', 
 'By inexperienced testers', 
 'After the system has gone live', 
 'Only by end users', 'B'),

('Expected results are:', 
 'Only important in system testing', 
 'Only used in component testing', 
 'Never specified in advance', 
 'Most useful when specified in advance', 
 'Derived from the code', 'D'),

('Equivalence partitioning is:', 
 'A black box testing technique used only by developers', 
 'A black box testing technique than can only be used during system testing', 
 'A black box testing technique appropriate to all levels of testing', 
 'A white box testing technique appropriate for component testing', 
 '', 'C'),
('For which of the following would a static analysis tool be MOST useful?', 
 'Supporting reviews.', 
 'Validating models of the software.', 
 'Testing code executed in a special test harness.', 
 'Enforcement of coding standards.', 
 '', 'D'),

('FPA is used to', 
 'To measure the functional requirements of the project', 
 'To measure the size of the functionality of an Information system', 
 'To measure the functional testing effort', 
 'To measure the functional flow', 
 '', 'A'),

('Fault Masking is', 
 'Error condition hiding another error condition', 
 'Creating a test case which does not reveal a fault', 
 'Masking a fault by developer', 
 'Masking a fault by a tester', 
 '', 'A'),

('Find the mismatch', 
 'Test data preparation tools - Manipulate Data bases', 
 'Test design tools - Generate test inputs', 
 'Requirement management tools - Enables individual tests to be traceable', 
 'Configuration management tools - Check for consistence', 
 '', 'D'),

('Find the explanation of "Exhaustive testing is impossible".', 
 'Testing everything (all combinations of inputs and preconditions) is not feasible except for trivial cases. Instead of exhaustive testing, we use risks and priorities to focus testing efforts.', 
 'Math formulas for reports that the software will automatically generate.', 
 'Is to execute the same test scenario multiple times to ensure that the previous test did not miss any errors.', 
 'Testing can show that defects are present, but cannot prove that there are no defects. Testing reduces the probability of undiscovered defects remaining in the software but, even if no defects are found, it is not a proof of correctness', 
 '', 'A'),

('Find the explanation of "Early testing":', 
 'Testing activities should start as early as possible in the software or system development life cycle and should be focused on defined objectives.', 
 'Testing can show that defects are present, but cannot prove that there are no defects. Testing reduces the probability of undiscovered defects remaining in the software but, even if no defects are found, it is not a proof of correctness.', 
 'Finding and fixing defects does not help if the system built is unusable and does not fulfill the users'' needs and expectations.', 
 'Testing is done differently in different contexts. For example, safety-critical software is tested differently from an e-commerce site.', 
 '', 'A'),

('Find the explanation of "Testing shows presence of defects":', 
 'Testing can show that defects are present, but cannot prove that there are no defects. Testing reduces the probability of undiscovered defects remaining in the software but, even if no defects are found, it is not a proof of correctness.', 
 'Testing activities should start as early as possible in the software or system development life cycle and should be focused on defined objectives.', 
 'Finding and fixing defects does not help if the system built is unusable and does not fulfill the users'' needs and expectations.', 
 'Testing is done differently in different contexts. For example, safety-critical software is tested differently from an e-commerce site.', 
 '', 'A'),

('Fill in the blank: Confirmation testing', 
 'Execute the test again to confirm that the defect has indeed been fixed', 
 'Execute tests with the intent of checking that the system does not now have more defects in it as a result of some change', 
 'Verify that modifications in the software or the environment have not caused unintended adverse side effects and that the system still meets its requirements', 
 'Validate the expected results', 
 '', 'A'),

('One person has been dominating the current software process improvement meeting. Which technique should the facilitator use?', 
 'Confront the person and ask that other team members be allowed to express their opinions.', 
 'Wait for the person to pause, acknowledge the person''s opinion, and ask for someone else''s opinion.', 
 'Switch the topic to an issue about which the person does not have a strong opinion.', 
 'Express an opinion that differs from the person''s opinion in order to encourage others to express their ideas', 
 '', 'B'),

('Impact Analysis helps to decide:', 
 'How much regression testing should be done.', 
 'Exit Criteria', 
 'How many more test cases need to written', 
 'Different Tools to perform Regression Testing', 
 '', 'A'),
('Inspections can find all the following EXCEPT', 
 'Variables not defined in the code', 
 'Spelling and grammar faults in the documents', 
 'Requirements that have been omitted from the design documents', 
 'How much of the code has been covered', 
 '', 'D'),

('If an expected result is not specified then:', 
 'We cannot run the test', 
 'It may be difficult to repeat the test', 
 'It may be difficult to determine if the test has passed or failed', 
 'We cannot automate the user inputs', 
 '', 'C'),

('Integration testing in the large involves:', 
 'Testing the system when combined with other systems.', 
 'Testing a sub-system using stubs and drivers', 
 'Testing a system with a large number of users', 
 'Combing software components and testing them in one go.', 
 '', 'A'),

('Important consequences of the impossibility of complete testing are:', 
 'We can never be certain that the program is bug free.', 
 'We have no definite stopping point for testing, which makes it easier for some managers to argue for very little testing.', 
 'We have no easy answer for what testing tasks should always be required, because every task takes time that could be spent on other high importance tasks.', 
 'All of the others.', 
 '', 'D'),

('In error guessing, what is the tester primarily relying on to identify potential defects?', 
 'Formal specifications and requirements', 
 'Randomly generated test cases', 
 'Their own experience, intuition, and domain knowledge', 
 'The feedback from automated testing tools', 
 '', 'C'),

('In a software project, what is the purpose of test closure activities?', 
 'To plan the next phases of the project.', 
 'To ensure all test cases are automated for future use.', 
 'To analyze what was done and what could be improved for future projects', 
 'To ensure that the software does not have any remaining defects.', 
 '', 'C'),

('Independent testing - who is a tester? Choose the incorrect sentence:', 
 'Tests by the person who wrote the item under test.', 
 'Tests by a person from a different organizational group, such as an independent test team.', 
 'Tests by another person within the same team, such as another programmer.', 
 'Tests by the person who wrote the source code', 
 '', 'D'),

('System testing should investigate', 
 'Non-functional requirements only not Functional requirements', 
 'Functional requirements only not non-functional requirements', 
 'Non-functional requirements and Functional requirements', 
 'Non-functional requirements or Functional requirements', 
 '', 'C'),

('To make a test case effective it is most important that:', 
 'It is easy to execute.', 
 'It is designed to detect faults if present.', 
 'The expected outcome is specified before execution.', 
 'It is unlikely to delay progress.', 
 '', 'B'),

('Test are prioritized so that:', 
 'You shorten the time required for testing', 
 'You do the best testing in the time available', 
 'You do more effective testing', 
 'You find more faults', 
 '', 'B'),
('Typical defects discovered by static analysis includes', 
 'Programming standard violations', 
 'Referring a variable with an undefined value', 
 'Security vulnerabilities', 
 'All of the others', 
 '', 'D'),

('The Kick Off phase of a formal review includes the following:', 
 'Explaining the objective', 
 'Fixing defects found typically done by author', 
 'Follow up', 
 'Individual Meeting preparations', 
 '', 'A'),

('Testware (test cases, test dataset)', 
 'Needs configuration management just like requirements, design and code', 
 'Should be newly constructed for each new version of the software', 
 'Is needed only until the software is released into production or use', 
 'Does not need to be documented and commented, as it does not form part of the released software system', 
 '', 'A'),

('The purpose of exit criteria is: (choose one answer)', 
 'Define when to stop testing', 
 'End of test level', 
 'When a set of tests has achieved a specific pre condition', 
 'All of the others', 
 '', 'A'),

('The cost of fixing a fault:', 
 'Is not important', 
 'Increases as we move the product towards live use', 
 'Decreases as we move the product towards live use', 
 'Is more expensive if found in requirements than functional design', 
 'Can never be determined', 'B'),

('The difference between re-testing and regression testing is', 
 'Re-testing is running a test again; regression testing looks for unexpected side effects', 
 'Re-testing looks for unexpected side effects; regression testing is repeating those tests', 
 'Re-testing is done after faults are fixed; regression testing is done earlier', 
 'Re-testing uses different environments, regression testing uses the same environment', 
 'Re-testing is done by developers, regression testing is done by independent testers', 'A'),

('The Test Cases Derived from use cases', 
 'Are most useful in uncovering defects in the process flows during real world use of the system', 
 'Are most useful in uncovering defects in the process flows during the testing use of the system', 
 'Are most useful in covering the defects in the process flows during real world use of the system', 
 'Are most useful in covering the defects at the Integration Level', 
 '', 'A'),

('With which of the following categories is a test comparator tool USUALLY associated?', 
 'Tool support for performance and monitoring.', 
 'Tool support for static testing.', 
 'Tool support for test execution and logging.', 
 'Tool support for the management of testing and tests.', 
 '', 'C'),
('You have designed test cases to provide 100% statement and 100% decision coverage for the following
fragment of code:
if width > length then
    biggest_dimension = width
else
    biggest_dimension = length
end_if
print "Biggest dimension is " & biggest_dimension
print "Width: " & width
print "Length: " & length
How many more test cases are required?', 
 'One more test case will be required for 100% decision coverage', 
 'Two more test cases will be required for 100% statement coverage, one of which will be used to provide 100% decision coverage.', 
 'None, existing test cases can be used.', 
 'One more test case will be required for 100% statement coverage.', 
 '', 'C');