-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dep_no" SERIAL   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dep_no"
     )
);

CREATE TABLE "Departments_Employee" (
    "emp_no" INTEGER   NOT NULL,
    "dep_no" SERIAL   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Departments_Employee" PRIMARY KEY (
        "dep_no"
     )
);

CREATE TABLE "Departments_Manager" (
    "dept_no" SERIAL   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Departments_Manager" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employees" (
    "empo_no" SERIAL   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "empo_no"
     )
);

CREATE TABLE "Titles" (
    "emp_no" SERIAL   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" SERIAL   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dep_no" FOREIGN KEY("dep_no")
REFERENCES "Departments_Employee" ("dep_no");

ALTER TABLE "Departments_Employee" ADD CONSTRAINT "fk_Departments_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("empo_no");

ALTER TABLE "Departments_Manager" ADD CONSTRAINT "fk_Departments_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dep_no");

ALTER TABLE "Departments_Manager" ADD CONSTRAINT "fk_Departments_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("empo_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("empo_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("empo_no");

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


	







	
	

