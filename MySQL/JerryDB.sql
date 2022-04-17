-- MYSQL Course from Beginner to Expert
show databases;
show tables;


-- Learn : MySQL Practice

create database lab2Practice;
create table test(i int, c char(1));

use lab2Practice;
describe test;

alter table test drop i;
alter table test add i int;
alter table test add numbers int first;
desc test;

alter table test add anyC char(1) after c;
alter table test change anyC anyP bigint;
alter table test change anyP anyP int;
desc test;

use lab2Practice;
alter table test modify numbers bigint not null default 100;
alter table test modify c char(1) NOT NULL default 'S';
alter table test rename to db_sec_G;
desc db_sec_G;


-- -- Learn : MySQL Insert

create table teachers(tid int primary key,tname char(11));
desc teachers;

create table courses(cid int, cname char (11),primary key (cid));
desc courses;

create table students(
	sid int primary key,
	sname char(11),
    teacher_id int
    -- 外鍵foreign key (teacher_id) references teachers(tid) 
);
desc students;

alter table teachers add course_id int;
-- 外鍵alter table teachers ADD FOREIGN KEY (course_id) REFERENCES courses(cid);
desc courses;

insert into students values(1,'Asad',1);
insert into students values(2,'Ali',1);
insert into teachers values(1,'Sir',1);
insert into teachers values(2,'Sir',1),(3,'Ali',1);
insert into courses(cname,cid)values('DBT',3);

select * from courses;
select * from teachers;
select * from students;

-- Learn : MySQL Operation

create table customer (cid int primary key, CustomerName varchar(20),
ContactName varchar(20),Address varchar(20),City varchar(20),
PostalCode varchar(20),Country varchar(20));
describe customer;

insert into customer values (1,'Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany');
insert into customer values (2,'LALA','Massams','taxes Str. 57','London','13309','UK');
insert into customer values (3,'Bottom-Dollar','Elizabeth','Cerrito Str. 57','London','13309','Germany');
insert into customer values (4,'Liza','Mona','Cerrito Str. 57','Tsawassen','14444','Canada');
insert into customer values (5,'Harry','Lazim','Telli Str. 57','Bern','3012','Switzerland');
insert into customer values (6,'Trump','Harry','Taxes Str. 57','México D.F.','3012','Mexico');
select * from customer;

set sql_safe_updates=0;
UPDATE Customer SET ContactName = 'Talha', City= 'Lahore' WHERE cid = 2;
delete from customer where ContactName = 'Talha';
select * from customer;


-- Learn : MySQL Like

create table customer (cid int primary key, CustomerName varchar(20),
ContactName varchar(20),Address varchar(20),City varchar(20),
PostalCode varchar(20),Country varchar(20));
describe customer;

insert into customer values (7,'Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany');
insert into customer values (8,'LALA','Massams','taxes Str. 57','London','13309','UK');
insert into customer values (9,'Bottom-Dollar','Elizabeth','Cerrito Str. 57','London','13309','Germany');
insert into customer values (10,'Liza','Mona','Cerrito Str. 57','Tsawassen','14444','Canada');
insert into customer values (11,'Harry','Lazim','Telli Str. 57','Bern','3012','Switzerland');
insert into customer values (12,'Trump','Harry','Taxes Str. 57','México D.F.','3012','Mexico');
select * from customer;

SELECT  Country FROM Customer;
SELECT  CustomerName,Country FROM Customer;
SELECT DISTINCT Country FROM Customer;
SELECT * FROM Customer WHERE PostalCode = 3012;
SELECT * FROM Customer WHERE PostalCode > 3012;
SELECT * FROM Customer WHERE PostalCode >= 3012;
SELECT * FROM Customer WHERE PostalCode <> 14444;
SELECT * FROM Customer WHERE PostalCode != 14444;

SELECT * FROM Customer WHERE Country='Germany' AND City='karachi';
SELECT * FROM Customer WHERE City='karachi' OR City='London';
SELECT * FROM Customer WHERE Country='Germany' OR Country='Canada';
SELECT * FROM Customer WHERE NOT Country='Germany';
SELECT * FROM Customer WHERE Country='Germany' AND (City='karachi' OR City='London');
SELECT * FROM Customer WHERE NOT Country='Germany' AND  Country <>'Switzerland';
SELECT * FROM Customer WHERE PostalCode BETWEEN 3012 AND 14444;
SELECT * FROM Customer WHERE City IN ('karachi','London');

