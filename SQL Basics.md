# SQL Basics (Table creation)
## Data Types
- **INTEGER/INT**
- **tinyint** : allows whole numbers from 0-255
- **smallint** : allows whole numbers between -32,768 and 32,767
- **bigint** 
- **DECIMAL(p,q)** : p-bit numbers with q bits right of decimal
- **FLOAT(p)** : p-bit floating point numbers
- **CHAR(n)** : fixed length character string, length n
- **VARCHAR(n)** : variable length character string, max. Length n
- **VARCHAR(max)** : variable-length, max 1,073,741,824 characters
- **DATE** : describes a year, month, day
- **TIME** : describes an hour, minute, second
- **TIMESTAMP** : describes the date and time on that date
- **YEAR/MONTH INTERVAL** : time interval
- **DAY/TIME INTERVAL** : time interval
- **bit** : Allows 0,1 or NULL
- **money** : monetary data 
- **real** : floating precision number data
Unicode strings
- nchar(n)
- nvarchar(n)
- nvarchar(max)
- ntext
## Create Database
`CREATE DATABASE db_name;`
## Create Table
With foreign key and private key
`create table moviestar(`
	`starid varchar(5) NOT NULL,`
    `name varchar(50),`
    `address varchar(255),`
    `gender varchar(1),`
    `movieid varchar(5),`
    `primary key (starid),`
    `foreign key (movieid) references movies(movieid)`
`);`

## Alter
Whenever we want to edit a table we have already created
1. add **one attribute "movieid"** as string into the "movie" table then set it as primary key
`alter table movies`
`add movieid varchar(5) primary key;`
2. Modify a column : change the size/datatype of the attribute
`ALTER TABLE students`
`MODIFY COLUMN email VARCHAR(150);`
3. Rename a column
`ALTER TABLE students`
`RENAME COLUMN name TO full_name;`
4. Drop a column
`ALTER TABLE students`
`DROP COLUMN email;`
5. Add a constraint
`ALTER TABLE students`
`ADD CONSTRAINT uq_email UNIQUE (email);`
6. Drop a constraint
`ALTER TABLE students`
`DROP CONSTRAINT uq_email;`
7. Rename the table
`ALTER TABLE students`
`RENAME TO learners;`

## Insertion
- **INSERT INTO** 
**1st way** (ensure attributes are in correct order and in correct types) = 
`insert into movies values ('Chocolate Factory', 2006, 112,'drama', 3.5, 'm01');`
- **INSERT**
**2nd way** (traditional way, include all attribute names) = 
`INSERT department (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT) VALUES ('A00', 'SPIFFY COMPUTER SERVICE DIV.', '000010', 'A00');`

## Deletion
- Delete all rows : `delete from Employee;`
- Delete rows with condition : `delete from Employee where WorkDept = 'A00';`

## Update
### Update salary by 5%
`update Employee`
`set Salary = Salary * 1.05;`
### Change Department's name
`update Employee` 
`set WorkDept = 'E01'`
`where WorkDept = 'E21';`

## SELECT INTO
selects data from one table and **inserts it into a different table**
same as employee table (duplicate data from one table to another, we can filter some part if wanted)
- `create table newemp(`
`select * from employee where salary > 30000`
`);`

## Constraints
used to limit the type of data that can go into a table
they can be specified when a table is created or after the table is created (using ALTER TABLE statement)
### NOT NULL
enforces a column to NOT accept NULL values
- `LastName varchar(255) NOT NULL`
### UNIQUE
---
Uniquely identifies each record in a database table, can have NULL unlike PK (thats the difference)
provides a guarantee for uniqueness for a column or set of columns
- Write UNIQUE after declaring an attribute
- Write CONSTRAINT with UNIQUE
	- `CONSTRAINT uc_personID UNIQUE (P_Id,LastName)`
	- meaning, **P_Id and LastName together are UNIQUE**
### PRIMARY KEY
---
primary keys must contain unique values, and **cannot contain NULL values** (NOT NULL)
- Write PRIMARY KEY after declaring an attribute
- Write CONSTRAINT with PRIMARY KEY
	- `CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)`
** when we declare foreign key, we cannot set only 1 of the attributes from the PK in the parent table, because we declared 2 PK in the parent table earlier
### FOREIGN KEY
---
FOREIGN KEY in one table **points to a PRIMARY KEY in another table**
It’s used to **link two tables together** and maintain **referential integrity** (meaning: relationships between data are valid and consistent)
- Write CONSTRAINT with FOREIGN KEY
- `CONSTRAINT fk_student_course FOREIGN KEY (course_id) REFERENCES course(course_id)`
- Meaning, this table has course_id as a foreign key WITH reference to the attribute "course_id" in the course table

- How to create a table with foreign key
`CREATE TABLE enrollments (`
  `enrollment_id INT PRIMARY KEY,`
  `student_id INT,`
  `course_name VARCHAR(50),`
  `CONSTRAINT fk_student FOREIGN KEY (student_id)`
      `REFERENCES students(student_id)`
`);`
It means every `student_id` in `enrollments` **must already exist** in `students` table.
Then, we can **JOIN** a table that has a **foreign key** with the table it references to query for the columns in the table it references as well
#### Why use FOREIGN KEY
They ensure **data consistency**:
- You **cannot insert** an enrollment record for a **student who doesn’t exist** in the `students` table.
- You **cannot delete** a student if they still have enrollment records (unless you specify what to do).

### CREATE INDEX
---
Uses to create indexes in tables
It allows the database application to find data fast, without reading the whole table
- `CREATE INDEX PIndex ON Persons(LastName);`
without an index, if we run `SELECT * FROM students WHERE LastName = 'John';`
The database must **scan every row** (this is called a _full table scan_).  
- If we create an index, It’s like looking up a word in the back of a dictionary instead of reading every page.

### VIEW
---
A **view** is like a **virtual table** that’s based on the result of a query.
- It **does not store data** itself.
- Instead, it **stores a saved SQL query** that runs every time you access the view
- View contains rows and columns, just like a real table.
- The fields in a view are **fields from one or more real tables in the database**
`create   view  ManufacturingProjects as`
	`(  select   projno, projname, firstname, lastname`
	   `from     project, employee`
	   `where  respemp = empno  and  deptno = 'D21'  );`

Now, we can simply query it like : select * from ManufacturingProjects;
The result looks like a table, But no data is stored inside `employee_summary` — it just runs the saved query.

## Other Basics for Table creation
- `Auto_Increment` after declaring attr -> increment automatically whenever we record
- asc : sort in ascending order
	- Example : `PRIMARY KEY (sid ASC)` ->  set primary key (sid) IN ascending order
- desc : sort in descending order
	- can also use with select (eg : `order by salary desc`)