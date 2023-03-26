/*TO_DATE*/

select to_date('13.feb.23')+31 from dual;

select TO_DATE('22-MAR-2023') from dual;
select TO_DATE('01!MAR!23') from dual;
select TO_DATE('01@MAR@23') from dual;
select TO_CHAR(TO_DATE('01@MAR@23'),'dd-mon-yyyy hh24:mi:ssss') from dual;
select TO_DATE('18:40 21!maRt-23') from dual;

select TO_DATE('18:40 2019!17-sep','HH24:mi YYYY!dd-Mon') from dual;

select to_char(to_date('01-03-2023 15:16:17','dd-mm-yyyy hh24:mi:ss'),
'dd-mon-yyyy hh24:mi:ss') from dual;

select TO_DATE('18-sep-10','fxDD-MON-YYYY') from dual;

select * from employees where hire_date >'01-JAN-99';

select * from employees where hire_date >to_date('01-JAN-99', 'dd-MON-RR');

select TO_CHAR(TO_DATE('15?1987$17$18$19/09','hh24?YYYY$Mi$SS$DD/mm'), 'dd-MON-yyyy hh24:mi:ss') ff from dual;

select TO_CHAR(TO_DATE('18:40:23 10!03!23','HH24:Mi:ss dd!MM!YY'),'HH24:Mi:ss dd-MM-YY') datetime from dual;

select TO_DATE('22!mar!23','fxdd!mon!YY') from dual; /*Требует, чтобы формат соответствовал тексту*/

select * from employees where hire_date > '01-Jan-95';

select * from employees where hire_date > to_date('01-Jan-95','dd-mon-RR');

select TO_CHAR(TO_DATE('15$2023@17$18$19/03','hh24$YYYY@MI$ss$dd/mm'),'dd-MON-YYYY hh24:mi:ss') datetime from dual; /*Вывод из набора цифр даты и времени*/


/*TO_NUMBER*/
select TO_NUMBER('3444.3') from dual;

select TO_NUMBER('$3,444.3','$99,999.99') from dual;

select TO_NUMBER('<3444.3>','9999.9999PR') from dual;

select to_CHAR(3.17,'99.9') from dual;

select TO_NUMBER('3.14','99.9') from dual; /*будет ошибка, так как формат не соответсвует числу*/

select TO_NUMBER(3.14,'99.99') from dual; /*сначала конвертируется в текст, можно без кавычек*/

select TO_NUMBER('343434.33') from dual;

select TO_NUMBER('$22,233.233','$99,999.999') from dual;

select TO_NUMBER('44.444','99.9999') from dual;

select TO_NUMBER('777.77','9999.999') from dual;

select TO_NUMBER('<777.77>','9999.999pr') from dual;

select TO_CHAR(4.17,'99.9') from dual;
select TO_NUMBER(4.17,'99.99') from dual;

select TO_NUMBER(