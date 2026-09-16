# University Management System – SQL Assignment

## Project Overview

This project is a SQL-based **University Management System (UMS)** created as part of a hands-on SQL assignment.

The project demonstrates how to create a database, define tables with constraints, insert and manage data, and retrieve information using SQL queries.

## Database Used

* **Database:** MySQL
* **Tool:** MySQL Workbench
* **Database Name:** `ums`

## Tables Created

The database contains the following four tables:

1. **Student_Info**

   * Stores student personal and contact information.

2. **Subject_Master**

   * Stores subject details such as subject code, subject name, and weightage.

3. **Student_Marks**

   * Stores student marks for different subjects and semesters.

4. **Student_Result**

   * Stores semester-wise GPA and scholarship eligibility.

## SQL Concepts Covered

This assignment covers the following SQL concepts:

* Database and table creation
* Primary Keys
* Foreign Keys
* Unique Constraints
* NOT NULL Constraints
* DEFAULT Values
* CHECK Constraints
* INSERT statements
* UPDATE statements
* DQL / SELECT statements
* WHERE clause
* GROUP BY
* ORDER BY
* Aggregate Functions
* COUNT()
* AVG()
* MAX()
* LIKE operator
* BETWEEN operator
* IN operator
* JOIN operations
* Subqueries
* String Functions
* Date Functions
* CASE statements
* Views
* NULL handling
* Calculated fields

## Activities

### Activity 1 – Identify Tables and Columns

The required tables and their columns were identified based on the University Management System requirements.

### Activity 2 – Database and Table Creation

The `ums` database was created in MySQL Workbench.

Four tables were created with appropriate primary keys, foreign keys, and data validation constraints. Sample student, subject, marks, and result data were also inserted.

Various UPDATE and INSERT operations were performed to understand how database constraints work.

### Activity 3 – Data Retrieval

Multiple SQL queries were written to retrieve and analyze information from the database.

The queries include:

* Students with email addresses
* Number of students in each branch
* Students scoring more than 50 marks
* GPA-based sorting
* Student information sorting
* Age calculation
* Student and subject details using JOIN
* Weighted marks calculation
* Pattern matching using LIKE
* Marks filtering using BETWEEN
* Subject filtering using IN
* Scholarship eligibility
* Maximum marks and GPA using subqueries
* Average marks and GPA
* Creating and using SQL views
* NULL value handling
* Branch name formatting using CASE

## Project Structure

```text
University-Management-System/
│
├── README.md
│
├── Activity_1/
│   └── Activity_1.pdf
│
├── Activity_2/
│   └── Activity_2.pdf
│
└── Activity_3/
    └── Activity_3.sql
```

## Objective

The main objective of this project is to gain practical knowledge of SQL database creation, data manipulation, data retrieval, filtering, sorting, aggregation, joins, subqueries, and views using MySQL.

## Conclusion

The University Management System SQL assignment provides hands-on experience in working with relational databases and SQL queries. It demonstrates how structured student, subject, marks, and result data can be stored and retrieved efficiently using MySQL.
