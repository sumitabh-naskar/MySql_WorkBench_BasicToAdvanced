CREATE DATABASE Advanced_sql;
USE Advanced_sql;

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1,'Keyboard','Electronics',1200),
(2,'Mouse','Electronics',800),
(3,'Chair','Furniture',2500),
(4,'Desk','Furniture',5500);

CREATE TABLE Sales(
SaleID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1,1,4,'2024-01-05'),
(2,2,10,'2024-01-06'),
(3,3,2,'2024-01-10'),
(4,4,1,'2024-01-11');


-- Q6. Write a CTE to calculate the total revenue for each product 
-- (Revenues = Price × Quantity), and return only products where  revenue > 3000.

WITH ProductRevenue AS (
    SELECT p.ProductName, (p.Price * s.Quantity) AS Revenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
)
SELECT * FROM ProductRevenue
WHERE Revenue > 3000;


-- Q7. Create a view named  vw_CategorySummary that shows:
-- Category, TotalProducts, AveragePrice.

CREATE VIEW vw_CategorySummary AS
SELECT 
    Category, 
    COUNT(ProductID) AS TotalProducts, 
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

-- Q8. Create an updatable view containing ProductID, ProductName, and Price.
-- Then update the price of ProductID = 1 using the view.

-- Create the view
CREATE VIEW vw_ProductUpdates AS
SELECT ProductID, ProductName, Price
FROM Products;

-- Update the price using the view
UPDATE vw_ProductUpdates
SET Price = 1300
WHERE ProductID = 1;

-- Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category.

DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN catName VARCHAR(50))
BEGIN
    SELECT * FROM Products
    WHERE Category = catName;
END //
DELIMITER ;

--  Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new
-- table ProductArchive. The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.

-- The archive table structure
CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- The trigger
DELIMITER //
CREATE TRIGGER trg_AfterProductDelete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price);
END //
DELIMITER ;

