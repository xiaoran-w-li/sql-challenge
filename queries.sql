-- queries

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, last_name, first_name, sex, salary
FROM employees as e 
JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE e.hire_date 
BETWEEN '1/1/1986' AND '12/31/1986';
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager as m
JOIN departments as d
ON m.dept_no = d.dept_no
JOIN employees as e
ON m.emp_no = e.emp_no;
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as s
ON e.emp_no = s.emp_no
JOIN departments as d
ON s.dept_no = d.dept_no; 
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as p
ON e.emp_no = p.emp_no
JOIN departments as d 
ON p.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees as e
JOIN dept_emp as p
ON e.emp_no = p.emp_no
JOIN departments as d 
ON p.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(e.last_name)
FROM employees as e
GROUP by e.last_name
ORDER by COUNT(e.last_name) DESC;
