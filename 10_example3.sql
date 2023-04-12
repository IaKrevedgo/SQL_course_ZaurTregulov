/*DELETE*/

select * from employees;
                                                   

DELETE from new_emps;                                                           /*������ ��� ������ �� ������� ���� ��� WHERE*/

INSERT INTO new_emps (select employee_id, first_name, hire_date, job_id
    from employees);                                                            /*������� ��� ������ �� ������� employees � ������� new_emps*/

select * from new_emps;

DELETE FROM new_emps WHERE emp_id = 210;                                        /*������� 1 ������*/

DELETE FROM employees WHERE employee_id = 212;

DELETE FROM new_emps WHERE job LIKE '%CLERK%' OR name is NULL; 


DELETE FROM new_emps WHERE job IN 
(select distinct job_id from employees where department_id IN
    (select department_id from departments where manager_id=100));              /*������� ������ ��� JOB ��������� � ������������� ��� �������_�� = 100*/