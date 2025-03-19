
CREATE TABLE #EmployeeTransfers (
    EmployeeID INT,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);


INSERT INTO #EmployeeTransfers (EmployeeID, Name, Department, Salary)
SELECT 
    EmployeeID,
    Name,
    CASE 
        WHEN Department = 'HR' THEN 'IT'
        WHEN Department = 'IT' THEN 'Sales'
        WHEN Department = 'Sales' THEN 'HR'
    END AS Department,
    Salary
FROM Employees;


SELECT * FROM #EmployeeTransfers;



DECLARE @MissingOrders TABLE (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);


INSERT INTO @MissingOrders
SELECT OrderID, CustomerName, Product, Quantity
FROM Orders_DB1
WHERE OrderID NOT IN (SELECT OrderID FROM Orders_DB2);


SELECT * FROM @MissingOrders;



CREATE VIEW vw_MonthlyWorkSummary AS
SELECT 
    EmployeeID, 
    EmployeeName, 
    Department, 
    SUM(HoursWorked) AS TotalHoursWorked,
    NULL AS TotalHoursDepartment,  -- Placeholder for department summary
    NULL AS AvgHoursDepartment  -- Placeholder for department summary
FROM WorkLog
GROUP BY EmployeeID, EmployeeName, Department

UNION ALL

SELECT 
    NULL AS EmployeeID, 
    NULL AS EmployeeName, 
    Department, 
    NULL AS TotalHoursWorked, 
    SUM(HoursWorked) AS TotalHoursDepartment, 
    AVG(HoursWorked) AS AvgHoursDepartment
FROM WorkLog
GROUP BY Department;


SELECT * FROM vw_MonthlyWorkSummary;
