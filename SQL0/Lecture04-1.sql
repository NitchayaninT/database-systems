USE lecture04; #select database

CREATE TABLE Store( #table name = Store
	Store nchar(10) NULL, #attributes. nchar is string with 10 bytes
	Aisle nchar(10) NULL,
	Shelf nchar(10) NULL
);
INSERT Store (Store, Aisle, Shelf) VALUES (23, 'W', 5); # insert data, specify table, attributes and values
INSERT Store (Store, Aisle, Shelf) VALUES (24, 'K', 9);
INSERT Store (Store, Aisle, Shelf) VALUES (25, 'Z', 6);

CREATE TABLE P2(
	P_Code nvarchar(255) NULL,
	P_Descript nvarchar(255) NULL,
	Price float NULL
);
INSERT P2 (P_Code, P_Descript, Price) VALUES (345678, 'Microwave', 160);
INSERT P2 (P_Code, P_Descript, Price) VALUES (345679, 'Dishwasher', 500);

CREATE TABLE P(
	P_Code nvarchar(255) NULL,
	P_Descript nvarchar(255) NULL,
	Price decimal(10,8) NULL
);
INSERT P (P_Code, P_Descript, Price) VALUES (123456, 'Flashlight', 5.2600);
INSERT P (P_Code, P_Descript, Price) VALUES (123457, 'Lamp', 25.1500);
INSERT P (P_Code, P_Descript, Price) VALUES (123458, 'Box Fa', 10.9900);
INSERT P (P_Code, P_Descript, Price) VALUES (213345, '9v Battery', 1.9200);
INSERT P (P_Code, P_Descript, Price) VALUES (254467, '100W Bulb', 1.4700);
INSERT P (P_Code, P_Descript, Price) VALUES (311452, 'Powerdrill', 34.9900);

CREATE TABLE Fname2(
	F_Name nvarchar(255) NULL
);
INSERT Fname2 (F_Name) VALUES ('Jane');
INSERT Fname2 (F_Name) VALUES ('William');
INSERT Fname2 (F_Name) VALUES ('Jorge');
INSERT Fname2 (F_Name) VALUES ('Dennis');

CREATE TABLE Fname(
	F_Name nvarchar(255) NULL
);
INSERT Fname (F_Name) VALUES ('George');
INSERT Fname (F_Name) VALUES ('Jane');
INSERT Fname (F_Name) VALUES ('Elaine');
INSERT Fname (F_Name) VALUES ('Wilfred');
INSERT Fname (F_Name) VALUES ('Jorge');



CREATE TABLE S(
	sid nvarchar(255) NULL,
	name nvarchar(255) NULL,
	login nvarchar(255) NULL,
	age smallint NULL,
	gpa float NULL
);

INSERT S (sid, name, login, age, gpa) VALUES ('53666', 'Jones', 'jones@cs', 18, 3.4);
INSERT S (sid, name, login, age, gpa) VALUES ('53688', 'Smith', 'smith@ee', 18, 3.2);
INSERT S (sid, name, login, age, gpa) VALUES ('53650', 'Smith', 'smith@math', 19, 3.8);

CREATE TABLE E(
	sid varchar(10) NOT NULL,
	cid varchar(20) NOT NULL,
	grade varchar(2) NULL,
    CONSTRAINT PK_E PRIMARY KEY (sid,cid)
);
INSERT E (sid, cid, grade) VALUES ('53831', 'Carnatic10', 'C');
INSERT E (sid, cid, grade) VALUES ('53831', 'Raggae203', 'B');
INSERT E (sid, cid, grade) VALUES ('53650', 'Topology112', 'A');
INSERT E (sid, cid, grade) VALUES ('53666', 'History', 'B');