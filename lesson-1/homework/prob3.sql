CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATE
);

ALTER TABLE orders DROP CONSTRAINT PK_orders;
ALTER TABLE orders ADD CONSTRAINT PK_orders PRIMARY KEY (order_id);