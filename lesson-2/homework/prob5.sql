CREATE TABLE worker(
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

BULK INSERT worker
FROM 'F:\SQL\SQL_Homeworks\lesson-2\homework\workers.csv'
WITH(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

SELECT * FROM worker