/*GROUP FUNCTIONS*/
/*GROUP BY*/

select department_id, COUNT(*) from employees group by department_id
order by 1,2;

select department_id, COUNT(*), MIN(salary), AVG(NVL(commission_pct,0)) from employees group by department_id
order by 1,2;

select job_id, MIN(salary), MAX(salary), ROUND(AVG(salary)) s
from employees 
where LENGTH(first_name) > 4 AND salary > 5000
group by job_id 
order by job_id, s;

select MAX(hire_date), MIN(first_name), COUNT(*), ROUND(AVG(salary)), SUM(employee_id)
from employees
GROUP BY department_id;

select TO_CHAR(hire_date,'Month'), COUNT(*) from employees
GROUP by TO_CHAR(hire_date,'Month');                                            /*Сколько работников принятов каждом месяце*/

select location_id, count(*) from departments
group by location_id;                                                           /*Сколько департаментов в каждой локации*/



select department_id, count(*) from employees                                   /*группировка по департаментам*/
group by department_id
order by department_id;

select job_id, count(*) from employees                                          /*группировка по работам*/
group by job_id
order by job_id;

select department_id,job_id, count(*) from employees                            /*группировка по работам и департаментам*/
group by department_id,job_id
order by department_id,job_id;

select department_id, manager_id, count(*) from employees                       /*группировка по работам и менеджерам*/
group by department_id,manager_id                                               /*сколько человек в каждом департаменте у каждого менеджера*/
order by department_id,manager_id;

select job_id, TO_CHAR(hire_date,'YYYY') year, sum(salary)                    
from employees
WHERE job_id IN('ST_CLERK','SA_REP','SH_CLERK') and employee_id > 115
GROUP BY job_id, TO_CHAR(hire_date,'YYYY')
ORDER BY job_id, year;                                                          /*сумма работкников зарплат устроенных на JOB_ID в таком-то году*/

select job_id, TO_CHAR(hire_date,'YYYY') year, commission_pct, count(*), sum(salary)                    
from employees
WHERE job_id IN('ST_CLERK','SA_REP','SH_CLERK') and employee_id > 115
GROUP BY job_id, TO_CHAR(hire_date,'YYYY'), commission_pct
ORDER BY job_id, year;                                                           /*сумма работкников зарплат и комиссии устроенных на JOB_ID в таком-то году*/



/*HAVING*/
select department_id,count(*)     
from employees
where count(*) > 3
group by department_id
order by department_id;                                                         /*выдаст ошибку*/

select department_id,count(*)                                                   
from employees
where LENGTH(first_name) > 4
group by department_id
HAVING count(*) > 3
order by department_id;                                                         /*Условие отсеивания для групп*/

select department_id, count(*), ROUND(AVG(salary))                                                   
from employees
where LENGTH(first_name) > 4
group by department_id
HAVING count(*) > 3 AND ROUND(AVG(salary)) > 5000
order by department_id;                                                         /*Условие отсеивания для групп можно писать логические выражаения*/



/*NESTED GROUP FUNCTIONS*/
select department_id, AVG(salary) 
FROM employees
GROUP BY department_id;

select SUM(AVG(salary)) 
FROM employees
GROUP BY department_id;

select MAX(SUM(AVG(salary))) 
FROM employees
GROUP BY department_id;                                                         /*выдаст ошибку*/

select ROUND(SUM(AVG(LENGTH(UPPER(last_name)))))
FROM employees
GROUP BY department_id;