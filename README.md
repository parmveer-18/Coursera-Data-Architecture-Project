# Coursera-Data-Architecture-Project

## Project Description 
The objective of this project is to reconfigure Coursera’s current database to support new artificial intelligence (AI) features. The two main AI features identified are an autonomous chatbot and automatically generated practice quizzes.

The first step of the project involved analyzing Coursera’s website to understand the data requirements for their services. After a thorough review, an entity-relationship diagram (ERD) was created to represent all necessary tables for Coursera's functionality. This ERD is available in the provided PDF and JPEG files titled [ERD (Database Model)](ERD_database_model.pdf).

In the ERD:
* Data required to train the chatbot is highlighted in light blue, while dark blue indicates tables for collecting data from each chatbot interaction once it is operational.
*	Data required for automatically generated practice quizzes is highlighted in light yellow, while dark yellow indicates tables for collecting data from each quiz once this feature is implemented.

The [final_project_schema.sql](final_project_schema.sql) file uses the ERD to create the actual database with the necessary tables. The [data_insertion.sql](data_insertion.sql) file populates this database with temporary data. Lastly, the [managerial_queries.sql](data_insertion.sql) file contains ten queries designed to assist managerial decision-making by extracting relevant data from the database.

## Key Learnings
Through the process of creating an ERD, SQL database, temporary data, and managerial queries, I gained the following key insights:
* How to apply 1NF, 2NF, and 3NF database normalization techniques to design an effective and organized database for an organization.
*	How to use SQL to create a database schema.
*	How to utilize ChatGPT to generate test data for prototyping.
*	How to leverage SQL to generate value for the organization by answering managerial queries.
*	The importance of thorough data requirements analysis for comprehensive database design.
*	Best practices for documenting and visualizing database structures using ERDs.
*	Methods for validating and testing database functionality with temporary data.
*	Techniques for writing efficient SQL queries to support data-driven decision-making.

These learnings have significantly enhanced my understanding and skills in SQL and database management. If you have any questions please feel free to reach out to me on LinkedIn: [Parmveer Sohal](https://ca.linkedin.com/in/parmveer-sohal).
