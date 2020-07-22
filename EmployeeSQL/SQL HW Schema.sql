CREATE TABLE departments (
	CONSTRAINT departmentid PRIMARY KEY(dept_no),
	dept_no varchar NOT null,
	dept_name varchar NOT null);

CREATE TABLE dept_emp (
	emp_no int NOT null,
	dept_no varchar NOT null);
	
CREATE TABLE dept_manager (
	dept_no varchar NOT null,
	emp_no int NOT null);
	
CREATE TABLE employees (
    CONSTRAINT mainempid primary key (emp_no),
	emp_no int NOT null,
	emp_title varchar NOT null,
    birth_date date NOT null,
    first_name varchar NOT null,
    last_name varchar NOT null,
    sex varchar NOT null,
    hire_date date NOT null);
    
CREATE TABLE salaries (
	CONSTRAINT salempid PRIMARY KEY (emp_no),
	emp_no int NOT null,
	salary int NOT null);
	
CREATE TABLE titles (
	title_id varchar NOT null,
	title varchar NOT null);
	
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;