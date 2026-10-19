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

ALTER TABLE QuizQuestions ALTER COLUMN option_a NVARCHAR(MAX);
ALTER TABLE QuizQuestions ALTER COLUMN option_b NVARCHAR(MAX);
ALTER TABLE QuizQuestions ALTER COLUMN option_c NVARCHAR(MAX);
ALTER TABLE QuizQuestions ALTER COLUMN option_d NVARCHAR(MAX);
ALTER TABLE QuizQuestions ALTER COLUMN option_e NVARCHAR(MAX);
ALTER TABLE QuizQuestions ALTER COLUMN option_f NVARCHAR(MAX);
GO

IF OBJECT_ID('QuizQuestions', 'U') IS NULL
BEGIN
    CREATE TABLE QuizQuestions (
        id INT IDENTITY(1,1) PRIMARY KEY,
        question NVARCHAR(MAX),
        option_a NVARCHAR(MAX),
        option_b NVARCHAR(MAX),
        option_c NVARCHAR(MAX),
        option_d NVARCHAR(MAX),
        option_e NVARCHAR(MAX),
        option_f NVARCHAR(MAX),
        correct_answer VARCHAR(10)
    );
END
GO

TRUNCATE TABLE UserResponses;
TRUNCATE TABLE QuizQuestions;
GO

SELECT * FROM QuizQuestions;


-- TRUE/FALSE
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('A single designer can usually conduct a test of a lo-fi prototype by him/herself', 'True', 'False', '', '', '', '', 'A'),
('Creation of many alternative solutions increases the quality of the final design', 'True', 'False', '', '', '', '', 'A'),
('Designers prototype to test their design ideas before resource are invested in expensive and time-consuming software development', 'True', 'False', '', '', '', '', 'A'),
('Granularity of the needed information is an important consideration when designing system inputs', 'True', 'False', '', '', '', '', 'A'),
('Mode can change how multiple aspects of the system behave', 'True', 'False', '', '', '', '', 'A'),
('It is important not to criticize ideas during brainstorming', 'True', 'False', '', '', '', '', 'A'),
('It''s possible to create a useful, functional interactive prototype with very simple tools, such as paper, post-it notes, and scotch tape', 'True', 'False', '', '', '', '', 'A'),
('In the "generation" phase, your goal should be to sketch many different design ideas rather than to perfect a single idea', 'True', 'False', '', '', '', '', 'A'),
('True or false: One of your goals in designing products with a good user experience should be to fail as early and often as possible', 'True', 'False', '', '', '', '', 'A'),
('“Push” output can be time information delivery for maximum effectiveness', 'True', 'False', '', '', '', '', 'A'),
('“Pull” output gives user high level of control of information access', 'True', 'False', '', '', '', '', 'A'),
('Problem scoping is a fundamental part of the design process', 'True', 'False', '', '', '', '', 'A'),
('Sketching is used both for generating and for communicating ideas', 'True', 'False', '', '', '', '', 'A'),
('Scenarios help designers reflect on user needs, how technology might address those needs, and potential issues that might arise with the use of the envisioned technology', 'True', 'False', '', '', '', '', 'A'),
('Technical determinists believe that sometimes the properties of technologies almost necessitate certain kinds of consequences', 'True', 'False', '', '', '', '', 'A'),
('True or False: Baseline statistics such as task completion rate, time spent on task, and/or error rates should be included in user test reports', 'True', 'False', '', '', '', '', 'A'),
('True or false: In this course, you will "get your hands dirty" and gain hands-on experience with UX Research and Design methods', 'True', 'False', '', '', '', '', 'A'),
('Wireframes can test design concepts, as well as help designers decide among multiple ways of designing a piece of functionality', 'True', 'False', '', '', '', '', 'A');


INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('When sketching to come up with different design solutions, you should stop the first time you run out of ideas', 'True', 'False', '', '', '', '', 'B'),
('Affordances of user interface don''t have much influence on how easily users learn to use the system', 'True', 'False', '', '', '', '', 'B'),
('Although there are different types of input, UX designers only need to focus on designing the information that users will explicitly enter into the system', 'True', 'False', '', '', '', '', 'B'),
('Bill Buxton states that all design is “compromise”. By this he means that fundamentally no design is particularly good', 'True', 'False', '', '', '', '', 'B'),
('Designers should aim to generate about half a dozen solutions when they ideate', 'True', 'False', '', '', '', '', 'B'),
('Designers usually solve the exact design problem they are initially presented with', 'True', 'False', '', '', '', '', 'B'),
('Designers conduct formative research using a single, unified set of methods', 'True', 'False', '', '', '', '', 'B'),
('Excellent drawing skills are needed to create effective storyboards', 'True', 'False', '', '', '', '', 'B'),
('Formal research methods are always preferable to informal methods for doing formative research', 'True', 'False', '', '', '', '', 'B'),
('Is the following statement true or false? You should always include a pre-test questionnaire in any user test you conduct', 'True', 'False', '', '', '', '', 'B'),
('In order to have a mental model of a system that enable them to use that system effectively, users need to understand the technical underpinnings of that system', 'True', 'False', '', '', '', '', 'B'),
('In UX, "Design" is concerned only with the aesthetic (or beauty-related) aspects of products', 'True', 'False', '', '', '', '', 'B'),
('Ideation mostly happens at the start of the design process when the designer is first coming up with possible solutions to the design problem', 'True', 'False', '', '', '', '', 'B'),
('It is important to be good at drawing to use sketching in UX Design', 'True', 'False', '', '', '', '', 'B'),
('It''s typically obvious which design solution, among alternatives they generated, designers should pursue', 'True', 'False', '', '', '', '', 'B'),
('It doesn''t matter whether you initially create a low- or high-fidelity prototype. You can get the same kind of feedback on either', 'True', 'False', '', '', '', '', 'B'),
('Personas are purely fictional character', 'True', 'False', '', '', '', '', 'B'),
('The primary concern of design is to create artifacts and systems that are aesthetically pleasing', 'True', 'False', '', '', '', '', 'B'),
('The many new technological trends we discussed means that UX design as a process is fundamentally changing and that what we discussed in this course is not going to be useful a year or two from now.', 'True', 'False', '', '', '', '', 'B'),
('True or False: It is not the role of the UX researcher to assign severity to problems found in user testing--this should be left up to the product owner', 'True', 'False', '', '', '', '', 'B'),
('True or False: If you take good notes, there is no reason to capture a screen recording of user test sessions for later review', 'True', 'False', '', '', '', '', 'B'),
('True or false: "User Experience" only describes the experience that people have while actually using a product, and not other related experiences like acquiring the product or fixing it when it breaks', 'True', 'False', '', '', '', '', 'B'),
('You have to be good at drawing to create sketches that are useful for design', 'True', 'False', '', '', '', '', 'B'),
('True or false: You need to have a degree in psychology in order to understand the principles behind good UX', 'True', 'False', '', '', '', '', 'B'),
('Wizard of Oz prototypes are most useful for prototyping screen-based applications', 'True', 'False', '', '', '', '', 'B'),
('While designers have to set defaults for many design elements, these default values rarely matter since users can just change them at any time', 'True', 'False', '', '', '', '', 'B');


