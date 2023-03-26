/*CONERSION FUNCTIONS*/
select Length(123) from dual;
select * from countries;
/*select add_months('05.06.19', 3) from dual;*/
select add_months('05-JUN-19', 3) as data from dual;
select next_day('01-MAR-23','WED') from dual;



/* TO_CHAR*/
select to_CHAR(18)from dual;
select to_CHAR(181818,'99999')from dual;            /*количество целых чисел*/
select to_CHAR(18,'099999')from dual;               /*отображение 0*/
select to_CHAR(18,'99.999')from dual;               /*Позиция десятичной точки*/
select to_CHAR(18,'99D999')from dual;               /*Позиция десятичной точки*/
select to_CHAR(18000000,'999G999G999D99')from dual; /*Позиция запятой*/
select to_CHAR(18,'$99D999')from dual;              /*Знак доллара*/
select to_CHAR(18,'L99D999')from dual;              /*Локальная валюта*/ 
select to_CHAR(-18,'999MI')from dual;               /*Знак минуса*/
select to_CHAR(-18,'0999PR')from dual;              /*Если отрицательное то в скобках отображается*/
select to_CHAR(18,'S099'), to_CHAR(-18,'S099')from dual;  /*Выводит знак+-*/

select first_name, salary*1.1111111,
to_char(salary*1.1111111,'$999,999.99'),
to_char(salary*1.1111111,'$9,999.99')
from employees;



/*TO_CHAR DATE to CHAR*/
select TO_CHAR(sysdate,'DAY',  'NLS_DATE_LANGUAGE = RUSSIAN')|| TO_CHAR(sysdate,'MONTH')||  TO_CHAR(sysdate, 'YEAR', 'NLS_DATE_LANGUAGE = RUSSIAN') from dual;
select TO_CHAR('05-aug-84') from dual;
select TO_CHAR(SYSDATE,'YYY') from dual;              /*3 последние цифры года*/
select TO_CHAR(SYSDATE,'YEAR') from dual;             /*год текстом загавными*/
select TO_CHAR(SYSDATE,'year') from dual;             /*год текстом прописными*/
select TO_CHAR(SYSDATE,'MM') from dual;                 /*месяц*/
select TO_CHAR(SYSDATE,'d') from dual;              /*день недели*/
select TO_CHAR(SYSDATE,'dd') from dual;              /*день месяца*/
select TO_CHAR(SYSDATE,'ddd') from dual;              /*день года*/
select TO_CHAR(SYSDATE,'DAY') from dual;              /*Название дня недели*/
select TO_CHAR(SYSDATE,'w') from dual;              /*неделя месяца*/
select TO_CHAR(SYSDATE,'ww') from dual;              /*неделя года*/
select TO_CHAR(SYSDATE,'Q') from dual;              /*квартал года*/
select TO_CHAR(SYSDATE,'CC') from dual;              /*век*/

select TO_CHAR(SYSDATE,'P.M.') from dual;              /*до обеда/после обеда?*/
select TO_CHAR(SYSDATE,'HH24') from dual;              /*час 24 часовой*/
select TO_CHAR(SYSDATE,'HH12') from dual;              /*час 12 часовой*/
select TO_CHAR(SYSDATE,'MI') from dual;              /*минуты*/
select TO_CHAR(SYSDATE,'SSSS') from dual;              /*секунды*/
select TO_CHAR(SYSDATE,'DAY!MON?YYYY') from dual;              /*форматирование даты*/
select TO_CHAR(SYSDATE,'fm"Month "month" of "year"') from dual;              /*выыод тескста с парамертрами датыЁ!!*/
select TO_CHAR(SYSDATE,'DDth" of "month') from dual;              /*th */
select TO_CHAR(SYSDATE,'YYYYsp mmsp sssp') from dual;              /*буквенное описание*/
select TO_CHAR(SYSDATE,'Mithsp') from dual;              /*комбинация th и sp*/


select hire_date, TO_CHAR(hire_date,'Month','NLS_DATE_LANGUAGE = RUSSIAN')||'Hello!' as Месяц from employees;

select hire_date, 
TO_CHAR(hire_date,'fmMonth','NLS_DATE_LANGUAGE = RUSSIAN') as Месяц 
from employees; /*без пробелов*/

select hire_date, 
TO_CHAR(hire_date,'Month') as Месяц from employees; /*без пробелов*/
 
select hire_date from employees
where TO_CHAR(hire_date,'fmMonth') = 'August';

select first_name, Last_name, hire_date from employees
where TO_CHAR (hire_date, 'fmMonth') = 'March';

select 'My colleague with ID ='||employee_id || ' and job_id = '|| job_id||
' joined us on ' || TO_CHAR(hire_date, 'day"the "ddTH" of " fmMonth YYYY')
from employees;

select TO_CHAR(SYSDATE,'HH24') from dual;              /*час 24 часовой*/
select TO_CHAR(SYSDATE,'fmday:dd:month:YYYY:HH:MM:sssp') from dual;

select 'Мой коллега с ID '||employee_id||' и job_id = '||job_id||' работает с нами с '|| TO_char(hire_date,'fmday ddth fmMonth fmYYYY " года"') from employees;