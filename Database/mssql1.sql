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

DELETE FROM Student;