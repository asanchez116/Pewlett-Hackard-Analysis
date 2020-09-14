select e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
into retirement_titles
from employees as e
join titles as t on e.emp_no = t.emp_no
where birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no

select * from retirement_titles

select distinct on (emp_no) e.emp_no,
                            e.first_name,
                            e.last_name,
                            t.title,
                            t.from_date,
                            t.to_date
into unique_titles
from employees as e
join titles as t
on e.emp_no = t.emp_no
where birth_date between '1952-01-01' AND '1955-12-31'
order by emp_no ASC, to_date DESC;

select * from unique_titles


select count(title) as count,
                       title
into retiring_titles
from unique_titles
group by title
order by count DESC

select * from retiring_titles

select distinct on (e.emp_no) e.emp_no,
					e.first_name,
					e.last_name,
					e.birth_date,
					de.from_date,
					de.to_date,
					t.title
into mentorship_eligibilty
FROM employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join titles as t on e.emp_no=t.emp_no
WHERE de.to_date = ('9999-01-01') AND
(e.birth_date between '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

select * from mentorship_eligibilty
