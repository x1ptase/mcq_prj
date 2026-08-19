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


-- MORE ANSWERS
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
(N'Which of the following statements about funded research programs are appropriate?', N'A bottom-up research program only supports research that is motivated by current, practical needs of industry.', N'A top-down research program gives researchers maximum freedom in selecting research topics.', N'A bottom-up research program allows researchers to select any possible research topic, and proposals are selected for funding only based on their originality, significance, and rigor.', N'A top-down research program defines precisely the research topics that can be funded and should be addressed by applicants.', N'A top-down research program only funds research that aims at an empirical evaluation in a practical setting of previously achieved theoretical results.', N'', 'CD'),
(N'Which of the following statements correctly describe soundness and completeness of a theory? (choose two answers)', N'Ideally, a theory should be both sound and complete.', N'A theory for a given phenomenon is complete if all its predictions are possible manifestations of the phenomenon.', N'A theory for a given phenomenon is sound if all its predictions are possible manifestations of the phenomenon.', N'A complete theory for a given phenomenon can predict impossible manifestations.', N'A theory for a given phenomenon is complete if it predicts all the possible manifestations.', N'', 'CE'),
(N'Consider an algorithm that is supposed to find all possible occurrences in a text of person''s names. (select 02 correct answers)', N'The algorithm finds a name that is not a person''s name. This is a false negative.', N'The algorithm does not find the occurrence of certain person''s names. This is a false positive.', N'The algorithm may both find a name that is not a person''s name and may fail to find the occurrence of certain person''s names. In this case the algorithm is simply an unacceptable approximation.', N'The algorithm may find a name that is not a person''s name and may fail to find the occurrence of certain person''s names. In this case the algorithm can generate both false positives and false negatives.', N'The algorithm finds a name that is not a person''s name. This is a false positive.', N'', 'DE'),
(N'This question is about rigor. When can a research result be defined as rigorous?', N'The research result is of theoretical nature.', N'The research result is a new artifact, whose design and validation are clearly and thoroughly described.', N'The research result solves an open problem that has been studied for many years.', N'The research result is properly formalized in mathematical form, and definitions and proofs are described clearly, correctly, and elegantly.', N'The research result may be used by other researchers to advance their own research.', N'', 'BD'),
(N'Consider the following statements about precision and recall of an algorithm. Which are correct? (Select all that apply)', N'Either precision or recall must be equal to one for an approximate algorithm to be acceptable.', N'Precision and recall are equal to one for algorithms computing exact solutions.', N'Precision is less than one for algorithms that compute false positives.', N'If we are given two approximate algorithms for the same problem, they can differ in precision and recall.', N'Recall is less than one for algorithms that produce false negatives.', N'', 'BCE'),
(N'Deduction vs. induction. Select 3 correct statements:', N'In deductive inference, the consequences of true premises must be further validated by experiments before they can be accepted as a truth.', N'Modus ponens is a typical deductive inference rule.', N'In deductive inference, the consequences are guaranteed to be true if premises are true.', N'Deductive inferences can be used to generate predictions from a given theory.', N'Inductive inferences always lead to necessary conclusions.', N'', 'BCD'),
(N'Soundness vs. completeness of a theory of a certain phenomenon', N'Ideally, a theory should be both sound and complete', N'A theory for a given phenomenon is complete if all its predictions are possible manifestations of the phenomenon', N'A theory for a given phenomenon is sound if all its predictions are possible manifestations of the phenomenon.', N'A complete theory for a given phenomenon can predict impossible manifestations.', N'A theory for a given phenomenon is complete if it predicts all the possible manifestations.', N'', 'ACE');
GO


