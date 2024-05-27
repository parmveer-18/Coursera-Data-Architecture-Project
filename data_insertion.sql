/* This file contains all the data insertion for the tables. Added atleast 5 rows of data to each table*/

USE final_project_schema;

-- Encrypted_Student Table
INSERT INTO encrypted_student (student_id, first_name, last_name, phone_number, email, birth_date, highest_education_completed, hashed_password)
VALUES
(1, 'John', 'Doe', 1234567890, 'john@example.com', '1995-05-15', 'Bachelor', 'hashed_password_1'),
(2, 'Alice', 'Smith', 9876543210, 'alice@example.com', '1998-09-22', 'Master', 'hashed_password_2'),
(3, 'Eva', 'Johnson', 5556667777, 'eva@example.com', '2000-11-30', 'High School', 'hashed_password_3'),
(4, 'Michael', 'Brown', 1112223333, 'michael@example.com', '1990-03-10', 'PhD', 'hashed_password_4'),
(5, 'Sophia', 'Wilson', 9998887777, 'sophia@example.com', '1996-07-18', 'Master', 'hashed_password_5');

SELECT * FROM encrypted_student;

-- Chatbot_Occurence Table
INSERT INTO chatbot_occurence (chatbot_occurence, student_id, user_question, generated_answer, user_rating, time_of_conversation, date_of_conversation)
VALUES
(1, 1, 'What are the enrollment dates?', 'Enrollment starts on January 15th and ends on February 28th.', 5, '12:30:00', '2023-01-25'),
(2, 2, 'Can I change my degree?', 'Yes, you can request a change within the first month of enrollment.', 4, '09:45:00', '2023-03-10'),
(3, 3, 'How can I apply for scholarships?', 'You can find scholarship information on our website under the Financial Aid section.', 3, '15:20:00', '2023-04-05'),
(4, 4, 'Are there online courses available?', 'Yes, we offer various online courses across different disciplines.', 5, '11:00:00', '2023-02-18'),
(5, 5, 'What is the course schedule like?', 'Course schedules vary based on the degree program. You can check the course catalog for details.', 4, '14:10:00', '2023-05-20');

SELECT * FROM chatbot_occurence;

-- Institute Table
INSERT INTO institute (institute_id, institute_name)
VALUES
(1, 'Massachusetts Institute of Technology'),
(2, 'Harvard University'),
(3, 'Yale University'),
(4, 'Stanford University'),
(5, 'University of California, Berkeley');

SELECT * FROM institute;

-- Degree Table
INSERT INTO degree (degree_id, institute_id, degree_type, degree_length, degree_credit_hours, degree_delivery_type, degree_tuition, degree_explanation)
VALUES
(1, 1, 'Computer Science', '4 years', 120, 'Full-time', 25000.00, 'Core programming and algorithms'),
(2, 2, 'Business Administration', '3 years', 90, 'Part-time', 18000.00, 'Management and finance focus'),
(3, 3, 'Fine Arts', '5 years', 150, 'Full-time', 30000.00, 'Visual arts and design'),
(4, 4, 'Biology', '4 years', 120, 'Full-time', 28000.00, 'Study of living organisms'),
(5, 5, 'Medicine', '6 years', 180, 'Full-time', 35000.00, 'Medical theory and practice');

SELECT * FROM degree;

-- Degree_Testimonials Table
-- For BLOB data, actual video and metadata would be inserted but represented here as placeholders
INSERT INTO degree_testimonials (degree_testomonial_id, degree_id, degree_testomonial_video, degree_tesotomonial_video_metadata, degree_testomonial_quote, degree_testomonial_person, degree_testomonial_person_title)
VALUES
(1, 1, 'Video1', 'Metadata1', 'This degree program changed my perspective on technology.', 'John Doe', 'Software Engineer'),
(2, 2, 'Video2', 'Metadata2', 'Excellent business insights gained during the program.', 'Alice Smith', 'Business Analyst'),
(3, 3, 'Video3', 'Metadata3', 'The art courses opened new creative avenues for me.', 'Eva Johnson', 'Artist'),
(4, 4, 'Video4', 'Metadata4', 'Studying biology expanded my scientific knowledge.', 'Michael Brown', 'Biologist'),
(5, 5, 'Video5', 'Metadata5', 'This medical program prepared me well for my profession.', 'Sophia Wilson', 'Doctor');

SELECT * FROM degree_testimonials;

