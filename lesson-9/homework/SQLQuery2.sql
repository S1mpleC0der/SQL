CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

WITH EmployeeHierarchy AS (
    SELECT EmployeeID, ManagerID, JobTitle, 0 AS Depth
    FROM Employees
    WHERE ManagerID IS NULL  -- President (root)

    UNION ALL

    SELECT e.EmployeeID, e.ManagerID, e.JobTitle, eh.Depth + 1
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT * FROM EmployeeHierarchy;


WITH FactorialCTE AS (
    SELECT 1 AS Num, 1 AS Factorial
    UNION ALL
    SELECT Num + 1, Factorial * (Num + 1)
    FROM FactorialCTE
    WHERE Num < 10  -- Change 10 to N for other values
)
SELECT * FROM FactorialCTE;


WITH FibonacciCTE AS (
    SELECT 1 AS n, 1 AS Fibonacci_Number
    UNION ALL
    SELECT 2 AS n, 1 AS Fibonacci_Number
    UNION ALL
    SELECT n + 1, f1.Fibonacci_Number + f2.Fibonacci_Number
    FROM FibonacciCTE f1
    JOIN FibonacciCTE f2 ON f1.n = f2.n - 1
    WHERE f1.n < 9  -- Change 9 to (N-1) for other values
)
SELECT * FROM FibonacciCTE;
