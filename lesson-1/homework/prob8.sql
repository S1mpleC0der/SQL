CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) CHECK (title <> ''),
    price DECIMAL(10,2) CHECK (price > 0),
    genre VARCHAR(255) DEFAULT 'Unknown'
);

INSERT INTO books (title, price, genre) VALUES ('Book A', 15.99, 'Fiction');
INSERT INTO books (title, price) VALUES ('Book B', 20.00);
INSERT INTO books (title, price, genre) VALUES ('', 10.00, 'Drama');
INSERT INTO books (title, price) VALUES ('Book C', -5.00);

