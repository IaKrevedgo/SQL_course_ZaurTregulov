/*ƒŒÃ¿ÿ ¿ œŒ –¿«ƒ≈À”*/

select first_name from employees
where INSTR(LOWER(first_name), 'b') > 0;

select first_name from employees
where INSTR(LOWER(first_name), 'a', 1, 2) > 0;

select department_name from departments;

select SUBSTR(department_name, 1, INSTR(department_name, ' ') -1) 
from departments 
where INSTR(department_name, ' ') >0;

select first_name, substr(first_name,2, substr(length(first_name)-2,1,1)) result from employees;

select first_name, substr(first_name,2, length(first_name)-2) result from employees;


select * from employees
where  LENGTH(SUBSTR(job_id, INSTR(job_id,'_')+1)) >= 3 
AND SUBSTR(job_id, INSTR(job_id,'_')+1)!= 'CLERK';

select * from employees
where  TO_CHAR(hire_date,'dd') = '01'; /*‰ÂÌ¸*/

select * from employees
where  TO_CHAR(hire_date,'RR') = 95; /*„Ó‰*/

select 'Tommorrow is '||to_char(sysdate+1,'fmDDDspth')||' day of '||TO_CHAR(sysdate,'Month') from dual;

select first_name, TO_CHAR(hire_date, 'fmddth" of "Month", "YYYY') hire from employees;

select first_name, TO_CHAR(salary*1.2,'$999,999.99') from employees;

select sysdate + 
    TO_NUMBER(TO_CHAR(sysdate,'ss')+
    TO_CHAR(sysdate,'mm')+
    TO_CHAR(sysdate,'hh24')+
    TO_CHAR(sysdate,'dd')+
    TO_CHAR(sysdate,'mm')+
    TO_CHAR(sysdate,'RR'))
    from dual;

select first_name, salary, salary + TO_NUMBER('$12,345.55','$99,999.99') from employees;

select first_name, hire_date, ROUND((TO_DATE('SEP, 18:45:00 18 2009', 'MON, hh24:mi:ss dd YYYY')-hire_date)/12) fff,  ROUND(MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, hh24:mi:ss dd YYYY'),hire_date)) mounts
from employees;

select first_name, hire_date, MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, hh24:mi:ss dd YYYY')-hire_date)
from employees;

select first_name, salary, TO_CHAR(salary+ salary *NVL(commission_pct,0), '$99,999.99') from employees;

select first_name, last_name, NVL2(NULLIF(LENGTH(first_name),LENGTH(last_name)),'different length','same length')
from employees;

select first_name, commission_pct, NVL2(commission_pct,'YES','NO') from employees;

select first_name, COALESCE(commission_pct, manager_id, salary) info from employees;
select first_name,
    CASE
        WHEN commission_pct is not null THEN commission_PCT
        WHEN manager_id is not null THEN manager_id
    ELSE salary
    END result
from employees;

select first_name, salary,
    CASE
        WHEN salary < 5000 THEN 'Low level'
        WHEN salary between 5000 and 9999 THEN 'Normal level'
    ELSE 'High level'
    END result
from employees;

select first_name, salary,
    DECODE(salary, salary < 5000, 'Low level',  salary between 5000 and 9999, 'Normal level')
from employees;

select country_name, DECODE (region_id,
1, 'Europe',
2, 'America',
3, 'Asia',
4, 'Africa',
'Unknown')
region
from countries;

select country_name,
    CASE region_id
        WHEN 1 THEN 'Europe'
        WHEN 2 THEN 'Amerika'
        WHEN 3 THEN 'Asia'
        WHEN 4 THEN 'Afrika'
        ELSE 'Unknown'
    END
        region
from countries;

select first_name, salary,
    CASE
        WHEN salary < 10000 and commission_pct is null THEN 'BAD'
        WHEN salary between 10000 and 14999 and commission_PCT is not null then 'NORMAL'
    ELSE 'GOOD'
    END 
        conditions
from employees;