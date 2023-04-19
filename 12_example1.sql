/*CONSTRANIT. БИЗНЕС ПРАВИЛА*/
/*UNIQUE*/
CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,
    faculty_id integer,
    avg_score number(5,2),
    start_date date,
    scholarship integer
    );


CREATE TABLE students (
    id number CONSTRAINT st_id_unique UNIQUE,                                   /*Создаем с уникальным констрайнтом*/
    name varchar2(15),
    course number,
    faculty_id integer,
    avg_score number(5,2),
    start_date date,
    scholarship integer
    );

CREATE TABLE students (
    id number UNIQUE,                                                           /*Создаем с уникальным констрайнтом. Оракл сам выбирает имя*/
    name varchar2(15),
    course number,
    faculty_id integer,
    avg_score number(5,2),
    start_date date,
    scholarship integer
    );

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,
    faculty_id integer,
    avg_score number(5,2),
    start_date date,
    scholarship integer,
    CONSTRAINT st_id_unique UNIQUE (id, name)                                   /*То же самое, но пишем в конце. Создаем с уникальным констрайнтом для нескольких столбцов. */
    );                                                                          /*На уникальность проверяется теперь два столбца*/

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,
    faculty_id integer,
    avg_score number(5,2),
    start_date date,
    scholarship integer,
    UNIQUE (id)                                                                 /*То же самое, но пишем в конце. Создаем с уникальным констрайнтом для одного столбца*/
    );                                                                          /*Оракл сам выбирает имя*/

CREATE TABLE faculties(
    id number,
    name varchar2(15)
    );
       
DROP TABLE students;
DROP TABLE faculties;


select * from students;
select * from faculties;

INSERT INTO students VALUES
    (1,'Zaur', 3, 1, 8.7, TO_DATE('15-sep-17'), 1500);
INSERT INTO students VALUES
    (2,'Max', 3, 3, 5.7, TO_DATE('16-sep-18'), 1700);
INSERT INTO students VALUES
    (NULL,'Jennie', 3, 3, 5.7, TO_DATE('16-sep-18'), 1700);                        
COMMIT;

ALTER TABLE students ADD CONSTRAINT st_id_unique UNIQUE(id);                    /*Добавление констрайнта после создания таблицы*/

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Economics');
INSERT INTO faculties VALUES (2, 'Philology');

ALTER TABLE faculties ADD UNIQUE(id);                                           /*Добавление констрайнта после создания таблицы. Без имени*/
UPDATE faculties set id=3 where name = 'Philology';

ALTER TABLE students MODIFY (id constraint st_id_unique UNIQUE);                /*Короткий вариант написания*/

ALTER TABLE faculties MODIFY (id UNIQUE);                                       /*Еще короче*/

ALTER TABLE students DROP CONSTRAINT st_id_unique;                              /*УДАЛЕНИЕ констрайнта*/