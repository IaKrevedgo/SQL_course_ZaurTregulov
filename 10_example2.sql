/*UPDATE*/

select * from employees;

UPDATE employees SET salary = 10000 WHERE employee_id = 100;

UPDATE employees SET salary = salary*2 WHERE employee_id = 100;

UPDATE employees 
SET salary = salary + 2020
WHERE employee_id < 105 AND salary < 10000;

UPDATE employees SET salary = 100;                                              /*Не забываем про where*/

UPDATE employees SET employee_id = 102 WHERE employee_id = 100;                 /*Нельзя сделать на ИД дбликат*/


UPDATE employees SET salary = salary + 550 WHERE department_id IN
    (select department_id from departments where department_name = 'Marketing');/*Увеличиваем зп работникам из департамента маркетинг*/
    
UPDATE employees SET salary = (select MAX(salary) from employees), 
    hire_date = (select MIN(start_date) from job_history) 
WHERE employee_id = 180;                                                        /*ДЛЯ 180 работника ставим самую большю зп среди всех и ставим дату устройства самую раннюю из тоблицы жоб_хистори*/


UPDATE employees SET salary = (select salary from employees where employee_id = 5), 
    hire_date = (select MIN(start_date) from job_history) 
WHERE employee_id = 180;                                                        /*Если условие в сете ничего не нашло онон ставит в значение NULL*/

