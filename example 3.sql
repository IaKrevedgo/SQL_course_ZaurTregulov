select 'abc'||'xyz'||(90*30) as result from dual;

select 'Privet, '||'dorogoy student' as greetings from dual; 

select 39*365*24*60*60 "Moy vozrast v secundah" from dual;

select 'It''s my life' as TXT from dual;

select q'<It's my life>' as TXT from dual;

select q'(It's my life)' as TXT from dual;

select * from dual;

desc dual;

SELECT * 
FROM regions;

select first_name, department_id, salary, last_name from employees;

select employee_id, email, (hire_date-7) as "One week before hire date" 
from employees;

select (first_name|| '(' || last_name || ')') as our_emplyees from employees;

select DISTINCT first_name from employees;

select * from jobs;

select job_title, ('min = '||min_salary||', max = '||max_salary) as info, max_salary as max,
    (max_salary*2-2000) as new_salary
from jobs;

select q'<Peter's dog is very clever>' from dual;

select 'Peter''s dog is very clever' from dual;

select 365.25*100*24*60 as "Количество минут в одном веке" from dual;