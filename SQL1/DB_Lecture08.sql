select distinct P.ProjNo, E.LastName
from Employee E, Project P
where P.RespEmp = E.EmpNo
and P.DeptNo = 'E21';

select distinct E.LastName
from  Employee E, Department D, Employee Emgr
where  E.WorkDept = D. DeptNo
	and  D.MgrNo = Emgr.EmpNo
	and  E.Salary >= Emgr.Salary;
    
select E.EmpNo, Firstname, Salary, E.Salary-40000 as SalaryDiff
from Employee E;

# select clause (switch case)
select E.EmpNo,
	case when E.Salary < 40000 then 0
		else E.Salary - 40000 end
from Employee E;

# insert data to existing table, make sure the attributes are correct
insert into Employee
values ('000350', 'Sheldon', 'Q', 'Jetstream', 'A00','1122','2000-10-01',2500.00);

select * from employee where WORKDEPT = 'A00';

# update data in specific attri 
update Employee
set Salary = Salary * 1.05;

# update work department from E21 to E01
update Employee
set WorkDept = 'E01'
where WorkDept = 'E21';

# retrieves managers name, lastname from each department
# select attributes from "employee" table only, and compare the empno 
# from employee table to mgrno from department table
select empno, firstname, lastname from employee where empno in (select mgrno from department);

# same as above, but without IN operator
# involves crossing 3 tables together, but above statement doesnt
select  distinct  Emgr.empno, Emgr.firstname , Emgr.lastname , Emgr.workdept
from      Employee E, Department D, Employee Emgr # crossing 3 tables
where    E.WorkDept = D. DeptNo
    and    D.MgrNo = Emgr.EmpNo;

select mgrno from department where mrgno NOT IN (select empno from employee);

select empno, firstname, lastname, salary
from employee
where salary > 50000;

# subqueries
select mgrno, deptno, deptname
from department
where mgrno in ( select empno from employee where salary > 50000 );

# subquery to query for the employee with MAX salary
select empno, lastname
from employee
where salary >= all(select salary from employee);

# correlated subquery, also returns the highest one
select empno, lastname
from employee E1
where salary is not null and not exists 
	( select * from employee E2 where E2.salary > E1.salary);
    
# scalar subquery
# employees that have the salary greater than employee who has empno 000190
select empno, firstname, salary
from employee
where salary > (select salary from employee e2 where e2.empno = '000190');

# subquery in select clause
# responsible employee for each department
# returns projno and deptname (with the subquery)
select projno, (select distinct deptname from department as d where e.workdept = d.deptno)
from project as p, employee as e
where p.respemp = e.empno;

# projno and projname who has the manager equivalent to the responsible employee
# (managers who take care of the project THAT have salary > 50000)
select projno, projname
from project as p, (select mgrno from department, employee where mgrno = empno
	and salary > 50000) as m
where respemp = mgrno; # responsible employee IS a manager

# outer join
# left outer join = we use data from left side and match with table on right side
# even if the data from the right doesnt match with the left, we will still keep data from the left since its LEFT outer join (add NULL)

# inner join
# results need to match from both sides