SELECT * FROM Customer WHERE City LIKE 'L%';
SELECT * FROM Customer WHERE City LIKE '%n';
SELECT * FROM Customer WHERE City LIKE 'L%n';
SELECT * FROM Customer WHERE City LIKE 'L_____%';


-- Learn : MySQL Aggregation
use lab2Practice;
CREATE TABLE CUSTOMERS(
	ID INT , 
    NAME VARCHAR (20) ,
    AGE  INT,
    ADDRESS  CHAR (25) ,
    SALARY   DECIMAL (18, 2),
    PRIMARY KEY (ID)
    );
    
CREATE TABLE ORDERS(
	OID int primary key,
    ODATE date,
    CUSTOMER_ID int, 
    AMOUNT int(20)
    -- foreign key (CUSTOMER_ID) references CUSTOMERS(ID)
	);

create table customer_detail(
	CD int primary key,
    salary int(20),
    ID int
    -- foreign key (ID) references CUSTOMERS(ID)
    );

desc customers;
desc orders;
desc customer_detail;

insert into customer_detail values(111,20000,1);
insert into customer_detail values(112,50000,2);
insert into customer_detail values(113,550000,3);
insert into customer_detail values(114,66000,4);
insert into customer_detail values(115,32000,5);
insert into customer_detail values(116,45000,6);
insert into customer_detail values(117,88000,7);
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (6, 'Komal', 22, 'MP', 4500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)VALUES (7, 'khan', 45, 'Lahore', 5000.00 );
INSERT INTO ORDERS (OID,ODATE,CUSTOMER_ID,AMOUNT)VALUES (101,'2009-11-20',2,1560);
INSERT INTO ORDERS (OID,ODATE,CUSTOMER_ID,AMOUNT)VALUES (102,'2019-11-20',3,1400);
INSERT INTO ORDERS (OID,ODATE,CUSTOMER_ID,AMOUNT)VALUES (103,'2020-10-11',3,2000);
INSERT INTO ORDERS (OID,ODATE,CUSTOMER_ID,AMOUNT)VALUES (104,'2020-10-11',4,4000);


select * from ORDERS;
select * from CUSTOMERS;

SELECT * FROM customers WHERE name LIKE '%n';
SELECT * FROM Customers WHERE name LIKE '%a%';
SELECT * FROM Customers WHERE name LIKE 'kh__';
SELECT * FROM Customers WHERE name LIKE 'k______';
SELECT * FROM Customers WHERE name LIKE '_ha_';
SELECT * FROM Customers WHERE address LIKE '_ahore';

SELECT id,name FROM customers WHERE id IN(select CUSTOMER_ID from orders );
SELECT CUSTOMER_ID FROM orders ;
SELECT * FROM CUSTOMERS WHERE ADDRESS IN ('Lahore', 'karachi', 'Delhi');
SELECT * FROM CUSTOMERS WHERE ADDRESS='Lahore' or ADDRESS='Delhi' or ADDRESS='karachi';
SELECT * FROM customers WHERE age between 40 and 50; 

select c.name,c.id from customers c , orders o where o.customer_id=c.id ;
select c.name,c.id from customers c , orders o where c.id=o.customer_id ;
select c.name,c.id from customers c , orders o;

select salary*1.1 as new_salary from customers;
select salary+200 as new_salary from customers;

SELECT * FROM CUSTOMERS LIMIT 3;
SELECT * FROM CUSTOMERS order by ID  LIMIT 3;
SELECT * FROM CUSTOMERS order by ID desc LIMIT 3;
SELECT * FROM CUSTOMERS WHERE ID <= 3;
SELECT * FROM CUSTOMERS WHERE ID = 4 and AGE=25;
SELECT * FROM CUSTOMERS WHERE ID = 1 or  AGE=25;

SELECT MIN(SALARY) AS Poor FROM customers;
SELECT MAX(SALARY) AS Rich FROM customers;
SELECT sum(SALARY) AS sum FROM customers;
SELECT AVG(SALARY) AS Average FROM customers;
SELECT count(SALARY) AS number_of_customers FROM customers;
SELECT NAME, SUM(SALARY) FROM CUSTOMERS GROUP BY NAME;
SELECT CUSTOMER_ID, SUM(AMOUNT) FROM orders GROUP BY CUSTOMER_ID;
SELECT CUSTOMER_ID, MAX(AMOUNT) FROM orders WHERE AMOUNT IN(SELECT  SUM(AMOUNT) FROM orders GROUP BY CUSTOMER_ID);
SELECT CUSTOMER_ID, MIN(AMOUNT) FROM orders WHERE AMOUNT IN(SELECT  SUM(AMOUNT) FROM orders GROUP BY CUSTOMER_ID);


