drop table table1, table2;
CREATE TABLE table2 (
var1 char(2),
var2 int,
var3 date);
INSERT INTO table2
SET
Var1 = 'ab', var2 = 41, var3="2000-03-20";

select * from table1;

UPDATE table1 as a
SET var5 = (SELECT var1 FROM table2 as b
WHERE a.var1 =b.var1)
;


ALTER TABLE table1
ADD
(var4 int,
var5 char(2))
;
use sys;

CREATE TABLE table1 (
var1 char(2),
var2 int,
var3 date,
var4 char(10));

INSERT INTO table1
SET

Var1 = 'vw', var2 = null, var3="2010-12-30", var4 = 'OK'
;


SELECT * FROM table1;

SELECT COUNT(*)
FROM table1
;
SELECT COUNT(var1)
FROM table1
;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

SELECT COUNT(*) AS columns -- shows number of columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'table2'
;
SELECT DISTINCT(var1)
FROM table2;

-- To identify total number of missing values in a column
SELECT COUNT(*) as total,
COUNT(var2) as nonmissing,
COUNT(*) - COUNT(var2) as missing,
((COUNT(*) - COUNT(var2)) * 100) / COUNT(*) as 'perc_missing'
FROM table1
;

-- mean
SELECT AVG(var2)
FROM table2;

-- Standard deviation
SELECT STDDEV(var2)
FROM table2;

-- Minimum and Maximum
SELECT MIN(var2)
FROM table2;

SELECT MAX(var2)
FROM table2;

-- merging two tables one on top of another, union all will make union with repeated numbers in case there are some, union will just make union with unique values
SELECT var1, var2, var4 FROM table2 UNION ALL
SELECT var1, var2, var4 FROM table1
;

drop table table3, table4;

CREATE TABLE table3
(ID int, 
CUSTOMER_NAME char (20))
;
INSERT INTO table3 (ID, CUSTOMER_NAME)
VALUES 
(101, 'Muhammad'),
(102, 'Ibrahim'),
(103, 'Bello')
;

SELECT * FROM table3;

CREATE TABLE table4
(ID int, 
FRUIT char(20))
;
INSERT INTO table4 (ID, FRUIT)
VALUES
(101, 'APPLE'),
(102, 'MANGO'),
(103, 'ORANGE'),
(104, 'GRAPE')
;
SELECT * FROM table4;

SELECT a.ID, a.CUSTOMER_NAME, b.ID, b.FRUIT
FROM
table3 as a
LEFT JOIN
table4 as b
ON a.ID=b.ID
;
SELECT * FROM TABLE4;

SELECT a.ID, a.CUSTOMER_NAME, b.ID, b.FRUIT
FROM
table3 as a
RIGHT JOIN
table4 as b
ON a.ID=b.ID
;

SELECT a.ID, a.CUSTOMER_NAME, b.ID, b.FRUIT
FROM
table3 as a
INNER JOIN
table4 as b
ON a.ID=b.ID
;
SELECT * FROM table4;

CREATE TABLE table7
(ID int, 
TOWN char(20),
ZIP int)
;
INSERT INTO table7 (ID, TOWN, ZIP)
VALUES
(101, 'AZARE', 234),
(102, 'BAUCHI', 233),
(103, 'KANO', 234),
(104, 'GOMBE', 901),
(105, 'NULL', 234)
;
SELECT * FROM table7;
drop table table7;

ALTER TABLE table7
ADD PRIMARY KEY (TOWN);

ALTER TABLE table7
ADD UNIQUE index_name (ID, TOWN);

SHOW INDEX FROM table7;
use sys;

CREATE TABLE table8
(Customer_ID int, 
Customer_name char (20), 
Spend int, 
Region char (20));

INSERT INTO  table8 (Customer_ID, Customer_name, spend, Region)
VALUES
(100, 'Muhammad', 50, 'Bauchi'),
(101, 'Rambo', 60, 'Gombe'),
(102, 'Imu', 70, 'Kano'),
(103, 'Ali', 80, 'Doho'),
(104, 'Laila', 90, 'Chokel')
;

SELECT * FROM table8;

CREATE TABLE table9
(Customer_ID int,
Item_name char(10))
;
INSERT INTO table9 (Customer_ID, Item_name)
VALUES
(100, 'APPLE'),
(100, 'GRAPES'),
(101, 'ORANGE'),
(102, 'PINEAPPLE'),
(103, 'APPLE')
;

SELECT * from table8;

SELECT * from table8
WHERE Customer_ID in
(SELECT DISTINCT Customer_ID from table9)
;
CREATE TABLE table11
(Customer_ID int,
Spend int,
ZIP int)
;

INSERT INTO table11 (Customer_ID, Spend, ZIP)
VALUES
(100, 30, 30),
(100, 30, 30),
(101, 50, 45),
(102, 50, 50),
(103, 45, 20),
(105, null, 35)
;
SELECT * from table11;

CREATE TABLE table102
SELECT DISTINCT * from table11;

select * from table102;

UPDATE table11
SET spend = IFNULL(spend,40)
;
CREATE TABLE table12
(var1 int,
var2 int,
var3 int)
;

INSERT INTO table12 (var1, var2, var3)
VALUES
(100, 30, 30),
(100, 30, 30),
(101, 50, 45),
(102, 50, 50),
(103, 45, 20),
(105, null, 35),
(106, 45, 35),
(107, 20, 15),
(108, 50, 30),
(109, 80, 55),
(110, 75, 60),
(1500, 25, 30),
(1800, 45, 45)
;
SELECT * from table12
ORDER by var1;

SET @row:= 0;
SELECT var1, rank_new/@row as percentile
FROM
(SELECT var1, @row:= @row+1 as rank_new
FROM table12) as p;

SELECT var1,
CASE 
WHEN var2 < 25 THEN 1
WHEN var2 > 25 THEN 2
ELSE 3
END AS var4
FROM table12;
DROP TABLE table13;

CREATE TABLE table13
(ID int,
Jan int,
Feb int,
Mar int)
;

INSERT INTO table13 (ID, Jan, Feb, Mar)
VALUES
(100, 1000, 1000, 1000),
(101, NULL, 1500, 1500),
(102, 1700, 1700, 1700),
(103, NULL, NULL, 1800)
;
SELECT * from table13;
select *, coalesce(jan,feb,mar) as first_income from table13;

create table table14
(ID char(10),
income decimal(10,2));

INSERT INTO table14
VALUES
('MUHAMMAD', 3540.55),
('UMAR', 2740.4552)
;
SELECT * FROM table14;
;

SELECT * FROM table14;
SELECT UCASE (ID), LCASE (ID), MID(ID,2,2), LENGTH (ID), 
ROUND (income,1)
FROM
table14
;

use sys;

SELECT current_user;
RENAME USER 'root'@'localhost' TO 'Keenmuhammad'@'localhost'
;
use sys;
SELECT ROUND (TRUNCATE (MOD (2500, 20), -1), 2) FROM dual;

CREATE TABLE moh (var1 varchar (10));
insert into moh values ('123');
select * from moh;

SELECT * FROM table14;
SELECT DISTINCT ID FROM table14;
SELECT COUNT(DISTINCT ID) FROM table14;




