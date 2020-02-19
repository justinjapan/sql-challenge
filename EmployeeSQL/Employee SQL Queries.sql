-- SQL Analyze DATA

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
    
SELECT *
FROM employees
JOIN Salaries
	ON employees.emp_no = Salaries.emp_no
    

-- 2. List employees who were hired in 1986.

SELECT 
	emp_no, 
    first_name, 
    last_name
FROM employees
WHERE hire_date > '1985/12/31' and hire_date < '1987/01/01'


-- 3. List the manager of each department with the following information: department number, department name,
--    the manager's employee number, last name, first name, and start and end employment dates.

SELECT t1.dept_no,
	t3.dept_name,
	t1.emp_no,
	t2.first_name,
	t2.last_name,
	t1.from_date,
	t1.to_date
FROM dept_manager AS t1
JOIN employees AS t2 ON
t1.emp_no = t2.emp_no
JOIN departments AS t3
ON t3.dept_no = t1.dept_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name,
--    and department name.

SELECT t1.emp_no,
	t1.last_name,
	t1.first_name,
	t3.dept_name
FROM employees AS t1
JOIN dept_emp AS t2
ON t1.emp_no = t2.emp_no
JOIN departments AS t3
ON t3.dept_no = t2.dept_no;


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name,
	employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 


-- 6. List all employees in the Sales department, including their employee number, last name,
--    first name, and department name.

SELECT t1.emp_no
	, t1.last_name
	, t1.first_name
	, t3.dept_name
FROM employees AS t1
JOIN dept_emp AS t2
ON t1.emp_no = t2.emp_no
JOIN departments AS t3
ON t3.dept_no = t2.dept_no
WHERE t3.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number,
--    last name, first name, and department name.

SELECT t1.emp_no,
	 t1.last_name,
	 t1.first_name,
	 t3.dept_name
FROM employees AS t1
JOIN dept_emp AS t2
ON t1.emp_no = t2.emp_no
JOIN departments AS t3
ON t3.dept_no = t2.dept_no
WHERE t3.dept_name = 'Sales' OR t3.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees
--    share each last name.

SELECT 
	last_name
FROM employees
ORDER BY last_name DESC

