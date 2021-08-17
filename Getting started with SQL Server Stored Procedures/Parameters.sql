-- B) Stored Procedure Parameters
-- in this, i will extend the stored procedure which allows you to pass one or more values to it.
-- The result of the SP will change based on the values of the parameters.

-- creating SP with one parameter
-- following query retunrs a product list from the products table
SELECT * FROM production.products;

SELECT
product_name, list_price
FROM
production.products
ORDER BY
model_year ASC;


-- create a stored procedure
CREATE PROC uspFindProducts
AS
BEGIN
SELECT
product_name, list_price
FROM
production.products
ORDER BY
list_price;
END;
-- Add parameter to the stored procedure to find the products whose list prices are greater than an input price
ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL)
AS
BEGIN
SELECT
product_name,
list_price
FROM
production.products
WHERE 
list_price >= @min_list_price
ORDER BY
list_price;
END;
--in this, i added a parameter named @min_list_price to the uspFindProducts SP
--parameter starts with @ sign
-- AS DECIMAL specify the data type

-- To execute the SP
EXEC uspFindProducts 100;
-- returns all products whose list prices are >= 100


-- Stored procedure with multi parameter
ALTER PROCEDURE uspFindProducts(
	@min_list_price AS DECIMAL
	,@max_list_price AS DECIMAL

)
AS
Begin
SELECT
	product_name, list_price
	FROM
	production.products
	WHERE
	list_price >= @min_list_price AND
	list_price <= @max_list_price
	ORDER BY
	list_price;
END;

EXEC uspFindProducts 900, 1000;

-- We can also add the @name parameter as a character string
ALTER PROCEDURE uspFindProducts(
	@min_list_price AS DECIMAL
	,@max_list_price AS DECIMAL
	,@name AS VARCHAR(max)

)
AS
Begin
SELECT
	product_name, list_price
	FROM
	production.products
	WHERE
	list_price >= @min_list_price AND
	list_price <= @max_list_price AND
	product_name LIKE '%'+ @name +'%'
	ORDER BY
	list_price;
END;

EXEC uspFindProducts 
	@min_list_price = 900,
	@max_list_price = 1000,
	@name = 'Trek'


--There is also one parameter named as Optinal parameter, that is we give some default values to the parameter. 
--so, no need to give values at the execution everytime
ALTER PROCEDURE uspFindProducts(
	@min_list_price AS DECIMAL = 500
	,@max_list_price AS DECIMAL = 1000
	,@name AS VARCHAR(max)

)
AS
Begin
SELECT
	product_name, list_price
	FROM
	production.products
	WHERE
	list_price >= @min_list_price AND
	list_price <= @max_list_price AND
	product_name LIKE '%'+ @name +'%'
	ORDER BY
	list_price;
END;

EXEC uspFindProducts
@name = 'Trek'