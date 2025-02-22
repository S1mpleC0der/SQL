SELECT TOP 5 Department, 
       AVG(Salary) AS AverageSalary,
       CASE 
           WHEN Salary > 80000 THEN 'High'
           WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees
WHERE Salary IN (SELECT TOP 10 PERCENT Salary FROM Employees ORDER BY Salary DESC)
GROUP BY Department, Salary
ORDER BY AverageSalary DESC
OFFSET 2 ROWS;
