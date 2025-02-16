CREATE TABLE data_types_demo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    description TEXT,
    price DECIMAL(10,2),
    DOB DATETIME,
    flag BIT,
    file_data VARBINARY(MAX),
    weight FLOAT,
    category CHAR(10),
    big_int BIGINT
);

INSERT INTO data_types_demo
(name, description, price, DOB, flag, file_data, weight, category, big_int)
VALUES
('Laptop', 'Gaming and Design', 1099.99, GETDATE(), 1, NULL, 1.5, 'Electronics', 2782927222),
('Laptop', 'Gaming and Design', 1099.99, GETDATE(), 1, NULL, 1.5, 'Electronics', 2782927222),
('Laptop', 'Gaming and Design', 1099.99, GETDATE(), 1, NULL, 1.5, 'Electronics', 2782927222),
('Laptop', 'Gaming and Design', 1099.99, GETDATE(), 1, NULL, 1.5, 'Electronics', 2782927222);

SELECT * FROM data_types_demo;