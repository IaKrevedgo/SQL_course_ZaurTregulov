/*TRANSACTIONS*/
/*TCL команда*/
/*ACID  
        A-Атомарность
                Либо все команды срабатывают - либо ниодна
        C-Соглассованость 
                Как выглядила таблица на момент запроса так и будет выполняться
        I-Изолированность
                Изменения которые вносит один юзер не увидит другой юзер пока не сделает КОММИТ
        D-Долговечность
                Если транзакция завершена (КОММИТ или РОЛЛБАК) то все изменения видят все юзеры и они не могут быть утеряны*/
                


/*COMMIT - ПРИНЯТИЕ ИЗМЕНЕНИЙ*/

select * from new_emps;

DELETE from new_emps where name = 'Tregulov';
COMMIT;                                                                         /*Завершает транзакцию из одной комманды*/


INSERT INTO new_emps VALUES (1000, 'Igor', sysdate, 'IT_PROG');
UPDATE new_emps set emp_id = 300 where emp_id = 100;
DELETE FROM new_emps where emp_id = 101;
COMMIT;                                                                         /*Завершает транзакцию из 3 комманд сохранением*/



/*ROLLBACK*/

DELETE from new_emps;
INSERT INTO new_emps (select employee_id, last_name, hire_date, job_id 
from employees);
COMMIT;

select * from new_emps;
DELETE from new_emps where name = 'Tregulov';
ROLLBACK;                                                                       /*Завершает транзакцию из одной комманды откатываением назад*/

INSERT INTO new_emps VALUES (1000, 'Igor', sysdate, 'IT_PROG');
UPDATE new_emps set emp_id = 300 where emp_id = 100;
DELETE FROM new_emps where emp_id = 101;
ROLLBACK;                                                                       /*Завершает транзакцию из 3 комманд откатываем на исходную*/


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
ROLLBACK TO SAVEPOINT s2;                                                       /*Откатится к сейвпоинт С2. Транзакция НЕ ЗАКРЫТА*/
ROLLBACK TO SAVEPOINT s1;                                                       /*Откатится к сейвпоинт С2. Транзакция НЕ ЗАКРЫТА*/
COMMIT;                                                                         /*Транзакция завершена*/

ROLLBACK TO SAVEPOINT s1;                                                       /*После коммита сейвпоинты исчезают*/



/*АВТО COMMIT*/
set autocommit on;                                                              /*Автокоммит включен*/
UPDATE new_emps set emp_id = 111 where emp_id = 1002;
set autocommit off;                                                             /*автокоммит выключен*/
DELETE FROM new_emps where emp_id = 1002;


/*SELECT FOR UPDATE*/

select * from new_emps for update;                                              /*Ставит блок на всю выборку в селекте. Из другой сессии будет невозмонжо изменить, пока не закончится транзакця*/
DELETE FROM new_emps where emp_id = 1002;
commit;

select * from new_emps;                                                         /*Перед этим в другой сессии заблочили 1002 и 1001 ИД.*/
UPDATE new_emps set emp_id = 111 where emp_id = 300;                            /*С другими строками все работает*/
Commit;
UPDATE new_emps set emp_id = 111 where name = 'Igor';                           /*Задача подвисает до времени пока не будет закончена транзакция*/