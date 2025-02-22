CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    category_id INT,
    CONSTRAINT FK_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

ALTER TABLE item DROP CONSTRAINT FK_category;
ALTER TABLE item ADD CONSTRAINT FK_category FOREIGN KEY (category_id) REFERENCES category(category_id);