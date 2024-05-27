/* This file contains all the SQL queries designed to 
assist managerial decision-making by extracting relevant data from the database*/

USE final_project_schema;

-- Q1) Quiz performance analysis: Obtain average score of normal, non-ai generated quizes
SELECT quiz_attempt_id, AVG(quiz_score) AS average_score
            FROM Course_quiz_attempt
            GROUP BY quiz_attempt_id;

-- Q2) Popular quizzes: A count of the the most popular quizzes taken by students
SELECT quiz_attempt_ID, COUNT(*) AS attempts_count
            FROM Course_quiz_attempt
            GROUP BY quiz_attempt_id
            ORDER BY attempts_count DESC
            LIMIT 25;

-- Q3) Quiz completion rates: Identify which quizzes arent completed frequently,
--      currently zero but as the data set grows, and quizes are left incomplete, this will change
SELECT quiz_attempt_id AS incomplete_quizzes, COUNT(*)
            FROM Course_quiz_attempt
            WHERE quiz_score = NULL
            GROUP BY incomplete_quizzes;

-- Q4) Quiz difficulty levels: Average score of quizzes, sorted by easiest to hardest
SELECT AVG(quiz_score) AS average_score
            FROM course_quiz_attempt
            DESC;

-- Q5) Counting the number of students using each subscription plan
SELECT ss.student_subscription_id, s.type_of_subscription, COUNT(*) AS student_count
            FROM student_subscription ss
            JOIN subscription s ON ss.student_subscription_id = s.subscription_id
            GROUP BY ss.student_subscription_id, s.type_of_subscription;

-- Q6) Chatbot usage statistics: Count the number of interactions with chatbot
SELECT chatbot_occurence, COUNT(*) AS interaction_count
            FROM chatbot_occurence
            GROUP BY chatbot_occurence;

-- Q7) Popular chatbot topics: Find the most frequently asked topics
SELECT user_question, COUNT(*) AS question_count
            FROM chatbot_occurence
            GROUP BY user_question
            ORDER BY question_count DESC
            LIMIT 20;

-- Q8) Chatbot satisfaction: Analyze the average satisfaction ratings of the user chats
SELECT AVG(user_rating) AS average_satisfaction
            FROM chatbot_occurence;

-- Q9) Chatbot Interaction Trends Over Time, finding the number of chat bot interaction by day
SELECT DATE_FORMAT(date_of_conversation, '%Y-%m') AS month, COUNT(*) AS interactions_count
            FROM chatbot_occurence
            GROUP BY month
            ORDER BY month;

-- Q10) Students who are engaging with chatbot: Find the students who use the chatbot frequently, currently, this is set to 1 interaction,
--      but can be changed to a higher number of interactions as the data set grows
SELECT student_id, COUNT(*) AS interaction_count
            FROM chatbot_occurence
            GROUP BY student_id
            HAVING interaction_count >= 1;