-- Student_enrollment_degree table
INSERT INTO student_enrollment_degree (degree_enrollment_id, degree_id, student_id, enrollment_begin_date, enrollment_end_date, enrollment_status)
VALUES
(1, 1, 1, '2023-09-01', '2027-05-30', 'Enrolled'),
(2, 2, 2, '2023-08-15', '2026-07-20', 'Enrolled'),
(3, 3, 3, '2023-10-10', '2028-06-25', 'Enrolled'),
(4, 4, 4, '2023-09-05', '2027-05-15', 'Enrolled'),
(5, 5, 5, '2023-08-20', '2029-05-10', 'Enrolled');

SELECT * FROM student_enrollment_degree;

-- Encrypted_instructor table
INSERT INTO encrypted_instructor (instructor_id, institute_id, first_name, last_name, hire_date, department, phone_number, email, birth_date)
VALUES
(1, 1, 'Emily', 'Johnson', '2015-05-10', 'Computer Science', 9876543210, 'emily@example.com', '1980-03-20'),
(2, 2, 'David', 'Williams', '2018-09-15', 'Business Administration', 1234567890, 'david@example.com', '1975-08-12'),
(3, 3, 'Sophie', 'Anderson', '2017-07-20', 'Fine Arts', 5556667777, 'sophie@example.com', '1988-11-05'),
(4, 4, 'Matthew', 'Brown', '2016-04-18', 'Biology', 1112223333, 'matthew@example.com', '1972-09-30'),
(5, 5, 'Olivia', 'Garcia', '2019-08-25', 'Medicine', 9998887777, 'olivia@example.com', '1985-06-15');

SELECT * FROM encrypted_instructor;

-- Mardown table
INSERT INTO markdown (markdown_id, type_of_markdown, cost, markdown_start, markdown_end)
VALUES
(1, 'Early Bird Discount', 150.00, '2023-01-01', '2023-03-31'),
(2, 'Summer Sale', 100.00, '2023-06-01', '2023-08-31'),
(3, 'Year-End Clearance', 200.00, '2023-10-01', '2023-12-31'),
(4, 'Back-to-School Promotion', 120.00, '2023-08-15', '2023-09-30'),
(5, 'Holiday Special', 180.00, '2023-11-15', '2023-12-25');

SELECT * FROM markdown;

-- Country table
INSERT INTO country (country_id, Country_name)
VALUES
(1, 'United States'),
(2, 'United Kingdom'),
(3, 'Canada'),
(4, 'Australia'),
(5, 'Germany');

SELECT * FROM country;

-- Subscription Table
INSERT INTO subscription (subscription_id, type_of_subscription, subscription_length)
VALUES
(1, 'Basic', 30),
(2, 'Premium', 90),
(3, 'Gold', 180),
(4, 'Silver', 60),
(5, 'Platinum', 365);

SELECT * FROM subscription;

-- Subscription_countries table
INSERT INTO subscription_countries (subscription_id, country)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

SELECT * FROM subscription_countries;

-- Student_subscription table
INSERT INTO student_subscription (student_subscription_id, student_id, subscription_id, markdown_id, subscription_start_date, subscription_end_date)
VALUES
    (1, 1, 1, 1, '2023-01-15', '2023-06-15'),
    (2, 2, 2, 2, '2023-03-10', '2023-06-10'),
    (3, 3, 3, 3, '2023-04-05', '2023-10-05'),
    (4, 4, 4, 4, '2023-02-18', '2023-04-18'),
    (5, 5, 5, 5, '2023-05-20', '2024-05-20');

SELECT * FROM student_subscription;

-- Student_address
INSERT INTO student_address (student_address_id, student_id, country_id, address_line_1, address_line_2, postal_code, state)
VALUES
    (1, 1, 1, '123 Main Street', 'Apt 101', '12345', 'California'),
    (2, 2, 2, '456 Elm Street', NULL, '67890', 'New York'),
    (3, 3, 3, '789 Oak Street', 'Suite 303', '13579', 'Texas'),
    (4, 4, 1, '101 Pine Street', 'Unit B', '24680', 'California'),
    (5, 5, 2, '222 Maple Street', NULL, '97531', 'New York');

SELECT * FROM student_address;

-- Encrypted_student_payment_details table
INSERT INTO Encrypted_student_payment_details (student_payment_id, student_id, student_address_id, card_type, card_number, expiration_date, cvv, card_full_name)
VALUES
    (1, 1, 1, 'Visa', 12345678, '12/25', 123, 'John Doe'),
    (2, 2, 2, 'Mastercard', 12365678, '11/24', 456, 'Alice Smith'),
    (3, 3, 3, 'Visa', 12905678, '10/23', 789, 'Eva Johnson'),
    (4, 4, 4, 'Mastercard', 12345690, '09/22', 101, 'Michael Brown'),
    (5, 5, 5, 'Visa', 12343978, '08/21', 121, 'Sophia Wilson');

