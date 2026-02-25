CREATE DATABASE hr_analytics;
USE hr_analytics;

-- 1. Overall Attrition Rate
SELECT
ROUND(SUM(attrition)/COUNT(*)*100,2) AS attrition_rate
FROM employees;

-- 2. Attrition by Department
SELECT department,
COUNT(*) AS total_employees,
SUM(attrition) AS attrition_count,
ROUND(SUM(attrition)/COUNT(*)*100,2) AS attrition_rate
FROM employees
GROUP BY department
ORDER BY attrition_rate DESC;

-- 3. Attrition by Job Role
SELECT JobRole,
SUM(attrition) AS attrition_count
FROM employees
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- 4. Average Income vs Attrition
SELECT Attrition,
ROUND(AVG(Salary),2) AS avg_income
FROM employees
GROUP BY Attrition;

-- 5. High Risk Employees (Early Leavers)
SELECT EmployeeID, department, JobRole, YearsAtCompany
FROM employees
WHERE Attrition = 1 AND YearsAtCompany < 3;

-- 6. Experience-wise Attrition
SELECT YearsAtCompany,
SUM(Attrition) AS attrition_count
FROM employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;