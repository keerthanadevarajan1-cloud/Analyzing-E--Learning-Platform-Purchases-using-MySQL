-- Create Database
CREATE DATABASE elearning_db;
USE elearning_db;

-- Create learners table
CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Create purchases table
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert learners
INSERT INTO learners VALUES
(1, 'Keerthana D', 'India'),
(2, 'Rahul Sharma', 'India'),
(3, 'John Smith', 'USA'),
(4, 'Maria Garcia', 'Spain'),
(5, 'Li Wei', 'China');

-- Insert courses
INSERT INTO courses VALUES
(101, 'SQL Basics', 'Data Analytics', 500.00),
(102, 'Python Programming', 'Programming', 800.00),
(103, 'Excel for Business', 'Productivity', 400.00),
(104, 'Machine Learning', 'Data Analytics', 1200.00),
(105, 'Web Development', 'Programming', 900.00);

-- Insert purchases
INSERT INTO purchases VALUES
(1, 1, 101, 1, '2025-03-01'),
(2, 1, 102, 2, '2025-03-05'),
(3, 2, 103, 1, '2025-03-07'),
(4, 3, 104, 1, '2025-03-10'),
(5, 4, 101, 3, '2025-03-12'),
(6, 5, 105, 1, '2025-03-15'),
(7, 2, 102, 1, '2025-03-18'),
(8, 3, 101, 2, '2025-03-20');

--PART 2: Data Exploration Using Joins
--INNER JOIN
SELECT 
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_revenue,
    p.purchase_date
FROM purchases p
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
ORDER BY total_revenue DESC;

--LEFT JOIN
SELECT 
    l.full_name,
    c.course_name,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount
FROM learners l
LEFT JOIN purchases p ON l.learner_id = p.learner_id
LEFT JOIN courses c ON p.course_id = c.course_id;

--RIGHT JOIN
SELECT 
    c.course_name,
    l.full_name,
    p.quantity
FROM purchases p
RIGHT JOIN courses c ON p.course_id = c.course_id
LEFT JOIN learners l ON p.learner_id = l.learner_id;

--3. Analytical Queries
--Q1: Total Spending per Learner
SELECT 
    l.full_name,
    l.country,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name, l.country
ORDER BY total_spent DESC;

--Q2: Top 3 Most Purchased Courses
SELECT 
    c.course_name,
    SUM(p.quantity) AS total_quantity
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_name
ORDER BY total_quantity DESC
LIMIT 3;

--Q3: Category Revenue & Unique Learners
SELECT 
    c.category,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category;

--Q4: Learners Purchasing from Multiple Categories
SELECT 
    l.full_name
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name
HAVING COUNT(DISTINCT c.category) > 1;

--Q5: Courses Not Purchased
SELECT 
    c.course_name
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;

