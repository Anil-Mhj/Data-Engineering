INSERT INTO Department (Dept_name, Code)
VALUES 
    ('CSIT', 101),
    ('BCA',  102),
    ('BIT',  103),
    ('BIM',  104);

SELECT * FROM Department;

-- CSIT (5 subjects per semester)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES 
    -- Sem 1
    (1, 'Math', 1),
    (1, 'Physics', 1),
    (1, 'Programming', 1),
    (1, 'Database', 1),
    (1, 'Networking', 1),
    -- Sem 2
    (1, 'Statistics', 2),
    (1, 'Electronics', 2),
    (1, 'Data Structures', 2),
    (1, 'Operating Systems', 2),
    (1, 'Software Engineering', 2);

-- BCA (5 subjects per semester)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES
    -- Sem 1
    (2, 'Math', 1),
    (2, 'Computer Fundamentals', 1),
    (2, 'Programming', 1),
    (2, 'Database', 1),
    (2, 'Web Design', 1),
    -- Sem 2
    (2, 'Statistics', 2),
    (2, 'Object Oriented Programming', 2),
    (2, 'Data Structures', 2),
    (2, 'Operating Systems', 2),
    (2, 'Software Engineering', 2);

-- BIT (4 subjects per semester)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES
    -- Sem 1
    (3, 'Math', 1),
    (3, 'Programming', 1),
    (3, 'Database', 1),
    (3, 'Networking', 1),
    -- Sem 2
    (3, 'Statistics', 2),
    (3, 'Data Structures', 2),
    (3, 'Operating Systems', 2),
    (3, 'Software Engineering', 2);

-- BIM (4 subjects per semester)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES
    -- Sem 1
    (4, 'Accounting', 1),
    (4, 'Economics', 1),
    (4, 'Marketing', 1),
    (4, 'Management', 1),
    -- Sem 2
    (4, 'Business Law', 2),
    (4, 'Organizational Behavior', 2),
    (4, 'Finance', 2),
    (4, 'Business Communication', 2);

SELECT * FROM Subject;