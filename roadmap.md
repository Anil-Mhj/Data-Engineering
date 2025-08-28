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
- Containers
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
- features of relational database
    - model data as relation and entity
    - primary, foreign key and cascade
    - transition
    - ACID
- DDL statements
- select
    - basic select, manipulate select output like concat two columns, use function like uppercase
    - using case, nullif, coalesce
    - order and limit
    - aggregate queries: sum, count, avg, min, max, group by, having
    - join queries: inner, left, right, full, self cross
    - subquery
    - join vs subquery
- Advance queries
    - advanced function: 
        - floor, abs, mod, round, ceiling
        - string: concat, length, substring, replace, upper, lower
        - date: date, time, timestamp, datepart, dateadd
    - CTE
    - CTE vs subquery vs join
    - windows functions
- Stored Procedures
- View and Material views
- Performance Optimization
    - Indexes
    - Query analysis techniques
2. Column Database: Cassandra
- Need for column database
- relational vs column database
- distributed database
3. No Sql database: 
4. Data Lakes
5. Vector Database
6. Others: TimeStream