CREATE TABLE student(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    classes INT,
    tuition_per_class DECIMAL(10,2),
    total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student (name, classes, tuition_per_class)
VALUES
('Alomat', 5, 150.00),
('Farrux', 4, 170.55),
('Gulsanam', 7, 130.45);

SELECT * FROM student;