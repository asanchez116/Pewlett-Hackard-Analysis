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
