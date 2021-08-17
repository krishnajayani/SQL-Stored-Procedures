--1) A basic guide to stored procedures – show you how to create, execute, modify, and drop a stored procedure in SQL Server.

-- Following SELECT statment returns alist of products from the products table in the BikeStores database.
select product_name, list_price from production.products order by product_name;


-- To create stored procedure that wraps this query, we use CREATE PROCEDURE statement
CREATE PROCEDURE uspProductList
AS BEGIN
SELECT
product_name, list_price
FROM
production.products
ORDER BY
product_name;
END;
-- We can see this stored procedure in BikeStores -> Programmability-> Stored Procedures
-- To execute this stored procedure
EXECUTE uspProductList;

-- To modify SP, use ALTER PROCEDURE (simply right click stored procedure name and select Modify menu name and modify the SP
-- To delete the SP, use DROP PROCEDURE or DROP PROC