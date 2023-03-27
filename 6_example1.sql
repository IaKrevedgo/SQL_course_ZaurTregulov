/*GROUP FUNCTIONS*/
/*COUNT*/

select COUNT(*) from employees;                                                 /*Количество строк*/

select COUNT(*) from employees where salary > 5000;                             /*Количество строк с условием*/

select * from employees;

select COUNT(salary) from employees;                                            /*количество строк без null*/

select COUNT(commission_pct) from employees;                                    /*c null*/

select COUNT(NVL(commission_pct,0)) from employees;                             /*без null*/

select COUNT(ALL commission_pct) from employees;                                /*никакой разницы*/

select COUNT(DISTINCT commission_pct) from employees;                           /*количество уникальных значений*/

select COUNT(DISTINCT first_name) from employees;                               /*количество уникальных значений*/

select COUNT(first_name), COUNT(DISTINCT first_name) from employees;            /*уникальнве и неуникальные имена количество*/

select COUNT(*), COUNT(commission_pct), COUNT(DISTINCT commission_pct) 
from employees;                                                                  /*уникальнве и неуникальные имена и общее количество*/

select COUNT(DISTINCT NVL(commission_PCT,0)) from employees;                    /*Делаем из нулл ноль и получается  + 1 значение уникальное*/

select first_name, last_name, first_name||' '||last_name from employees;

select COUNT('abc') from employees;                                             /*Добавляется к каждой строке абс и выводиться количество строк*/
select COUNT('7') from employees;                                               /*Добавляется к каждой строке абс и выводиться количество строк*/
select COUNT(' ') from employees;                                               /*Добавляется к каждой строке абс и выводиться количество строк*/

select COUNT(salary), first_name from employees;                                 /*Будет ошибкаб но можно написать несколько каунтов*/


/*SUM*/

select SUM(salary) from employees;                                              /*суммирует нот null*/

select 5+null from dual;                                                        /*будет null*/

select SUM(DISTINCT commission_pct) from employees;                             /*уникадбные значения*/

select SUM(salary), SUM(DISTINCT salary) from employees;                        /*суммирует нот null*/

select SUM(commission_pct), COUNT(ВDISTINCT salary), COUNT(*) from employees;   /*можно совмещать с любыми груп-функциями*/

select SUM('7') from employees;                                                 /*складывается 107 семерок*/

select sysdate - hire_date from employees;                                      /*сколкьо дней проработал каждый сотрудник*/

select ROUND(SUM(sysdate - hire_date)) from employees;                          /*сколкьо дней проработали все сотрудники*/

select ROUND(SUM(sysdate - hire_date)/365) from employees;                      /*сколкьо лет проработали все сотрудники*/

select ROUND(SUM(LENGTH(first_name))/COUNT(*)) from employees;                  /*среднее количество букв в имени работника*/


/*AVG*/
select (3+5+11)/3 from dual;

select AVG(salary) from employees;                                              /*среднее орифметическое*/

select AVG(salary) from employees where job_id = 'IT_PROG';

select AVG(salary), AVG(DISTINCT salary) from employees;                        /*среднее среди уникальных значений зп*/

select AVG(commission_pct), AVG(DISTINCT commission_pct) from employees;        /*значения нулл игнорируются*/

select COUNT(*) a, SUM(salary) b, AVG(commission_pct) c from employees;         /*любые групповые функции в одном запросе*/

select AVG(7) from employees;                                                   /*средне арифметическое от 7 равно 7*/

select AVG(sysdate-hire_date)/365 from employees;   

select AVG(commission_pct), AVG(NVL(commission_pct,0)) from employees;          /*если добавить строк обрабатываемых то среднее арифметическое будет меньше*/


/*MIN и MAX*/
select MIN(salary), MAX(salary) from employees where department_id = 50;

select MIN(DISTINCT salary), MAX(DISTINCT salary) from employees 
where department_id = 50;                                                       /* результат тот же*/

select MIN(hire_date) rano, MAX(hire_date) pozdno from employees 
where department_id = 50; 

select MIN(last_name) mini, MAX(last_name) maxi from employees 
where department_id = 50; 

select COUNT(salary), SUM(salary), AVG(salary), MIN(salary), MAX(salary) from employees;

select MAX(LENGTH(first_name)), MIN(LENGTH(first_name)) from employees;