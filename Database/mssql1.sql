CREATE DATABASE COLLEGE;

USE COLLEGE;

-- Department table
CREATE TABLE Department
(
    Department_id INT PRIMARY KEY IDENTITY(1,1),
    Dept_name NVARCHAR(100) NOT NULL,
    Code INT UNIQUE NOT NULL
);

-- Student table
CREATE TABLE Student
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Fname NVARCHAR(50) NOT NULL,
    Lname NVARCHAR(50),
    DOB DATE,
    Sex CHAR(1) CHECK (Sex IN ('M','F')),
    Country NVARCHAR(50),
    City NVARCHAR(50),
    Address NVARCHAR(200),
    Department_id INT,
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);

-- Subject table
CREATE TABLE Subject
(
    Subject_id INT PRIMARY KEY IDENTITY(1,1),
    Department_id INT,
    Name NVARCHAR(100) NOT NULL,
    Sem INT CHECK (Sem IN (1,2)),
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);

-- Student Marks table
CREATE TABLE Student_marks
(
    Marks_id INT PRIMARY KEY IDENTITY(1,1),
    Student_id INT,
    Subject_id INT,
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    FOREIGN KEY (Student_id) REFERENCES Student(Id),
    FOREIGN KEY (Subject_id) REFERENCES Subject(Subject_id)
);

SELECT *
FROM Student;

Select id, Fname, Lname
From Student
ORDER BY id  OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY;

Select id, Fname, Lname, Fname+' '+Lname as FullName
from Student
WHERE FullName='David Herring'
ORDER by FullName OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

Select *
from Student_marks;

SELECT MIN(Marks) AS Min_marks, MAX(Marks) AS Max_marks, AVG(Marks) AS Average, SUM(marks) AS Sum, COUNT(marks) AS Count
FROM Student_marks;

select Subject_id, Student_id
from Student_marks
group by Subject_id, Student_id;

SELECT Student_id, MIN(Marks), MAX(Marks)
from Student_marks
group by Student_id;

SELECT Subject_id, COUNT(*) as num
from Student_marks
group by Subject_id
HAVING COUNT(*)>250;

SELECT DISTINCT
    S.Fname,
    S.Lname,
    Sub.Name AS SubjectName,
    Mar.Marks,
    Sub.Sem
FROM
    Student S
    JOIN
    Student_marks Mar ON S.Id = Mar.Student_id
    JOIN
    Subject Sub ON Mar.Subject_id = Sub.Subject_id;


SELECT count(*)
from Student
CROSS JOIN student_marks;

select count(*)
from student;
select count(*)
from Student_marks;

Select *
from student s
    join Student_marks mar on s.Id=mar.Student_id AND S.Country='Nepal';

select s.Id, s.Fname, s.Lname, sum(Marks)
from Student_marks mar
    join Student s on mar.Student_id=s.Id
group by S.Id, S.Fname, S.Lname;

delete from Student_marks where Student_id=268;

SELECT *
from Student s
    left join Student_marks mar on s.Id=mar.Student_id
where mar.Marks_id is NULL;

select *
from Student
where Id=268;

select max(marks), S.Name, S.Department_id, (select d.Dept_name
    from Department d
    where d.Department_id=S.Department_id)
from Student_marks mar
    join Subject S on mar.Subject_id=S.Subject_id
group by S.Subject_id, S.Name, S.Department_id;


select *, (select max(Marks)
    from Student_marks
    where Student_marks.Student_id = Student.id) as "Max"
from Student;

DELETE FROM Student;

--1. List all student top 10 student with highest marks in individual subject
SELECT Subject_id, SubjectName, Student_id, StudentName, Marks
FROM (
    SELECT 
        Sub.Subject_id,
        Sub.Name AS SubjectName,
        S.Id AS Student_id,
        CONCAT(S.Fname, ' ', S.Lname) AS StudentName,
        SM.Marks,
        ROW_NUMBER() OVER (PARTITION BY Sub.Subject_id ORDER BY SM.Marks DESC) AS RankNo
    FROM Student_marks SM
    JOIN Student S ON SM.Student_id = S.Id
    JOIN Subject Sub ON SM.Subject_id = Sub.Subject_id
) AS Ranked
WHERE RankNo <= 10
ORDER BY Subject_id, RankNo;



--2. Count the total, average, min, max marks of all subject, output should contain subject name

SELECT s.Name, SUM(mar.Marks) as Total, AVG(mar.Marks) as Average, MIN(mar.Marks) as Min_marks, MAX(mar.Marks) as Max_marks
from Student_marks mar
    join Subject s on s.Subject_id=mar.Subject_id
GROUP BY s.Name
ORDER by s.Name;

--3. Calculate total, average, min, max obtain in each department (using join)

SELECT d.Dept_name, SUM(mar.Marks) as Total, AVG(mar.Marks) as Average, MIN(mar.Marks) as Min_marks, MAX(mar.Marks) as Max_marks
from Student_marks mar
    join Subject s on mar.Subject_id=s.Subject_id
    join Department d on d.Department_id=s.Department_id
GROUP BY d.Dept_name
ORDER by d.Dept_name;

--4. Calculate total, average, min max obtain in each department (using subquery)

SELECT D.Dept_name,
       (SELECT SUM(Marks)
        FROM Student_marks SM
        JOIN Student S ON SM.Student_id = S.Id
        WHERE S.Department_id = D.Department_id) AS Total_Marks,
       
       (SELECT AVG(Marks)
        FROM Student_marks SM
        JOIN Student S ON SM.Student_id = S.Id
        WHERE S.Department_id = D.Department_id) AS Avg_Marks,
       
       (SELECT MIN(Marks)
        FROM Student_marks SM
        JOIN Student S ON SM.Student_id = S.Id
        WHERE S.Department_id = D.Department_id) AS Min_Marks,
       
       (SELECT MAX(Marks)
        FROM Student_marks SM
        JOIN Student S ON SM.Student_id = S.Id
        WHERE S.Department_id = D.Department_id) AS Max_Marks
FROM Department D;


--5. calculate the no of students with total percentage coverted of students of a country
SELECT
    S.Country,
    COUNT(*) AS StudentCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*)
    FROM Student), 2) AS Percentage,
    (SELECT COUNT(*)
    FROM Student) AS Total
FROM
    Student S
GROUP BY 
    S.Country
ORDER BY 
    S.Country;


