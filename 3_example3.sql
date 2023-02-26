select * from employees;

select * from employees where INSTR(job_id, 'PROG') = 4;

select * from employees where INSTR(job_id, 'CLERK') = 4;

select * from employees where INSTR(hire_date, '05') = 4;

select * from employees where INSTR(salary, '2') = 2;

select * from employees where Length (salary) <5;

select INSTR('Denis Sagidullin','i',5) from dual;

select INSTR('Denis Sagidullin','i',2,1), INSTR('Denis Sagidullin','i',2,2) from dual;


select email, SUBSTR(email, 0, 2) from employees;

select email, SUBSTR(email, 6, 2) from employees;

select SUBSTR('Privetá gag ttt?', 7, 5) from dual;

select SUBSTR('Privetá gag ttt?', 37, 5) from dual;

select salary, SUBSTR(salary, 2, 3) from employees;

select hire_date, SUBSTR(hire_date, 2, 7) from employees;

select SUBSTR('Privetá gag ttt?', -7) from dual;

select 'Privetá gag ttt?', SUBSTR('Privet gag ttt?', -6, 5) from dual;



select REPLACE('Privet gag ttt?', 'gag') from dual;

select REPLACE('Privet gag ttt?', 'gag', 'GAG') from dual;

select REPLACE('Privet gag tttut?', 't','*') from dual;

select REPLACE('FIura rechi ne naidena', ' ') from dual;

select salary, REPLACE(salary,'1','9') from employees order by salary;

select hire_date, REPLACE(hire_date,'.','-') from employees order by salary;
