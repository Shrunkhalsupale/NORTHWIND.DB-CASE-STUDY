-- 1. WHICH SHIPPERS DO WE HAVE?
-- We have a table called Shippers. Return all the fields from all the shippers

select shipper_id,company_name,phone
from northwind_db.shippers;

-- 2. CERTAIN FIELD FROM CATEGORIES TABLE?
-- In the Categories table, selecting all the fields using this SQL:

Select DISTINCT category_name,description
from NORTHWIND_DB.Categories;

-- 3. SALES REPRESENTATIVES
-- We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. Write a SQL statement that returns only those employees.

Select first_name, last_name, hire_date
from northwind_db.employees
where title= 'sales representative';

-- 4. SALES REPRESENTATIVES IN THE UNITED STATES
-- Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, and also are in the United States

select first_name, last_name, hire_date
from northwind_db.employees
where title= 'sales representative' and country='USA'

--  5. ORDERS PLACED BY SPECIFIC EMPLOYEE ID
-- Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven Buchanan) is 5.

select order_id 
from northwind_db.orders
where employee_id="5";

-- 6. SUPPLIERS AND CONTACTTITLES
-- In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager

select supplier_id, contact_name, contact_title
from northwind_db.suppliers
where contact_title!="Marketing manager";

-- 7. PRODUCTS WITH "QUESO" IN PRODUCT NAME
-- In the products table, we’d like to see the ProductID and ProductName for those products where the ProductName includes the string “queso”.

select product_id, product_name
from northwind_db.products
where product_name like "Queso%";

-- 8. ORDERS SHIPPING TO FRANCE OR BELGIUM
-- Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the orders from any Latin American country. 
-- But we don’t have a list of Latin American countries in a table in the Northwind database.
-- So, we’re going to just use this list of Latin American countries that happen to be in the Orders table: Brazil Mexico Argentina Venezuela 

select order_id
from northwind_db.orders
where ship_country= 'FRANCE' OR ship_country= 'BRAZIL';

-- 9. ORDER SHIPPING TO ANY COUNTRY IN LATIN AMERICA 
-- Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.

select order_id, customer_id, order_date, ship_country
from northwind_db.orders
where ship_country in('BRAZIL', 'MEXICO', 'ARGENTINA', 'VENEZUELA');

-- 10. EMPLOYEES, IN ORDER OF AGE
-- For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first.

select first_name, last_name, title, birth_date
from northwind_db.employees
order by birth_date DESC;

-- 11. SHOWING ONLY THE DATE WITH A DATE TIME FIELD
-- In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field.

select FIRST_NAME, LAST_NAME, title, birth_date
from northwind_db.employees
order by birth_date desc;

-- 12. EMPLOYEES FULL NAME
-- Show the FirstName and LastName columns from the Employees table, and then create a new column called FullName, showing FirstName and LastName joined together in one column, with a space in-between.

select EMPLOYEE_ID, CONCAT (FIRST_NAME,LAST_NAME) AS NAME
from northwind_db.employees

-- 13. ORDER DETAILS AMOUNT PER LINE ITEM
-- In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that multiplies these two together. We’ll ignore the Discount field for now.
-- In addition, show the OrderID, ProductID, UnitPrice, and Quantity.Order by OrderID and ProductID.

select order_id, product_id, unit_price, quantity
(unit_price*quantity) AS 'total_price'
FROM Northwind_db.order_details
order by order_id and product_id;

-- 14. HOW MANY CUSTOMERS?
-- How many customers do we have in the Customers table? Show one value only, and don’t rely on getting the recordcount at the end of a
-- resultset.

select
COUNT(customer_id)
from NORTHWIND_DB.customers;

-- 15. WHEN WAS THE FIRST ORDER?
-- Show the date of the first order ever made in the Orders table.

select min(order_date)
from northwind_db.orders;

-- 16. COUNTRIES WHERE THERE ARE CUSTOMERS
-- Show a list of countries where the Northwind company has customers.

select distinct(country)
from northwind_db.customers;

-- 17. CONTACT TITLES FOR CUSTOMERS
-- Show a list of all the different values in the Customers table for ContactTitles. Also include a count for each ContactTitle.
-- This is similar in concept to the previous question “Countries where there are customers”, except we now want a count for each ContactTitle.

SELECT contact_title,
(customer_id) as total
FROM northwind_db.customers
group by contact_title;

-- 18. PRODUCTS WITH ASSOCIATED SUPPLIER NAMES
-- We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID.
-- This question will introduce what may be a new concept, the Join clause in SQL. The Join clause is used to join two or more relational database
-- tables together in a logical way. Here’s a data model of the relationship between Products and Suppliers.

select product_id, product_name,company_name
from northwind_db.products
inner join northwind_db.suppliers 
where products.supplier_id=suppliers.supplier_id;

-- 19. ORDERS AND THE SHIPPER THAT WAS USED
-- We’d like to show a list of the Orders that were made, including the Shipper that was used. Show the OrderID, OrderDate (date only), and
-- CompanyName of the Shipper, and sort by OrderID. In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.

select orders.order_id, 
       orders.order_date,
       shippers.shipper_id,
       shippers.company_name,
company_name as shipper
from northwind_db.orders
join northwind_db.shippers
on orders.shipper_id=shippers.shipper_id
and order_id< "10300";