-- TRUE/FALSE & MULTIPLE CHOICE
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
(N'Audit services focus on the verification of product movement by investigating physical records or performing inventory analysis. Such data are used to measure sales and assess market share and track the performance of new products or services.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'In exponential discriminative snowball sampling, the market researcher screens very carefully the individuals before accepting them in the final sample.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'"Non-respondents may be different from respondents in terms of certain demographics such as demographics, personality, and perceptions. In case that the non-respondents differ significantly from respondents, it means that the sample is significantly biased. Increased response rates usually imply lower rates of non-response bias." Is the above statement true or false?', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'"Survey questionnaires can be administered through the use of different modes. Those being, telephone interviews, personal interviews, mail interviews, and online interviews." Is the above statement true or false?', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'Survey questionnaires can be administered through the use of different modes. Those being, telephone interviews, personal interviews, mail interviews, and online interviews.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'Qualitative research is popular in market research due to the fact that there is no better way to understand the in-depth motivations and feelings of consumers.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'Response rates can be increased through the adoption of', N'Questionnaires', N'Incentives', N'Promises', N'Suggestions to research participants', N'', N'', 'B'),
(N'"Audit services focus on the verification of product movement by investigating physical records or performing inventory analysis. Such data are used to measure sales and assess market share and track the performance of new products or services." Is the above statement true or false?', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'In-depth interviews can reveal hidden motivations and are considered one of the most popular data collection approaches in qualitative research.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'The combination of survey data and databases helps the organization identify the nature and scope of different customer segments, understand the nature of the factors that influence the needs of customer groups, and reflect on best practices regarding target market decisions.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'The individual one-to-one interaction offers the interviewee the opportunity to be the focus of attention and to feel that their feelings and point of view are important and they are really important for the research project.', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'Is this word appropriate for an academic essay? increase', N'True', N'False', N'', N'', N'', N'', 'A'),
(N'Is this phrase appropriate for an academic essay? drunk as a skunk', N'No', N'Yes', N'', N'', N'', N'', 'A'),
(N'Is this word appropriate for an academic essay? y''all', N'Yes', N'No', N'', N'', N'', N'', 'B');
GO


