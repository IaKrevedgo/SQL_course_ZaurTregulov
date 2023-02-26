/*Date functions*/

select * from job_history;

select * from nls_session_parameters where parameter ='NLS_DATE_FORMAT';

select SYSDATE from dual;

select TO_CHAR(SYSDATE,'DD-MM-RR hh24:mi:ss') from dual;

select * from employees;

select ROUND(sysdate - hire_date) from employees;

select SYSdate, sysdate +7, SYSDATE + 7.5 from dual;


select employee_id, ABS(ROUND(MONTHS_BETWEEN(hire_date, sysdate))) as COL_MONTHS from employees;

select employee_id, ROUND(MONTHS_BETWEEN(end_date, start_date)) from job_history;

select MONTHS_BETWEEN('12.02.22','05.04.23')*31 from dual;



select end_date, ADD_MONTHS(end_date, 7) from job_history;

select end_date, ADD_MONTHS(end_date, -7) from job_history;

select ADD_MONTHS('30.09.19',5)from dual;

select ADD_MONTHS('04.12.19',2)from dual;

select * from employees 
where MONTHS_BETWEEN('01.01.99', hire_date) >6;




select NEXT_DAY(sysdate, 7) from dual;

select NEXT_DAY(sysdate, 'вск') as NEXT_WEEK_DAY from dual;

select * from sys.nls_session_parameters;

select NEXT_DAY('31.12.19','ѕЌƒ')-7 from dual;



select LAST_DAY(sysdate) from dual;

select LAST_DAY(hire_date), hire_date from employees;

select hire_date, LAST_DAY(hire_date)-hire_date as prorabotal from employees;



select hire_date, ROUND(hire_date, 'CC') from employees where employee_id in (120, 121);/*век*/

select hire_date, ROUND(hire_date, 'YYYY') from employees where employee_id in (120, 121);/*год*/

select hire_date, ROUND(hire_date, 'Q') from employees where employee_id in (120, 121); /*„етверть*/

select hire_date, ROUND(hire_date, 'MM') from employees where employee_id in (120, 121); /*ћес€ц*/

select hire_date, ROUND(hire_date) from employees where employee_id in (120, 121); /*день*/


select hire_date, TRUNC(hire_date, 'CC') from employees where employee_id in (120, 121);/*век*/

select hire_date, TRUNC(hire_date, 'YYYY') from employees where employee_id in (120, 121);/*год*/

select hire_date, TRUNC(hire_date, 'Q') from employees where employee_id in (120, 121); /*„етверть*/

select hire_date, TRUNC(hire_date, 'MM') from employees where employee_id in (120, 121); /*ћес€ц*/

select hire_date, TRUNC(hire_date) from employees where employee_id in (120, 121); /*день*/



/*домашка*/
select * from employees 
where length(first_name) > 10;

select * from employees 
where MOD(salary, 1000) = 0;

select phone_number, LPAD(phone_number, 3) from employees 
where LENGTH(phone_number) = 12;

select phone_number, SUBSTR(phone_number, 1, 3)
from employees
where phone_number LIKE '___.___.____';

select * from employees 
where SUBSTR(first_name, -1) = 'm' 
AND length(first_name) > 5;

select NEXT_DAY(sysdate, 'ѕт') from dual;

select * from employees 
where MONTHS_BETWEEN(sysdate, hire_date) > 150;

select REPLACE(phone_number,'.','-') 
from employees;

select UPPER(first_name)||'    '||LOWER(email)||'    '||INITCAP(Job_id) as TXT 
from employees;

select CONCAT(first_name, salary) from employees;

select ROUND(hire_date, 'MM'), TRUNC(hire_date, 'YYYY') 
from employees;

select RPAD(first_name,10,'$'), LPAD(Last_name,15,'!') 
from employees;

select first_name, INSTR(first_name, 'a', 1, 2) 
from employees; /* c первого символа искать второе повторение*/

select '!!!HELLO!! MY FRIEND!!!!!!!', TRIM('!' from'!!!HELLO!! MY FRIEND!!!!!!!') 
from dual;

select salary, salary*3.1415, ROUND(salary*3.1415), TRUNC(salary*3.1415, -3)/1000
from employees;

select hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date) 
from employees;