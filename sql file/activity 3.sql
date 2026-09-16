# 1. Display students who have an email ID
   SELECT *
FROM Student_Info
WHERE Email_ID IS NOT NULL;

# 2.Display the number of students in each branch
SELECT Branch, COUNT(*) AS Number_of_Students
FROM Student_Info
GROUP BY Branch;

# 3. Display marks and registration number of students who scored more than 50%
SELECT Reg_Number, Marks
FROM Student_Marks
WHERE Marks > 50;



# 4. Display student name, registration number and GPA in descending order of GPA
SELECT S.Student_Name, R.Reg_Number, R.GPA
FROM Student_Info S
JOIN Student_Result R
ON S.Reg_Number = R.Reg_Number
ORDER BY R.GPA DESC;

# 5. Display student information in ascending order of student name
SELECT *
FROM Student_Info
ORDER BY Student_Name ASC;

#6. Display student information in ascending order of age
SELECT *,
       TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE()) AS Age
FROM Student_Info
ORDER BY Age ASC;

#7. Display registration number, student name, subject name, semester and marks
 SELECT SM.Reg_Number,
       SI.Student_Name,
       SUB.Subject_Name,
       SM.Semester,
       SM.Marks
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
JOIN Subject_Master SUB
ON SM.Subject_Code = SUB.Subject_Code;

# 8. Display student registration number, student name, marks and semester ordered by registration number and semester
SELECT SM.Reg_Number,
       SI.Student_Name,
       SM.Marks,
       SM.Semester
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
ORDER BY SM.Reg_Number ASC, SM.Semester ASC;

#9. Display student name, registration number, subject code-subject name, marks and semester for students who scored more than 50%

SELECT SI.Student_Name,
       SM.Reg_Number,
       CONCAT(SM.Subject_Code, '- ', SUB.Subject_Name) AS Subject,
       SM.Marks,
       SM.Semester
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
JOIN Subject_Master SUB
ON SM.Subject_Code = SUB.Subject_Code
WHERE SM.Marks > 50;

# 10. Display registration number and GPA with scholarship-eligible students first
SELECT Reg_Number, GPA
FROM Student_Result
ORDER BY Is_Eligible_Scholarship DESC;

# 11. Display registration number, student name, semester number and GPA with high GPA on top
SELECT R.Reg_Number,
       S.Student_Name,
       R.Semester,
       R.GPA
FROM Student_Result R
JOIN Student_Info S
ON R.Reg_Number = S.Reg_Number
ORDER BY R.GPA DESC;

#12. Display student name, registration number, marks and weighted marks Weighted Marks = Marks × Weightage % / 100
 SELECT SI.Student_Name,
       SM.Reg_Number,
       SM.Marks,
       (SM.Marks * SUB.Weightage / 100) AS Weighted_Marks
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
JOIN Subject_Master SUB
ON SM.Subject_Code = SUB.Subject_Code;

# 13. Display all students whose name starts with "M"

SELECT *
FROM Student_Info
WHERE Student_Name LIKE 'M%';

# 14. Display student name, registration number and marks between 60 and 100
SELECT SI.Student_Name,
       SM.Reg_Number,
       SM.Marks
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
WHERE SM.Marks BETWEEN 60 AND 100;

# 15. Display student name, registration number and marks where student name does not start with the character "J"

SELECT SI.Student_Name,
       SM.Reg_Number,
       SM.Marks
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
WHERE SI.Student_Name NOT LIKE 'J%';

# 16. Display student name, registration number and marks for subjects EE01DCF or EC02MUP
-- Rule: Do not use OR operator

SELECT SI.Student_Name,
       SM.Reg_Number,
       SM.Marks
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
WHERE SM.Subject_Code IN ('EE01DCF', 'EC02MUP');

-- 17. Display all students whose name ends with "on"

SELECT *
FROM Student_Info
WHERE Student_Name LIKE '%on';

-- 18. Display student name, registration number and marks
-- in all semesters for students who have an email address

SELECT SI.Student_Name,
       SM.Reg_Number,
       SM.Marks
FROM Student_Info SI
JOIN Student_Marks SM
ON SI.Reg_Number = SM.Reg_Number
WHERE SI.Email_ID IS NOT NULL;

-- 19. Display student name and branch in capital letters

SELECT UPPER(Student_Name) AS Student_Name,
       UPPER(Branch) AS Branch
FROM Student_Info;

-- 20. Display all details in Subject_Master in lowercase

SELECT LOWER(Subject_Code) AS Subject_Code,
       LOWER(Subject_Name) AS Subject_Name,
       Weightage
FROM Subject_Master;

-- 21. Display student information in the required format

SELECT CONCAT(Student_Name, ' with ', Reg_Number,
              ' is studying in Branch ', Branch) AS Student_Details
FROM Student_Info;

-- 22(a). Display registration number and date of birth
-- in YYYY/MM/DD format

