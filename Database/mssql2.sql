INSERT INTO Department (Dept_name, Code)
VALUES 
    ('CSIT', 101),
    ('BCA',  102),
    ('BIT',  103),
    ('BIM',  104);

SELECT * FROM Department;

-- CSIT (5 subjects)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES 
    (1, 'Math', 1),
    (1, 'Physics', 1),
    (1, 'Programming', 1),
    (1, 'Database', 1),
    (1, 'Networking', 1),
    (1, 'Math', 2),
    (1, 'Physics', 2),
    (1, 'Programming', 2),
    (1, 'Database', 2),
    (1, 'Networking', 2);

-- BCA (5 subjects)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES
    (2, 'Math', 1),
    (2, 'Computer Fundamentals', 1),
    (2, 'Programming', 1),
    (2, 'Database', 1),
    (2, 'Web Design', 1),
    (2, 'Math', 2),
    (2, 'Computer Fundamentals', 2),
    (2, 'Programming', 2),
    (2, 'Database', 2),
    (2, 'Web Design', 2);

-- BIT (4 subjects)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES
    (3, 'Math', 1),
    (3, 'Programming', 1),
    (3, 'Database', 1),
    (3, 'Networking', 1),
    (3, 'Math', 2),
    (3, 'Programming', 2),
    (3, 'Database', 2),
    (3, 'Networking', 2);

-- BIM (4 subjects)
INSERT INTO Subject (Department_id, Name, Sem)
VALUES
    (4, 'Accounting', 1),
    (4, 'Economics', 1),
    (4, 'Marketing', 1),
    (4, 'Management', 1),
    (4, 'Accounting', 2),
    (4, 'Economics', 2),
    (4, 'Marketing', 2),
    (4, 'Management', 2);

SELECT * FROM Subject;