--Total Sales by Product and Year
SELECT 
PROD.[Name] AS ProductName,
YEAR(HDR.[OrderDate]) AS OrderYear,
SUM([LineTotal]) AS TotalSales

FROM [Sales].[SalesOrderHeader] HDR
INNER JOIN [Sales].[SalesOrderDetail] DET
ON HDR.SalesOrderID = DET.SalesOrderID
INNER JOIN [Production].[Product] PROD
ON DET.ProductID = PROD.ProductID
GROUP BY PROD.[Name], YEAR(HDR.[OrderDate])
ORDER BY 1, 2;

--Top 5 Salespersons by Total Sales Amount in a Specific Year
SELECT TOP 5
PER.[FirstName] + ' ' + PER.[LastName] AS SalesPersonFullName,
SUM([LineTotal]) AS TotalSales
FROM [Sales].[SalesOrderHeader] HDR
JOIN [Sales].[SalesOrderDetail] DET
ON HDR.SalesOrderID = DET.SalesOrderID
JOIN [Sales].[SalesPerson] PERS
ON HDR.SalesPersonID = PERS.BusinessEntityID
JOIN [Person].[Person] PER
ON PERS.BusinessEntityID = PER.BusinessEntityID
WHERE YEAR(HDR.[OrderDate]) = 2014
GROUP BY PER.[FirstName] + ' ' + PER.[LastName]
ORDER BY SUM([LineTotal]) DESC;


--Sales Trend Analysis by Quarter

SELECT 
YEAR(HDR.[OrderDate]) AS OrderYear,
DATEPART(QUARTER, [OrderDate]) AS OrderQuarter,
SUM(DET.[LineTotal]) AS TotalSales
FROM [Sales].[SalesOrderHeader] HDR
JOIN [Sales].[SalesOrderDetail] DET
ON HDR.SalesOrderID = DET.SalesOrderID
GROUP BY YEAR(HDR.[OrderDate]),
DATEPART(QUARTER, [OrderDate])
ORDER BY 
OrderYear,2;

--Detailed Sales by Territory and Product
SELECT 
TER.[Name] AS TerritoryName,
PROD.[Name] AS ProductName,
SUM([LineTotal]) AS TotalSales
FROM [Sales].[SalesOrderHeader] HDR
JOIN [Sales].[SalesOrderDetail] DET
ON HDR.SalesOrderID = DET.SalesOrderID
JOIN [Sales].[SalesTerritory] TER
ON HDR.TerritoryID = TER.TerritoryID
JOIN [Production].[Product] PROD
ON DET.ProductID = PROD.ProductID
GROUP BY TER.[Name], PROD.[Name];

--Average Order Value by Customer
WITH AvgOrder AS
(
SELECT 
HDR.CustomerID,
PER.[FirstName] + ' ' + PER.[LastName] AS CustomerName,
COUNT(HDR.[SalesOrderID]) AS NumberofOrders,
SUM([LineTotal]) AS TotalSales
FROM [Sales].[SalesOrderHeader] HDR
JOIN [Sales].[SalesOrderDetail] DET
ON HDR.SalesOrderID = DET.SalesOrderID
JOIN [Person].[Person] PER
ON HDR.CustomerID = PER.BusinessEntityID
WHERE PER.PersonType = 'IN'
GROUP BY HDR.CustomerID, PER.[FirstName] + ' ' + PER.[LastName])
SELECT *,
TotalSales/ NULLIF(NumberofOrders, 0) AS AverageOrderValue
FROM AvgOrder;

--SELECT DISTINCT PersonType FROM [Person].[Person];

