/*TRANSACTIONS*/
/*TCL �������*/
/*ACID  
        A-�����������
                ���� ��� ������� ����������� - ���� ������
        C-��������������� 
                ��� ��������� ������� �� ������ ������� ��� � ����� �����������
        I-���������������
                ��������� ������� ������ ���� ���� �� ������ ������ ���� ���� �� ������� ������
        D-�������������
                ���� ���������� ��������� (������ ��� �������) �� ��� ��������� ����� ��� ����� � ��� �� ����� ���� �������*/
                


/*COMMIT - �������� ���������*/

select * from new_emps;

DELETE from new_emps where name = 'Tregulov';
COMMIT;                                                                         /*��������� ���������� �� ����� ��������*/


INSERT INTO new_emps VALUES (1000, 'Igor', sysdate, 'IT_PROG');
UPDATE new_emps set emp_id = 300 where emp_id = 100;
DELETE FROM new_emps where emp_id = 101;
COMMIT;                                                                         /*��������� ���������� �� 3 ������� �����������*/



/*ROLLBACK*/

DELETE from new_emps;
INSERT INTO new_emps (select employee_id, last_name, hire_date, job_id 
from employees);
COMMIT;

select * from new_emps;
DELETE from new_emps where name = 'Tregulov';
ROLLBACK;                                                                       /*��������� ���������� �� ����� �������� ������������� �����*/

INSERT INTO new_emps VALUES (1000, 'Igor', sysdate, 'IT_PROG');
UPDATE new_emps set emp_id = 300 where emp_id = 100;
DELETE FROM new_emps where emp_id = 101;
ROLLBACK;                                                                       /*��������� ���������� �� 3 ������� ���������� �� ��������*/


DELETE from new_emps;
INSERT INTO new_emps (select employee_id, last_name, hire_date, job_id 
from employees where employee_id < 110);
COMMIT;



/*SAVEPOINT*/

select * from new_emps;
INSERT INTO new_emps VALUES (1002, 'Igor2', sysdate, 'IT_PROG');
savepoint s1;
UPDATE new_emps set emp_id = 300 where emp_id = 109;
savepoint s2;
DELETE FROM new_emps where emp_id = 1002;
ROLLBACK TO SAVEPOINT s2;                                                       /*��������� � ��������� �2. ���������� �� �������*/
ROLLBACK TO SAVEPOINT s1;                                                       /*��������� � ��������� �2. ���������� �� �������*/
COMMIT;                                                                         /*���������� ���������*/

ROLLBACK TO SAVEPOINT s1;                                                       /*����� ������� ���������� ��������*/



/*���� COMMIT*/
set autocommit on;                                                              /*���������� �������*/
UPDATE new_emps set emp_id = 111 where emp_id = 1002;
set autocommit off;                                                             /*���������� ��������*/
DELETE FROM new_emps where emp_id = 1002;


/*SELECT FOR UPDATE*/

select * from new_emps for update;                                              /*������ ���� �� ��� ������� � �������. �� ������ ������ ����� ���������� ��������, ���� �� ���������� ���������*/
DELETE FROM new_emps where emp_id = 1002;
commit;

select * from new_emps;                                                         /*����� ���� � ������ ������ ��������� 1002 � 1001 ��.*/
UPDATE new_emps set emp_id = 111 where emp_id = 300;                            /*� ������� �������� ��� ��������*/
Commit;
UPDATE new_emps set emp_id = 111 where name = 'Igor';                           /*������ ��������� �� ������� ���� �� ����� ��������� ����������*/