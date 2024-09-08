
/*Person.Person – Contains information about individuals (e.g., employees).
Sales.SalesOrderHeader – Contains information about sales orders.
Sales.SalesOrderDetail – Contains details of each sales order.
Production.Product – Contains information about products.*/

--INNER JOIN
--Description: Returns only the rows where there is a match in both tables.
--Example Query: Suppose you want to find the sales orders along with the names of the individuals who made the orders.

SELECT p.FirstName, p.LastName, so.SalesOrderID, so.OrderDate
FROM Person.Person p
INNER JOIN Sales.SalesOrderHeader so ON p.BusinessEntityID = so.SalesPersonID;

-- LEFT JOIN (or LEFT OUTER JOIN)
-- Description: Returns all rows from the left table and matched rows from the right table. If there is no match, the result is NULL on the right side.
--Example Query: Find all sales orders and include the salesperson's name if available. Include orders even if they don't have a salesperson assigned.

SELECT so.SalesOrderID, so.OrderDate, p.FirstName, p.LastName
FROM Sales.SalesOrderHeader so
LEFT JOIN Person.Person p ON so.SalesPersonID = p.BusinessEntityID;

-- RIGHT JOIN (or RIGHT OUTER JOIN)
--Description: Returns all rows from the right table and matched rows from the left table. If there is no match, the result is NULL on the left side.
--Example Query: Find all products and any associated sales orders. Include products even if they have not been ordered.


SELECT p.Name, so.SalesOrderID
FROM Sales.SalesOrderHeader so
LEFT JOIN Sales.SalesOrderDetail sod 
ON sod.SalesOrderID = so.SalesOrderID
RIGHT JOIN Production.Product p
ON p.ProductID = sod.ProductID;

--FULL JOIN (or FULL OUTER JOIN)
--Description: Returns all rows when there is a match in either the left or right table. If there is no match, the result is NULL on the side without a match.
--Example Query: Find all products and all sales orders, including those without matches in either table.


SELECT p.Name, so.SalesOrderID
FROM Production.Product p
FULL JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
FULL JOIN Sales.SalesOrderHeader so ON sod.SalesOrderID = so.SalesOrderID;