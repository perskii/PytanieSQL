--Find the customer with the lowest daily total order cost between 2019-02-01 to 2019-05-01. If customer had less than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.


--For simplicity, you can assume that every first name in the dataset is unique.

-- table: customers
-- id: int
-- first_name: varchar
-- last_name: varchar
-- city: varchar
-- address: varchar
-- phone_number: varchar

-- table orders
-- id: int
-- cust_id: int
-- order_date: datetime
-- order_details: varchar
-- total_order_cost: int


SELECT
    K.first_name,
    H.order_date,
    SUM(H.total_order_cost) AS total_order_cost
    FROM customers AS K
    JOIN orders AS H
    ON H.cust_id = K.id
    WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY  cust_id, order_date
    LIMIT 1