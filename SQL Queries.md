# SQL Basics Queries
- distinct : remove duplicate rows
- WHERE
- SELECT
- TOP (LIMIT)
- LIKE
- IN (within WHERE clause)
- BETWEEN
- JOINS
- Ordering results (ORDER BY)
- Group Aggregation (GROUP BY)
- Having clauses
- CASE (if else)
## WHERE clause
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
## SELECT clause
- select "difference between each employee's salary with 40000" as a **COLUMN named** **Salary Diff**
`select E.EmpNo, E.Salary-40000 as SalaryDiff`
`from Employee E;`
## TOP Clause (LIMIT)
specify number of records to return
- `SELECT * FROM employee LIMIT 5;`
Example : show top 5 salaries
`select firstname,lastname, salary`
`from employee`
`order by salary desc`
`limit 5;`
## LIKE
### SQL wildcards (use with SQL LIKE)
- % = represents zero, one, or multiple chars
- _ = represents a single char
search for **specified pattern in a column**
- `SELECT * FROM employee WHERE Firstname LIKE 'e%';`
## IN
specify multiple values in WHERE clause
Example : get last name that ends with Henderson and Kwan
- `select * from employee`
`where lastname in('HENDERSON','KWAN');`
## BETWEEN
sets a range of data between two values. The values can be numbers, text or dates
- `select * from employee`
`where lastname between 'HENDERSON' AND 'KWAN';`

If use : `WHERE lastname > 'Henderson'` -> in alphabetical order
## JOINS
### INNER JOIN
---
** NORMAL JOIN is the same as INNER JOIN
Returns rows when **there is at least one match in both tables**
- `SELECT p.projname, d.deptname`
	`FROM project p INNER JOIN department d ON p.deptno=d.deptno;`
	- Meaning : Join Project and Department tables together on the column deptno from both tables (**like natural/eqi joins**)
- Actual meaning : which project works by which dept
INNER JOIN as also be represented like
- `select * from movies mv, moviestar ms where mv.movieid = ms.movieid;`

### LEFT OUTER JOIN
---
Include the result region that have no branch (as NULL)
- `SELECT * FROM region LEFT OUTER JOIN branch ON branch.region_nbr=region.region_nbr`
`ORDER BY region.region_nbr;`

### FULL OUTER JOIN
---
**UNION between left outer join and right outer join** together to get FULL Outer join
- `SELECT P.PersonID, P.FirstName, P.LastName, G.GenderID, G.Gender`
`FROM Person AS P`
`LEFT OUTER JOIN Gender AS G ON P.GenderID = G.GenderID`
`UNION`
`SELECT P.PersonID, P.FirstName, P.LastName, G.GenderID, G.Gender`
`FROM Person AS P`
`RIGHT OUTER JOIN Gender AS G ON P.GenderID = G.GenderID;`
### CROSS JOIN
---
- `select * from Person CROSS JOIN Gender`
## Set Operations
### UNION
---
The **`UNION`** operator combines **results from two (or more) SELECT queries** into one result set. It also removes duplicate rows by default
`SELECT name FROM students_2024`
`UNION`
`SELECT name FROM students_2025;`

- example (hard) : Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name. Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
- - two rows, one column named `results`
**SELECT t.result AS results**
**FROM (**
**SELECT u.name AS result**
**FROM Movies AS m**
**LEFT JOIN MovieRating AS r ON m.movie_id = r.movie_id**
**LEFT JOIN Users AS u ON u.user_id = r.user_id**
**GROUP BY u.user_id, u.name**
**ORDER BY COUNT(r.movie_id) DESC, u.name**
**LIMIT 1**
**) AS t**

**UNION ALL**

**SELECT t2.result**
**FROM (**
**SELECT m.title AS result**
**FROM Movies AS m**
**LEFT JOIN MovieRating AS r ON m.movie_id = r.movie_id**
**LEFT JOIN Users AS u ON u.user_id = r.user_id**
**WHERE r.created_at >= '2020-02-01' AND r.created_at < '2020-03-01'**
**GROUP BY m.movie_id, m.title**
**ORDER BY AVG(r.rating) DESC, m.title**
**LIMIT 1**
**) AS t2;**
### INTERCEPT (MySQL = IN)
---
(already in the IN section)
- select student names who enrolled in DB systems
`SELECT name`
`FROM students`
`WHERE student_id IN (`
    `SELECT student_id`
    `FROM enrollments`
    `WHERE course_name = 'Database Systems'`
