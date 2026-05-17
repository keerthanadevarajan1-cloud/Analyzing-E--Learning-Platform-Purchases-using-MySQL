#  📚 E-Learning Database Management System
An online learning platform sells various digital courses to learners across different countries. Each learner can purchase multiple courses, and each course belongs to a specific category. The management team wants to analyze purchase data to understand sales trends, learner behavior, and popular course categories.

## 📌 Project Overview

This project demonstrates the creation and analysis of an **E-Learning Database Management System** using MySQL.
The database stores information about learners, courses, and course purchases, enabling data analysis through SQL queries and joins.

The project covers:

* Database creation
* Table relationships
* Data insertion
* SQL joins
* Analytical queries
* Revenue and learner analysis

---

# 🎯 Project Objectives

* Design a relational database for an e-learning platform
* Establish relationships using foreign keys
* Perform data analysis using SQL joins
* Generate business insights from learner purchases
* Practice analytical SQL queries

---

# 🛠️ Technologies Used

* MySQL
* SQL (Structured Query Language)

---

# 🗂️ Database Structure

## 1️⃣ Learners Table

Stores learner information.

| Column Name | Description       |
| ----------- | ----------------- |
| learner_id  | Unique learner ID |
| full_name   | Learner full name |
| country     | Learner country   |

---

## 2️⃣ Courses Table

Stores course details.

| Column Name | Description      |
| ----------- | ---------------- |
| course_id   | Unique course ID |
| course_name | Course title     |
| category    | Course category  |
| unit_price  | Course price     |

---

## 3️⃣ Purchases Table

Stores purchase transaction details.

| Column Name   | Description                 |
| ------------- | --------------------------- |
| purchase_id   | Unique purchase ID          |
| learner_id    | Linked learner              |
| course_id     | Linked course               |
| quantity      | Number of courses purchased |
| purchase_date | Date of purchase            |

---

# 🔗 Database Relationships

* `learner_id` in purchases table references learners table
* `course_id` in purchases table references courses table

---

# 🧱 Database Creation

## Create Database

```sql id="2te7mu"
CREATE DATABASE elearning_db;
USE elearning_db;
```

---

# 📋 Table Creation

## Learners Table

```sql id="h4i7vg"
CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);
```

## Courses Table

```sql id="fvhzfm"
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);
```

## Purchases Table

```sql id="3y7hzi"
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

---

# 📝 Sample Data Insertion

The project includes sample data for:

* Learners
* Courses
* Purchase transactions

This helps simulate a real-world e-learning business environment.

---

# 🔍 SQL Joins Used

## 1️⃣ INNER JOIN

Used to retrieve matching learner, purchase, and course details.

### Purpose

* Display learner purchase history
* Calculate total revenue per order

```sql id="3xqeg5"
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
```

---

## 2️⃣ LEFT JOIN

Used to display all learners, including those without purchases.

### Purpose

* Identify inactive learners
* Analyze learner participation

```sql id="phjghu"
LEFT JOIN purchases p ON l.learner_id = p.learner_id
```

---

## 3️⃣ RIGHT JOIN

Used to display all courses, including courses without purchases.

### Purpose

* Identify unpopular or inactive courses

```sql id="m0c17d"
RIGHT JOIN courses c ON p.course_id = c.course_id
```

---

# 📊 Analytical Queries

## 1️⃣ Total Spending per Learner

Calculated total amount spent by each learner.

### Insights

* Identified highest-paying learners
* Compared spending across countries

```sql id="lf3q6w"
SUM(p.quantity * c.unit_price)
```

---

## 2️⃣ Top 3 Most Purchased Courses

Identified the most popular courses based on purchase quantity.

### Insights

* Determined trending courses
* Analyzed learner preferences

---

## 3️⃣ Category Revenue & Unique Learners

Calculated:

* Total revenue by category
* Number of unique learners

### Insights

* Measured category performance
* Identified profitable categories

---

## 4️⃣ Learners Purchasing from Multiple Categories

Identified learners who purchased courses from multiple categories.

### Insights

* Analyzed learner interests
* Identified highly engaged learners

---

## 5️⃣ Courses Not Purchased

Displayed courses with zero purchases.

### Insights

* Identified low-demand courses
* Helped evaluate course popularity

---

# 📈 Key Learnings

Through this project, I learned:

* Relational database design
* Primary and foreign key relationships
* SQL joins and analytical queries
* Revenue and customer analysis
* Business intelligence using SQL

---

# 📌 Conclusion

This project successfully demonstrates the implementation of an **E-Learning Database Management System** using SQL.
It showcases database creation, relationship management, joins, and analytical querying techniques to derive valuable business insights from learner purchase data.

