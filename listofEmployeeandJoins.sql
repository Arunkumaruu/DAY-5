-- Create a new database
CREATE DATABASE company;

-- Use the new database
USE company;

-- departments table
CREATE TABLE departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- employees table
CREATE TABLE employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

--  employers table
CREATE TABLE employers (
    employer_id INT IDENTITY(1,1) PRIMARY KEY,
    employer_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- Insert data into departments
INSERT INTO departments (department_name) VALUES ('Sales'), ('Marketing'), ('HR'), ('IT');

-- Insert data into employees
INSERT INTO employees (first_name, last_name, department_id, hire_date) VALUES
('John', 'Doe', 1, '2023-01-15'),
('Jane', 'Smith', 1, '2023-02-20'),
('Alice', 'Johnson', 2, '2023-03-10'),
('Bob', 'Williams', 3, '2023-04-05'),
('Charlie', 'Brown', 3, '2023-05-12'),
('David', 'Wilson', 4, '2023-06-22');

-- Insert data into employers
INSERT INTO employers (employer_name, department_id) VALUES
('MegaCorp', 1),
('Marketing Pro', 2),
('HR Solutions', 3),
('Techies Inc.', 4);

--list of employees
SELECT d.department_name, COUNT(e.employee_id) AS number_of_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY  d.department_name;

--inner Join

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

--left join
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

--right join

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

--fuller outer join

SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id



--self join
SELECT e1.first_name AS Employee1, e2.first_name AS Employee2, d.department_name
FROM employees e1
INNER JOIN employees e2 
    ON e1.department_id = e2.department_id 
    AND e1.employee_id <> e2.employee_id
INNER JOIN departments d 
    ON e1.department_id = d.department_id;