-- Learn : MySQL joins
select * from CUSTOMERS;
select * from ORDERS;
select * from customer_detail;

SELECT  Customers.ID,Orders.OID, Orders.ODate FROM Orders JOIN Customers ON Orders.CUSTOMER_ID=Customers.ID;
SELECT  Customers.ID,Orders.OID, Orders.ODate FROM Orders INNER JOIN Customers ON Orders.CUSTOMER_ID=Customers.ID;

SELECT  Customers.ID,customers.NAME,Orders.OID, Orders.ODate FROM Customers 
LEFT JOIN orders ON Customers.ID=Orders.CUSTOMER_ID;

SELECT  Customers.ID,customers.NAME,Orders.OID, Orders.ODate FROM orders 
LEFT JOIN  Customers ON Customers.ID=Orders.CUSTOMER_ID;

SELECT  Customers.ID,customers.NAME,Orders.OID, Orders.ODate FROM Customers 
RIGHT JOIN orders ON Customers.ID=Orders.CUSTOMER_ID;

SELECT  Customers.ID,customers.NAME,Orders.OID, Orders.ODate FROM Customers 
RIGHT JOIN orders ON Customers.ID=Orders.CUSTOMER_ID;

#MULTI Tables Inner joins
SELECT  Customers.ID,Orders.OID, Orders.ODate, customer_detail.salary FROM Orders 
INNER JOIN Customers INNER JOIN customer_detail 
ON Orders.CUSTOMER_ID=Customers.ID and Customers.ID=customer_detail.ID 
where customer_detail.salary > 50000;

SELECT  Customers.ID,customers.NAME FROM customer_detail 
full JOIN  Customers ;
SELECT  Customers.ID,customers.NAME FROM orders 
full JOIN  Customers ;



-- Learn : MySQL groupby. if create can pass create process

show tables;
select * from ORDERS;
select * from CUSTOMERS;

SELECT NAME, SUM(SALARY) FROM CUSTOMERS 
GROUP BY NAME;

SELECT CUSTOMER_ID, SUM(AMOUNT) FROM orders 
GROUP BY CUSTOMER_ID;


-- Learn : MySQL INBETWEEN. if create can pass create process
show tables;
select * from ORDERS;
select * from CUSTOMERS;

SELECT * FROM CUSTOMERS
WHERE ADDRESS IN ('Lahore', 'karachi', 'Delhi');

SELECT * FROM CUSTOMERS
WHERE ADDRESS='Lahore' or ADDRESS='Delhi' or ADDRESS='karachi';

select * from customers 
where age between 40 and 50; 

select salary*1.1 as new_salary from customers;
select salary+200 as new_salary from customers;

SELECT * FROM CUSTOMERS LIMIT 3;
SELECT * FROM CUSTOMERS order by ID  LIMIT 3;
SELECT * FROM CUSTOMERS order by ID desc LIMIT 3;

SELECT * FROM CUSTOMERS WHERE ID <= 3;
SELECT * FROM CUSTOMERS WHERE ID = 4 and AGE=25;
SELECT * FROM CUSTOMERS WHERE ID = 1 or  AGE=25;

SELECT MIN(SALARY) AS Poor FROM customers;
SELECT MAX(SALARY) AS Rich FROM customers;
SELECT sum(SALARY) AS sum FROM customers;
SELECT AVG(SALARY) AS Average FROM customers;
SELECT count(SALARY) AS number_of_customers FROM customers;
SELECT NAME, SUM(SALARY) FROM CUSTOMERS GROUP BY NAME;
SELECT CUSTOMER_ID, SUM(AMOUNT) FROM orders GROUP BY CUSTOMER_ID;



-- Learn : Nested --
create database lab2Airport;
use lab2Airport;
CREATE TABLE flights(flno INT , flight_from varchar(20) ,flight_to varchar(20),distance  int(25) ,departs time,arrives time,PRIMARY KEY (flno),aid int,foreign key (aid) references Aircraft(aid));
CREATE TABLE Aircraft(aid INT , aname varchar(20) ,cruisingrange  int(25) ,PRIMARY KEY (aid));
create table employees (eid int,ename varchar(20),salary int(10),primary key(eid));
CREATE TABLE Certified(eid int,aid int,foreign key (eid) references employees(eid),foreign key (aid) references Aircraft(aid));

