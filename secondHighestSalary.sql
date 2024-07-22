create database employee
use employee

CREATE TABLE employee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert  data
INSERT INTO employee (name, position, salary) VALUES
('Alice', 'Manager', 90000.00),
('Bob', 'Developer', 80000.00),
('Charlie', 'Developer', 85000.00),
('David', 'Designer', 75000.00),
('Eve', 'Manager', 95000.00);

SELECT * from employee
-- second highest salary
SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
