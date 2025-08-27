import pyodbc
import random
from faker import Faker

fake = Faker()

# Connection to SQL Server
conn = pyodbc.connect(
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=localhost;"
    "DATABASE=college;"
    "UID=SA;"
    "PWD=Marshall40;"
    "Encrypt=yes;TrustServerCertificate=yes;"
)
cursor = conn.cursor()

# Insert 100 random students
for _ in range(100):
    fname = fake.first_name()
    lname = fake.last_name()
    dob = fake.date_of_birth(minimum_age=18, maximum_age=25)
    sex = random.choice(["M", "F"])
    country = random.choice(['Nepal', 'India', 'China', 'USA', 'UK'])
    city = random.choice(['Kathmandu', 'Delhi', 'Beijing', 'New York', 'London'])
    address = fake.address().replace("\n", ", ")
    department_id = random.randint(1, 4)

    cursor.execute(
        """
        INSERT INTO Student (Fname, Lname, DOB, Sex, Country, City, Address, Department_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """,
        (fname, lname, dob, sex, country, city, address, department_id),
    )

conn.commit()
cursor.close()
conn.close()

print("✅ Inserted 100 random students successfully!")
