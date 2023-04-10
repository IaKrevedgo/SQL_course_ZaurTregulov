/*ÄÎÌÀØÊÀ*/

select first_name, last_name from employees
where LENGTH(first_name) = (select MAX(LENGTH(first_name)) from employees);

select * from employees
where salary > (select AVG(salary) from employees);

select * from employees;
select * from departments;
select * from locations;
select * from jobs;

select city from locations l, departments d, employees e
where (l.location_id = d.location_id) AND (d.department_id=e.department_id) AND
    (salary < (select MIN(SUM(salary)) from employees group by city));
    
select * from employees e1
where manager_id IN (select employee_id
                    from employees
                    where salary > 15000);
    
select * from departments d
where department_id not in (select distinct department_id from employees
                            where department_id IS NOT NULL);


select * from employees 
where employee_id NOT IN (select distinct manager_id
                            from employees
                            where manager_id is NOT NULL);
    
select * from employees e
where (select COUNT(*) from employees  
    where e.employee_id = manager_id) > 6;
    
select * from employees
    where department_id = (select department_id from departments where department_name = 'IT');
 
 
select * from employees
where manager_id IN (select employee_id
                    from employees
                    where TO_CHAR(hire_date, 'YYYY') = '1997')
        AND hire_date < TO_DATE ('01-01-1997', 'DD-MM_YYYY');


select * from employees e
where manager_id IN (select employee_id
                    from employees
                    where TO_CHAR(hire_date, 'MM') = '01')
        AND (select LENGTH(job_title)
        from jobs
        where job_id =e.job_id) > 15;
        
select * from employees where employee_id =146;