`);`
### EXCEPT (MySQL = NOT IN)
---
Set difference
Example : Which employees are **not** managers of any department?”
- `select empno` 
`from employee`
`where empno` 
`not in(select mgrno from department where mgrno <> '');` // mgrno not equal to null, so it means select all mgrno

## Ordering Results (ORDER BY)
Example : sort by decreasing order
- `select distinct e.empno, hiredate, firstname, lastname` 
`from employee e`
`order by hiredate desc;`

## Group Aggregation (GROUP BY)
Apply WHERE then GROUP BY
- GROUP BY attr is/are the attributes that we want to group, 
- The **`GROUP BY`** clause is used to **combine rows that have the same value** in one or more columns 
and then apply **aggregate functions** (like `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`) to each group.
Think of it like: “Group similar things together, then summarize each group.”

example : **group by department**. **sum salary and count employees for each department**. count * means count number of tuples in the group
`select  deptno, deptname, sum(salary) as totalsalary, count(*) as employees`
`from department d, employee e`
`where e.workdept = d.deptno`
`group by deptno, deptname;`
- Imagine : we connect dept and emp tables together, now there are duplicate depts because there are many employees working in the same dept (in e.workdept). when group by count and sum, it will sum all of the salary within the same Deptno, deptname AND count number of tuples in the group (no. of employees)

Example with subqueries (HARD) : **show empno, firstname, lastname of highest salary of each department**
Think about "**highest salary of each department**" first, so we join dept and emp, group by dept, find max(salary), now we have a table with max salary of each department. 
But we dont have the names yet, because we shouldnt group by names to get highest salary for EACH department, so that one has to be the subquery
After that, we can use Empno to join with WorkDept of the subquery WHO has salary equals to the maxsalary we got in the subquery
- `select empno,firstname,lastname`
`from employee,(select deptno, max(salary) as maxsalary`
				`from department d, employee e` 
                `where e.workdept = d.deptno` 
                `group by deptno ) as mx`
`where salary = mx.maxsalary and workdept = deptno;`
### Aggregation Functions
- `count(*)` : number of tuples in the group
- `count(E)` : number of tuples for which E (an expression that may involve non-grouping attributes) is non-NULL
- `count(distinct E)` : number of distinct non-NULL E values
- `sum(E)` : sum of non-NULL E values
- `sum(distinct E)` : sum of distinct non-NULL E value
- `avg(E)` : average of distinct non-NULL E values
- `min(E)` : min of non-NULL values
- `max(E)` : max of non-NULL values
## HAVING
- `WHERE` filters rows **before grouping**.
- `HAVING` filters **after grouping** (based on aggregate results).
example : count only the records **that have records equal or more than 4** (filter from grouping)
`select  deptno, deptname, avg(Salary) as MeanSalary, count(*)`
`from department d, employee e`
`where e.workdept = d.deptno` 
`group by deptno, deptname` 
`having count(*)>=4;`

example : department that the **total of salary of over all employees is higher than department budget**
`select d.did, d.budget, sum(e.salary) as sumSalary`
`FROM Emp e, Dept d, Works w`
`WHERE w.did = d.did AND e.eid = w.eid`
`GROUP BY d.did, d.budget`
`HAVING sum(e.salary) > d.budget;`

### IMPORTANT for Group By
Cases when no GROUP BY is needed
1. When the SELECT has ONLY aggregate functions
`SELECT COUNT(*), SUM(salary), MAX(age)`
`FROM employees;`
- why? : This is valid because you're aggregating the entire table as one group. Result = one single row.
2. **When you use no aggregate functions at all** (normal)

**we must use GROUP BY only when a SELECT mixes aggregated and non-aggregated columns.** Otherwise, aggregates alone don’t require GROUP BY.

