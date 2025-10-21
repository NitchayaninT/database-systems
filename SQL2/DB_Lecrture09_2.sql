USE lecture08;
select FirstName, LastName, HireDate
from Employee
where Salary > 30000;

# cross 2 tables together (Employee x Project) connect 2 conditions together -> can create dulp records
# eliminate dul records = distinct
select distinct P.ProjNo, E.LastName
from Employee E, Project P
where P.RespEmp = E.EmpNo
and P.DeptNo = 'E21';

