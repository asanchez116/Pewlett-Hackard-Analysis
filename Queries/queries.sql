select count(last_name) from employees
WHERE birth_date between '1952-01-01' AND '1955-12-31';


select count(last_name) from employees
WHERE birth_date between '1952-01-01' AND '1952-12-31';


--Create three more queries to search for employees who were born in 1953, 1954, and 1955.


select first_name, last_name from employees
WHERE birth_date between '1953-01-01' AND '1953-12-31';


select first_name, last_name from employees
WHERE birth_date between '1954-01-01' AND '1954-12-31';


select first_name, last_name from employees
WHERE birth_date between '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT count(last_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;


drop table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

--Joining departments and dept_manager tables
SELECT d.dept_name,
	   dm.emp_no,
	   dm.from_date,
	   dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm on d.dept_no = dm.dept_no;

--Joining retirement_inf and dept_emp tables
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   de. to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de on ri.emp_no = de.emp_no;



select ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
on ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')

select * from current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
into retirement_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no
;

select * from salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

select e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
into emp_info
from employees as e
left join salaries as s on s.emp_no = e.emp_no
left join dept_emp as de on e.emp_no = de.emp_no
where (birth_date between '1952-01-01' and '1955-12-31')
AND (hire_date between '1985-01-01' and '1988-12-31')
AND (de.to_date = '9999-01-01');

select * from emp_info;

-- List of managers per department
SELECT dm.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   ce.last_name,
	   ce.first_name,
	   dm.from_date,
	   dm.to_date
INTO manager_info
FROM dept_manager as dm
INNER JOIN departments as d
on (dm.dept_no = d.dept_no)
INNER JOIN current_emp as ce
on (dm.emp_no = ce.emp_no);

select * from manager_info

select ce.emp_no,
	   ce.first_name,
	   ce.last_name,
	   d.dept_name
--into dept_info
FROM current_emp as ce
inner join dept_emp as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no);

--create a query that will return only the information relevant to the sales team
--employee numbers
--employee first name
--employee last name
--employee department name

select ri.emp_no, ri.first_name, ri.last_name, d.dept_name
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
WHERE dept_name like ('Sales')

-- same info but for both sales and development departments
select ri.emp_no, ri.first_name, ri.last_name, d.dept_name
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
WHERE dept_name in ('Sales', 'Development')
