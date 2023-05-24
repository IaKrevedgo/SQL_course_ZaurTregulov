/*VIEW*/

select * from employees;

CREATE VIEW fin_emp AS 
    select employee_id, job_id, salary from employees;
    
DROP VIEW fin_emp;                                                              /*Удалить вью*/

select * from fin_emp;

CREATE VIEW fin_emp2 AS 
    select department_name, SUM(salary) sum_salary from employees e JOIN departments d
        ON (e.department_id = d.department_id) group by department_name;        /*Создание временной таблицы по селекту*/
        
select * from fin_emp2;

select department_name from fin_emp2 where sum_salary > 10000;

create view emps_with_high_salary2 AS select first_name, last_name from employees 
    where salary >=12000;

select * from emps_with_high_salary2;    