## Cases
**SELECT OrderID, Quantity,**  
**CASE**  
    **WHEN Quantity > 30 THEN "The quantity is greater than 30"**  
    **WHEN Quantity = 30 THEN "The quantity is 30"**  
    **ELSE "The quantity is under 30"**  
**END**  
**FROM OrderDetails;**

Example : count the number of actors and the number of actresses from moviestar table
- `select count(case when ms.gender='M' then ms.name end), count(case when ms.gender='F' then ms.name end)`
`from moviestar ms;`

Alternative (easier):
`SELECT SUM(ms.gender = 'M') AS male_count, SUM(ms.gender = 'F') AS female_count`
`FROM moviestar ms;`

`COUNT(ms.gender='M')` alone won’t do what we want
- `COUNT(expr)` counts **non-NULL** values of `expr`.
- In MySQL, the Boolean expression `ms.gender='M'` evaluates to **1 (TRUE)** or **0 (FALSE)** for non-NULL `gender`, and **NULL** if `gender` is NULL.
- Both **1 and 0 are non-NULL**, so  
    `COUNT(ms.gender='M')` → counts **all rows where `gender` is not NULL**, not just the males.
The aggregate **`SUM()` adds numbers** and **ignores NULLs**.
- TRUE rows contribute **1**,
- FALSE rows contribute **0**,
- NULL rows contribute **nothing**.
    
Example : count number of actors and actresses for each movie
`select mv.title, count(case when ms.gender='M' then ms.name end), count(case when ms.gender='F' then ms.name end)` 
`FROM movies AS mv`
`LEFT JOIN moviestar AS ms ON ms.movieid = mv.movieid`
`GROUP BY mv.title;` 

Example (hard) : swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
`select`
	`case`
	`when id % 2 = 0 then id-1`
	`when id = (SELECT MAX(id) FROM Seat) and id % 2 = 1 THEN id`
	`else id+1`
	`end as id,`
	`student`
`from Seat`
`order by id;`
## Subqueries
### Correlated Subqueries
### Scalar Subqueries

## Others
- `LENGTH(attr)` = get the size of a string
- visited **without making any transactions** and the number of times they made these types of visits
	- `select V.customer_id, COUNT(V.visit_id) as count_no_trans`
`from Visits as V LEFT JOIN Transactions as T ON V.visit_id = T.visit_id`
`where T.visit_id is NULL`
`GROUP BY V.customer_id;`
- Subtract a time interval from a date or datetime.
	- `DATE_SUB(date_value, INTERVAL day/time)`
	- example : `SELECT DATE_SUB('2025-10-25', INTERVAL 7 DAY);`
- Average time of process per machine
	- `select A.machine_id, ROUND(avg(B.timestamp-A.timestamp),3) AS processing_time`
		`from Activity as A, Activity as B`
		`WHERE A.activity_type='start' AND B.activity_type='end' and A.machine_id = B.machine_id`
		`group by A.machine_id;`
- To round up decimals
	- `ROUND(value,no_decimals)`
- number of times each student attended each exam (CROSS JOIN, then left outer join)
`select distinct Std.student_id, Std.student_name, Sub.subject_name, count(e.subject_name) as attended_exams`
`from Students as Std`
`CROSS JOIN Subjects as Sub`
`LEFT OUTER JOIN Examinations e ON e.subject_name = Sub.subject_name`
`and e.student_id = Std.student_id`
`group by std.student_id, std.student_name, Sub.subject_name`
`order by Std.student_id asc;`
- find managers with at least five employees.
`select manager.name`
`from Employee as manager JOIN Employee as normal ON normal.managerId = manager.id`
`group by manager.name, manager.id`
`having count(manager.id)>=5;`
- Find the IDs of the employees whose salary is **strictly less than $30000 and whose manager left the company.**
	- employee that left. employee_id is null
	- so, select each employee's manager and find if their manager is IN any employee_id or not
`select employee_id`
`from Employees`
`where salary < 30000 and manager_id not in (select employee_id from Employees)`
`order by employee_id asc;`
