/* 1. List the following details of each employee:
 employee number, last name, first name, sex, and salary.*/
SELECT emp.id, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees as emp
INNER JOIN salaries as sal ON
emp.id = sal.emp_id;

/* 2. List first name, last name, and hire date for employees who were hired in 1986.*/
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

/* 3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name.*/
SELECT dep.id, dep.name, man.emp_id, emp.last_name, emp.first_name
FROM departments AS dep
INNER JOIN dept_manager AS man
ON dep.id = man.dept_id
INNER JOIN employees as emp
ON emp.id = man.emp_id;

/* 4. List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
SELECT emp.id, emp.last_name, emp.first_name, dep.name
FROM employees AS emp
INNER JOIN dept_emp
ON emp.id = dept_emp.emp_id
INNER JOIN departments AS dep
ON dept_emp.dept_id = dep.id;

/* 5. List first name, last name, and sex 
for employees whose first name is "Hercules" and last names begin with "B."*/
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees as emp
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

/* 6. List all employees in the Sales department, 
including their employee number, last name, first name, and department name.*/
SELECT emp.id, emp.last_name, emp.first_name, dep.name
FROM employees AS emp
INNER JOIN dept_emp
ON emp.id = dept_emp.emp_id
INNER JOIN departments AS dep
ON dept_emp.dept_id = dep.id
WHERE dep.name = 'Sales';

/* 7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT emp.id, emp.last_name, emp.first_name, dep.name
FROM employees AS emp
INNER JOIN dept_emp
ON emp.id = dept_emp.emp_id
INNER JOIN departments AS dep
ON dept_emp.dept_id = dep.id
WHERE dep.name = 'Sales';

/* 8. In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;