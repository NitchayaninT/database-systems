use lecture08;

# ordering
select distinct e.empno, hiredate, firstname, lastname 
from           employee e
order by    hiredate desc;

# grouping
# new columns : totalsalary, employees
# example : group by department. sum salary and count employees for each department. count * means count number of tuples in the group
# shows the result for each group of deptno,deptname
# apply where, then group by
select  deptno, deptname, sum(salary) as totalsalary, count(*) as employees
from department d, employee e
where e.workdept = d.deptno # when cross product + where condition (filter), there will be duplicates for department if there are more than 2 employees working in that dep
group by deptno, deptname; # so that each duplicate deptno, deptname will be treated as the same group

# having (after grouping)
# count only the records that have records equal or more than 4 (filter from grouping)
# the result = only shows records that satisfy the having clause
select  deptno, deptname, avg(Salary) as MeanSalary, count(*)
from department d, employee e
where e.workdept = d.deptno # when cross product + where condition (filter), there will be duplicates for department if there are more than 2 employees working in that dep
group by deptno, deptname # the groupby and select attr should be the same, or select can be subset of groupby
having count(*)>=4;


