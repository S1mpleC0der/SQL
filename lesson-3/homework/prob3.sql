SELECT Category, ProductName, Price,
       CASE 
           WHEN Stock = 0 THEN 'Out of Stock'
           WHEN Stock BETWEEN 1 AND 10 THEN 'Low Stock'
           ELSE 'In Stock'
       END AS InventoryStatus
FROM Products P1
WHERE Price = (SELECT MAX(Price) FROM Products P2 WHERE P2.Category = P1.Category)
ORDER BY Price DESC
OFFSET 5 ROWS;