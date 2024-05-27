/* This file contains the creation of all tables based on our ERD. */

DROP SCHEMA IF EXISTS final_project_schema;
CREATE SCHEMA final_project_schema;
USE final_project_schema;

DROP TABLE IF EXISTS encrypted_student;
CREATE TABLE encrypted_student (
    student_id INT,
    first_name varchar(255),
    last_name varchar(255),
    phone_number DECIMAL(20,0),
    email varchar(255),
    birth_date DATE,
    highest_education_completed varchar(255),
    hashed_password varchar(255),
    CONSTRAINT phone_number_length CHECK(phone_number >= 1000000000 AND phone_number <= 9999999999),
    PRIMARY KEY (student_id)
);

DROP TABLE IF EXISTS chatbot_occurence;
CREATE TABLE chatbot_occurence (
    chatbot_occurence INT,
    student_id INT,
    user_question VARCHAR(255),
    generated_answer VARCHAR(255),
    user_rating INT,
    time_of_conversation TIME,
    date_of_conversation DATE,
    CONSTRAINT user_rating_check CHECK (user_rating >= 0 AND user_rating <= 5),
    PRIMARY KEY (chatbot_occurence),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS institute;
CREATE TABLE institute (
    institute_id INT,
    institute_name VARCHAR(255),
  PRIMARY KEY (institute_id)
);

DROP TABLE IF EXISTS degree;
CREATE TABLE degree (
    degree_id INT,
    institute_id INT,
    degree_type VARCHAR(255),
    degree_length VARCHAR(255),
    degree_credit_hours INT,
    degree_delivery_type VARCHAR(255),
    degree_tuition DECIMAL(10,2),
    degree_explanation VARCHAR(255),
    PRIMARY KEY (degree_id),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

DROP TABLE IF EXISTS degree_testimonials;
CREATE TABLE degree_testimonials (
    degree_testomonial_id INT,
    degree_id INT,
    degree_testomonial_video BLOB,
    degree_tesotomonial_video_metadata BLOB,
    degree_testomonial_quote VARCHAR(255),
    degree_testomonial_person VARCHAR(255),
    degree_testomonial_person_title VARCHAR(255),
    PRIMARY KEY (degree_testomonial_id),
    FOREIGN KEY (degree_id) REFERENCES degree(degree_id)
);

DROP TABLE IF EXISTS student_enrollment_degree;
CREATE TABLE student_enrollment_degree (
    degree_enrollment_id INT,
    degree_id INT,
    student_id INT,
    enrollment_begin_date DATE,
    enrollment_end_date DATE,
    enrollment_status VARCHAR(255),
    PRIMARY KEY (degree_enrollment_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id),
    FOREIGN KEY (degree_id) REFERENCES degree(degree_id)
);

DROP TABLE IF EXISTS encrypted_instructor;
CREATE TABLE encrypted_instructor (
    instructor_id INT,
    institute_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    hire_date DATE,
    department VARCHAR(255),
    phone_number DECIMAL(20,0),
    email VARCHAR(255),
    birth_date DATE,
    PRIMARY KEY (instructor_id),
    CONSTRAINT phone_number_check CHECK(phone_number >= 1000000000 AND phone_number <= 9999999999),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

DROP TABLE IF EXISTS markdown;
CREATE TABLE markdown (
    markdown_id INT,
    type_of_markdown VARCHAR(255),
    cost DECIMAL(10,2),
    markdown_start DATE,
    markdown_end DATE,
    PRIMARY KEY (markdown_id)
);

DROP TABLE IF EXISTS country;
CREATE TABLE country (
    country_id INT,
    Country_name VARCHAR(255),
    PRIMARY KEY (country_id)
);

DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription (
    subscription_id INT,
    type_of_subscription VARCHAR(255),
    subscription_length INT,
    PRIMARY KEY (subscription_id)
);

DROP TABLE IF EXISTS subscription_countries;
CREATE TABLE subscription_countries (
    subscription_id INT,
    country INT,
    FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id),
    FOREIGN KEY (country) REFERENCES country(country_id),
    PRIMARY KEY (subscription_id, country)
);

DROP TABLE IF EXISTS student_subscription;
CREATE TABLE student_subscription (
    student_subscription_id INT,
    student_id INT,
    subscription_id INT,
    markdown_id INT,
    subscription_start_date DATE,
    subscription_end_date DATE,
    PRIMARY KEY (student_subscription_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id),
    FOREIGN KEY (markdown_id) REFERENCES markdown(markdown_id)
);

DROP TABLE IF EXISTS student_address;
CREATE TABLE student_address (
    student_address_id INT,
    student_id INT,
    country_id INT,
    address_line_1 VARCHAR(255),
    address_line_2 VARCHAR(255),
    postal_code VARCHAR(6),
    state VARCHAR(255),
    PRIMARY KEY (student_address_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

DROP TABLE IF EXISTS encrypted_student_payment_details;
CREATE TABLE Encrypted_student_payment_details (
    student_payment_id INT,
    student_id INT,
    student_address_id INT,
    card_type VARCHAR(255),
    card_number INT,
    expiration_date VARCHAR(5),
    cvv INT,
    card_full_name VARCHAR(255),
    CONSTRAINT cvv_length CHECK(LENGTH(cvv) = 3),
    PRIMARY KEY (student_payment_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id),
    FOREIGN KEY (student_address_id) REFERENCES student_address(student_address_id)
);

DROP TABLE IF EXISTS course;
CREATE TABLE course (
    course_id INT,
    title VARCHAR(255),
    subject VARCHAR(255),
    course_type VARCHAR(255),
    PRIMARY KEY (course_id)
);

DROP TABLE IF EXISTS course_career_affiliation;
CREATE TABLE course_career_affiliation (
    career_id INT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    PRIMARY KEY (career_id, course_id)
);

DROP TABLE IF EXISTS career_data;
CREATE TABLE career_data (
    career_data_id INT,
    career_id INT,
    career_title VARCHAR(255),
    FOREIGN KEY (career_id) REFERENCES course_career_affiliation(career_id),
    PRIMARY KEY (career_data_id)
);

DROP TABLE IF EXISTS course_instance;
CREATE TABLE course_instance (
    course_instance_id INT,
    course_id INT,
    institute_id INT,
    semester INT,
    enrollment_open_date DATETIME,
    enrollment_close_date DATETIME,
    course_subscription_fee DECIMAL(10,2),
    course_about VARCHAR(255),
    PRIMARY KEY (course_instance_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

DROP TABLE IF EXISTS student_enrollment_course;
CREATE TABLE student_enrollment_course (
    enrollment_id INT,
    course_instance_id INT,
    student_id INT,
    enrollment_begin_date DATETIME,
    enrollment_end_date DATETIME,
    enrollment_status VARCHAR(20),
    PRIMARY KEY (enrollment_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_pre_requisite;
CREATE TABLE course_pre_requisite (
    course_pre_requisite_id INT,
    course_instance_id INT,
    pre_requisite_id INT,
    PRIMARY KEY (course_pre_requisite_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id),
    FOREIGN KEY (pre_requisite_id) REFERENCES course_instance(course_id)
);

DROP TABLE IF EXISTS course_outcomes;
CREATE TABLE course_outcomes (
    outcomes_id INT,
    course_instance_id INT,
    outcome_description VARCHAR(255),
    PRIMARY KEY (outcomes_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id)
);

DROP TABLE IF EXISTS degree_reccomendation;
CREATE TABLE degree_reccomendation (
    degree_reccomendation_id INT,
    course_instance_id INT,
    degree_id INT,
    PRIMARY KEY (degree_reccomendation_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id),
    FOREIGN KEY (degree_id) REFERENCES degree(degree_id)
);

DROP TABLE IF EXISTS course_recommendation;
CREATE TABLE course_recommendation (
    recommendation_id INT,
    course_instance_id INT,
    recommended_course_id INT,
    PRIMARY KEY (recommendation_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id),
    FOREIGN KEY (recommended_course_id) REFERENCES course(course_id)
);

DROP TABLE IF EXISTS course_faq;
CREATE TABLE course_faq (
    faq_id INT,
    course_instance_id INT,
    faq_question VARCHAR(255),
    faq_answer VARCHAR(255),
    PRIMARY KEY (faq_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id)
);

DROP TABLE IF EXISTS course_reviews;
CREATE TABLE course_reviews (
    review_id INT,
    course_instance_id INT,
    student_id INT,
    rating INT,
    description VARCHAR(255),
    PRIMARY KEY (review_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id),
    CONSTRAINT rating_check CHECK (rating >= 0 AND rating <= 5)
);

DROP TABLE IF EXISTS course_completion;
CREATE TABLE course_completion (
    course_completion_id INT,
    student_id INT,
    course_instance_id INT,
    grade_point_average DECIMAL(10,2),
    pass_or_fail VARCHAR(25),
    CONSTRAINT grade_point_average_check CHECK (grade_point_average >= 0 AND grade_point_average <= 4.44),
    PRIMARY KEY (course_completion_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id)
);

DROP TABLE IF EXISTS course_modules;
CREATE TABLE course_modules (
    module_id INT,
    course_instance_id INT,
    module_name VARCHAR(255),
    module_description VARCHAR(255),
    expected_time VARCHAR(25),
    PRIMARY KEY (module_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id)
);

DROP TABLE IF EXISTS course_videos;
CREATE TABLE course_videos (
    video_id INT,
    module_id INT,
    video BLOB,
    video_transcript BLOB,
    video_metadata_file BLOB,
    PRIMARY KEY (video_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id)
);

DROP TABLE IF EXISTS video_status;
CREATE TABLE video_status (
    video_status_id INT,
    video_id INT,
    student_id INT,
    video_status VARCHAR(255),
    last_time TIMESTAMP,
    PRIMARY KEY (video_status_id),
    FOREIGN KEY (video_id) REFERENCES course_videos(video_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_readings;
CREATE TABLE course_readings (
    course_reading_id INT,
    module_id INT,
    reading_title VARCHAR(255),
    reading_link VARCHAR(255),
    reading_metadata_file BLOB,
    PRIMARY KEY (course_reading_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id)
);

DROP TABLE IF EXISTS reading_status;
CREATE TABLE reading_status (
    reading_status_id INT,
    course_reading_id INT,
    student_id INT,
    reading_status VARCHAR(255),
    last_paragraph VARCHAR(255),
    PRIMARY KEY (reading_status_id),
    FOREIGN KEY (course_reading_id) REFERENCES course_readings(course_reading_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_assignments;
CREATE TABLE course_assignment (
    course_assignment_id INT,
    module_id INT,
    assignment_type VARCHAR(255),
    assignment_name VARCHAR(255),
    assignment_description VARCHAR(255),
    PRIMARY KEY (course_assignment_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id)
);

DROP TABLE IF EXISTS assignment_question;
CREATE TABLE assignment_question (
    assignment_question_id INT,
    course_assignment_id INT,
    question_type VARCHAR(25),
    question_title  VARCHAR(255),
    PRIMARY KEY (assignment_question_id),
    FOREIGN KEY (course_assignment_id) REFERENCES course_assignment(course_assignment_id)
);

DROP TABLE IF EXISTS Assignment_attempt;
CREATE TABLE assignment_attempt (
    assignment_attempt_id INT,
    course_assignment_id INT,
    student_id INT,
    assignment_score INT,
    PRIMARY KEY (assignment_attempt_id),
    FOREIGN KEY (course_assignment_id) REFERENCES course_assignment(course_assignment_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_quiz;
CREATE TABLE Course_quiz (
    course_quiz_id INT,
    module_id INT,
    quiz_type VARCHAR(255),
    quiz_name VARCHAR(255),
    PRIMARY KEY (course_quiz_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id)
);

DROP TABLE IF EXISTS quiz_question;
CREATE TABLE quiz_question (
    quiz_question_id INT,
    course_quiz_id INT,
    question_type VARCHAR(25),
    question_title VARCHAR(255),
    PRIMARY KEY (quiz_question_id),
    FOREIGN KEY (course_quiz_id) REFERENCES course_quiz(course_quiz_id)
);

DROP TABLE IF EXISTS quiz_question_answer;
CREATE TABLE quiz_question_answer (
    answer_id INT,
    quiz_question_id INT,
    answer_type VARCHAR(25),
    answer VARCHAR(255),
    PRIMARY KEY (answer_id),
    FOREIGN KEY (quiz_question_id) REFERENCES quiz_question(quiz_question_id)
);

DROP TABLE IF EXISTS course_quiz_attempt;
CREATE TABLE course_quiz_attempt (
    quiz_attempt_id INT,
    quiz_question_id INT,
    student_id INT,
    quiz_score DECIMAL(10,2),
    PRIMARY KEY (quiz_attempt_id),
    FOREIGN KEY (quiz_question_id) REFERENCES quiz_question(quiz_question_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_discussion;
CREATE TABLE course_discussion (
    course_discussion_id INT,
    module_id INT,
    discussion_creator INT,
    course_discussion_title VARCHAR(255),
    course_discussion_body VARCHAR(255),
    date_of_creation DATETIME,
    PRIMARY KEY (course_discussion_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id),
    FOREIGN KEY (discussion_creator) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_discussion_response;
CREATE TABLE course_discussion_response (
    course_discussion_response_id INT,
    course_discussion_id INT,
    discussion_responder INT,
    response_title VARCHAR(255),
    response_body VARCHAR(255),
    date_of_creation DATETIME,
    PRIMARY KEY (course_discussion_response_id),
    FOREIGN KEY (course_discussion_id) REFERENCES course_discussion(course_discussion_id),
    FOREIGN KEY (discussion_responder) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS module_status;
CREATE TABLE module_status (
    module_status_id INT,
    module_id INT,
    student_id INT,
    module_status VARCHAR(255),
    PRIMARY KEY (module_status_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);

DROP TABLE IF EXISTS course_instructor;
CREATE TABLE course_instructor (
    instructor_id INT,
    course_instance_id INT,
    instructor_title VARCHAR(255),
    PRIMARY KEY (instructor_id, course_instance_id),
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(course_instance_id),
    FOREIGN KEY (instructor_id) REFERENCES encrypted_instructor(instructor_id)
);

DROP TABLE IF EXISTS AI_course_quiz;
CREATE TABLE AI_course_quiz (
    AI_course_quiz_id INT,
    module_id INT,
    quiz_type VARCHAR(255),
    quiz_name VARCHAR(255),
    PRIMARY KEY (AI_course_quiz_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id)
);

DROP TABLE IF EXISTS AI_quiz_question;
CREATE TABLE AI_quiz_question (
    AI_quiz_question_id INT,
    AI_course_quiz_id INT,
    question_type varchar(25),
    question_title VARCHAR(255),
    PRIMARY KEY (AI_quiz_question_id),
    FOREIGN KEY (AI_course_quiz_id) REFERENCES AI_course_quiz(AI_course_quiz_id)
);

DROP TABLE IF EXISTS AI_quiz_answer;
CREATE TABLE AI_quiz_answer (
    AI_quiz_answer_id INT,
    AI_quiz_question_id INT,
    answer_type VARCHAR(25),
    answer VARCHAR(255),
    PRIMARY KEY (AI_quiz_answer_id),
    FOREIGN KEY (AI_quiz_question_id) REFERENCES AI_quiz_question(AI_quiz_question_id)
);

DROP TABLE IF EXISTS AI_course_quiz_attempt;
CREATE TABLE AI_course_quiz_attempt (
    AI_quiz_attempt_id INT,
    AI_quiz_question_id INT,
    student_id INT,
    quiz_score DECIMAL(10,2),
    PRIMARY KEY (AI_quiz_attempt_id),
    FOREIGN KEY (AI_quiz_question_id) REFERENCES AI_quiz_question(AI_quiz_question_id),
    FOREIGN KEY (student_id) REFERENCES encrypted_student(student_id)
);