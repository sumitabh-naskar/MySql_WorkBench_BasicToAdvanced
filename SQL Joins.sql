CREATE DATABASE joins_assignment;
USE joins_assignment;

CREATE TABLE Customers(
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(50));

INSERT INTO Customers(CustomerID,CustomerName,City) VALUES
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');

CREATE TABLE Orders(
OrderID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Amount INT);

INSERT INTO Orders(OrderID,CustomerID,OrderDate,Amount) VALUES
(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-10',450),
(105,6,'2024-10-12',400);

CREATE TABLE Payments(
PaymentID VARCHAR(10) PRIMARY KEY,
CustomerID INT,
PaymentDate DATE,
Amount INT);

INSERT INTO Payments(PaymentID,CustomerID,PaymentDate,Amount) VALUES
('P001',1,'2024-10-02',250),
('P002',2,'2024-10-06',300),
('P003',3,'2024-10-11',450),
('P004',4,'2024-10-15',200);

CREATE TABLE Employees(
EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
EmployeeName VARCHAR(50),
ManagerID INT);

INSERT INTO Employees(EmployeeID,EmployeeName,ManagerID) VALUES
(1,'Alex Green',NULL),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);

-- Question 1.
-- Retrieve all customers who have placed at least one order.

SELECT Customers.CustomerID,Customers.CustomerName,Customers.City,
Orders.OrderID,Orders.CustomerID,Orders.OrderDate,Orders.Amount FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Question 2. 
-- Retrieve all customers and their orders, including customers who have not placed any orders.

SELECT Customers.CustomerID,Customers.CustomerName,Customers.City,
Orders.OrderID,Orders.CustomerID,Orders.OrderDate,Orders.Amount FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Question 3.
 -- Retrieve all orders and their corresponding customers, including orders placed by unknown 
-- customers.

SELECT Customers.CustomerID,Customers.CustomerName,Customers.City,
Orders.OrderID,Orders.CustomerID,Orders.OrderDate,Orders.Amount FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Question 4.
-- Display all customers and orders, whether matched or not.

SELECT Customers.CustomerID,Customers.CustomerName,Customers.City,
Orders.OrderID,Orders.CustomerID,Orders.OrderDate,Orders.Amount FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID,Customers.CustomerName,Customers.City,
Orders.OrderID,Orders.CustomerID,Orders.OrderDate,Orders.Amount FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Question 5.
--  Find customers who have not placed any orders.

SELECT Customers.CustomerID,Customers.CustomerName,Customers.City,
Orders.OrderID,Orders.CustomerID,Orders.OrderDate,Orders.Amount
FROM Customers LEFT JOIN Orders ON 
Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;

-- Question 6.
-- Retrieve customers who made payments but did not place any orders.

SELECT *
FROM Customers INNER JOIN Payments ON Customers.CustomerID = Payments.CustomerID
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;

-- Question 7.
-- Generate a list of all possible combinations between Customers and Orders.

SELECT * FROM Customers CROSS JOIN Orders;

-- Question 8.
-- Show all customers along with order and payment amounts in one table.

SELECT Customers.CustomerID,Customers.CustomerName,
Customers.City,SUM(Orders.Amount) AS TotalOrderAmount,SUM(Payments.Amount)
AS TotalPaymentAmount FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Payments ON Customers.CustomerID = Payments.CustomerID
GROUP BY Customers.CustomerID,Customers.CustomerName,Customers.City
ORDER BY Customers.CustomerID;

-- Question 9.
-- Retrieve all customers who have both placed orders and made payments.

SELECT *
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Payments ON Customers.CustomerID = Payments.CustomerID;

-- OR

SELECT DISTINCT Customers.CustomerID,Customers.CustomerName,Customers.City 
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Payments ON Customers.CustomerID = Payments.CustomerID
ORDER BY Customers.CustomerID;
 
-- This will show only the Names of Distinct Customers who have both placed orders and 
-- made payments without any other details.


