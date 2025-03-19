CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);

WITH AllDays AS (
    SELECT 0 AS Num FROM generate_series(1, 7) -- Adding 7 missing days with 0 shipments
    UNION ALL
    SELECT Num FROM Shipments
),
Ranked AS (
    SELECT Num, ROW_NUMBER() OVER (ORDER BY Num) AS rn
    FROM AllDays
)
SELECT AVG(Num) AS Median
FROM Ranked
WHERE rn IN (20, 21);
