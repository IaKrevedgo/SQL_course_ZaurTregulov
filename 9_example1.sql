/*SET OPERATORS*/
/*UNION ALL*/

select * from jobs where job_id like '%MAN%'
UNION ALL
select * from jobs where job_id like '%MAN%';                                   /*� ������ 4 ������� �������������� ������ 4 ������� �� �������*/


select job_id,job_title from jobs where job_id like '%MAN%'
UNION ALL
select job_id,job_title, min_salary from jobs where job_id like '%MAN%';        /*����� ������ ��� ��� ���������� ������� ������ ���� ����������*/


select job_id col_1, max_salary col_2 from jobs where job_id like '%MAN%'
UNION ALL
select job_title, min_salary from jobs where job_id like '%MAN%';               /*����� ������� ������ �� ������ �������*/


select job_id, job_title, min_salary m from jobs where job_id like '%MAN%'
UNION ALL
select job_id, job_title, min_salary  from jobs where job_id like '%MAN%'
order by m DESC;                                                                /*��������� �� ������� �� ������� �������*/

select first_name, last_name, salary from employees where employee_id > 200
UNION ALL
select job_id, job_title, max_salary from jobs where job_id LIKE '%MAN%';


select country_id from countries
UNION ALL
select country_name from countries;                                             /*����������� �������� � ������� ������ �� � ������ ���������� ���� ����� �����, ������ - ������, ����-����*/



/*UNION*/
select * from jobs where job_id like '%MAN%'
UNION 
select * from jobs where job_id like '%MAN%';                                   /*��������� � ���������� ������ ��� ���������*/


select * from jobs where min_salary BETWEEN 4500 and 8000
UNION
select * from jobs where max_salary BETWEEN 10000 and 15000
ORDER BY 3;                                                                     /*����������� ����� �� ������ �������, �� ����� �� ���������*/



/*INTERSECT*/
select * from jobs where job_id like '%MAN%'
INTERSECT 
select * from jobs where job_id like '%MAN%';                                   /*������� ��������� � ��������� �����*/


select * from jobs where min_salary BETWEEN 4500 and 8000
INTERSECT
select * from jobs where max_salary BETWEEN 10000 and 15000
ORDER BY 3;                                                                     /*������� ����� ������ ��� ����� ��������*/

select first_name, last_name from employees
INTERSECT
select street_address, city from locations;                                     /*����� ������ ����� ���� ��� ���������� �����*/


select job_id, job_title, max_salary from jobs 
where min_salary BETWEEN 4500 and 8000
INTERSECT
select job_id, job_title, max_salary from jobs 
where max_salary BETWEEN 10000 and 15000
ORDER BY max_salary desc;                                                       /*����� ������ ����� ��� ��� ���� �� ������ � ������ �������*/



/*MINUS*/
select * from jobs where job_id like '%MAN%'
MINUS
select * from jobs where job_id like '%MAN%';                                   /*��������� ������ �� ������, ������� ���� � ������ ������� �� ��� �� ������*/


select job_id, job_title, max_salary from jobs 
where min_salary BETWEEN 4500 and 8000
MINUS
select job_id, job_title, max_salary from jobs 
where max_salary BETWEEN 10000 and 15000
ORDER BY max_salary desc;                                                       /*�� ������� �������� ���������� ������ ������ � ������� ���������. �� �������� ��������� � ������������*/


