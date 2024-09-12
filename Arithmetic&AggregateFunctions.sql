 -- Calculate the unit price after applying discount
 -- Calculate the total sales amount for each detail line
 -- Join the Product table to get standard cost
 -- Calculate the profit
WITH SalesData As
(
SELECT
    p.ProductID,
    p.Name AS ProductName,
    sod.SalesOrderID,
    sod.OrderQty AS QuantitySold,
    sod.UnitPrice AS OriginalUnitPrice,
    sod.UnitPriceDiscount AS Discount,
    p.StandardCost AS ProductStandardCost,
	(sod.UnitPrice - sod.UnitPriceDiscount) AS UnitPriceAfterDiscount,
	sod.OrderQty * (sod.UnitPrice - sod.UnitPriceDiscount) AS TotalSalesAmount,
	(sod.OrderQty * (sod.UnitPrice - sod.UnitPriceDiscount)) - (sod.OrderQty * p.StandardCost) AS Profit

FROM
    Sales.SalesOrderDetail sod
    INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
    INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE
    soh.OrderDate BETWEEN '2004-01-01' AND '2015-12-31')

--ORDER BY
--sod.SalesOrderID, p.ProductID ASC)

Select 
/*ProductID,
ProductName,
SUM(TotalSalesAmount) AS TotalSalesbyProduct,
AVG(TotalSalesAmount) AS AverageSalesbyProduct,
MAX(TotalSalesAmount) AS MaxSalesAmountbyProduct,
MIN(TotalSalesAmount) AS MinSalesAmountbyProduct*/
SalesOrderID, COUNT(*) As Duplicate
From SalesData
GROUP BY ProductID, SalesOrderID
HAVING COUNT(*) > 1;
