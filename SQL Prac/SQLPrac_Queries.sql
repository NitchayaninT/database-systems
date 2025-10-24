USE YugoNationalBank;
select * from Customers;

# 6.1 Find total deposit, withdraw, and total difference for each customer
# join deposits, withdraws, customers
# group by customer id, customer name, 
# include NULL also, (Total withdraw and difference can have NULL, but Deposit cannot, so it should Left Outer join withdrawals)

select c.CustomerID, c.CustomerName, sum(d.DepositAmount), sum(w.WithdrawalAmount), sum(d.DepositAmount) - sum(w.WithdrawalAmount) as Diff
from Customers as c
JOIN Deposits as d ON c.CustomerID = d.CustomerID 
LEFT OUTER JOIN Withdrawals as w ON c.CustomerID = w.CustomerID
GROUP BY c.CustomerID,c.CustomerName
ORDER By c.CustomerID asc;

# 6.2 Count the number of transactions from both withdraw and deposit from each employee
# join employee, withdraw, deposit
# count aggregation
# count distinct AVOIDS duplicate data
select e.EmployeeID, e.FirstName, count(distinct d.EmployeeID) as depositCount, count(distinct w.EmployeeID) as withdrawalCount, count(distinct d.EmployeeID)+count(distinct w.EmployeeID) as Total_Trans
from Employees as e
JOIN Deposits as d ON e.EmployeeID = d.EmployeeID
LEFT OUTER JOIN Withdrawals as w ON e.EmployeeID = w.EmployeeID
GROUP BY e.EmployeeID, e.FirstName
ORDER BY e.EmployeeID asc;

select * from Deposits;

# 6.3 Show the number of customers from each state
# group by state
select c.State, count(*) as TolCustomer
from Customer c
GROUP BY c.State;

# 6.4 Show the list of customers who have the Last name beginning with H 
# no need GROUP BY , just query every cus with 'H' in the Last name
# H%
# get Last Name : SUBSTRING_INDEX('John Smith', ' ', -1) AS SecondPart;
select CustomerName
FROM Customers
WHERE SUBSTRING_INDEX(CustomerName, ' ', -1) LIKE 'H%';