-- NOT/ MOST TRUE/ LEAST
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('Which of the following is not a characteristic of low-fidelity prototypes?', 'They should be quick to create', 'They should support the full sequence of actions needed to complete a task', 'They should be realistic', 'They should cover the functionality of the whole system', '', '', 'C'),
('Which of the following is NOT a reason to randomize your response categories in a nominal survey question?', 'Anchoring', 'Primacy', 'Recency', 'Cognitive burden', '', '', 'D'),
('Which of the following is NOT an uncommon type of survey question?', 'Drill Down', 'Nominal', 'Heat Map', 'Pick, Group and Rank', '', '', 'B'),
('Which of the following is NOT a dimension of survey modes?', 'Cost', 'Respondent burden', 'Sampling frame', 'Flexibility', '', '', 'C'),
('Which of the following is NOT a type of sampling?', 'Census', 'Sampling Frame', 'Probability', 'Convenience', '', '', 'B'),
('When choosing an environment to conduct a user test session, which of the following is NOT an important characteristic of your chosen site?', 'Distraction-free', 'Private', 'Dedicated only for conducting user tests', 'Quiet', '', '', 'C'),
('Which of the following is NOT an element of a typical scenario?', 'Agent', 'Actions', 'Location', 'Goals', 'Events', '', 'C'),
('Which of the following is NOT a method one would use to understand why people are using a product at certain times?', 'Surveys', 'Clickstream analytics', 'Concept Testing', 'Interviews', 'Remote testing', '', 'C'),
('Which of the following does NOT impact the likelihood that something in long-term memory will be recalled?', 'Strength of association', 'Frequency of use', 'Recency of use', 'Accuracy of information', '', '', 'D'),
('Which of the following is NOT another name for the kind of qualitative research methodology you learned in this specialization?', 'Ethnographic research', 'Contextual inquiry', 'User needs assessment', 'Socio-technical extraction', '', '', 'D'),
('Which of the following is NOT important to consider when defining your population?', 'Number of questions you want to ask', 'Characteristics of the people you''re interested in', 'Survey mode', 'Relationship to the product', '', '', 'A'),
('Which of the following is NOT something you should consider while writing questions?', 'Avoiding jargon', 'Keeping language as simple as possible', 'Ask one question at a time', 'Making the question sound scientific', '', '', 'D'),
('Which of the following should you NOT do when trying to establish rapport with an interview participant?', 'Talk about what other participants have been saying', 'Make small talk at first', 'Listen and observe how they respond', 'Adopt a learning mindset', '', '', 'A'),
('Which of the following is NOT a best practice when designing ordinal closed-ended questions?', 'Use direct labels', 'Use vague quantifiers rather than specific metrics', 'Provide a balanced scale', 'Provide scales that approximate the real world distribution', '', '', 'B'),
('Which of the following would NOT be an example of a sampling frame?', 'A social media site, like Twitter', 'An organization''s email directory', 'All phone numbers in the U.S', 'User names of everyone who logged into the site this month', '', '', 'A'),
('Which of the following is NOT a type of passive input?', 'Application data like contacts, calendar events, or user''s health information (e.g., steps)', 'Weather data', 'Picture taken by the user using the phone camera', 'User''s current location', '', '', 'C'),
('Which of the following is NOT a way to match your UX goals to survey methods?', 'Launch an exploratory survey to determine UX goals', 'Ask why you want to have the data', 'Have a story for why surveys are the best way to meet this UX goal', 'Define goals before choosing metrics', '', '', 'A'),
('Which of the following topics are NOT a common part of the introduction to an interview?', 'How confidentiality will be handled', 'Expected duration of the interview', 'How many other interview participants there are', 'Overall goals of the interview', '', '', 'C'),
('Which of the following is NOT something to think about if you are going to use Amazon''s Mechanical Turk to recruit respondents?', 'How to pay a fair wage to Turkers', 'The shakiness of the demographic data about Turkers', 'How to check for the validity of responses', 'Response rates for Turkers', '', '', 'D'),
('Which of the following is NOT a best practice in writing nominal closed-ended questions?', 'Avoid unequal response options', 'Use "select all that apply" responses rather than forced choices', 'Constrain the number of response options that you provide', 'Randomize response options when necessary', '', '', 'B'),
('Which of the following is NOT a best practice for writing open-ended questions?', 'Use an open-ended question after every closed-ended question', 'Use neutral probes when possible', 'Provide extra motivation to respond', 'Specify the response wanted in the question stem', '', '', 'A'),
('Nielsen provides several recommendations for help and documentation. Which of the following is NOT one of his recommendations?', 'Help should be focused on users'' tasks', 'Help should be small and searchable', 'Help should include step-by-step instructions', 'Help should be written from the system developers'' point of view', '', '', 'D'),
('Which of the following is NOT a key design skill?', 'To frame or reframe a design problem', 'To generate a large number of alternative solutions', 'To evaluate tradeoffs of different alternatives', 'To create and test with potential users a functioning prototype of a design solution', 'To write a business plan for selling the technology designers created', '', 'E'),
('Which of the following is NOT a way to increase the perceived benefit of participating in a survey?', 'Specify how the survey results will be used', 'Identify the trustworthiness of the sponsoring organization', 'Make the survey as short as possible', 'Stress that opportunities to respond are limited', '', '', 'C'),
('Which of the following is NOT a reason why building products with great UX is hard?', 'You are not the user', 'Computers are weird', 'Software is (usually) complex', 'There is no known process that we can follow to create good UX', '', '', 'D'),
('Which of the following is NOT a best practice in writing nominal closed-ended questions?', 'Avoid unequal response options', 'Use "select all that apply" responses rather than forced choices', 'Constrain the number of response options that you provide', 'Randomize response options when necessary', '', '', 'B'),
('Which of the following is NOT an example of convenience sampling?', 'Asking people on a street corner to answer some questions', 'Posting flyers in a doctor''s office asking for participants who have had a cold recently', 'Asking your friends on Facebook or Twitter to answer questions for you', 'Emailing all students at a university based on a random sample of email addresses provided by the administration', '', '', 'D'),
('Which of the following is NOT a reason you would want to have a high response rate?', 'If you want to be more confident that you''ve detected a difference/change', 'If your population is very heterogeneous', 'If you want to be able to conduct more complicated statistical analyses', 'If you want to detect smaller, or more subtle differences/changes', '', '', 'C'),
('Which of the following is NOT important for every survey question?', 'Writing a question that every respondent will interpret in the way the researcher intends', 'Writing a question that every respondent will answer in the same way', 'Writing a question that every respondent will respond to accurately', 'Writing a question that every respondent is willing to answer', '', '', 'B'),
('Which of the following is NOT a way of reducing the burden for a respondent to participate in your survey?', 'Asking people who use a site''s shopping cart how they feel about that experience', 'Keep the survey as short as you can without compromising quality', 'Reduce the complexity of questions by making them easy to understand', 'Asking one group of respondents to forward the survey invite to their social networks', '', '', 'A'),
('Which of the following is NOT an advantage of lo-fi prototyping?', 'You can identify problems before investing significant resources into a design direction', 'You can work out aspects of graphic design such as fonts and color schemes, which have the largest impact on user experiences', 'Stakeholders are more likely to give honest feedback if they perceive that design ideas are "sketchy" rather than highly polished', 'Lo-fi prototypes are easy to change, allowing you to iterate more rapidly than you could if you were creating more complex prototypes', '', '', 'B'),
('Which of the following is typically NOT TRUE of user testing?', 'You should not know who the test participants are, and they should not know who you are', 'You should observe test participants using the system directly', 'You should recruit test participants who are representative of your target users', 'You should give test participants specific tasks to carry out using the system', '', '', 'A'),
('Which is not an output modality commonly used in today''s interactive applications?', 'Audio', 'Visual', 'Olfactory', 'Tactile/Haptic', '', '', 'C'),
('Which of the following is not a characteristic of sketches done for the purposes of ideation?', 'Quick', 'Disposable', 'Evocative', 'Refined', 'Ambiguous', '', 'D'),
('Which of the following is not one of the qualities of well-designed tasks for use in a user test?', 'Realistic', 'Verifiable', 'Doesn''t "lead the witness"', 'Leaves room for different users'' interpretation', '', '', 'D'),
('Which of the following data types is typically not collected in a user test?', 'Task completion', 'Task timing', 'Critical incidents', 'Expected purchase price', '', '', 'D'),
('Which of the following is not an example of a subjective measure that might be collected during a user test?', 'Perceived usability', 'Desirability', 'Perceived usefulness', 'Task completion speed', '', '', 'D'),
('Which new technological trend is not requiring designers to change how they prototype and test their systems?', 'Proliferation of screens (smart watches, embedded displays, etc.) for which designers need to design user experiences', 'Instrumented environments', 'Artificial Intelligence-based systems', 'Virtual and augmented reality', 'None of the others', '', 'E'),
('Which of the following is not part of a typical UX design process?', 'Understanding the problem', 'Generating possible solutions', 'Establishing the sale price for a product', 'Assessing prototypes and finding new problems', '', '', 'C'),
('Which of the following is not a question that can be answered by getting feedback on wireframes?', 'Do screens contain the right functional components?', 'Does the screen layout make sense?', 'Is the displayed content ordered correctly?', 'Do the screens provide adequate navigation?', '', '', 'C'),
('Which of the following is not a characteristic of hi-fi prototypes?', 'They are more resource-intensive to develop', 'They can be run by the tester without help', 'They are of limited usefulness for testing usability', 'They can be used as a part of the spec given to developers', '', '', 'C'),
('Which of the following would you typically not include in a debrief interview?', 'Review of problems encountered during tasks', 'General questions about perceived usefulness and comparisons to similar systems', 'Demographic questions like age, gender, and education level', 'A "wrap-up" question in which you ask participants for any additional thoughts that weren''t covered already', '', '', 'C'),
('Which of the following is not considered a primitive visual feature that is processed in the first, and fastest, stage of visual processing?', 'angle of intersection', 'proximity', 'shade/contrast', 'motion', '', '', 'B'),
('Which of the following is not another name for the kind of qualitative research methodology you learned in this course?', 'Ethnographic research', 'Contextual inquiry', 'User needs assessment', 'Socio-technical extraction', '', '', 'D'),
('Which of the following is not one of the three things you learned in this course?', 'Conducting semi-structured interviews', 'Observing users', 'Coding of qualitative texts', 'Analyzing data with affinity walls', '', '', 'C'),
('When choosing an environment to conduct a user test session, which of the following is not an important characteristic of your chosen site?', 'Distraction-free', 'Private', 'Dedicated only for conducting user tests', 'Quiet', '', '', 'C'),
('About how long does an item remain in short-term memory if it is not actively maintained through rehearsal?', 'Less than one second', 'A few seconds', 'A few minutes', 'Up to an hour', '', '', 'B'),
('Bill Buxton claims that ______ is not just a byproduct of design, but is central to design thinking and learning', 'Sketching', 'Beauty', 'Functionality', 'User Testing', '', '', 'A'),
('Designing thoughtful defaults is important for several reasons. Which of the following is not a reason for designing good defaults?', 'Defaults define out-of-the-box experience', 'Defaults are easily changed', 'Defaults decrease onboarding time', 'Defaults can have large consequences', '', '', 'B'),
('In user testing, we generally ask test participants to verbalize what they are thinking as they perform tasks. Which of the following is NOT correct?', 'Debriefing', 'The Think-Aloud Protocol', 'What You See Is What You Get', 'Screening', '', '', 'B'),
('Which of the following is MOST true about offering a "Don''t Know" option in your response categories?', 'Research shows people don''t choose the "Don''t Know" option when it''s offered', 'You should always include a "Don''t Know" option in your written surveys', 'It''s best to do when the question asks for recall, not when asking for opinions', 'The "Don''t Know" option should only be used for opinion questions', '', '', 'C'),
('Which of the following is the MOST TRUE statement?', 'It can be hard to operationalize abstract concepts in a way that every respondent understands', 'The best way to start a survey is by writing some questions, and then iterating on them', 'People are very consistent in how they answer questions over time', 'Pre-testing a survey is rarely worth the time it takes', '', '', 'A'),
('Which of the following is the MOST TRUE about social exchange theory?', 'People consider the economic value to themselves of any given social exchange', 'People think about the risk to themselves primarily in considering social exchanges', 'People are really bad at guessing the cost/benefit of any given social exchange', 'People use trust as a basis to make a cost/benefit guess on the value of a social exchange', '', '', 'D'),
('Which of the following is the MOST TRUE statement about how people remember things?', 'People remember their past behavior well enough to give accurate survey responses', 'Memory can be guided back to accuracy through careful prompts', 'Memory fades over time, but people are good at remembering routine actions', 'Memory fades over time, and often doesn''t capture routine actions', '', '', 'D'),
('Which of the following is the MOST TRUE statement?', 'It''s better to get a low response rate from a small sample than it is to get a high response rate from a big sample', 'Response rates are only important for national, probability studies', 'Response rates are not connected to survey quality', 'It''s better to get a high response rate from a small sample than a low response rate from a big sample', '', '', 'D'),
('Which of the following is the MOST IMPORTANT consideration in picking what type of question type to use?', 'The demographic makeup of your population', 'The type of analysis you plan on doing', 'The type of sampling you''re using', 'The mode your survey will be delivered in', '', '', 'B'),
('Which of the following statements about open-ended questions is most FALSE?', 'They are the easiest type of question to analyze', 'They allow respondents to answer without limiting the range of responses', 'They are more frequently skipped than other types of questions', 'They are often used when we haven''t pre-defined response categories', '', '', 'A'),
('Factors that capture the ways in which you expect your users to differ can be expressed as:', 'Recruiting criteria', 'Diversity criteria', 'Success criteria', 'Tasks', '', '', 'B'),
('When reporting an issue found through user testing you should report all of the following EXCEPT:', 'Recommendation', 'Severity', 'Evidence', 'Clear description of the problem', 'The names of the participants who encountered them', '', 'E'),
('All of the following are important to do when observing a user testing session, EXCEPT for:', 'Capture recordings of the user''s screen', 'Capture audio recordings of the user thinking aloud', 'Notify participants as soon as they have met each task''s success criteria', 'Use a logging sheet to capture when critical incidents occur', '', '', 'C'),
('When making a recommendation for how to address a problem, you should consider all of the following EXCEPT:', 'Identifying best practices from competitors'' products', 'Declining to provide a recommendation, admitting you have no good ideas', 'Suggesting further research to better characterize the problem', 'Recommending an iterative design process to find the best solution', '', '', 'B'),
('Nielsen''s set of 10 heuristics was designed to meet all of the following criteria EXCEPT:', 'The heuristics are exhaustive and detailed enough to tell a designer exactly what elements to include in every possible part of every possible user interface', 'The heuristics are applicable to a wide range of different platforms and interaction modalities (e.g., mouse-and-keyboard, touch-based mobile, speech)', 'The heuristics are compact enough to be taught to a non-expert within a few hours', 'The heuristics are backed up by systematic research showing that the set of heuristics could explain a range of usability problems observed across numerous usability tests with multiple systems', '', '', 'A'),
('Which of the following is a BAD question to ask during a user needs assessment interview?', 'Could you tell me about a recent time when you used the "undo" feature?', 'Tell me more -- what was the context when you used the "undo" feature?', 'What functionality would you have liked to have to complete the task?', 'Was it because you didn''t know about the "undo" feature that you were unable to complete the task?', '', '', 'D'),
('Which of the following is the LEAST true statement about open-ended questions?', 'Responses require effort for coding and analysis', 'Respondents are more likely to skip open-ended questions', 'They can require more data cleaning', 'They provide bad data because responses are not standardized', '', '', 'D'),
('Which of the following is LEAST true about extrinsic, or material, incentives?', 'You should frame incentives as gifts, not as payment', 'Incentives given "before" the survey are more effective', 'The more money you offer, the more likely people are to participate', 'Lotteries (a chance to win a larger reward) are not very effective as incentives', '', '', 'C'),
('Which of the following is a STRENGTH of surveys as a UX method?', 'Measuring Behaviors', 'Understanding why people do things', 'Describing Opinions of a Group of People', 'Conducting Exploratory Work', '', '', 'C');


