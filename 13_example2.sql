/*VIEW продолжение*/
CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number
);
DROP TABLE students;

INSERT INTO students VALUES (1,'Zaur', 3);
INSERT INTO students VALUES (2,'Misha', 2);
INSERT INTO students VALUES (3,'Kolya', 4);
INSERT INTO students VALUES (4,'Vasya', 5);
INSERT INTO students VALUES (5,'Patya', 1);

CREATE OR REPLACE VIEW fin_emp2 AS select * from students;                      /*Если ВЬЮ есть то заменяет его новым*/
select * from fin_emp2;

CREATE OR REPLACE VIEW v201 AS select name, surname from students2;             /*Если нет столбцов или таблицы вью не создастся*/

CREATE FORCE VIEW v201 AS select * from students2;                              /*Таблицы нет, но вью создастся, VIEW заработает когда будет создана таблица STUDENTS2*/


create view v202 as select * from students where course >2;
select * from v202;

INSERT INTO v202 VALUES (7,'Katya',1);

create view v203 as select * from students where course >2 WITH CHECK OPTION;   /*Будет проверяться условие при добавлении строк во ВЬЮ*/
select * from v203;

INSERT INTO v203 VALUES (7,'Katya',5);
UPDATE v203 SET course = 1 where name = 'Katya';                                /*УПДАТЕ не пройдет так как нарушиться условие course >2*/
UPDATE v203 SET course = 8 where name = 'Katya';                                /*УПДАТЕ проейдет так как условие соблюдается*/

create view v204 as select * from students WITH READ ONLY;                      /*Создается ИБЮ в котором запрещены любые DML команды (может использоваться только для селекта)*/
select * from v204;

create view v210 as select * from students 
    WITH READ ONLY constraint ogranichenie_1;                                   /*можно использовать для уточнения, что Вью рид онли*/
select * from v210;

create view v211 (a,b,c) as select * from students;                             /*Можно создать сразу алиасы для всех столбцов во вью.Количество должно совпадать с числом колонок в селекте после AS*/
select * from v211;

CREATE VIEW v212 AS select * from v211;                                         /*можно создавать один вью из другого*/


CREATE FORCE VIEW v18 as select name, last_name from students;                  /*СОЗДАЕМ с несуществующим полем last_name*/
select * from v18;

ALTER TABLE students ADD (last_name varchar2(15));
ALTER VIEW v18 compile;

DROP VIEW v18;

create view v301 as select * from students where id > 4; 
select * from v301 where name= 'Patya';