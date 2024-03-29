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