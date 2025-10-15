CREATE DATABASE Lecture05;
USE Lecture05;

# NULL = can have empty cell in the column
CREATE TABLE Student2(
	sid nvarchar(255) NOT NULL PRIMARY KEY, # set primary key
	name nvarchar(255) NOT NULL,
	login nvarchar(255) NOT NULL,
	age smallint NULL,
	gpa float NULL
);

INSERT Student2 (sid, name, login, age, gpa) VALUES ('53666', 'Jones', 'jones@cs', 18, 3.4);
INSERT Student2 (sid, name, login, age, gpa) VALUES ('53687', '', 'smith@ee', 18, 3.2);

CREATE TABLE Student3(
	sid nvarchar(255) NOT NULL,
	name nvarchar(255) NOT NULL,
	login nvarchar(255) NOT NULL,
	age smallint NULL,
	gpa float NULL,
    PRIMARY KEY (sid ASC) # set primary key IN ascending order, and can define primary key using 2 or more attributes
);

CREATE TABLE Enrolled(
	sid varchar(20) NOT NULL,
	cid varchar(10) NOT NULL,
	grade varchar(2) NULL,
    CONSTRAINT PriKey PRIMARY KEY(sid,cid) # set primary key 
);

INSERT Enrolled (sid, cid, grade) VALUES ('53831', 'Carnatic10', 'C ');
INSERT Enrolled (sid, cid, grade) VALUES ('53831', 'Raggae203 ', 'B ');
INSERT Enrolled (sid, cid, grade) VALUES ('53688', 'Topology11', 'A ');
INSERT Enrolled (sid, cid, grade) VALUES ('53666', 'History', 'B ');

DROP TABLE Student;

# update the data (eg : adding more attribute to the table, we should add it before inserting data)
ALTER TABLE Student2
ADD firstYear int;

# Delete data
DELETE FROM Student2
WHERE name= 'Jones';

CREATE TABLE Students_pk(
	sid varchar(20) NOT NULL,
	name varchar(20) NULL,
	login varchar(10) NULL,
	age int NULL,
	gpa real NULL,
	PRIMARY KEY (sid ASC)
);

INSERT Students_pk (sid, name, login, age, gpa) VALUES ('53650', 'Smith', 'smith@math', 19, 3.8);
INSERT Students_pk (sid, name, login, age, gpa) VALUES ('53666', 'Jones', 'jones@ee', 18, 3.4);
INSERT Students_pk (sid, name, login, age, gpa) VALUES ('53688', 'Smith', 'smith@ee', 18, 3.2);

CREATE TABLE Enrolled_pk(
	sid varchar(20) NOT NULL,
	cid varchar(20) NOT NULL,
	grade varchar(2) NULL,
	PRIMARY KEY ( sid ASC, cid ASC), # both together are primary keys
	FOREIGN KEY (sid)References Students_pk(sid) # create foreign key (from student_pk(sid))
);

INSERT Enrolled_pk (sid, cid, grade) VALUES ('53650', 'Topology112', 'A'); # if sid doesnt exist in student table, it will not be added
INSERT Enrolled_pk (sid, cid, grade) VALUES ('53666', 'Camatic101', 'C');
INSERT Enrolled_pk (sid, cid, grade) VALUES ('53666', 'History105', 'B');
INSERT Enrolled_pk (sid, cid, grade) VALUES ('53666', 'Reggae203', 'B');