-- DAU_____
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
(N'_____focus on electronic devices which automatically record behavior and are supplemented by a diary. Such data are used for creating media programs on air time and developing viewer profiles.', N'Diary media panels', N'Focus groups', N'Interviews', N'Discussions', N'', N'', 'A'),
(N'_____sampling is considered as a two-stage restricted judgemental sampling which is adopted extensively in street interviewing.', N'Random', N'Convenience', N'Quota', N'Probability', N'', N'', 'C'),
(N'_____scale is a comparative scale in which key informants are requested to assign a constant sum of units such as points, euros, or dollars among a set of stimulus objects regarding some criterion.', N'Ordinal', N'Nominal', N'Semantic differential', N'Likert', N'Constant sum', N'', 'E'),
(N'_____is defined as the process of identifying constructive associations, patterns, and trends emerging from accumulated amounts of collected data stored in repositories, through the adoption of pattern recognition and statistical and mathematical approaches.', N'Data mining', N'Data reading', N'Data analysis', N'Data cleaning', N'', N'', 'A'),
(N'_____sampling is considered as a two-stage restricted judgemental sampling which is adopted extensively in street interviewing.', N'Random', N'Convenience', N'Quota', N'Probability', N'', N'', 'C'),
(N'_____scale is a scale where the numbers used to rank objects, such as numerically equal distances on the scale, demonstrate equal distances in the attribute being measured.', N'Interval', N'Nominal', N'Ordinal', N'Ratio', N'', N'', 'A'),
(N'_____scale is a comparative scale in which key informants are requested to assign a constant sum of units such as points, euros, or dollars among a set of stimulus objects regarding some criterion.', N'Ordinal', N'Nominal', N'Semantic differential', N'Likert', N'Constant sum', N'', 'E'),
(N'_____is defined as the procedure of placing key informants on a continuum regarding their attitude towards a certain product or product line', N'Measuring', N'Assessing', N'Scaling', N'Reconfiguring', N'', N'', 'C'),
(N'_____refer to organizations which gather and sell pools of data and information which are developed to address information requirements and needs.', N'Data', N'Texts', N'Syndicated sources', N'Analyses', N'', N'', 'C'),
(N'______ scaling focuses on two objects which the respondents are asked to select one according to some criterion.', N'Likert', N'Ordinal', N'Paired comparison', N'Nominal', N'', N'', 'C'),
(N'An_____scale is a ranking scale in which numbers are allocated to objects to demonstrate the degree to which object has more or less of an attribute than another object but not how much more or less. An example of such a scale is the ranking of service quality offered by a number of banks.', N'Ordinal', N'Ratio', N'Interval', N'Nominal', N'', N'', 'A'),
(N'A_____include(s) a collection of different and integrated databases developed in supporting decision-making and solving of problems. The data which are included can be accessed through data mining approaches.', N'Datawarehouse', N'Warehouse', N'Record', N'Research documents', N'', N'', 'A'),
(N'A_____scale is a figurative labeling scheme in which numbers serve as labels or tags in order to identify and classify objects.', N'Nominal', N'Ordinal', N'Ratio', N'Interval', N'', N'', 'A'),
(N'A well-developed research instrument can enhance the response rate and reduce_____ to participate in the research study.', N'Refusals', N'Willingness', N'Follow-ups', N'Suggestions', N'', N'', 'A'),
(N'A/An_____scale is a figurative labeling scheme in which numbers serve as labels or tags in order to identify and classify objects.', N'Nominal', N'Ordinal', N'Ratio', N'Interval', N'', N'', 'A'),
(N'Gathered market research data should be integrated with other research data coming from both_____ and external sources to make the most of their use and to make more confident strategic decision-making', N'Internal', N'External', N'Mixed', N'Experimental', N'', N'', 'A'),
(N'Non-comparative scaling techniques include the semantic differential scale, the_____scale', N'Q-sort', N'Rank order', N'Paired comparison', N'Likert', N'Constant sum', N'', 'D'),
(N'In structured data collection a formal research instrument is developed and the different questions are offered in a_____order.', N'Pre-arranged', N'Random', N'', N'', N'', N'', 'A'),
(N'In an action research project during the_____stage the plans are implemented and interventions are made collaboratively between the researcher and the research participants.', N'Observe', N'Reflect', N'Plan', N'Pre-step', N'Act', N'', 'E'),
(N'In a survey questionnaire, the vast majority of questions are_____responses that require the respondent to select the answer from a prearranged set of responses.', N'Fixed', N'Obscure', N'Easy', N'Obvious', N'', N'', 'A'),
(N'In a_____scale, a single adjective (e.g., user-friendly, high quality) is located in the center of the scale, which usually is a 10-point scale that ranges from +5 to -5. The approach is designed to operationalize the direction and the intensity of the attitudes at the same time.', N'Likert', N'Stapel', N'Ordinal', N'Nominal', N'', N'', 'B'),
(N'In a collective case study or_____case study the issue to be investigated is selected but the researcher chooses a number of case studies to depict the issue. Such an action helps to investigate different aspects of the issue under investigation.', N'Random', N'Multiple', N'Experimental', N'Attitudinal', N'', N'', 'B'),
(N'In an action research project during_____the stage the plans are implemented and interventions are made collaboratively between the researcher and the research participants.', N'Observe', N'Reflect', N'Plan', N'Pre-step', N'Act', N'', 'E'),
(N'The success of an in-depth interview depends on the_____of the interviewer.', N'Skills', N'Accent', N'Questions', N'Chrisma', N'', N'', 'A'),
(N'The_____scale consists of a number of statements that communicate a favorable or unfavorable attitude toward the concept under investigation', N'Stapel', N'Semantic differential', N'Ordinal', N'Likert', N'', N'', 'D'),
(N'The in-depth_____does not have the retrictions of a group process and in this vein, new streams of_____and questioning can be developed at any time.', N'Participants', N'Advice', N'Questionnaires', N'Interviews', N'', N'', 'D'),
(N'The development of a_____scale commences with a concept that should be rated, such as the image of a brand or the quality of a service. The market researcher chooses opposite pairs of words or phrases (for instance, reliable (1) to unreliable (7)), which could be used to capture the concept on a scale, which is usually anchored from 1 to 7.', N'Nominal', N'Semantic differential', N'Ordinal', N'Likert', N'', N'', 'B'),
(N'The budget scheduled for research should be considered and, in this vein, if there are limited research resources, more cost-efficient ways of collecting data should be considered, including_____data collection approaches. Right market research data assist companies in better connecting with their customers and attracting new customers', N'Internal', N'External', N'Automated', N'Manual', N'', N'', 'C'),
(N'The design of a qualitative study commences with broad_____regarding the qualitative_____and the theoretical lens which shape and direct the study', N'Assumptions. Inquiry', N'Inspirations. Assumptions', N'Dreams. Assumptions', N'Details. Structure', N'', N'', 'A'),
(N'The general empirical approach in action research includes_____that is demonstrated in activities such as attending, sensing, and imaging', N'Decision', N'Understanding', N'Judgement', N'Acting', N'Experience', N'', 'E'),
(N'The success of an in-depth interview depends on the_____of the interviewer', N'Skills', N'Accent', N'Questions', N'Charisma', N'', N'', 'A'),
(N'The research can be classified as_____or_____based upon whether the objective of the research is known to the respondents', N'Fixed or changing', N'Standardised or random', N'Structed or unstructured', N'Direct or indirect', N'', N'', 'D'),
(N'The development of a_____scale commences with a concept that should be rated, such as the image of a brand or the quality of a service. The market researcher chooses opposite pairs of words or phrases (for instance, reliable (1) to unreliable (7)), which could be used to capture the concept. As a next step, respondents rate the concept on a scale, which is usually anchored from 1 to 7.', N'Nomial', N'Semantic differential', N'Ordinal', N'Likert', N'', N'', 'B'),
(N'Survey approaches are based upon the design and development of well_____questionnaires', N'Standardised', N'Structured', N'Arranged', N'Directed', N'', N'', 'B'),
(N'Structured refers to the level of_____that is used during the data collection procedure', N'Standardization', N'Variation', N'Collaboration', N'Creativity', N'', N'', 'A'),
(N'Qualitative researchers are reluctant to generalise the cases from one context to another because the contexts of the various cases are different. If the intention is to generalise, the qualitative researcher should select_____cases to be considered in the qualitative study.', N'Internal', N'Representative', N'External', N'Mixed', N'', N'', 'B'),
(N'Response rates can be increased through the adoption of_____to research participants', N'Questionnaires', N'Incentives', N'Promises', N'Suggestions', N'', N'', 'B'),
(N'Under the spectrum of a/an_____case study, the researcher concentrates on an issue or concern and as a next step chooses a bounded case study to depict the case.', N'Longitudinal', N'Attitudinal', N'Single instrumental', N'Random', N'', N'', 'C'),
(N'Well-trained researcher can enhance_____rates and increase conversion and persuasion of key informants', N'Response', N'Percentage', N'Question', N'Questionnaire', N'', N'', 'A');
GO



