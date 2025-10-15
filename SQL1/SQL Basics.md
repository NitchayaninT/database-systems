# SQL Basics
## Data Types
varchar(size) = string
int = int
double = double
decimal(size, deci_size)= decimal
## Create Database
`CREATE DATABASE db_name;`
## Create Table
With foreign key and private key
`create table moviestar(`
	`starid varchar(5),`
    `name varchar(50),`
    `address varchar(255),`
    `gender varchar(1),`
    `movieid varchar(5),`
    `primary key (starid),`
    `foreign key (movieid) references movies(movieid)`
`);`
add **one attribute "movieid"** as string into the "movie" table then set it as primary key
`alter table movies`
`add movieid varchar(5) primary key;`
## Where clause
- **Conditions** may include arithmetic operators and comparisons
- logical connectives (and,or,not)
`select E.LastName`
`from Employee E, Department D, Employee Emgr` **# Crossing 3 tables**
`where E.WorkDept = D.DeptNo`
`and D.MgrNo = Emgr.EmpNo`
`and E.Salary > Emgr.salary;`
- Also, E.WorkDept = D.DeptNo for each employee's department number, what this does is it eqi joins WorkDept column in Employee E's table with DeptNo column in Department D table, so **only matching WorkDept and DeptNo are left** and **each employee row get its own manager name from Department table** (D.MgrNo) and the rest of data from department table
- And, D.MgrNo = Emgr.EmpNo means we do equi join for D.MgrNo (current table we have) and Emgr.EmpNo to **get employees that are managers**. What this does is it **adds Employee info** to the Department table **based on the Manager No (D.Mgrno)** of each department. (So employees that arent managers are filtered out from Emgr table)
- Now, **Emgr table** is the table that only contains employees that are managers
- ==Instead of Cross Multiplying between these 3 tables, we set the condition(filter) in where clause so we get exactly the data we want== 

so that these employee E can be compared with their manager Emgr, and if they're already managers, they're compared with themselves

This "==Lists the last names of employees who make more than their manager=="

** **FROM** represents ==tables we wanna retrieve data from==, which can be used with conditions specified in WHERE clause to make the table for Managers from Employee table (not every employee is a manager, but every manager is an employee). 
## Select clause
- select "difference between each employee's salary with 40000" as a **COLUMN named** **Salary Diff**
`select E.EmpNo, E.Salary-40000 as SalaryDiff`
`from Employee E;`
## Insertion & Deletion
### Insert data
#### INSERT INTO 
**1st way** (ensure attributes are in correct order and in correct types) = `insert into movies values ('Chocolate Factory', 2006, 112,'drama', 3.5, 'm01');`
#### INSERT
**2nd way** (traditional way, include all attribute names) = `INSERT department (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT) VALUES ('A00', 'SPIFFY COMPUTER SERVICE DIV.', '000010', 'A00');`
### Delete data
#### Delete all rows
`delete from Employee;`
#### Delete rows with condition
`delete from Employee where WorkDept = 'A00';`
## Update
### Update salary by 5%
`update Employee`
`set Salary = Salary * 1.05;`
### Change Department's name
`update Employee` 
`set WorkDept = 'E01'`
`where WorkDept = 'E21';`
## Set Operations
## Multiset Operations
## Logical Expression
## Subqueries
### Correlated Subqueries
### Scalar Subqueries
## Outer Joins
## Inner Joins
### eqi join
`select * from movies mv, moviestar ms where mv.movieid = ms.movieid;`
### natural join
`select * from movies natural join moviestar;`