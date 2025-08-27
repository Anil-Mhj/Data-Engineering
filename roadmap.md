## Data Engineering Roadmap

### Intro
- What is Data Engineering.
- Role of Data Engineering
- Data Engineering vs Data Analyst vs Data Scientist
- Data Engineering lifecycle
    - data generation
    - data storage
    - data ingestion
    - data serving

### Python
- Basic
- OOP, Data structure (array, tree)
- File manipulation (read, write), string manipulation, regex
- numpy and pandas

## Basic
- Linux
- Git and Github
- Distributed System and Networking basic

### Understanding Data Source
- type of files
    - json
    - csv
    - parquet
    - avro
    - orc
- REST API
    - a communication standard build on top of http
    - used to send and receive data between server and other parties
    - communication flow, requester -> server -> requester, response is provided in json 
    - HTTP methods: GET, POST, PUT, PATCH, DELETE
    - difference between GET and POST, 
    - Request header
    - Response payload
    - Response header
    - Response status code, and content type
    - common url structure used to get all, get one, delete etc
- Log files
- Streams

### Data Storage
1. Relational Database: postgres, mysql, MSSQL
- need and use
- transition
- DDL statements
- select
    - order of select
    - order and limit
    - group and window function
    - joins
    - cte
    - subquery
2. Column Database: Cassandra
3. No Sql database: 
4. Data Lakes
5. Vector Database
6. Others: TimeStream