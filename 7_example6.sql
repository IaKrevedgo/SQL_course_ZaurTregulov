/*CROSS JOIN*/

select * from countries;
select * from regions;

select * from countries CROSS JOIN regions order by country_id;                 /*также называют cartesion product*/

select * from employees CROSS JOIN departments order by first_name; 

select * from countries CROSS JOIN regions
where countries.region_id >=2
order by country_id;                                                            /*работают условия*/

select * from countries NATURAL JOIN jobs;                                      /*Если нет общих столбцов то получается CROSS JOIN*/



/*СИНТАКСИС JOIN ORACLE*/

select first_name, last_name, salary, d.department_id, department_name
from employees e, departments d
WHERE e.department_id = d.department_id;                                        /*INNER JOIN*/


select first_name, last_name, salary, d.department_id, department_name
from employees e, departments d
WHERE e.department_id (+)= d.department_id;                                     /*RIGHT OUTER JOIN*/


select first_name, last_name, salary, d.department_id, department_name
from employees e, departments d
WHERE e.department_id = d.department_id (+);                                    /*LEFT OUTER JOIN*/


select first_name, last_name, salary, d.department_id, department_name
from employees e, departments d;                                                /*CROSS JOIN*/