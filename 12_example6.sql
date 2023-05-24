/*INDEX*/
/*B-TREE*/
select * from employees where rowid = 'AAAR3GAAEAAAKTuAAK';                     /*ROWID скрытая колонка таблицы с индефикатором строки. Уникально для всех таблиц*/

/*  B-TREE индекс  эффективен если:
    1)Когда в таблице много строк
    2)Количество строк в оутпует / на общее количство строк небольшое
    3)Много уникальных значений
    4)Использование WHERE, JOIN по этому столбцу
*/
DROP TABLE students;   
DROP TABLE faculties;
CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,
    faculty_id number
);

CREATE TABLE faculties(                                                         /*Сначала создаем таблицу с праймари кей*/
    id number,
    name varchar2(15)
    );  
select * from students;
select * from faculties;

truncate table faculties;

  
select * from employees;
CREATE INDEX in1 ON students(id);                                               /*B-TREE, NON UNIQUE*/

INSERT INTO students VALUES (1, 'Den', 3);
INSERT INTO students VALUES (2, 'Erra', 2);
INSERT INTO students VALUES (2, 'Falus', 5);
INSERT INTO students VALUES (2, 'Falus', 3);

select * from students;
CREATE UNIQUE INDEX in2 ON students (name);                                     /*B-TREE, UNIQUE*/
CREATE INDEX in3 ON students (name, ID);                                        /*Можно для несокльких столбцов создавать*/

CREATE UNIQUE INDEX stud_in1 ON students (id); 
CREATE UNIQUE INDEX fuc_in1 ON faculties (id);
CREATE UNIQUE INDEX stud_in2 ON students (course); 
CREATE UNIQUE INDEX stud_in3 ON students (name);

ALTER TABLE students add constraint st_pk primary key (id);
ALTER TABLE students add constraint st_un unique (id);
ALTER TABLE faculties add constraint f_pk primary key (id);
ALTER TABLE students add constraint st_fk foreign key (faculty_id)
    references faculties (id);

DROP INDEX stud_in2;                                                            /*Удалить индекс, если он не праймари кей*/


/*BITMAP*/
/*Для столбцов с малым количество строк*/
CREATE BITMAP INDEX b_ind1 ON students (faculty_id);
select * from v$version;