-- SHORT QUESTIONS
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
(N'What is the first thing to do after you receive a research paper assignment?', N'Think of a research question', N'Make an outline', N'Write the thesis statement', N'', N'', N'', 'A'),
(N'Which of the following groups of words is definitely not on the Academic Word List?', N'facilitate, prime', N'transit', N'crash, cop, messy', N'evolve, generate, alter', N'dynamic, prohibit, identical', N'', 'B'),
(N'Which of the following appears on the income statement?', N'Cash', N'Accounts Payable', N'Service Revenue', N'Retained Earnings', N'', N'', 'C'),
(N'Which of the following groups of words is definitely not on the Academic Word List?', N'error, alter, reject', N'trashy, know-it-all, grouchy', N'capable, display, incorporate', N'locate, remove, specify', N'', N'', 'B'),
(N'Which of the following is not a reason to use a statistic in your research paper?', N'to support your point', N'some subjects depend on them', N'to make your paper longer', N'', N'', N'', 'C'),
(N'Which of the following internet sites would be acceptable to use when searching for sources for a research paper?', N'www.google.com', N'www.yahoo.com', N'www.bing.com', N'scholar.google.com', N'', N'', 'D'),
(N'Which of the following is the most academic kind of source?', N'popular sources', N'news sources', N'library databases', N'', N'', N'', 'C'),
(N'Which of the following is NOT a very good search term for this topic? Topic: Gun Laws', N'gun restrictios', N'guns', N'gun laws in the U.S', N'the right to own a gun', N'', N'', 'B'),
(N'Which type of scale involves the comparison of different objects? For instance, key informants may be asked to indicate if they prefer Coca Cola or Pepsi.', N'Likert', N'Semantic differential', N'Stapel', N'Nominal', N'Comparative', N'', 'E'),
(N'According to the lecture, where is the best place to look for sources for a research paper?', N'library databases', N'Google Scholar', N'Google', N'', N'', N'', 'A'),
(N'All of the following are questions to ask when determining the reliability of a source EXCEPT which one?', N'Who wrote the source?', N'What is the date of the source?', N'What is the purpose of the source?', N'How long is the source?', N'Is the source biased?', N'', 'D'),
(N'Most research papers share all of the following characteristics EXCEPT which one?', N'They have considerable length', N'They use sources', N'They are complex', N'They are worth 150 pts', N'', N'', 'D'),
(N'Mail diary panels refer to information that comes from households, and such information is offered for an extended period of time. In this vein, the key informants are required to record behavior as it takes place.', N'Syndicated services', N'Mail diary panels', N'industrial services', N'Audit services', N'', N'', 'B'),
(N'You are asked to review a survey paper. In which of the following dimensions you are not expecting the paper to be particularly strong? select one', N'Originality', N'Significance', N'Rigor', N'', N'', N'', 'A');
GO


