# top 5 employees (by eid)
use lecture10_project;
select * 
from employee 
limit 5;

# top 5 salary
select firstname,lastname, salary
from employee
order by salary desc
limit 5;

# IN operator : specify multiple values in WHERE clause
select * from employee
where lastname in('HENDERSON','KWAN');

# BETWEEN operator : selects a range of data between two values (can be num,text,dates)
select * from employee
where lastname between 'HENDERSON' AND 'KWAN';
# WHERE lastname > 'Henderson' -> in alphabetical order

# JOIN = Inner join
# UNION between left outer join and right outer join together to get FULL Outer join
select p.projname, d.deptname
from project p inner join department d on p.deptno=d.deptno;

# SELECT INTO = select data from one table and inserts it into a different table
# same as employee table (duplicate data from one table to another, we can filter some part if wanted)
create table newemp(
select * from employee where salary > 30000
);

# create PK FK
CREATE TABLE Persons(	
	P_Id int NOT NULL PRIMARY KEY,	
    LastName varchar(255) NOT NULL,	
    FirstName varchar(255),	
    Address varchar(255),	
    City varchar(255));
    
CREATE TABLE orders(
		orderID int not null,
		orderNumber int not null,
		personID int,
		PRIMARY KEY(orderID),
		FOREIGN KEY (personID) REFERENCES Persons(P_Id));

# CREATE Index
CREATE INDEX PIndex
ON Persons(LastName);

# Creating a foreign key
CREATE DATABASE lecture10_people; 

USE lecture10_people;

CREATE TABLE Gender(
	GenderID int NOT NULL PRIMARY KEY,
	Gender varchar(255) NOT NULL
);

INSERT Gender (GenderID, Gender) VALUES (1, 'Female');
INSERT Gender (GenderID, Gender) VALUES (2, 'Male');
INSERT Gender (GenderID, Gender) VALUES (3, 'Unknown');

CREATE TABLE Person(
	PersonID int Auto_Increment PRIMARY KEY NOT NULL, # Auto _Increment after attr name = increment automatically whenever we record
	FirstName varchar(20),
	LastName varchar(20) NOT NULL,
	GenderID int NULL,
	FOREIGN KEY (GenderID) REFERENCES Gender(GenderID)
);

INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (1, 'Grude', 'Larson', 1);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (2, 'Raymond', 'Kouma', NULL);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (3, 'Peter', 'Mukoko', 2);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (4, 'Wally', 'Baston', 2);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (5, 'Sylvai', 'Nguyen', NULL);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (6, 'Donald', 'Wallace', 2);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (7, 'Hermine', 'Kana', 1);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (8, 'Charlotte', 'Thomas', NULL);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (9, 'Paula', 'Barbers', NULL);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (10, 'Crissie', 'Dentd', 1);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (11, 'Ernestine', 'Essien', 1);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (12, 'Barbara', 'Randt', NULL);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (13, 'Helene', 'Cranston', 1);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (14, 'Robert', 'Palau', 3);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (15, 'Paulette', 'Krazucky', 1);
INSERT Person (PersonID, FirstName, LastName, GenderID) VALUES (16, 'Frank', 'Cranston', NULL);
