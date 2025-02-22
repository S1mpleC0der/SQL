CREATE TABLE product (
    product_id INT UNIQUE,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);

ALTER TABLE product DROP CONSTRAINT UQ_product_product_id;
ALTER TABLE product ADD CONSTRAINT UQ_product_product_id UNIQUE (product_id);
ALTER TABLE product ADD CONSTRAINT UQ_product_name_id UNIQUE (product_id, product_name);
