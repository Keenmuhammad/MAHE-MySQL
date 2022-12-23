use sys; -- Selects database.

drop table Customers;-- Deletes table.

CREATE TABLE Customers -- Creates table.
(CustomerID int, 
CustomerName char (50),
ContactName char(50),
Address varchar(50),
City char (20),
PostalCode varchar (15),
Country char (20))
;

-- Inserts into a table. 
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
( 1,'Alfreds Futterkiste',	'Maria Anders',	'Obere Str. 57.', 'Berlin', '12209', 'Germany'),
(2,	'Ana Trujillo Emparedados y helados',	'Ana Trujillo',	'Avda. de la Constitución 2222', 'México D.F.',	'05021', 'Mexico'),
(3,	'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4,	'Around the Horn',	'Thomas Hardy',	'120 Hanover Sq.',	'London',	'WA1 1DP',	'UK'),
(5,	'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 	'Mannheim',	'68306', 'Germany'),
(7,	'Blondel père et fils',	'Frédérique Citeaux', '24, place Kléber',	'Strasbourg',	'67000',	'France'),
(8,	'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil, 67',	'Madrid', '28023', 'Spain'),
(9,	'Bon app',	'Laurence Lebihans', '12, rue des Bouchers',	'Marseille',	'13008', 'France'),
(10, 'Bottom-Dollar Marketse', 'Elizabeth Lincoln',	'23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada'),
(11, 'Bs Beverages',	'Victoria Ashworth', 'Fauntleroy Circus', 'London', 'EC2 5NT', 'UK'),
(12, 'Cactus Comidas para llevar',	'Patricio Simpson', 'Cerrito 333',	'Buenos Aires',	'1010',	'Argentina'),
(13, 'Centro comercial Moctezuma', 'Francisco Chang', 'Sierras de Granada 9993', 'México D.F.',	'05022', 'Mexico'),
(14, 'Chop-suey Chinese', 'Yang Wang', 'Hauptstr. 29',	'Bern',	'3012',	'Switzerland'),
(15, 'Comércio Mineiro', 'Pedro Afonso',	'Av. dos Lusíadas, 23',	'São Paulo', '05432-043', 'Brazil'),
(16, 'Consolidated Holdings', 'Elizabeth Brown', 'Berkeley Gardens 12 Brewery',	'London',	'WX1 6LT',	'UK'),
(17, 'Drachenblut Delikatessend', 'Sven Ottlieb', 'Walserweg 21', 'Aachen',	'52066', 'Germany'),
(18, 'Du monde entier',	'Janine Labrune', '67, rue des Cinquante Otages', 'Nantes',	'44000', 'France'),
(19, 'Eastern Connection', 'Ann Devon',	'35 King George', 'London',	'WX3 6FW',	'UK'),
(20, 'Ernst Handel', 'Roland Mendel', 'Kirchgasse 6',	'Graz',	'8010',	'Austria'),
(21, 'Piccolo und mehr', 'Georg Pipps',	'Geislweg 14', 'Salzburg', '5020', 'Austria'),
(22, 'Princesa Isabel Vinhoss',	'Isabel de Castro',	'Estrada da saúde n. 58', 'Lisboa', '1756',	'Portugal'),
(23, 'Que Delícia', 'Bernardo Batista',	'Rua da Panificadora, 12', 'Rio de Janeiro', '02389-673', 'Brazil'),
(24, 'Queen Cozinha', 'Lúcia Carvalho', 'Alameda dos Canàrios, 891', 'São Paulo', '05487-020', 'Brazil'),
(25, 'QUICK-Stop', 'Horst Kloss', 'Taucherstraße 10', 'Cunewalde',	'01307', 'Germany'),
(26, 'Die Wandernde Kuh', 'Rita Müller', 'Adenauerallee 900', 'Stuttgart', '70563', 'Germany'),
(27, 'Wartian Herkku', 'Pirkko Koskitalo', 'Torikatu 38', 'Oulu', '90110', 'Finland'),
(28, 'White Clover Markets', 'Karl Jablonski', '305 - 14th Ave. S. Suite 3B', 'Seattle', '98128', 'USA'),
(29, 'Wilman Kala', 'Matti Karttunen', 'Keskuskatu 45', 'Helsinki', '21240', 'Finland'),
(30, 'Wolski', 'Zbyszek', 'ul. Filtrowa 68', 'Walla', '01-012', 'Poland')
;

SELECT * FROM Customers; -- Shows all from.

SELECT CUSTOMERID, CustomerName, city from Customers; -- Shows selected columns.

SELECT CustomerID, Address, City, PostalCode from Customers;

SELECT COUNTRY from Customers;

SELECT DISTINCT COUNTRY from Customers; -- Shows no duplicate.

SELECT COUNT(DISTINCT Country) FROM Customers; -- Gives count of distinct values.

CREATE TABLE MIB LIKE Customers; -- Creates new table like an existing one
-- Inserts values just as in previous table. 
INSERT INTO MIB (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country 
FROM Customers
;

SELECT * FROM MIB;

SELECT * FROM Customers -- limits number of rows to be printed
LIMIT 5;

CREATE TABLE IB LIKE Customers; -- Creates new table like an existing one
-- Inserts values just as in previous table. 
INSERT INTO IB (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country 
FROM Customers
LIMIT 10; -- Limits the records inserted
SELECT * FROM IB;

ALTER TABLE IB -- alters table by adding columns
ADD(
Income int,
Rating char (20));

ALTER TABLE IB -- alters table by deleting columns
DROP Income,
DROP Rating ;

ALTER TABLE IB -- used to modify length and type of column
MODIFY COLUMN ContactName char (100);

ALTER TABLE IB -- changes name of a column
CHANGE COLUMN ContactName Contact_Name char(100);

UPDATE IB -- updates table by multiplying specified column by 2
SET 
CustomerID = CustomerID * 2
;

UPDATE IB as a  -- update cells with infor from another table
set Rating = (SELECT Country FROM Customers as b
where a.CustomerID = b.CustomerID)
;

update ib set Income ='1000' where CustomerName= 'Alfreds Futterkiste'; -- updates a particular cell
SELECT * FROM IB;
SELECT COUNT(Distinct country) from ib;

CREATE TABLE table22 (var1 int, var2 int, var3 int);

INSERT INTO table22 (var1, var2, var3)
VALUES
(100, 101, 100),
(1009, 10, 100),
(15, 09, 100),
(16, 90, 100),
(100, 200, 100),
(26, 22, 100),
(25, 10, 100);

SELECT avg(var1) -- calculates average
FROM table22
WHERE var1 IS NOT NULL;

Select * from table22;

CREATE TABLE table33 (var1 int, var2 char, var3 char, var4 decimal(10,2));
INSERT INTO table33
VALUES
(1, 'R', 'R', 4),
(2, 'G', 'R', 4.5),
(3, 'R', 'R', 3.5),
(4, 'G', 'G', 4.5),
(5, 'G', 'G', 4.5),
(6, 'G', 'R', 4);
SELECT * FROM table33;

ALTER TABLE table33
CHANGE COLUMN var1 Student int,
CHANGE COLUMN var2 var1 char,
CHANGE COLUMN var3 var2 char,
CHANGE COLUMN var4 var3 decimal(10,2);

SELECT var1, var2, avg(var3) as A from table33
GROUP BY var1, var2
HAVING A > 4;

Select * from ib;

SELECT * from IB -- orders in accending order
Order by CustomerName asc;

SELECT * from IB -- orders in decending order
Order by CustomerName desc;

SELECT var1, var2
FROM table22
where var1 IS NOT NULL;

SELECT * FROM TABLE22;

SELECT * FROM CUSTOMERS -- Select entry with Mexico as country only. 
WHERE Country = 'Mexico';

Select * from Customers
Where CustomerID = 15;

Select * from Customers
Where  not Country= 'Mexico';

SELECT * FROM Customers
WHERE City = 'Berlin'
AND Postalcode = 12209;

SELECT * FROM Customers
WHERE City = 'Berlin'
OR City = 'London';

