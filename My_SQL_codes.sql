/*
SQL 
*/

-- basic structure 
SELECT CustomerKey as CustomerID, SUM(SalesAmount) as SalesAmount
FROM FactInternetSales
WHERE year(OrderDate) > 2010
GROUP BY CustomerKey
HAVING SUM(SalesAmount) > 10000
ORDER BY SalesAmount Desc 


-- select from 
-- select all 
SELECT * 
FROM FactInternetSales
-- select specific columns
SELECT SalesOrderNumber AS InvoiceNumber, 
OrderDate 
FROM FactInternetSales


-- use where to filter rows 
SELECT SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SalesTerritoryKey 
FROM FactInternetSales
-- WHERE SalesTerritoryKey = 6 
WHERE SalesOrderNumber = "5051182"


-- use group by to combine rows 
SELECT SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SUM(SalesAmount)AS InvoiceSubTotal, 
SUM(TaxAmt) AS TaxAmount, 
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesOrderNumber = "5051182"

GROUP BY SalesOrderNumber, OrderDate 


-- use HAVING to filter grouped rows 
SELECT SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SUM(SalesAmount)AS InvoiceSubTotal, 
SUM(TaxAmt) AS TaxAmount, 
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesOrderNumber = "5051182"

GROUP BY SalesOrderNumber, OrderDate 
HAVING SUM(SalesAmount) > 1000


-- Order of operations: SELECT is excuted much later 


-- use ORDER BY sort query rows 
SELECT SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SUM(SalesAmount)AS InvoiceSubTotal, 
SUM(TaxAmt) AS TaxAmount, 
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesOrderNumber = "5051182"

GROUP BY SalesOrderNumber, OrderDate 
HAVING SUM(SalesAmount) > 1000

ORDER BY InvoiceSubTotal DESC 
-- ASC 


-- filter rows top N 
SELECT TOP(10)
SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SUM(SalesAmount)AS InvoiceSubTotal, 
SUM(TaxAmt) AS TaxAmount, 
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesOrderNumber = "5051182"

GROUP BY SalesOrderNumber, OrderDate 
HAVING SUM(SalesAmount) > 1000

ORDER BY InvoiceSubTotal DESC 
-- ASC 


-- filter rows top N PERCENT 
SELECT TOP(10) PERCENT
SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SUM(SalesAmount)AS InvoiceSubTotal, 
SUM(TaxAmt) AS TaxAmount, 
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesOrderNumber = "5051182"

GROUP BY SalesOrderNumber, OrderDate 
HAVING SUM(SalesAmount) > 1000

ORDER BY InvoiceSubTotal DESC 
-- ASC 


-- filter rows OFFSET FETCH 
SELECT
SalesOrderNumber AS InvoiceNumber, 
OrderDate, 
SUM(SalesAmount)AS InvoiceSubTotal, 
SUM(TaxAmt) AS TaxAmount, 
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesOrderNumber = "5051182"

GROUP BY SalesOrderNumber, OrderDate 
HAVING SUM(SalesAmount) > 1000

ORDER BY InvoiceSubTotal DESC 

OFFSET 2 ROWS FROM NEXT 10 ROWS ONLY 


-- filter rows DISTINCT 
SELECT DISTINCT CustomerKey
FROM FactInternetSales
ORDER BY CustomerKey


SELECT CustomerKey
FROM FactInternetSales
ORDER BY SalesAmount



/*
Exercise 1a 
create a list of product costs, grouped by invoice numbers.
1. write a query to return InvoiceNumber and TotalProductCost from the FactInternetSales.
2. return only invoices that HAVE a total product cost per InvoiceNumber > 2000. 
Hint: you first need to group by the invoice to get the total and then filter. 

*/

SELECT
SalesOrderNumber AS InvoiceNumber, 
SUM(TotalProductCost) AS TotalProductCost 
FROM FactInternetSales

GROUP BY SalesOrderNumber

HAVING SUM(TotalProductCost) > 2000

ORDER BY TotalProductCost DESC 


/*
Exercise 1b 
we need a detailed list of invoices and invoice line numbers, but we are only interested in currency key 100. 
1. write a query to return InvoiceNumber, InvoiceLineNumber and SalesAmount from the FactInternetSales.
2. return only lines WHERE the currency key is 100. 
Hint: since line number is the lowest level of detail in the FactInternetSales table, you won't need to use GROUP BY. 

*/


-- use where to filter rows 
SELECT 
SalesOrderNumber AS InvoiceNumber, 
InvoiceLineNumber AS InvoiceLineNumber, 
SalesAmount AS SalesAmount
FROM FactInternetSales

WHERE CurrencyKey = 100


/*
Exercise 1c 
we have a new data analyst in the team who wants to see a unique list of sales territory keys. This will help her to better understand the database. 
1. write a query to return the sales territory column from the FactInternetSales table. 
2. return a unique list of territories only. 
3. order the results alphabetically for ease. 
*/

SELECT DISTINCT SalesTerritoryKey AS SalesTerritoryKey
FROM FactInternetSales
ORDER BY SalesTerritoryKey ASC


/*
module 3 manipulating values with functions 
aggregate functions: SUM, AVG, COUNT, MAX, MIN 
*/




