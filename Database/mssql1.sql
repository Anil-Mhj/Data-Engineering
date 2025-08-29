CREATE DATABASE COLLEGE;

USE COLLEGE;

-- Department table
CREATE TABLE Department (
    Department_id INT PRIMARY KEY IDENTITY(1,1),
    Dept_name NVARCHAR(100) NOT NULL,
    Code INT UNIQUE NOT NULL
);

-- Student table
CREATE TABLE Student (
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
CREATE TABLE Subject (
    Subject_id INT PRIMARY KEY IDENTITY(1,1),
    Department_id INT,
    Name NVARCHAR(100) NOT NULL,
    Sem INT CHECK (Sem IN (1,2)),
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);

-- Student Marks table
CREATE TABLE Student_marks (
    Marks_id INT PRIMARY KEY IDENTITY(1,1),
    Student_id INT,
    Subject_id INT,
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    FOREIGN KEY (Student_id) REFERENCES Student(Id),
    FOREIGN KEY (Subject_id) REFERENCES Subject(Subject_id)
);

SELECT * FROM Student;

Select id, Fname, Lname From Student ORDER BY id  OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY;

Select id, Fname, Lname, Fname+' '+Lname as FullName from Student WHERE FullName='David Herring' ORDER by FullName OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

Select * from Student_marks;

SELECT MIN(Marks) AS Min_marks, MAX(Marks) AS Max_marks, AVG(Marks) AS Average, SUM(marks) AS Sum, COUNT(marks) AS Count FROM Student_marks;

select Subject_id, Student_id from Student_marks group by Subject_id, Student_id;

SELECT Student_id, MIN(Marks), MAX(Marks) from Student_marks group by Student_id;

SELECT Subject_id, COUNT(*) as num from Student_marks group by Subject_id HAVING COUNT(*)>250;

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


DELETE FROM Student;
