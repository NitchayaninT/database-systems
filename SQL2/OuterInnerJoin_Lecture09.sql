-- keep info from the mentioned side
SELECT region.region_nbr, region.region_name, branch.branch_nbr, branch.branch_name
FROM region LEFT OUTER JOIN branch ON branch.region_nbr = region.region_nbr
ORDER BY region.region_nbr;
-- inner join = match from both side (inner join = join)
SELECT region.region_nbr, region.region_name, branch.branch_nbr, branch.branch_name
FROM region JOIN branch ON branch.region_nbr = region.region_nbr
ORDER BY region.region_nbr;

-- order the final result according to descending hiredate
use lecture08;
select distinct e.empno, hiredate, firstname, lastname
from employee e
order by hiredate desc;

select deptno, deptname, sum(salary) as totalsalary, count(*) as employees
from department d, employee e
where e.workdept = d.deptno
group by deptno, deptname;


select deptno, deptname, avg(salary) as MeanSalary
from department d, employee e
where e.workdept = d.deptno
group by deptno, deptname
having count(*) >=4;
-- highest salary
select max(salary)
from employee;
-- show the empno, firstname, and lastname of highest salary
select empno, firstname, lastname
from employee
where salary=(select max(salary) from employee);
-- show highest salary from each department
select deptno, max(salary)
from department d, employee e
where e.workdept = d.deptno
group by deptno;
-- show empno, firstname, lastname of highest salary of each department
select empno,firstname,lastname
from employee,(select deptno, max(salary) as maxsalary
				from department d, employee e 
                where e.workdept = d.deptno 
                group by deptno ) as mx
where salary = maxsalary and workdept = deptno;







