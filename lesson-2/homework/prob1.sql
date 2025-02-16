CREATE TABLE test_identity(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO test_identity(name) VALUES
    ('John'),
    ('Doe'),
    ('Carla'),
    ('Alice'),
    ('David');

SELECT * FROM test_identity;

DELETE FROM test_identity WHERE id=3;
SELECT * FROM test_identity;

TRUNCATE TABLE test_identity;
SELECT * FROM test_identity;

INSERT INTO test_identity(name) VALUES ('Alomat');
SELECT * FROM test_identity;

DROP TABLE test_identity;
