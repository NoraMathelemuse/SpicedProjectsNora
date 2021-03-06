--
--1. Get the names and quantities in stock for each product.
--

SELECT quantity_per_unit, product_name 
FROM products
WHERE discontinued !=FALSE
LIMIT 55;

--
--2. Get a list of current products (productId and name)
--

SELECT product_id, product_name, discontinued
FROM products
WHERE discontinued = FALSE
LIMIT 55;

--
--3. Get a list of the most expensive products (name and unit price) 
--

SELECT product_name, MAX(unit_price) highest_unit_price
FROM products
GROUP BY product_name
ORDER BY highest_unit_price
LIMIT 55;

--
--3.1 Get a list of the least expensive products (name and unit price)
--

SELECT product_name, MIN(unit_price) lowest_unit_price
FROM products
GROUP BY product_name
ORDER BY lowest_unit_price
LIMIT 55;

--
--4. Get products that cost less than 20€
--

SELECT product_name, unit_price
FROM products
WHERE unit_price<20
LIMIT 55;

--
--5. Get products that cost between 15 and 25€
--

SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 15 AND 25
LIMIT 55;

--
--6.Get products above average price. 
--

SELECT *
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
LIMIT 55;

--
--7. Find the ten most expensive products
--

SELECT product_name, MAX(unit_price) max_unit_price
FROM products
GROUP BY product_name
ORDER BY max_unit_price
LIMIT 10;

--
--8. Get a list of discontinued products (Product id and name)
--

SELECT product_id, product_name
FROM products
WHERE discontinued = TRUE
LIMIT 55;

--
--9. Count current and discontinued products

SELECT  discontinued, COUNT(discontinued)
FROM products
GROUP BY  discontinued;


--
--10. Find products with less units in stock than the quantity on order.
--

SELECT product_name, units_in_stock, units_on_order
FROM products
WHERE units_in_stock < units_on_order
LIMIT 55;

--
--11. Find the customer who had the highest order amount 
--

SELECT MAX(order_details.quantity), customers.contact_name, order_details.order_id --, orders.order_id, orders.customer_id, customers.customer_id,
FROM order_details
FULL JOIN orders ON order_details.order_id = orders.order_id
    FULL JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY order_details.order_id, customers.contact_name
LIMIT 1;

--
--12. Get orders for a given employee and the according customer. 
--

SELECT orders.employee_id, employees.employee_id, employees.first_name, employees.last_name, customers.contact_name, customers.customer_id, orders.customer_id, products.product_name, products.product_id, order_details.product_id, orders.order_id, order_details.order_id
FROM orders 
FULL JOIN employees ON orders.employee_id = employees.employee_id
   FULL JOIN customers ON orders.customer_id = customers.customer_id
        FULL JOIN order_details ON orders.order_id = order_details.order_id
            FULL JOIN products ON order_details.product_id = products.product_id
ORDER BY orders.customer_id
LIMIT 20;

 





--13. Find the hiring age of each employee ERROR!!
--
SELECT employee_id, first_name, last_name AS employee
(CAST(hire_date) as TIMESTAMP )-(CAST(birth_date) as TIMESTAMP) as VARCHAR(10)
FROM employees
--GROUP BY employee_id
--ORDER BY
LIMIT 10;

--
--14. Create views and/or names queries for some of these queries
--

CREATE VIEW employee_sales AS(
SELECT orders.employee_id, employees.employee_id, employees.first_name, employees.last_name, customers.contact_name, customers.customer_id, orders.customer_id, products.product_name, products.product_id, order_details.product_id, orders.order_id, order_details.order_id
FROM orders 
FULL JOIN employees ON orders.employee_id = employees.employee_id
   FULL JOIN customers ON orders.customer_id = customers.customer_id
        FULL JOIN order_details ON orders.order_id = order_details.order_id
            FULL JOIN products ON order_details.product_id = products.product_id
ORDER BY orders.customer_id
LIMIT 20);