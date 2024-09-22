--Replace Null values with 'Default' using COALESCE

SELECT ProductID,
Name AS ProductName,
COALESCE(Color, 'Not Available') As Color
FROM [Production].[Product];
--WHERE Color IS NULL;

-- Avoid Division by Zero using NULLIF
SELECT ProductID,
Name AS ProductName,
ListPrice,
StandardCost,
ListPrice / NULLIF(StandardCost, 0)  As PriceToCostRatio
FROM [Production].[Product];

--Check for Null values and Use Default Value with ISNULL
SELECT ProductID,
Name AS ProductName,
ISNULL(Color, 'Not Available') As Color
FROM [Production].[Product];
--WHERE Color IS NULL;

--Handle Multiple Nullable Columns using COALESCE
SELECT ProductID,
Name AS ProductName,
COALESCE(Color, Name, 'Not Available') As Color
FROM [Production].[Product];

--calculation with default values using COALESCE
SELECT COALESCE(SUM(LineTotal), 0) AS TotalSales  FROM [Sales].[SalesOrderDetail];

--cases
SELECT ProductID,
Name AS ProductName,
CASE
	WHEN Color IS NULL THEN Name
	WHEN Color IS NULL AND NAME IS NULL THEN 'Not Available'
	ELSE Color
END As Color
FROM [Production].[Product];

--Complex Case Statement
WITH OrderStatus AS
(
SELECT 
	ProductID,
--	LineTotal As OrderAmount,
	SUM(LineTotal) AS TotalOrderAmountByProduct,
	STDEV(LineTotal) AS StDevOrderAmount
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID)

SELECT 
	OrderSt.*,
	CASE
		WHEN TotalOrderAmountByProduct > 10000 THEN 'HIGH SALES'
		WHEN TotalOrderAmountByProduct BETWEEN 5000 AND 10000 THEN 'MEDIUM SALES'
		ELSE 'LOW SALES'
	END AS SalesStatus
	
FROM OrderStatus OrderSt;



