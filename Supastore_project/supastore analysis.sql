CREATE DATABASE SuperstoreAnalysis;
GO

USE SuperstoreAnalysis;
GO

CREATE TABLE Superstore (
    Ship_Mode VARCHAR(50),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code INT,
    Region VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(10,4),
    Profit DECIMAL(10,4)
);
GO

-- Verify import worked
SELECT TOP 20 *
FROM Superstoredata;

-- Explore the dataset
SELECT COUNT(*) AS Total_Rows
FROM Superstoredata;

-- See unique categories
SELECT DISTINCT Category
FROM Superstoredata;

-- See regions
SELECT DISTINCT Region
FROM Superstoredata;

-- Check for nulls
SELECT *
FROM Superstoredata
WHERE Sales IS NULL
   OR Profit IS NULL;

-- Total records
SELECT COUNT(*) AS Total_Transactions
FROM Superstoredata;

-- Total sales and total profit
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstoredata;

-- Product categories
SELECT DISTINCT Category
FROM Superstoredata;

-- Sales by category
SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM Superstoredata
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Profit by category
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM Superstoredata
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Regional Analysis
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM Superstoredata
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Profit by region
SELECT 
    Region,
    SUM(Profit) AS Total_Profit
FROM Superstoredata
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Average profit by discount level
SELECT 
    Discount,
    AVG(Profit) AS Avg_Profit
FROM Superstoredata
GROUP BY Discount
ORDER BY Discount;

-- Loss-making transactions
SELECT COUNT(*) AS Loss_Making_Orders
FROM Superstoredata
WHERE Profit < 0;

-- Loss-making subcategories
SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM Superstoredata
GROUP BY Sub_Category
ORDER BY Total_Profit ASC;

-- Top 10 states by sales
SELECT TOP 10
    State,
    SUM(Sales) AS Total_Sales
FROM Superstoredata
GROUP BY State
ORDER BY Total_Sales DESC;

-- Top 10 cities by profit
SELECT TOP 10
    City,
    SUM(Profit) AS Total_Profit
FROM Superstoredata
GROUP BY City
ORDER BY Total_Profit DESC;