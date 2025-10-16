CREATE DATABASE lecture08_branch; 
USE lecture08_branch;

CREATE TABLE region(
	region_nbr varchar(5) NULL,
	region_name varchar(20) NULL
);

INSERT region (region_nbr, region_name) VALUES ('100', 'East Regio');
INSERT region (region_nbr, region_name) VALUES ('200', 'Central Regio');
INSERT region (region_nbr, region_name) VALUES ('300', 'Virtual Regio');
INSERT region (region_nbr, region_name) VALUES ('400', 'West Regio');

CREATE TABLE branch(
	branch_nbr varchar(5) NULL,
	branch_name varchar(20) NULL,
	region_nbr varchar(5) NULL,
	employee_count smallint NULL
);
INSERT branch (branch_nbr, branch_name, region_nbr, employee_count) VALUES ('108', 'New York', '100', 10);
INSERT branch (branch_nbr, branch_name, region_nbr, employee_count) VALUES ('110', 'Bosto', '100', 6);
INSERT branch (branch_nbr, branch_name, region_nbr, employee_count) VALUES ('212', 'Chicago', '200', 5);
INSERT branch (branch_nbr, branch_name, region_nbr, employee_count) VALUES ('404', 'San Diego', '400', 6);
INSERT branch (branch_nbr, branch_name, region_nbr, employee_count) VALUES ('415', 'San Jose', '400', 3);

# left outer join
SELECT region.region_nbr, region.region_name, branch.branch_nbr, branch.branch_name
FROM region LEFT OUTER JOIN branch ON branch.region_nbr = region.region_nbr
ORDER BY region.region_nbr; # order by region number	

# inner join (specified attr need to match from both sides)
SELECT region.region_nbr, region.region_name, branch.branch_nbr, branch.branch_name
FROM region INNER JOIN branch ON branch.region_nbr = region.region_nbr # these region_nbr need to match
ORDER BY region.region_nbr; # order by region number