-- LONG QUESTIONS
INSERT INTO QuizQuestions 
(question, option_a, option_b, option_c, option_d, option_e, option_f, correct_answer) 
VALUES 
(N'What is an annotated bibliography?', N'It is a list of articles related to your topic, and it summarizes and evaluates these', N'It is a list of articles that you plan to read for your research.', N'It is a list of articles by one author who is an expert on your topic.', N'', N'', N'', 'A'),
(N'What is a null hypothesis? Tick the correct answer.', N'An obviously wrong hypothesis that does not explain a certain phenomenon.', N'Hypothesis made by an inexperienced scientist.', N'No hypothesis made', N'Hypothesis that further experiments disprove', N'Hypothesis framed in a negative form, which researchers try to reject to confirm a theory.', N'', 'E'),
(N'What is the purpose of an annotated bibliography?', N'to help you develop your paper', N'to help you think of search terms for your research', N'to give you more work to do when you have a research assignment', N'to help you summarize and evaluate your source', N'', N'', 'D'),
(N'Which of the following best describes the nature of a scientific theory? (Choose one)', N'Must always be described as a set of mathematical formulae.', N'Is valid if a majority vote of researchers approves it.', N'Must be stated as an absolute truth. It is guaranteed that it will never be falsified by further experiments.', N'Is guaranteed to be unfalsifiable when it is published', N'Is valid until further findings disprove it', N'', 'E'),
(N'Which of the following statements about research are valid?', N'Research is only inspired by practical problems observed in the physical world.', N'Research has to be purely speculative, disconnected from practical concerns that would only be distractions.', N'Research may generate new knowledge. New knowledge may generate innovations that may favor progress of society.', N'Research does not require other investments than salaries for researchers', N'Research is only a hobby of talented individuals, who can afford investing their time and effort in it', N'', 'C'),
(N'Which of the following would be the most effective thesis statement for a research paper?', N'The tooth fairy and Santa Claus are imaginary characters for children.', N'The U.S. government should require that all companies pay men and women the same amount of money for equal work.', N'It''s hotter in the oceans now than it was a few years ago, so something should be done about climate change.', N'Terrorism is really awful, so governments should prevent it.', N'', N'', 'B'),
(N'Which of the following statements correctly describe soundness and completeness of a theory? (choose two answers)', N'Ideally, a theory should be both sound and complete.', N'A theory for a given phenomenon is complete if all its predictions are possible manifestations of the phenomenon.', N'A theory for a given phenomenon is sound if all its predictions are possible manifestations of the phenomenon.', N'A complete theory for a given phenomenon can predict impossible manifestations.', N'A theory for a given phenomenon is complete if it predicts all the possible manifestations.', N'', 'CE'),
(N'Which of the following statements about the distinction between basic and applied research are acceptable?', N'The spectrum between basic and applied research is continuous, and a researcher may engage in both kinds of research during his/her work.', N'Applied research is a less valuable (and prestigious) kind of research than basic research.', N'Basic research inevitably leads to discoveries that can then be transformed by applied research into practical industrial innovations.', N'Basic research only requires "paper and pencil." No special equipment is needed.', N'Basic research is so fundamentally different from applied research that a researcher has to specialize and choose between the two upfront.', N'', 'A'),
(N'Among the following statements, which properly describes the scientific method, originated in the 17th century by scientists like Galileo, Newton, and others.', N'The method requires explaining the natural phenomenon under study avoiding the use of mathematics.', N'The method consists of observing a natural phenomenon under study, postulating a theory that explains it, and devising carefully chosen experiments to confirm or disprove the theory.', N'The method is based on validation of a theory by randomly generated experiments.', N'The method is purely theoretical, and does not require any experiments.', N'The method assures that a certain theory explaining a natural phenomenon is valid (i.e., it is an undisputable truth) after carefully chosen experiments confirm it.', N'', 'B'),
(N'A scientific theory... (tick one)', N'Must always be described as a set of mathematical formulae.', N'Is valid if a majority vote of researchers approves it', N'Must be stated as an absolute truth. It is guaranteed that it will never be falsified by further experiments.', N'Is guaranteed to be unfalsifiable when it is published', N'Is valid until further findings disprove it.', N'', 'E'),
(N'This question is about significance. When can a research result be defined as significant?', N'The research result was not known before.', N'The research that produced the result required very substantial funding.', N'The research result was unexpected.', N'The research result may be used by other researchers to advance their research.', N'The research result may lead to an improvement of a certain practical process, which reduces its cost and improves its performance.', N'', 'D'),
(N'Tick one or more of the following statements, which properly describes the scientific method, originated in the 17th century by scientists like Galileo, Newton, and others.', N'The method requires explaining the natural phenomenon under study avoiding the use of mathematics.', N'The method consists of observing a natural phenomenon under study, postulating a theory that explains it, and devising carefully chosen experiments to confirm or disprove the theory.', N'The method is based on validation of a theory by randomly generated experiments.', N'The method is purely theoretical, and does not require any experiments.', N'The method assures that a certain theory explaining a natural phenomenon is valid (i.e., it is an undisputable truth) after carefully chosen experiments confirm it', N'', 'B');
GO