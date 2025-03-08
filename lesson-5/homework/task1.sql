create table Employees (
	employeeID int primary key,
	name varchar(50),
	department varchar(50),
	salary decimal(10, 2),
	hireDate date
);

insert into Employees (employeeID, name, department, salary, hireDate) values
(1, 'Alice Johnson', 'HR', 55000.00, '2020-06-15'),
(2, 'Bob Smith', 'IT', 75000.00, '2019-09-23'),
(3, 'Charlie Brown', 'Finance', 68000.00, '2021-03-10'),
(4, 'David Williams', 'Marketing', 62000.00, '2018-12-05'),
(5, 'Emma Davis', 'IT', 80000.00, '2017-07-19'),
(6, 'Frank Miller', 'Sales', 57000.00, '2022-01-28'),
(7, 'Grace Lee', 'HR', 53000.00, '2023-04-12'),
(8, 'Henry Wilson', 'Finance', 70000.00, '2020-11-08'),
(9, 'Isabella Moore', 'Marketing', 60000.00, '2021-09-15'),
(10, 'Jack White', 'IT', 82000.00, '2016-05-30'),
(11, 'Kelly Green', 'Sales', 58000.00, '2022-07-20'),
(12, 'Liam Adams', 'HR', 56000.00, '2019-02-14'),
(13, 'Mia Carter', 'Finance', 69000.00, '2023-01-05'),
(14, 'Noah Baker', 'Marketing', 63000.00, '2018-11-27'),
(15, 'Olivia Scott', 'Sales', 59000.00, '2017-06-03');

select * from Employees;

--1st
select employeeID, name, department, salary,
	rank() over (order by salary desc) as RankSalary
from Employees;

--2nd
WITH RankedEmployees AS (
    SELECT EmployeeID, Name, Department, Salary, 
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT * 
FROM RankedEmployees
WHERE SalaryRank IN (
    SELECT SalaryRank 
    FROM RankedEmployees
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
);

--3rd
SELECT EmployeeID, Name, Department, Salary
FROM (
    SELECT EmployeeID, Name, Department, Salary, 
           RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
) Ranked
WHERE SalaryRank <= 2;

--4th
SELECT EmployeeID, Name, Department, Salary
FROM (
    SELECT EmployeeID, Name, Department, Salary, 
           RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS SalaryRank
    FROM Employees
) Ranked
WHERE SalaryRank = 1;

--5th
SELECT EmployeeID, Name, Department, Salary, 
       SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Employees;

--6th
SELECT EmployeeID, Name, Department, Salary, 
       SUM(Salary) OVER (PARTITION BY Department) AS TotalDepartmentSalary
FROM Employees;

--7th
SELECT EmployeeID, Name, Department, Salary, 
       AVG(Salary) OVER (PARTITION BY Department) AS AvgDepartmentSalary
FROM Employees;

--8th
SELECT EmployeeID, Name, Department, Salary, 
       Salary - AVG(Salary) OVER (PARTITION BY Department) AS SalaryDifference
FROM Employees;

--9th
SELECT EmployeeID, Name, Salary, 
       AVG(Salary) OVER (ORDER BY EmployeeID 
                         ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAverage
FROM Employees;

--10th
SELECT SUM(Salary) 
FROM (
    SELECT Salary 
    FROM Employees 
    ORDER BY HireDate DESC 
    OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY
) AS Last3;

--11th
SELECT EmployeeID, Name, Salary, 
       AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningAverage
FROM Employees;

--12th
SELECT EmployeeID, Name, Salary, 
       MAX(Salary) OVER (ORDER BY EmployeeID 
                         ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS MaxSalaryWindow
FROM Employees;


--13th
SELECT EmployeeID, Name, Department, Salary, 
       (Salary * 100.0) / SUM(Salary) OVER (PARTITION BY Department) AS SalaryPercentage
FROM Employees;