insert into flights values(1,'Bonn','Madras',200,'01:20:00','02:20:00',5);
insert into flights values(3,'Bonn','Madras',200,'01:20:00','02:20:00',4);
insert into flights values(2,'Lahore','London',200,'01:20:00','02:20:00',2);
insert into Aircraft values(1,'PIA',2000);
insert into Aircraft values(2,'emirates',2000);
insert into Aircraft values(3,'Qatar',2000);
insert into Aircraft values(4,'AirBlue',3000);
insert into Aircraft values(5,'Saudi',5000);
insert into Aircraft values(6,'Boeing',9000);
insert into employees values(1,'Ali',200000);
insert into employees values(2,'Ahmad',50000);
insert into employees values(3,'Arshad',10000);
insert into employees values(4,'Talha',400000);
insert into employees values(5,'Ahsan',70000);
insert into employees values(6,'Osama',100000000);
insert into Certified values(1,1);
insert into Certified values(1,2);
insert into Certified values(1,3);
insert into Certified values(2,1);
insert into Certified values(2,5);
insert into Certified values(5,4);
insert into Certified values(2,6);
select * from Aircraft;
select * from flights;
select * from employees;
select * from Certified;


-- Learn : MySQL Views

CREATE TABLE `fruits` (
  `fruit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fruit_name` varchar(45) NOT NULL,
  `inventory` smallint(5) NOT NULL,
  `unit_id` tinyint(3) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_updated` timestamp NOT NULL,
  PRIMARY KEY (`fruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `units` (
  `unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(45) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_updated` timestamp NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Units VALUES 
(1,'Piece','2018-08-17 13:30:00','2018-08-17 13:30:00'),
(2,'Kilogram','2018-08-17 13:30:00','2018-08-17 13:30:00'),
(3,'Gram','2018-08-17 13:30:00','2018-08-17 13:30:00'),
(4,'Pound','2018-08-17 13:30:00','2018-08-17 13:30:00'),
(5,'Ounce','2018-08-17 13:30:00','2018-08-17 13:30:00'),
(6,'Bunch','2018-08-17 13:30:00','2018-08-17 13:30:00'),
(7,'Container','2018-08-17 13:30:00','2018-08-17 13:30:00');
	
INSERT INTO Fruits VALUES 
(1,'Apple',10,1,'2018-08-17 13:30:00','2018-08-17 13:30:00'),
(2,'Orange',5,2,'2018-08-17 13:30:00','2018-08-17 13:30:00'),
(3,'Banana',20,6,'2018-08-17 13:30:00','2018-08-17 13:30:00'),
(4,'Watermelon',10,1,'2018-08-17 13:30:00','2018-08-17 13:30:00'),
(5,'Grapes',15,6,'2018-08-17 13:30:00','2018-08-17 13:30:00'),
(6,'Strawberry',12,7,'2018-08-17 13:30:00','2018-08-17 13:30:00');


-- ## CREATE VIEW 
CREATE VIEW vFruitsInventory AS -- CREATE OR REPLACE VIEW vfruitsInventory AS
SELECT 
    Fruits.fruit_name,
    Fruits.Inventory,
    Units.unit_name
FROM
	Fruits INNER JOIN units ON
    Fruits.unit_Id = Units.Unit_Id;

Select * From lab2Practice.vFruitsInventory;
    
-- modify
ALTER VIEW vFruitsInventory AS
SELECT 
	Fruits.Fruit_Id,
    Fruits.Fruit_Name,
    Fruits.Inventory,
    Units.Unit_Name
FROM
	Fruits INNER JOIN Units ON
    Fruits.Unit_Id = Units.Unit_Id;
    
DROP VIEW lab2Practice.vFruitsInventory ;
Select * From lab2Practice.vFruitsInventory;

-- ## CREATE PROCEDURE 
DELIMITER //   	-- 更換完結點為 //
CREATE PROCEDURE spCheckFruitStock(thisFruit SMALLINT)
BEGIN
	SELECT 
		Fruits.Fruit_Name, 
		Fruits.Inventory, 
		Units.Unit_Name
	FROM 
		Fruits INNER JOIN Units ON
		Fruits.Unit_Id = Units.Unit_Id
	WHERE 
		Fruits.Fruit_Id = thisFruit;  -- 此處需要用到;
END //.  -- 使用完結點 //
DELIMITER ; -- 更換回 ; DELIMITER 改編定義，輸入較多的語句且句中包含分號，此時就要換成其他符號如//、$$或者;;。

-- modify
DELIMITER //
CREATE PROCEDURE spCheckFruitStock(thisFruit SMALLINT)
BEGIN
	SELECT 
		Fruits.Fruit_Id, 
		Fruits.Fruit_Name, 
		Fruits.Inventory, 
		Units.Unit_Name
	FROM 
		Fruits INNER JOIN Units ON
		Fruits.Unit_Id = Units.Unit_Id
	WHERE 
		Fruits.Fruit_Id = thisFruit;
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS spCheckFruitStock;


-- Advance
DELIMITER //
CREATE PROCEDURE spCheckFruitStockLevel(
	IN pFruit_Id SMALLINT(5),
    OUT pStockLevel VARCHAR(6))
BEGIN
	DECLARE stockNumber SMALLINT;
	SELECT 
		Fruits.Inventory into stockNumber
	FROM 
		Fruits INNER JOIN Units ON
		Fruits.Unit_Id = Units.Unit_Id
	WHERE 
		Fruits.Fruit_Id = pFruit_Id;
	IF stockNumber > 10 THEN
		SET pStockLevel = 'High';
    ELSEIF (stockNumber <= 10 AND stockNumber >= 5) THEN
		SET pStockLevel = 'Medium';
    ELSEIF (stockNumber < 5) THEN
		SET pStockLevel = 'Low - Please Replace Now!';
	END IF;
END
DELIMITER ;

DROP PROCEDURE IF EXISTS spCheckFruitStockLevel;

## Co-related Query
SELECT e.eid,e.ename
FROM employees e WHERE EXISTS
 (SELECT * FROM Certified WHERE Certified.eid = e.eid and e.ename LIKE 'A%');

#INNER Query
SELECT eid,ename
FROM employees WHERE employees.eid IN 
(SELECT Certified.eid FROM Certified WHERE employees.ename LIKE 'A%');

#Cross product
select distinct e.eid, e.ename from employees e , Certified c 
where e.eid=c.eid and e.ename LIKE 'A%';

#INNER JOIN
SELECT distinct  employees.eid, employees.ename  FROM employees INNER JOIN Certified 
ON employees.eid=Certified.eid where employees.ename LIKE 'A%';


select c.eid from employees e ,Certified c,Aircraft a where 
e.eid=c.eid and a.aid=c.aid and a.aname='Boeing';

select e.ename from employees e ,Certified c,Aircraft a where 
e.eid=c.eid and a.aid=c.aid and a.aname='Boeing';

select a.aid from Aircraft a , flights f where 
f.aid=a.aid and f.flight_from='Bonn' and f.flight_to='Madras';

alter table flights add eid int;
desc flights;

alter table flights add foreign key (eid) references employees(eid);
UPDATE flights SET eid =4 WHERE flno = 1;
UPDATE flights SET eid =5 WHERE flno = 2;
UPDATE flights SET eid =6 WHERE flno = 3;
select * from flights;
select * from flights f , employees e where f.eid=e.eid and e.salary > 1000000;

select e.ename from employees e ,Certified c,Aircraft a where 
e.eid=c.eid and a.aid=c.aid and a.cruisingrange > 3000 and not a.aname ='Boeing';

SELECT E.ENAME AS PILOTS FROM EMPLOYEES E WHERE E.EID 
IN(SELECT C.EID FROM CERTIFIED C WHERE C.AID IN(SELECT A.AID FROM AIRCRAFT A WHERE A.cruisingrange >3000 AND A.ANAME!='BOEING'));

select e.eid from employees e where 
e.salary = (select max(salary) from employees);

select e.eid from employees e where 
e.salary = (SELECT salary FROM (SELECT salary FROM Employees ORDER BY salary DESC LIMIT 2) AS Emp ORDER BY salary LIMIT 1); 

select c.eid,count(c.eid) from employees e ,Certified c,Aircraft a where 
e.eid=c.eid and a.aid=c.aid group by c.eid ;

select eid FROM Certified GROUP BY eid HAVING COUNT(EID) 
IN (SELECT MAX(count_return.EmpID) FROM (SELECT COUNT(EID) as EmpID FROM CERTIFIED GROUP BY EID) as count_return);

select c.eid from employees e ,Certified c,Aircraft a where 
e.eid=c.eid and a.aid=c.aid group by c.eid having count(c.eid)=3;

select sum(salary) as total_amount_paid from employees;



