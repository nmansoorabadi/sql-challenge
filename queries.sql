-- 1-List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT * FROM employees;
SELECT * FROM salaries;

SELECT employees.emp_no AS "employee number",employees.last_name AS "last name",employees.first_name AS "first name",employees.gender,salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no=salaries.emp_no;

-- 2-List employees who were hired in 1986.

SELECT * FROM employees;


SELECT last_name, 1986 As "Hired in 1986"
FROM employees
GROUP BY last_name;

-- 3-List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT * FROM Departments_Manager;
-- dept_no

SELECT * FROM Departments;
-- dep_name

SELECT * FROM employees;
-- emp_no
-- last_name
-- first_name
-- hire_date



SELECT dm.dept_no AS "Department Number",
d.dept_name AS "Department Name",
dm.emp_no As "Employee Number",
e.last_name As "Last Name",
e.first_name AS "First Name ",
dm.from_date As "Date Start",
dm.to_date As "Date Ends"
FROM Departments_Manager AS dm 
INNER JOIN Departments AS d
ON
(dm.dept_no=d.dep_no)
INNER JOIN employees AS e
ON 
(dm.emp_no=e.emp_no);

-- 4-List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM employees;
-- emp_no
-- last_name
-- first_name
SELECT * FROM departments_employee;
-- emp_no
-- dep_no
SELECT * FROM departments;
-- dept_name
-- dep_no

SELECT 
e.emp_no AS "Employee Number",
e.last_name As "Last Name",
e.first_name As "First Name",
d.dept_name As "Department Name"
FROM employees AS e
INNER JOIN departments_employee AS de
ON
e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON
de.dep_no=d.dep_no;

-- 5-List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name= 'Hercules'
AND last_name like 'B%';

-- 6-List all employees in the Sales department, including their employee number, last name, first name, and department name.


SELECT * FROM departments;
-- dept_name=Sales
-- dep_no
SELECT * FROM departments_employee;
-- dep_no
-- emp_no
SELECT * FROM employees;
-- emp_no
-- last_name
-- first_name

SELECT
de.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
d.dept_name AS "Department Name"
FROM departments_employee AS de
INNER JOIN employees AS e
ON
de.emp_no=e.emp_no
LEFT JOIN departments AS d
ON
d.dep_no=de.dep_no
WHERE d.dept_name='Sales';

--7- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
de.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
d.dept_name AS "Department Name"
FROM departments_employee AS de
INNER JOIN employees AS e
ON
de.emp_no=e.emp_no
LEFT JOIN departments AS d
ON
d.dep_no=de.dep_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--8- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,COUNT(last_name)AS "Number of last_name"
FROM employees
GROUP BY last_name
ORDER BY "Number of last_name" DESC;

