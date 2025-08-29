import pyodbc
import random
from faker import Faker
import os
from dotenv import load_dotenv

load_dotenv()

fake = Faker()

# Load environment variables
driver = os.getenv("DRIVER")
server = os.getenv("SERVER")
database = os.getenv("DATABASE")
username = os.getenv("USERNAME")
password = os.getenv("PASSWORD")

# exit(0)

# Connection to SQL Server
conn = pyodbc.connect(
    f"DRIVER={{{driver}}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"UID={username};"
    f"PWD={password};"
    "Encrypt=yes;TrustServerCertificate=yes;"
)
cursor = conn.cursor()

# Insert 100 random students
for _ in range(100):
    fname = fake.first_name()
    lname = fake.last_name()
    dob = fake.date_of_birth(minimum_age=18, maximum_age=25)
    sex = random.choice(["M", "F"])
    country = random.choice(["Nepal", "India", "China", "USA", "UK"])
    city = random.choice(["Kathmandu", "Delhi", "Beijing", "New York", "London"])
    address = fake.address().replace("\n", ", ")
    department_id = random.randint(1, 4)

    cursor.execute(
        """
        INSERT INTO Student (Fname, Lname, DOB, Sex, Country, City, Address, Department_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """,
        (fname, lname, dob, sex, country, city, address, department_id),
    )

# Fetch all students (Id and Department_id)
cursor.execute("SELECT Id, Department_id FROM Student")
students = cursor.fetchall()

# Fetch all subjects with their Department
cursor.execute("SELECT Subject_id, Department_id FROM Subject")
subjects = cursor.fetchall()

# Organize subjects by department_id
subjects_by_dept = {}
for subj_id, dept_id in subjects:
    subjects_by_dept.setdefault(dept_id, []).append(subj_id)

# Insert random marks for each student in their department's subjects
for student_id, dept_id in students:
    if dept_id in subjects_by_dept:
        for subj_id in subjects_by_dept[dept_id]:
            marks = random.randint(35, 100)  # range 35–100
            cursor.execute(
                """
                INSERT INTO Student_marks (Student_id, Subject_id, Marks)
                VALUES (?, ?, ?)
                """,
                (student_id, subj_id, marks),
            )
# Commit the transaction and close the connection
conn.commit()
cursor.close()
conn.close()

print("✅ Inserted 100 random students successfully!")
