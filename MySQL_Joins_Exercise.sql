/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name FROM products
 LEFT Join categories ON categories.CategoryID = products.CategoryID
 where products.CategoryID = 1 or categories.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating FROM products
LEFT JOIN reviews ON reviews.ProductID = products.ProductID
where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.LastName, employees.EmployeeID, SUM(sales.Quantity) as QuantitySold FROM bestbuy.employees
LEFT JOIN sales ON sales.EmployeeID = employees.EmployeeID
GROUP BY employees.LastName, employees.EmployeeID
ORDER BY QuantitySold DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name as Department, categories.Name as Category from categories
INNER JOIN departments ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, sum(sales.Quantity) as NumSold, sum(sales.Quantity * sales.PricePerUnit) as TotalPrice FROM products
 LEFT JOIN sales on sales.ProductID = products.ProductID
 WHERE products.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM products
LEFT JOIN reviews on reviews.ProductID = products.ProductID
WHERE products.Name = 'Visio TV' 
GROUP BY products.Name
order by Rating;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.employeeID, employees.FirstName, employees.LastName, products.Name as ProductName, SUM(sales.Quantity)  FROM employees
LEFT JOIN sales on sales.EmployeeID = employees.EmployeeID
LEFT JOIN products on products.ProductID = sales.ProductID
GROUP BY  employees.EmployeeID, products.ProductID
Order by LastName;

