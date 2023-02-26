select * from employees;

select CONCAT(first_name, last_name) from employees;

select CONCAT('PREVED ','medved') from dual;

select CONCAT(salary*2, hire_date) from employees;

select SYSDATE from dual;

select CONCAT('today is ', SYSDATE) as date_time from dual;

select CONCAT('Privet ', CONCAT('moy ','drug')) from dual;



select first_name, LENGTH(first_name) as dlina from employees;

select LENGTH('Denis    Sagidullin')  from dual;

select salary, LENGTH(salary), hire_date, LENGTH(hire_date) from employees;

select 'Name is '|| first_name||' and surname is '|| last_name AS full_name,
LENGTH('Name is '|| first_name||' and surname is '|| last_name) AS full_name 
from employees;

select * from countries;

SELECT country_name from countries
where length (country_name) > 8;

SELECT country_name from countries order by length (country_name);


select LPAD('Denis',10,'#') from dual;

select RPAD('Denis',10,'#') from dual;

select first_name, LPAD(first_name,25,'$') from employees;

select first_name, RPAD(first_name,10,'$') RPAD, LPAD(first_name,10,'$') LPAD from employees;

select LPAD(first_name,25,'abc_') LPAD from employees;

select RPAD('Privet',5,'!') from dual;

select RPAD('Privet',5,'!') from dual;

select RPAD(first_name,15,' ')|| LPAD(salary,8,' ') from employees;




select trim(trailing 'q' from 'DDDEEEQqqqq')from dual;

select trim(leading '*' from '****DDDEEEQqqqq***')from dual;

select trim(both 'q' from 'qqqqDDDEEEQqqqq')from dual;

select trim ('*' from '*******dfdfdf******') from dual;

select TRIM (' ' from '     dfdf fdfdf fff  ') from dual;

select TRIM ('   ddfdfdf dfdfdf   ')from dual;

select TRIM (5 from '5554444555')from dual;