SELECT Reg_Number,
       DATE_FORMAT(Date_of_Birth, '%Y/%m/%d') AS Date_of_Birth
FROM Student_Info;

-- 23. Display student age, name, contact number and email ID

SELECT Student_Name,
       Contact_Number,
       Email_ID,
       TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE()) AS Age
FROM Student_Info;

-- 24. Display registration number, student name, semester
-- and average marks secured in each semester

SELECT SM.Reg_Number,
       SI.Student_Name,
       SM.Semester,
       AVG(SM.Marks) AS Average_Marks
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
GROUP BY SM.Reg_Number, SI.Student_Name, SM.Semester;

-- 25. Display registration number and student name
-- of students who secured the maximum mark
-- Rule: Use subquery

SELECT SM.Reg_Number,
       SI.Student_Name
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
WHERE SM.Marks = (
    SELECT MAX(Marks)
    FROM Student_Marks
);

-- 26. Display student name and registration number
-- of the student who secured maximum marks in EI05IP
-- Rule: Use subquery

SELECT SI.Student_Name,
       SM.Reg_Number
FROM Student_Marks SM
JOIN Student_Info SI
ON SM.Reg_Number = SI.Reg_Number
WHERE SM.Subject_Code = 'EI05IP'
AND SM.Marks = (
    SELECT MAX(Marks)
    FROM Student_Marks
    WHERE Subject_Code = 'EI05IP'
);

-- 27. Display total number of candidates
-- eligible for scholarship

SELECT COUNT(*) AS Total_Eligible_Students
FROM Student_Result
WHERE Is_Eligible_Scholarship = 'Y';

-- 28. Display student details with maximum GPA
-- in each semester

SELECT SI.Student_Name,
       SR.Reg_Number,
       SR.Semester,
       SR.GPA
FROM Student_Result SR
JOIN Student_Info SI
ON SR.Reg_Number = SI.Reg_Number
WHERE (SR.Semester, SR.GPA) IN (
    SELECT Semester, MAX(GPA)
    FROM Student_Result
    GROUP BY Semester
);

-- 29. Display student name, registration number and GPA
-- of students eligible for scholarship

SELECT SI.Student_Name,
       SR.Reg_Number,
       SR.GPA
FROM Student_Result SR
JOIN Student_Info SI
ON SR.Reg_Number = SI.Reg_Number
WHERE SR.Is_Eligible_Scholarship = 'Y';

-- 30. Display semester number and average GPA

SELECT Semester,
       AVG(GPA) AS Average_GPA
FROM Student_Result
GROUP BY Semester;

-- 31. Create a view with student name, registration number,
-- semester number and GPA

CREATE VIEW STUDENT_GPA AS
SELECT SI.Student_Name,
       SR.Reg_Number,
       SR.Semester,
       SR.GPA
FROM Student_Info SI
JOIN Student_Result SR
ON SI.Reg_Number = SR.Reg_Number;

-- 32. Display student details from STUDENT_GPA view
-- where GPA is greater than 5

SELECT Student_Name,
       Reg_Number,
       Semester,
       GPA
FROM STUDENT_GPA
WHERE GPA > 5;

-- 33. Create a view with student name, registration number
-- and average GPA across all semesters

CREATE VIEW STUDENT_AVERAGE_GPA AS
SELECT SI.Student_Name,
       SR.Reg_Number,
       AVG(SR.GPA) AS Average_GPA
FROM Student_Info SI
JOIN Student_Result SR
ON SI.Reg_Number = SR.Reg_Number
GROUP BY SI.Student_Name, SR.Reg_Number;

-- 34. Display student name, registration number and average GPA
-- where average GPA is greater than 7

SELECT Student_Name,
       Reg_Number,
       Average_GPA
FROM STUDENT_AVERAGE_GPA
WHERE Average_GPA > 7;

-- 35. Display all student records
-- and replace NULL email with no valid email address

SELECT Reg_Number,
       Student_Name,
       Branch,
       Contact_Number,
       Date_of_Birth,
       Date_of_Joining,
       Address,
       IFNULL(Email_ID, 'no valid email address') AS Email_ID
FROM Student_Info;

-- 36. Display student name, branch, registration number,
-- semester number and result with full branch names

SELECT SI.Student_Name,
       CASE
           WHEN SI.Branch = 'EEE'
               THEN 'Electrical and Electronic Engineering'
           WHEN SI.Branch = 'ECE'
               THEN 'Electronics and Communication Engineering'
           ELSE SI.Branch
       END AS Branch,
       SR.Reg_Number,
       SR.Semester,
       CASE
           WHEN SR.GPA >= 5 THEN 'Pass'
           ELSE 'Fail'
       END AS Result
FROM Student_Info SI
JOIN Student_Result SR
ON SI.Reg_Number = SR.Reg_Number;