SELECT * FROM Encrypted_student_payment_details;

-- Course table
INSERT INTO course (course_id, title, subject, course_type)
VALUES
    (1, 'Introduction to Programming', 'Computer Science', 'Online'),
    (2, 'Data Structures and Algorithms', 'Computer Science', 'Offline'),
    (3, 'Introduction to Psychology', 'Psychology', 'Online'),
    (4, 'Microeconomics 101', 'Economics', 'Online'),
    (5, 'Advanced Spanish', 'Languages', 'Offline');

SELECT * FROM course;

-- Course_career_affiliation table
INSERT INTO course_career_affiliation (career_id, course_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

SELECT * FROM course_career_affiliation;

-- Career_data table
INSERT INTO career_data (career_data_id, career_id, career_title)
VALUES
    (1, 1, 'Software Engineer'),
    (2, 2, 'Data Scientist'),
    (3, 3, 'Psychologist'),
    (4, 4, 'Economist'),
    (5, 5, 'Translator');

SELECT * FROM career_data;

-- Course_instance table
INSERT INTO course_instance (course_instance_id, course_id, institute_id, semester, enrollment_open_date, enrollment_close_date, course_subscription_fee, course_about)
VALUES
    (1, 1, 1, 1, '2023-08-01 00:00:00', '2023-09-30 23:59:59', 150.00, 'An introductory course to programming concepts.'),
    (2, 2, 2, 2, '2023-08-01 00:00:00', '2023-09-30 23:59:59', 150.00, 'A course on data structures and algorithms.'),
    (3, 3, 3, 3, '2023-08-01 00:00:00', '2023-09-30 23:59:59', 150.00, 'An introductory course to psychology.'),
    (4, 4, 4, 4, '2023-08-01 00:00:00', '2023-09-30 23:59:59', 150.00, 'An introductory course to microeconomics.'),
    (5, 5, 5, 5, '2023-08-01 00:00:00', '2023-09-30 23:59:59', 150.00, 'An advanced course in Spanish.');

SELECT * FROM course_instance;

-- Student_enrollment_course table
INSERT INTO student_enrollment_course (enrollment_id, course_instance_id, student_id, enrollment_begin_date, enrollment_end_date, enrollment_status)
VALUES
    (1, 1, 1, '2023-08-05 00:00:00', '2023-12-05 23:59:59', 'Active'),
    (2, 2, 2, '2023-08-05 00:00:00', '2023-12-05 23:59:59', 'Active'),
    (3, 3, 3, '2023-08-05 00:00:00', '2023-12-05 23:59:59', 'Active'),
    (4, 4, 4, '2023-08-05 00:00:00', '2023-12-05 23:59:59', 'Active'),
    (5, 5, 5, '2023-08-05 00:00:00', '2023-12-05 23:59:59', 'Active');

SELECT * FROM student_enrollment_course;

-- Course_pre_requisite table
INSERT INTO course_pre_requisite (course_pre_requisite_id, course_instance_id, pre_requisite_id)
VALUES
    (1, 2, 1),
    (2, 3, 1),
    (3, 4, 2),
    (4, 5, 3),
    (5, 5, 1);

SELECT * FROM course_pre_requisite;

-- Course_outcomes table
INSERT INTO course_outcomes (outcomes_id, course_instance_id, outcome_description)
VALUES
    (1, 1, 'Understand fundamental programming concepts.'),
    (2, 2, 'Apply advanced data structures and algorithms.'),
    (3, 3, 'Analyze human behavior from psychological perspectives.'),
    (4, 4, 'Comprehend economic principles and their applications.'),
    (5, 5, 'Achieve advanced proficiency in the specified language.');

SELECT * FROM course_outcomes;

-- Degree_reccomendation table
INSERT INTO degree_reccomendation (degree_reccomendation_id, course_instance_id, degree_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

SELECT * FROM degree_reccomendation;

-- Course_recommendation table
INSERT INTO course_recommendation (recommendation_id, course_instance_id, recommended_course_id)
VALUES
    (1, 1, 2),
    (2, 2, 3),
    (3, 3, 4),
    (4, 4, 5),
    (5, 5, 1);

SELECT * FROM course_recommendation;

-- Course_faq table
INSERT INTO course_faq (faq_id, course_instance_id, faq_question, faq_answer)
VALUES
    (1, 1, 'What are the prerequisites for this course?', 'This course requires basic understanding of programming concepts.'),
    (2, 2, 'Is this course suitable for beginners?', 'No, this course assumes prior knowledge of data structures.'),
    (3, 3, 'How will this course benefit my career?', 'This course provides foundational knowledge in psychology.'),
    (4, 4, 'Are there any group projects in this course?', 'Yes, there is a group economic analysis project.'),
    (5, 5, 'Can I teach this language after completing this course?', 'This course equips you with advanced teaching methodologies.');

SELECT * FROM course_faq;

-- Course_reviews table
INSERT INTO course_reviews (review_id, course_instance_id, student_id, rating, description)
VALUES
    (1, 1, 1, 4, 'Great course, covered a lot of ground.'),
    (2, 2, 2, 3, 'Decent content, but lacked practical examples.'),
    (3, 3, 2, 5, 'Amazing course, very insightful.'),
    (4, 4, 4, 4, 'Good explanations, could have more case studies.'),
    (5, 5, 5, 5, 'Fantastic teaching methods, highly recommended.');

SELECT * FROM course_reviews;

-- Course_completion table
INSERT INTO course_completion (course_completion_id, student_id, course_instance_id, grade_point_average, pass_or_fail)
VALUES
    (1, 1, 1, 3.75, 'Pass'),
    (2, 2, 2, 2.90, 'Pass'),
    (3, 3, 3, 4.00, 'Pass'),
    (4, 4, 4, 3.85, 'Pass'),
    (5, 5, 5, 4.30, 'Pass');

SELECT * FROM course_completion;

-- Course_modules table
INSERT INTO course_modules (module_id, course_instance_id, module_name, module_description, expected_time)
VALUES
    (1, 1, 'Introduction to Programming', 'Basic concepts of programming languages.', '2 weeks'),
    (2, 2, 'Data Structures Overview', 'Understanding various data structures.', '3 weeks'),
    (3, 3, 'Psychology Foundations', 'Fundamentals of human behavior.', '4 weeks'),
    (4, 4, 'Microeconomics Principles', 'Principles and theories of microeconomics.', '5 weeks'),
    (5, 5, 'Teaching Language Skills', 'Advanced methodologies in language teaching.', '6 weeks');

SELECT * FROM course_modules;

-- Course_videos table
INSERT INTO course_videos (video_id, module_id, video, video_transcript, video_metadata_file)
VALUES
    (1, 1, 'mock_video_blob_1', 'mock_transcript_blob_1', 'mock_metadata_blob_1'),
    (2, 2, 'mock_video_blob_2', 'mock_transcript_blob_2', 'mock_metadata_blob_2'),
    (3, 3, 'mock_video_blob_3', 'mock_transcript_blob_3', 'mock_metadata_blob_3'),
    (4, 4, 'mock_video_blob_4', 'mock_transcript_blob_4', 'mock_metadata_blob_4'),
    (5, 5, 'mock_video_blob_5', 'mock_transcript_blob_5', 'mock_metadata_blob_5');

SELECT * FROM course_videos;

-- Video_status table
INSERT INTO video_status (video_status_id, video_id, student_id, video_status, last_time)
VALUES
    (1, 1, 1, 'Watching', '2023-01-01 10:30:00'),
    (2, 2, 2, 'Paused', '2023-02-15 15:45:00'),
    (3, 3, 3, 'Completed', '2023-03-25 09:20:00'),
    (4, 4, 4, 'Watching', '2023-04-10 14:00:00'),
    (5, 5, 5, 'Not Started', '2023-05-20 11:10:00');

SELECT * FROM video_status;

-- Course_readings table
INSERT INTO course_readings (course_reading_id, module_id, reading_title, reading_link, reading_metadata_file)
VALUES
    (1, 1, 'Introduction to SQL', 'https://example.com/sql_intro', 'SQL_Intro.pdf'),
    (2, 2, 'Advanced SQL Techniques', 'https://example.com/advanced_sql', 'Advanced_SQL.pdf'),
    (3, 3, 'Database Normalization', 'https://example.com/db_normalization', 'DB_Normalization.pdf'),
    (4, 4, 'Data Modeling Best Practices', 'https://example.com/data_modeling', 'Data_Modeling.pdf'),
    (5, 5, 'Query Optimization Strategies', 'https://example.com/query_optimization', 'Query_Optimization.pdf');

SELECT * FROM course_readings;

-- Reading_status table
INSERT INTO reading_status (reading_status_id, course_reading_id, student_id, reading_status, last_paragraph)
VALUES
    (1, 1, 1, 'In Progress', 'Page 10'),
    (2, 3, 2, 'Completed', 'Page 50'),
    (3, 2, 3, 'Not Started', NULL),
    (4, 5, 4, 'In Progress', 'Page 20'),
    (5, 4, 5, 'Completed', 'Page 80');

SELECT * FROM reading_status;

-- Course_assignment table
INSERT INTO course_assignment (course_assignment_id, module_id, assignment_type, assignment_name, assignment_description)
VALUES
    (1, 1, 'Homework', 'SQL Practice', 'Practice exercises on SQL queries'),
    (2, 2, 'Project', 'Database Design Project', 'Design and implement a database for a business scenario'),
    (3, 3, 'Quiz', 'Normalization Quiz', 'Assessment on database normalization concepts'),
    (4, 4, 'Assignment', 'Data Modeling Assignment', 'Create an entity-relationship diagram for given requirements'),
    (5, 5, 'Presentation', 'Query Optimization Presentation', 'Prepare and present strategies for query optimization');

SELECT * FROM course_assignment;

-- Assignment_question table
INSERT INTO assignment_question (assignment_question_id, course_assignment_id, question_type, question_title)
VALUES
    (1, 1, 'Multiple Choice', 'SQL Basics'),
    (2, 2, 'Essay', 'Database Design Principles'),
    (3, 3, 'Short Answer', 'Normalization Forms'),
    (4, 4, 'Problem Solving', 'ER Diagram Creation'),
    (5, 5, 'Presentation', 'Query Optimization Strategies');

SELECT * FROM assignment_question;

-- Assignment_attempt table
INSERT INTO assignment_attempt (assignment_attempt_id, course_assignment_id, student_id, assignment_score)
VALUES
    (1, 1, 1, 85),
    (2, 2, 2, 92),
    (3, 3, 3, 75),
    (4, 4, 4, 88),
    (5, 5, 5, 90);

SELECT * FROM assignment_attempt;

-- Course_quiz table
INSERT INTO Course_quiz (course_quiz_id, module_id, quiz_type, quiz_name)
VALUES
    (1, 1, 'Practice', 'SQL Basics Quiz'),
    (2, 2, 'Assessment', 'Database Design Quiz'),
    (3, 3, 'Test', 'Normalization Quiz'),
    (4, 4, 'Evaluation', 'ER Diagram Quiz'),
    (5, 5, 'Review', 'Query Optimization Quiz');

SELECT * FROM Course_quiz;

-- Quiz_question table
INSERT INTO quiz_question (quiz_question_id, course_quiz_id, question_type, question_title)
VALUES
    (1, 1, 'Multiple Choice', 'SQL Basics'),
    (2, 2, 'Essay', 'Database Design Principles'),
    (3, 3, 'Short Answer', 'Normalization Forms'),
    (4, 4, 'Problem Solving', 'ER Diagram Creation'),
    (5, 5, 'True/False', 'Query Optimization Strategies');

SELECT * FROM quiz_question;

-- Quiz_question_answer table
INSERT INTO quiz_question_answer (answer_id, quiz_question_id, answer_type, answer)
VALUES
    (1, 1, 'Option', 'A'),
    (2, 1, 'Option', 'B'),
    (3, 1, 'Option', 'C'),
    (4, 1, 'Option', 'D'),
    (5, 2, 'Text', 'Describe the database design principles in detail.');

SELECT * FROM quiz_question_answer;

-- Course_quiz_attempt table
INSERT INTO course_quiz_attempt (quiz_attempt_id, quiz_question_id, student_id, quiz_score)
VALUES
    (1, 1, 1, 85.50),
    (2, 2, 2, 92.00),
    (3, 3, 3, 75.25),
    (4, 4, 4, 88.75),
    (5, 5, 5, 90.00);

SELECT * FROM course_quiz_attempt;

-- Course_discussion table
INSERT INTO course_discussion (course_discussion_id, module_id, discussion_creator, course_discussion_title, course_discussion_body, date_of_creation)
VALUES
    (1, 1, 1, 'SQL Basics Discussion', 'discuss the fundamentals of SQL.', '2023-11-29 09:00:00'),
    (2, 2, 2, 'Database Design Strategies', 'Discuss various approaches to database design.', '2023-11-30 10:00:00'),
    (3, 3, 3, 'Normalization Techniques', 'Share insights into database normalization.', '2023-12-01 11:00:00'),
    (4, 4, 4, 'ER Diagram Challenges', 'Explore difficulties in creating ER diagrams.', '2023-12-02 12:00:00'),
    (5, 5, 5, 'Query Optimization Tips', 'Exchange tips on optimizing queries.', '2023-12-03 13:00:00');

SELECT * FROM course_discussion;

-- Course_discussion_response table
INSERT INTO course_discussion_response (course_discussion_response_id, course_discussion_id, discussion_responder, response_title, response_body, date_of_creation)
VALUES
    (1, 1, 1, 'Re: SQL Basics Discussion', 'Lets delve deeper into SQL concepts.', '2023-11-29 10:00:00'),
    (2, 2, 2, 'Database Design Strategies - Response', 'Sharing experience on effective design.', '2023-11-30 11:00:00'),
    (3, 3, 3, 'Insights on Normalization Techniques', 'Offering insights into normalization.', '2023-12-01 12:00:00'),
    (4, 4, 4, 'Addressing ER Diagram Challenges', 'Strategies to overcome diagram hurdles.', '2023-12-02 13:00:00'),
    (5, 5, 5, 'Optimizing Queries - Tips Shared', 'Sharing effective query optimization tips.', '2023-12-03 14:00:00');

SELECT * FROM course_discussion_response;

-- Module_status table
INSERT INTO module_status (module_status_id, module_id, student_id, module_status)
VALUES
    (1, 1, 1, 'Completed'),
    (2, 2, 2, 'In Progress'),
    (3, 3, 3, 'Not Started'),
    (4, 4, 4, 'In Progress'),
    (5, 5, 5, 'Completed');

SELECT * FROM module_status;

-- Course_instructor table
INSERT INTO course_instructor (instructor_id, course_instance_id, instructor_title)
VALUES
    (1, 1, 'Professor'),
    (2, 2, 'Associate Professor'),
    (3, 3, 'Assistant Professor'),
    (4, 4, 'Lecturer'),
    (5, 5, 'Adjunct Professor');

SELECT * FROM course_instructor;

-- AI_course_quiz table
INSERT INTO AI_course_quiz (AI_course_quiz_id, module_id, quiz_type, quiz_name)
VALUES
    (1, 1, 'Practice', 'AI Basics Quiz'),
    (2, 2, 'Assessment', 'Machine Learning Quiz'),
    (3, 3, 'Test', 'Neural Networks Quiz'),
    (4, 4, 'Evaluation', 'Deep Learning Quiz'),
    (5, 5, 'Review', 'Reinforcement Learning Quiz');

SELECT * FROM AI_course_quiz;

-- AI_quiz_question table
INSERT INTO AI_quiz_question (AI_quiz_question_id, AI_course_quiz_id, question_type, question_title)
VALUES
    (1, 1, 'Multiple Choice', 'AI Fundamentals'),
    (2, 2, 'Essay', 'Machine Learning Algorithms'),
    (3, 3, 'Short Answer', 'Neural Network Architectures'),
    (4, 4, 'Problem Solving', 'Deep Learning Applications'),
    (5, 5, 'True/False', 'Reinforcement Learning Techniques');

SELECT * FROM AI_quiz_question;

-- AI_quiz_answer table
INSERT INTO AI_quiz_answer (AI_quiz_answer_id, AI_quiz_question_id, answer_type, answer)
VALUES
    (1, 1, 'Option', 'A'),
    (2, 1, 'Option', 'B'),
    (3, 1, 'Option', 'C'),
    (4, 1, 'Option', 'D'),
    (5, 2, 'Text', 'Describe machine learning algorithms in detail.');

SELECT * FROM AI_quiz_answer;

-- AI_course_quiz_attempt table
INSERT INTO AI_course_quiz_attempt (AI_quiz_attempt_id, AI_quiz_question_id, student_id, quiz_score)
VALUES
    (1, 1, 1, 85.50),
    (2, 2, 2, 92.00),
    (3, 3, 3, 75.25),
    (4, 4, 4, 88.75),
    (5, 5, 5, 90.00);

SELECT * FROM AI_course_quiz_attempt;


SELECT student_id, response_body FROM encrypted_student
         JOIN course_discussion_response ON encrypted_student.student_id = course_discussion_response.discussion_responder
         WHERE student_id = 1
;