-- 2-3 ANSWER
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('Download Attachment #2 as pdf and read in full to answer questions 3 and 4. Which of these aspects make the key findings section particularly good?', 'It lists UX issues ranked by priority based on evidence of actual user testing feedback', 'It includes actionable recommendations of how to fix the UX issues', 'It includes visuals of possible designs that would fix the UX', 'It only focuses on two main UX issues', '', '', 'AB'),
('Read the project brief, then the scenario. What conclusions might you draw from the scenario that would inform the design? (Select all that apply)', 'George needs the app to work efficiently, since he will likely be using it at the end of the day and will only have a short period to sell the leftover food', 'Consumers need to find out about the food availability right when it is posted, since it will likely be at the end of the day. Pushing notifications to consumers when food is posted would be useful in the app', 'The app''s success will rely on users following through on picking up their purchases; making users pay in-app rather than in the store will increase the likelihood that all the food is picked up', 'George does not care about making money since he is throwing the food away anyways, so all the leftover food should be posted on the app for free', '', '', 'ABC'),
('Imagine a new shopping website named Nomaza.com. Nomaza.com offers a wide range of products. Which of the following might be a reasonable goal for a Nomaza.com user test? (choose all that apply)', 'Can experienced online shoppers use Nomaza.com to find and purchase household items?', 'How likely are first-time users of Nomaza.com to return for a second visit?', 'Are novice Internet shoppers able to complete the checkout process on Nomaza.com?', 'Can people find stuff they want on Nomaza.com?', '', '', 'AC'),
('If this was the full test plan, which of the following suggestions might help clarify the plan?', 'Specify Recruiting Criteria', 'Complete the Test Script', 'Add task instructions for users to replicate', 'Include Follow-Up Questions', '', '', 'BC'),
('What deliverables are typically used to tell user stories? (pick all that apply)', 'Personas', 'Scenarios', 'Diary Study', 'Customer Journey Maps', '', '', 'ABD'),
('For each UX issue, the report includes the:', 'Severity', 'Evidence', 'Clear description of the problem', 'Name of the participant who encountered the issue', '', '', 'ABC'),
('Which of the following components of UX were discussed in this week''s lectures? Check all that apply', 'Value', 'Usability', 'Desirability', 'Adoptability', 'Scrollability', 'Monetizability', 'ABCD'),
('What makes these good research questions for a needs-finding study? (Select All that apply)', 'They''re open ended, not leading', 'They seek to learn about what problems there are with existing solutions', 'They are questions that can be answered by interviewing the target user population', 'They will help the researcher learn how users currently complete the activity that their design will try to improve', '', '', 'ABCD'),
('What alternative approaches can you use to engage people in research results? (pick all that apply)', 'Extensive report', 'Have stakeholders attend study sessions and participate in analyzing and interpreting data', 'Create and show videos of critical moments during tests', 'Emails that include bullet point findings', 'Brief executive summary', '', 'BCDE'),
('What elements should a script include for a remote moderated test?', 'Obtain Consent', 'Make introductions', 'Build rapport', 'Exact instructions for how to complete tasks', 'Set expectations for duration and content of test', 'Set expectations for role of moderator and observer', 'ABCEF'),
('NEEDS FINDING PLAN:
The purpose of this study is to research how people currently do their laundry and if the proposed sensor would enhance productivity. 
What are the habits of people who do laundry?
What problems do people, who do laundry, currently face when attempting to complete their task?
What practices inform how and why people, who wash their clothes, do laundry the way they do?
What are the constraints of current Smart Laundry Appliances technologies?
What Smart Technology features would users find most useful for doing laundry?

USER CRITERIA AND RECRUITING STRATEGY:
User Characteristics:
Operates laundry appliances regularly
Owns laundry appliances
Access to laundry appliances off site
Smart Home Technology.

These are good research questions for a needs-finding study?', 'They will help the researcher learn how users currently complete the activity that their design will try to improve', 'They are questions that can be answered by interviewing the target user population', 'They''re open ended, not leading', 'They seek to learn about what problems there are with existing solutions', '', '', 'ABCD');


-- SHORT
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('What kinds of information might be part of qualitative data analysis?
I. Quotations from interviews.
II. Observed actions or events.
III. Inferred facts from interviews', 'I only', 'I and II only', 'II only', 'I, II and III', '', '', 'D'),
('Which of the following steps will you be learning about in this user needs assessment course?
I. Preparing for and conducting interviews.
II. Observing users using a product or service.
III. Analyzing qualitative data to arrive at insights', 'I and II', 'I and III', 'II and III', 'I, II, and III', '', '', 'D'),
('In which of the following contexts can you use qualitative data analysis?
I. Understanding user needs
II. Making sense of non-quantitative data
III. Condensing complex information', 'I only', 'I and II', 'I and III', 'I, II, and III', '', '', 'D'),
('Which of the following is worth noticing in an observation?
I. The physical context where the user is.
II. Pauses or missteps the user makes.
III. Comments the user makes during a task', 'II only', 'III only', 'II and III', 'I, II and III', '', '', 'D'),
('Which of the following should you aim for when arranging interviews?
I. The participant should be a user or potential user of the product or service
II. The interview should be held where the product or service would normally be used
III. The time should be when the product or service would normally be used', 'I and II', 'I and III', 'II and III', 'I, II and III', '', '', 'D'),
('In a semi-structured interview, why would you want to avoid a question such as "Was it because you didn''t know about the ''undo'' feature that you were unable to complete the task?"
I. It is leading -- you are feeding a possible answer to the participant.
II. It is closed-ended -- this is a yes-or-no question.
III. It is judgmental -- you are suggesting that the participant''s lack of knowledge was a problem', 'I and II', 'I and III', 'II and III', 'I, II and III', '', '', 'D'),
('Effective ways of delivering findings to stakeholders include:
I. Anecdotes of critical moments
II. Retelling what happened during each session of a usability test
III. Having stakeholders attend study sessions and participate in analyzing or interpreting data
IV. Quotes or videos of critical moments', 'I', 'II', 'II, IV', 'I, III, IV', '', '', 'D');


INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('What types of research activities are typically engaged in by 2-3 people design teams?
I. A/B Testing
II. Feature driven usability testing
III. Competitive testing
IV. Attitudinal analytics (surveys)', 'I', 'II', 'III', 'IV', 'II and IV', '', 'B');











INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('______ means "to make an idea real or concrete"', 'Assessment', 'Communication', 'Reification', 'Reflection', '', '', 'C'),
('What is another name for the affinity wall technique?', 'The KJ Method', 'Relatedness clustering', 'Holmes deduction', 'Jiro Dreams of Sushi', '', '', 'A'),
('What kind of interviews are you learning about in this course?', 'Group, remote, semi-structured', 'Individual, remote, structured', 'Individual, in-person, semi-structured', 'Group, in-person, unstructured', '', '', 'C'),
('What does the System Usability Scale measure?', 'Perceived usability', 'Number of tasks successfully completed', 'Frequency of errors', 'Number of usability principles violated', '', '', 'A'),
('What term is used to describe the actual questions you ask people?', 'Respondent', 'Instrument', 'Frame', 'Population', '', '', 'B'),
('What type of question is the following survey question: How much do you like or dislike participating in surveys?
1. Extremely like
2. Somewhat like
3. Neither like nor dislike
4. Somewhat dislike
5. Extremely dislike', 'Bipolar ordinal', 'Unipolar ordinal', 'Nominal', 'Open-ended', '', '', 'A'),
('What technique can you use to learn about how large numbers of users navigate through an experience during the Optimization phase?', 'Benchmarking', 'Analytics Review', 'A/B testing', 'Remote usability testing', '', '', 'B'),
('What was the title of this course?', 'Understanding User Needs', 'Designing User Experience', 'Surveying Users at Scale', 'Analyzing User Data', '', '', 'A'),
('Which of the following research techniques were taught in this specific course?', 'Experience sampling', 'A/B testing', 'Semi-structured interviews', 'Surveys and questionnaires', '', '', 'C'),
('Which of the following is not a phase in the iterative design process?', 'Build', 'Design', 'Stylize', 'Assess', '', '', 'C'),
('Which of the following is not a method for doing ideation?', 'Brainstorming', 'Mind-mapping', 'Timed idea generation', 'Tradeoff analysis', 'Sketching', '', 'D'),
('Which of the following observation methodologies did you learn in this course?', 'Sit-and-stare methodology', 'Shock-and-awe technique', 'Think-aloud protocol', 'Poke-or-nudge routine', '', '', 'C'),
('Which of the following data types is arguably the most important to capture when conducting a formative, problem-finding user test?', 'Critical incidents', 'Perceived usability', 'Suggested improvements', 'Participant demographics', '', '', 'A'),
('Which position on the social effects of technology claims that technological adoption is primarily governed by the needs of different social groups and that it has little to do with the properties of the actual technology?', 'Social determinists', 'Technical determinists', 'Interactionists', '', '', '', 'A'),
('Which component of the QOC framework articulates conditions or constraints that the design needs to meet?', 'Questions', 'Options', 'Criteria', 'None of the others', '', '', 'C'),
('Which type of recruiting criteria would the following question screen for?
In the past week, how many hours did you spend completing coursework on ed? 0, 1-2, 3-5, or more than 5', 'Expertise', 'Behavioral', 'Characteristic', 'Attitudinal', '', '', 'B'),
('Which type of question asks the respondent to compare categories where there is no inherent order between the choices?', 'Ordinal closed-ended', 'Descriptive open-ended', 'Nominal closed-ended', 'List-of-items open-ended', '', '', 'C');



INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('About how many "key findings" should be included in a typical user test report?', '1', '2-3', '5-10', '20-50', '', '', 'C'),
('A collection of associated concepts in long-term memory is called what?', 'A thought', 'A schema', 'A mule', 'A gestalt', '', '', 'B'),
('According to Bill Moggridge, "A representation of a design, made before the final solution exists" is called a:', 'Design representation', 'Time capsule', 'Prototype', 'Brainstorm', '', '', 'C'),
('A feature of an environment or system that communicates through verbiage or imagery what will happen if an action is taken is called:', 'A signifier', 'A signal', 'Feedback', 'An icon', '', '', 'A'),
('A feature of an environment or system that, by its shape and appearance, suggests to a person that a particular action could be taken is called:', 'An affordance', 'A signal', 'A constraint', 'A signpost', '', '', 'A'),
('A change in an environment or system that indicates that a user''s action was recognized and communicates the result of that action is called:', 'Response time', 'A signal', 'Feedback', 'A dialogue box', '', '', 'C'),
('By helping users form effective ______, we can help users to predict the results of actions they haven''t yet performed using a system', 'System images', 'Assumptions', 'Feedback', 'Conceptual models', '', '', 'D'),
('Bill Buxton claims that _______ is not just a byproduct of design, but is central to design thinking and learning', 'Sketching', 'Beauty', 'Functionality', 'User Testing', '', '', 'A'),
('Reducing the set of available actions to only those that are possible given a particular state of the system would be an example of applying:', 'Feedback', 'Constraints', 'Conceptual Models', 'Mapping', '', '', 'B'),
('A basic ethical principle of research involving human subjects that states that researchers need to confirm that participants in a study know the purpose of the study, what they will be asked to do, their right to withdraw or refuse to comply with aspects of the study, and what will be done with the data is ______', 'Usability', 'Perceived usefulness', 'Acquiescence', 'Informed Consent', '', '', 'D'),
('A model of the design process that shows both the iterative nature and also how it progresses towards an end goal is:', 'The spiral model', 'The waterfall model', 'The hub-and-spoke model', 'The wave model', '', '', 'A'),
('According to the instructor, _____ information is understanding, and understanding is intelligence. Fill in the blank', 'Rearranging', 'Condensing', 'Creating', 'Eliminating', '', '', 'B'),
('According to the original research on short-term memory, how many "items" can a person retain in short-term memory at one time?', 'One or two', 'About 7', 'About 10', 'There is no measurable limit', '', '', 'B'),
('According to Wikipedia, a "direct manipulation interface" is one that features "continuous representation of objects of interest and rapid, reversible, and incremental actions and feedback." The "continuous representation of objects of interest" is best aligned with which principle of good UI design?', 'Prevent errors before they happen', 'Support recognition over recall', 'Employ aesthetic and minimalist design', 'Support user control and freedom', '', '', 'B'),
('Brainstorming, morphological analysis, and "the worst idea" are examples of what kind of technique?', 'Ideation', 'Lo-fi prototyping', 'Convergence', 'Poor', '', '', 'A'),
('Clear "tests" that determine whether someone is "in" or "out" of the target population for a user test are:', 'Recruiting criteria', 'Diversity criteria', 'User tests', 'Tasks', '', '', 'A'),
('Critical incidents and verbal reports are both examples of what kind of user testing data?', 'Quantitative', 'Qualitative', 'Insignificant', 'Performance', '', '', 'B'),
('Designing thoughtful defaults is important for several reasons. Which of the following is not a reason for designing good defaults?', 'Defaults define out-of-the-box experience', 'Defaults are easily changed', 'Defaults decrease onboarding time', 'Defaults can have large consequences', '', '', 'B'),
('For a system''s response to user input to be perceived as "instantaneous" by the user, what is the maximum time that can elapse between the user''s action and the system response?', '10 milliseconds', '100 milliseconds', '1 second', '1 minute', '', '', 'B'),
('Factors that capture the ways in which you expect your users to differ can be expressed as:', 'Recruiting criteria', 'Diversity criteria', 'Success criteria', 'Tasks', '', '', 'B'),
('Multiple choice questions like this are really just survey questions! What type of survey question is this?', 'Nominal closed-ended, choice unforced', 'Nominal closed-ended, choice forced', 'Ordinal closed-ended, choice unforced', 'Ordinal closed-ended, choice forced', '', '', 'B');


INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('If a user of a system is unable to determine whether an action they took helped to move them closer to achieving their goal, we would say that the system fails to bridge:', 'The Gulf of Inspection', 'The Gulf of Expectation', 'The Gulf of Execution', 'The Gulf of Evaluation', '', '', 'D'),
('If a user of a system is unable to find an option for action that they believe will move them closer to achieving their goal, we would say that the system fails to bridge:', 'The Gulf of Inspection', 'The Gulf of Expectation', 'The Gulf of Execution', 'The Gulf of Evaluation', '', '', 'C'),
('Research at scale can be carried out during the following product development lifecycles:', 'Discovery', 'Design/Development', 'Optimization', 'All of the others', '', '', 'D'),
('Interviews, Observations, Surveys, User Testing, and Inspection Methods are all examples of:', 'Common UX mistakes', 'UX Design methods', 'UX Research methods', 'UX Marketing methods', '', '', 'C'),
('Rank these prototypes in order of fidelity, from low to high', '1, 2, 3', '3, 2, 1', '1, 3, 2', '2, 1, 3', '', '', 'A'),
('The "central vision" portion of the human field of view, in which people can read text and recognize details in images, is approximately how wide?', '5 degrees', '18 degrees', '30 degrees', '180 degrees', '', '', 'A'),
('The effect that makes it easy to recognize objects in a visual field that differ from their background and all other objects in simple visual features like color and texture is called:', 'Saccade', 'Gestalt', 'Brightness', 'Pop-out', '', '', 'D'),
('The person who greets participants and communicates with them throughout a user test session is called the:', 'Logger', 'Moderator', 'Interviewer', 'Technician', '', '', 'B'),
('This term describes the total set of people you want to be able to represent with your survey', 'Sample', 'Response Rate', 'Respondents', 'Population', '', '', 'D'),
('The pattern of eye fixations that people perform when processing a web page has been shown what shape?', 'A circle', 'A spiral', 'The letter ''F''', 'The letter ''Z''', '', '', 'C'),
('This is error that is introduced when your questions somehow don''t actually get to the concept you''re interested in', 'Coverage Error', 'Sampling Error', 'Measurement error', 'Nonresponse Error', '', '', 'C'),
('This is the error that is introduced because some portion of the population is refusing to answer your questions', 'Coverage error', 'Nonresponse error', 'Sampling error', 'Measurement error', '', '', 'B'),
('This is the error that is introduced because the way you are asking questions is going to miss some big chunk of your population of interest', 'Measurement error', 'Nonresponse error', 'Coverage error', 'Sampling error', '', '', 'C'),
('Your client wants you to conduct a user test of their pre-release prototype to find the most important user interface problems to be fixed before the product is released.
What kind of user test is your client asking you to perform?', 'Summative', 'Formative', 'Competitive', 'A/B', '', '', 'B'),
('You are working on assessing the usability of a medical device. For regulatory reasons, you need to demonstrate that 99% of medical professionals can perform a certain task in under one minute.
What kind of user test should you perform?', 'Comparative', 'Formative', 'Benchmark', 'Microusability', '', '', 'C');



INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('Which of the following is a reason why you might use non-probability samples rather than probability samples?', 'Ability to represent the population better', 'Quality of data', 'Cost', 'Ability to get more responses', '', '', 'C'),
('Which of the following should you avoid when writing affinity notes?', 'Make each note understandable on its own', 'Be concrete', 'Aim for about one affinity note per minute of interview', 'Provide thorough, detailed explanations', '', '', 'D'),
('Which of the following are types of user-entered inputs?', 'GPS', 'Text fields where users enter free-form responses', 'Widgets like calendar pickers or on/off switches', 'Voice input, like dictation typing', 'All options on this list except GPS', '', 'E'),
('Which of the following methods would be the best approach for answering the stated questions?', 'Qualitative research such as user interviews or focus groups', 'Quantitative research such as surveys', 'Quantitative research such as A/B testing', 'Qualitative research such as user testing a prototype', '', '', 'A'),
('Which of the following is the most important consideration in picking what type of question type to use?', 'The demographic makeup of your population', 'The type of analysis you plan on doing', 'The type of sampling you''re using', 'The mode your survey will be delivered in', '', '', 'B'),
('Which of the following is the right way to take notes?', 'To write only the key points in short phrases', 'To capture only what audio recording definitely will not', 'There is no one right way to take notes', 'To jot down only follow-up questions you want to ask later', '', '', 'C'),
('Which of the following questions would be most relevant to the UX criterion of "Adoptability"?', 'Where do users currently look for products or services like the one we will offer?', 'Do users prefer bright or muted colors for graphics in this product category?', 'How much would people be willing to pay for the product or service we plan to offer?', 'What percentage of people succeed in completing key tasks using the product?', '', '', 'A'),
('Which of the following is not true about standardized usability questionnaires like QUIS and PSSUQ?', 'The level of reliability is known, allowing you to assess how consistent they are across systems and study participants', 'Most of them have been used in many studies, allowing comparisons across systems', 'Some of them allow you to "plug in" different questionnaire sections to ask about specific usability issues', 'They are so expensive that they are only used in the biggest, most well-funded projects', '', '', 'D'),
('Which of the following would be a good reason for using a high-end usability testing lab with separate control and observation room?', 'You will be providing a computer for participants to use during the test', 'You will be using the think-aloud protocol', 'You plan to administer a post-test questionnaire', 'You plan to invite multiple stakeholders to observe the test sessions', '', '', 'D'),
('Which of the following is not a characteristic of low-fidelity prototypes?', 'They should be quick to create', 'They should support the full sequence of actions needed to complete a task', 'They should be realistic', 'They should cover the functionality of the whole system', '', '', 'D'),
('Which of the following is most accurate?', 'Surveys are good at broad descriptions of groups, but not at precise measurements', 'Surveys have largely been abandoned in modern research because they are so inaccurate', 'Surveys should never be combined with other types of methods', 'Surveys are good at measuring behavioral outcomes', '', '', 'A'),
('Which of the following best describes the social desirability outcomes in interview-led survey modes?', 'Results can be biased because people want to be agreeable with an interviewer', 'Results can be biased because interviewers will avoid questions that could be embarrassing', 'Results can be biased because people semi-consciously will try to look acceptable to the interviewer', 'Results can be biased because some interviewers are more able to get people to do surveys', '', '', 'C'),
('Which of the following is the most true statement about how people remember things?', 'People remember their past behavior well enough to give accurate survey responses', 'Memory can be guided back to accuracy through careful prompts', 'Memory fades over time, but people are good at remembering routine actions', 'Memory fades over time, and often doesn''t capture routine actions', '', '', 'D'),
('Which of the following best describes the question stem?', 'It''s the optional instructions for how to answer a question', 'It''s the set of responses that a respondent can give', 'It''s the query that operationalizes the concept of interest and prompts a response', 'It''s a series of questions that are used together to form a scale', '', '', 'C'),
('Which of these examples of personas could be more effective for guiding a design solution?', '#2 because it includes relevant demographic information, motivations and needs related to the design problem, and characteristics could constrain the persona''s ability to use a system', '#1 because there are more personas and they''re in paragraph form', '#1 because the picture in #2 is distracting', '', '', '', 'A'),
('Which of the following can prototypes help designers test?', 'The overall design concept', 'Functionality of different components of the system', 'Screen layouts', 'User interactions', 'All of the others', '', 'E'),
('Which of the following best describes why you might choose to use a panel for recruiting respondents?', 'To reduce recruitment costs', 'To make sure you get people who are experienced in answering surveys', 'To increase quality', 'To avoid having a convenience sample', '', '', 'A'),
('Which of the following represents the system''s state:', 'Information about the user''s current location', 'User profile information', 'Rules for providing feedback to the user', 'Current values of all system inputs and variables, and rules for operating on those values', '', '', 'D'),
('Which of the following are research methods that can be applied in formative research?', 'Interviews', 'Observations', 'Asking friends and family members about their experiences', 'Participatory design groups', 'All of the others', 'None of the others', 'E'),
('Which of the following tasks is most representative of the kind of work involved in qualitative research?', 'Conducting interviews about how people use Excel spreadsheets', 'Analyzing statistical data about visits to Amazon', 'Writing software to classify user posts on Facebook', 'Running an experimental trial to see if users like Google with banner ads', '', '', 'A'),
('Which of the following best describes the question stem?', 'It''s the optional instructions for how to answer a question', 'It''s the set of responses that a respondent can give', 'It''s the query that operationalizes the concept of interest and prompts a response', 'It''s a series of questions that are used together to form a scale', '', '', 'C'),
('Which of the following is a good open-ended question to ask in a semi-structured interview?', 'How many times a week do you use a GPS device recently?', 'Can you tell me about the most recent time when you used a GPS device?', 'Was the GPS interface poorly designed?', 'Why didn''t you use the landmark feature on your GPS device?', '', '', 'B'),
('Which of the following is an example of purposive sampling?', 'Asking your female friends to respond to a survey via Facebook and Twitter requests', 'Asking people who use a site''s shopping cart how they feel about that experience', 'Emailing a random sample of employees who started at the company this year based on a list provided', 'Asking one group of respondents to forward the survey invite to their social networks', '', '', 'B'),
('Which of the following is the most accurate statement?', 'Error can be reduced by designing surveys as well as possible within resource constraints', 'Error should be reduced to zero before launching a survey', 'It''s impossible to affect error one way or another', 'Surveys should never be trusted because of how much error they involve', '', '', 'A'),
('Which of the following is most accurate?', 'Surveys are good at broad descriptions of groups, but not at precise measurements', 'Surveys have largely been abandoned in modern research because they are so inaccurate', 'Surveys should never be combined with other types of methods', 'Surveys are good at measuring behavioral outcomes', '', '', 'A'),
('Which of the following questions is best answered by a qualitative research methodology?', 'What proportion of Gadget X users love Feature Y?', 'What are the different ways in which Gadget X frustrates its users?', 'How will total revenue change if Gadget X''s price is reduced by 10%?', 'Does Gadget X tend to increase traffic accidents among its users?', '', '', 'B'),
('Which of the following is a BAD question to ask during a user needs assessment interview?', 'Could you tell me about a recent time when you used the "undo" feature?', 'Tell me more -- what was the context when you used the "undo" feature?', 'What functionality would you have liked to have to complete the task?', 'Was it because you didn''t know about the "undo" feature that you were unable to complete the task?', '', '', 'D'),
('Which of the following is the best-scoped question for a small user needs assessment project?', 'What kinds of problems do users face when using Microsoft Word''s spell-checking feature?', 'What kinds of problems do users face when using Microsoft products?', 'What kinds of problems do users face when using Microsoft Word?', 'What kinds of problems do users face when fixing a spelling error identified by Microsoft Word''s spell-checking feature?', '', '', 'A'),
('Which of the following is an example of a good use of a post-test questionnaire?', 'Asking open-ended questions where participants can give any answer that comes to mind', 'Asking follow-up questions to understand why participants gave answers that they did', 'Obtaining quantified measures of participants subjective reactions to using a system', 'Measuring the time it takes participants to complete a task', '', '', 'C'),
('Which of the following is the best definition of a probability sample?', 'Almost every member of your population has some chance to be selected for the survey', 'Only those people who will probably answer the survey are sampled from the population', 'Every member of your population has some chance to be selected for the survey', 'You invite every member of the population to participate in the survey', '', '', 'C'),
('Which of the following best describes the social desirability outcomes in interview-led survey modes?', 'Results can be biased because people want to be agreeable with an interviewer', 'Results can be biased because interviewers will avoid questions that could be embarrassing', 'Results can be biased because people semi-consciously will try to look acceptable to the interviewer', 'Results can be biased because some interviewers are more able to get people to do surveys', '', '', 'C'),
('Which of the following best describes the role of a participant in a user test?', 'They are being evaluated to see if they are competent enough to use the system tested', 'Once they have agreed to participate, they are obligated to complete all tasks and answer all questions, regardless of their discomfort', 'They are partners with the researchers administering the test, working with together to find flaws in the system design', 'They should remain ignorant of the goals of the test, so that they can offer more creative feedback and design suggestions', '', '', 'C');



INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('How do you get to Carnegie Hall?', 'Practice, practice, practice!', 'Go down three blocks and take a right', 'Buy a ticket online', 'Use a GPS device', '', '', 'A'),
('How many personas should designers create for a design project?', 'Often one or two personas are all that''s needed', 'As many personas as it takes to represent everything designers have learned in the formative work', 'The number of personas should match the number of classes of target users that the designers have identified in the formative work', 'The more personas, the better', 'Three to four personas are usually a sweet spot', '', 'C'),
('When using questionnaires to collect characteristic, behavioral, and attitudinal data about your test participants, it is best to:', 'Ask all the questions you can think of, because you never know what will be useful', 'Ask no questions, because it will distract from the test and annoy your participants', 'Focus on collecting data that could help explain differences in task outcomes', 'Focus on getting users to rate the quality of your system on a five-point scale', '', '', 'C'),
('When designing the set of tasks you will use in a test, it''s a good idea to:', 'Order them from hardest to easiest, to get the hard stuff out of the way', 'Order them from easiest to hardest, so that your participants feel more comfortable', 'Avoid making participants perform several very similar tasks in a row', 'Avoid trying to exhaustively test every possible path through the interface', '', '', 'B'),
('Why is it important to have a facilitator for a brainstorming session?', 'To make sure people don''t go on excessive tangents', 'To notice when session participants feel stuck or have hit a dead end, and to redirect the session by bringing up a new topic to brainstorm', 'To keep in check critiquing of ideas', 'To flag if participants end up diving too deeply into a single idea', '', '', 'C'),
('Why is it important to ask participants to announce when they believe they are done with a task?', 'Otherwise there is no way to know if they''ve finished', 'Allowing the moderator to declare a task "done" could give the participant more information than they would have if conducting the task outside the test environment', 'Saying "I''m done" gives the participant a sense of accomplishment', 'It allows the moderator to pay less attention to the current task and start to prepare for the next one', '', '', 'B'),
('Why does ideation emphasize the speed of idea generation?', 'Because the ideas that first come to mind are usually the best ones', 'Because the quality of the initial ideas doesn''t matter since a design solution gets iteratively refined many times anyway', 'Because designers often work on tight schedules', 'Because quick idea generation helps designers generate a lot of ideas', '', '', 'D'),
('Why would a designer create storyboards as opposed to write scenarios?', 'To better represent the physical environment in which the technology would be used', 'To better represent relationships among multiple people', 'To better envision size or other physical constraints of the technology and its use', 'All of the others', '', '', 'D');


INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
('A recommended technique for supporting "flexibility and efficiency of use" is:', 'The use of keyboard "accelerator" shortcuts', 'Make sure all commands are represented graphically on the screen', 'Streamline the design to minimize page load times', 'Eliminate as many commands as possible to prevent possible errors', '', '', 'A'),
('Among responses by interview participants that are relevant to your overarching question, what should you be paying particular attention to?', 'Answers that confirm what you know', 'Answers that are surprising or unexpected', 'Answers delivered without emotion', 'Answers that show off the participant''s cleverness', '', '', 'B'),
('According to Nielsen''s heuristics, "platform standards" are important to support in user interface design because:', 'Platform standards are always better than anything you could come up with on your own', 'Supporting standards allows users to leverage "schemas" they have developed through prior experiences with similar systems', 'Platform owners may refuse to allow your system to run on their platform if you do not conform', 'You can use pre-existing code libraries, which saves development time', '', '', 'B'),
('Because some users learn how to use a system through trial and error, it is important to:', 'Provide extensive documentation to ensure that users always do the right thing', 'Force users to undergo training before using a system so they don''t break anything', 'Provide users with only one option at a time so that they cannot make mistakes', 'Support "undo" and "redo" to help users recover from mistakes', '', '', 'D'),
('Conducting an actual semi-structured interview is most consistently like which of the following activities?', 'Golf, because negative events can affect your performance', 'Driving, because you have to navigate adversarial situations', 'Playing jazz, because improvisation is required', 'Running a marathon, because it is exhausting', '', '', 'C'),
('Designers often refer to the notion of the "design space." What does this term refer to?', 'Physical space (like a design studio) where design activities take place', 'Space into which the design has to fit (e.g., the size of the screen of a mobile phone)', 'Properties of the space (e.g., location, shape of the room) where the design will be used', 'The range of alternative ways that a design solution can work', '', '', 'D'),
('From a usability point of view, it''s important to use an "aesthetic and minimalist design" because:', 'A pleasing design can increase brand awareness, which can increase sales', 'Reducing clutter and organizing information makes it easier for people to find what they are looking for', 'A simpler design is more cost-effective to develop and maintain', 'An ugly design will provoke users to make errors on purpose, as a form of protest', '', '', 'B'),
('For the purposes of this course, which of the following is the best-scoped question for a small user needs assessment project?', 'How could the "on/off" switch of the device you are using be better designed to accommodate users?', 'How could the local grocery store be designed better to accommodate customers?', 'How could the city/town/village you live in be designed better to accommodate residents?', 'How could the customer queue at the local post office be designed better to accommodate customers?', '', '', 'D'),
('Gulf of evaluation refers to which of the following?', 'The user''s ability to understand the system''s output (e.g., the graphs that the system presents the user)', 'The ability of the user to tell if the system did what the user was trying to do', 'The user''s ability to evaluate if the system is a good match for his/her needs', 'The difference between user ratings of an app in the app store and the actual quality of the app', '', '', 'B'),
('Gulf of execution refers to which of the following?', 'The time it takes an application to execute some computationally-intensive task, such as running a statistical model', 'The difference between the output the system provided and the output the user wanted', 'The discrepancy between what the user is trying to do and what he/she is able to do using the system''s interface', 'The time between when the user gives the system a command and when the system executes that command (e.g., the delay in responding to a button press)', '', '', 'C'),
('In the context of this lesson, the use of consistency, standards, and metaphor is recommended because:', 'People are afraid of things that are new and different', 'They allow a design to take advantage of users'' existing schema', 'They are typically required by platform guideline documents', 'Borrowing ideas from others is easier than coming up with your own', '', '', 'B'),
('Is this a good scope for a user test?', 'Yes, it has users test the core functions of the app', 'No, a user test needs to include testing every single task in the application to deliver valuable data', 'No, a user test must focus on only one task', 'No, a user test needs to compare two different systems', '', '', 'A'),
('In the affinity wall demo video about toaster ovens, why were the two affinity notes related to "burning" eventually separated?', 'Because "burning toast" and "burning fingers" were associated with two different concepts that went better with other affinity notes', 'Because that cluster grew to exceed seven affinity notes', 'Because they were about two different interview participants', 'Because "burning toast" tends to happen before "burning fingers"', '', '', 'A'),
('Using obscure system codes or non-intuitive imagery to represent system features and/or feedback violates which heuristic?', 'User control and freedom', 'Flexibility and efficiency of use', 'Aesthetic and minimalist design', 'Match between system and the real world', '', '', 'D'),
('Personas represent target users and are, thus, primarily a distillation of the findings from formative work. Scenarios begin to move designers toward a design solution. How do scenarios do this?', 'By envisioning how a technology might address the needs identified in formative work', 'By enumerating features of the technology being designed', 'By articulating tradeoffs of different design solutions', 'By providing stories that can be put into the ads for the product being designed', '', '', 'A'),
('Personas include different types of information, from demographics to motivations and sociocultural context. How should designers decide what information to include?', 'They should focus on making the information as complete as possible', 'They should focus on idiosyncratic characteristics of people they encountered in the formative research that will make personas as vivid as possible', 'They should focus mostly on demographic information; other types of information are secondary', 'They should focus on information that contributes to the distinct needs and potential barriers to and motivations for use that each class of target users has in relation to the technology being developed', '', '', 'D'),
('Some web forms give instantaneous feedback about the validity of data entered into a form field every time a user types a character. This type of "in-process feedback" helps usability because:', 'It can be used to manipulate users into providing data they didn''t intend to provide', 'It encourages users to look up help and documentation to understand how the system works', 'It helps prevent errors before they happen', 'It keeps users focused on the current task rather than getting distracted', '', '', 'C'),
('The design process is highly iterative. Which of the following are iterative loops that a designer might do?', 'From ideation to problem framing', 'From creation of scenarios and storyboards to ideation', 'From creation of scenarios and storyboards to problem framing', 'From prototyping to ideation', 'All of the others', 'None of the others', 'E'),
('The methodology you learned in this specialization is often labeled "human-centered." Why?', 'Because it cannot be applied to animals', 'Because it requires mindfulness training and centeredness to execute well', 'Because it focuses on the needs, preferences, and perspectives of a human user (or potential user)', 'Because it focuses only on the human user and ignores the user''s environment', '', '', 'C'),
('The recommendation "keep lists of options short" is given because:', 'Short lists load faster on a web page', 'Designing long lists of options is a waste of time because most users will only ever choose one or two of them', 'Due to the limits of short-term memory, users will have forgotten the first items by the time they''ve gotten to the end of a long list', 'Long lists exceed users'' useful field of view, making them harder to scan effectively', '', '', 'C'),
('You are testing the Nomaza.com website. All of your test participants will be using the same computer, which is located in your user testing lab. Which of the following is not something you ought to worry about when preparing for each test session?', 'Making sure the browser cache is cleared so that later users don''t see which links have been visited', 'Clearing out data that was created by earlier users so that all participants see the same starting conditions', 'Testing participants'' laptops to make sure their default browser is capable of displaying Nomaza.com', 'Giving all participants the same account capabilities and payment method in order to ensure consistency', '', '', 'C'),
('With respect to semi-structured interviews, what is the point of the Carnegie Hall joke about practice?', 'Interviewing is a state of mind', 'The location where you conduct an interview is as important as the interview itself', 'Like any skill, practice is essential', 'Musicians make good interviewers', '', '', 'C');