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
------------------------------------------------------------------------------------------------------
--List the following details of each employee:
--employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;
------------------------------------------------------------------------------------------------------
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name AS "First Name", employees.last_name AS "Last Name",  hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
------------------------------------------------------------------------------------------------------
--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no AS "Department Num", departments.dept_name AS "Department Name",
dept_manager.emp_no AS "Emp Number", employees.last_name AS "Last Name", employees.first_name AS "First Name"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;
------------------------------------------------------------------------------------------------------
--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no AS "Emp Number", employees.last_name AS "Last Name",
employees.first_name AS "First Name", departments.dept_name AS "Department Name"
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;
------------------------------------------------------------------------------------------------------
--List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
------------------------------------------------------------------------------------------------------
--List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no AS "Emp Number", employees.last_name AS "Last Name",
employees.first_name AS "First Name", departments.dept_name AS "Department Name"
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
------------------------------------------------------------------------------------------------------
--List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no AS "Emp Number", employees.last_name AS "Last Name",
employees.first_name AS "First Name", departments.dept_name AS "Department Name"
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
------------------------------------------------------------------------------------------------------
--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;
------------------------------------------------------------------------------------------------------
--Epilogue "Search your ID number"
SELECT last_name AS "Last Name", first_name AS "First Name"
FROM employees
WHERE emp_no = '499942';