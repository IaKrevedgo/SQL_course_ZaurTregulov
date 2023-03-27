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
GROUP by TO_CHAR(hire_date,'Month');                                            /*������� ���������� �������� ������ ������*/

select location_id, count(*) from departments
group by location_id;                                                           /*������� ������������� � ������ �������*/



select department_id, count(*) from employees                                   /*����������� �� �������������*/
group by department_id
order by department_id;

select job_id, count(*) from employees                                          /*����������� �� �������*/
group by job_id
order by job_id;

select department_id,job_id, count(*) from employees                            /*����������� �� ������� � �������������*/
group by department_id,job_id
order by department_id,job_id;

select department_id, manager_id, count(*) from employees                       /*����������� �� ������� � ����������*/
group by department_id,manager_id                                               /*������� ������� � ������ ������������ � ������� ���������*/
order by department_id,manager_id;

select job_id, TO_CHAR(hire_date,'YYYY') year, sum(salary)                    
from employees
WHERE job_id IN('ST_CLERK','SA_REP','SH_CLERK') and employee_id > 115
GROUP BY job_id, TO_CHAR(hire_date,'YYYY')
ORDER BY job_id, year;                                                          /*����� ����������� ������� ���������� �� JOB_ID � �����-�� ����*/

select job_id, TO_CHAR(hire_date,'YYYY') year, commission_pct, count(*), sum(salary)                    
from employees
WHERE job_id IN('ST_CLERK','SA_REP','SH_CLERK') and employee_id > 115
GROUP BY job_id, TO_CHAR(hire_date,'YYYY'), commission_pct
ORDER BY job_id, year;                                                           /*����� ����������� ������� � �������� ���������� �� JOB_ID � �����-�� ����*/