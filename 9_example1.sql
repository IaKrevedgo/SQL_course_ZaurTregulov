/*SET OPERATORS*/
/*UNION ALL*/

select * from jobs where job_id like '%MAN%'
UNION ALL
select * from jobs where job_id like '%MAN%';                                   /*к первым 4 строкам присоединяются вторые 4 строчки из запроса*/


select job_id,job_title from jobs where job_id like '%MAN%'
UNION ALL
select job_id,job_title, min_salary from jobs where job_id like '%MAN%';        /*будет ошибка так как количество толбцов должно быть одинаковое*/


select job_id col_1, max_salary col_2 from jobs where job_id like '%MAN%'
UNION ALL
select job_title, min_salary from jobs where job_id like '%MAN%';               /*Имена берутся только из ервого селекта*/


select job_id, job_title, min_salary m from jobs where job_id like '%MAN%'
UNION ALL
select job_id, job_title, min_salary  from jobs where job_id like '%MAN%'
order by m DESC;                                                                /*сортровка по алиасам из первого селекта*/

select first_name, last_name, salary from employees where employee_id > 200
UNION ALL
select job_id, job_title, max_salary from jobs where job_id LIKE '%MAN%';


select country_id from countries
UNION ALL
select country_name from countries;                                             /*объединение столбцов с разными типами но с одного смемейства типа число число, строка - строка, дата-дата*/



/*UNION*/
select * from jobs where job_id like '%MAN%'
UNION 
select * from jobs where job_id like '%MAN%';                                   /*Сортирует и объеденяет удаляя все дубликаты*/


select * from jobs where min_salary BETWEEN 4500 and 8000
UNION
select * from jobs where max_salary BETWEEN 10000 and 15000
ORDER BY 3;                                                                     /*Сортировать можно по номеру столбца, по имени не получится*/



/*INTERSECT*/
select * from jobs where job_id like '%MAN%'
INTERSECT 
select * from jobs where job_id like '%MAN%';                                   /*Удаляет дубликаты и сортирует вывод*/


select * from jobs where min_salary BETWEEN 4500 and 8000
INTERSECT
select * from jobs where max_salary BETWEEN 10000 and 15000
ORDER BY 3;                                                                     /*Выводит общие строки для обоих селектов*/

select first_name, last_name from employees
INTERSECT
select street_address, city from locations;                                     /*Будет пустой вывод если нет одинаковых строк*/


select job_id, job_title, max_salary from jobs 
where min_salary BETWEEN 4500 and 8000
INTERSECT
select job_id, job_title, max_salary from jobs 
where max_salary BETWEEN 10000 and 15000
ORDER BY max_salary desc;                                                       /*можно писать ордер бай имя если он указан в первом селекте*/



/*MINUS*/
select * from jobs where job_id like '%MAN%'
MINUS
select * from jobs where job_id like '%MAN%';                                   /*Оставляет только те строки, которые есть в первом селекте но нет во втором*/


select job_id, job_title, max_salary from jobs 
where min_salary BETWEEN 4500 and 8000
MINUS
select job_id, job_title, max_salary from jobs 
where max_salary BETWEEN 10000 and 15000
ORDER BY max_salary desc;                                                       /*из первовг оселекта вычитается второй селект и остатки выводятся. не включает дубликаты и отсортирован*/


