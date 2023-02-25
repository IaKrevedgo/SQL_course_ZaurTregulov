select salary from employees;

select first_name, salary*1.5, salary from employees;

select salary, salary*5/2/10-5, salary*5/2/(10-5) from employees;

select commission_pct, commission_pct/2 FROM employees;

select * from job_history;

select start_date, end_date, (end_date - start_date)+1 from job_history;

select start_date, start_date + 7 from job_history;