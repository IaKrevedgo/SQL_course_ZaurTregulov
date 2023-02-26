select ROUND(3.14135699,1)from dual;

select ROUND(3.14135699)from dual;

select ROUND(3.14135699,6)from dual;

select salary, salary*3.1415, ROUND(salary*3.1415) from employees;

select ROUND(34343, -4) from dual;

select ROUND(34343.3434, 0) from dual;

select ROUND((sysdate - hire_date)* employee_id) as bonus, (sysdate - hire_date)* employee_id  from employees;


select TRUNC(3.141835699,3) trunc, round (3.141835699,3) round from dual;

select TRUNC(2223.141835699,-1) trunc, round (2223.141835699,-1) round from dual;



select mod(17,2) mod from dual;

select * from employees where MOD(employee_id,2) !=0;

select first_name, last_name, employee_id, MOD(employee_id,3)+1 as TEAM from employees; 


