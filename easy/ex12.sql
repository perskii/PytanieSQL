-- Find order details made by Jill and Eva.
-- Consider the Jill and Eva as first names of customers.
-- Output the order date, details and cost along with the first name.
-- Order records based on the customer id in ascending order.


-- Tables: customers, orders


------customers

-- id: int
-- first_name: varchar
-- last_name: varchar
-- city: varchar
-- address: varchar
-- phone_number: varchar


------orders

-- id: int
-- cust_id: int
-- order_date: datetime
-- order_details: varchar
-- total_order_cost: int

SELECT first_name, order_date, order_details,total_order_cost FROM orders as A
    JOIN customers AS K ON K.id = A.cust_id
    WHERE K.first_name LIKE 'Jill' || K.first_name LIKE 'Eva'