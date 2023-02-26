select * from employees;

select first_name, LOWER(first_name) from employees;

select LOWER ('FFFGGGgfgfgFFFFVVVVWWWOOPO') from dual;

select * from employees where LOWER(first_name) = 'david';

select * from employees where LOWER(first_name) like '%an%';

select LOWER (2+2*2) from dual;

select LOWER ('Priveet '|| 'Skolko tebe let? '|| 39) from dual;



select first_name, UPPER(first_name) from employees;

select UPPER ('Priveet '|| 'Skolko tebe let? '|| 39) from dual;

select UPPER ('FFFGGGgfgfgFFFFVVVVWWWOOPO') from dual;

select * from employees where UPPER(first_name) = 'STEPHEN';



select INITCAP('FFFGGGgfgfgFFFFVVVVWWWOOPO') from dual;

select INITCAP('Priveet '|| 'Skolko tebe let? '|| 39) from dual;

select INITCAP('Name is '|| first_name||' and surname is '|| last_name) AS full_name from employees;