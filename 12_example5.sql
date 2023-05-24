/*CHECK*/
/*Проверяет значение столбца на оперделенные правила*/
DROP TABLE students;

select * from students;

truncate table faculties;


CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number constraint ch CHECK (course >0 AND course < 6),               /*Не даст добавить если значение не входит в условие*/                  
    faculty_id integer                                     
    );
    
    
INSERT INTO students VALUES 
    (1,'Zaur', 6,'fdfdf@com', 1);     
INSERT INTO students VALUES 
    (2,'Den', 2, 2);
INSERT INTO students VALUES 
    (3,'Nina', 1, 1);
 
 
update students set course = 10; 
 
CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    start_date date constraint ch CHECK (date < sysdate -5),                    /*Не даст создать если тип дата*/                  
    faculty_id integer                                     
    );
    
CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    course number,
    email varchar(15) CHECK (INSTR(email,'@') >0) constraint un UNIQUE,                              /*Проверяет если в строке знак @*/
    faculty_id integer,
    constraint ch CHECK (course >id)                                            /*С другими столбцами можно сравнить только написав так*/  
    );
    
alter table students modify (id constraint ch1 Check (id>=1));
ALTER TABLE students add constraint ch3 check (course <0);

select * from employees;

create table new_emps10 AS select * from employees;                             /*Копируются констрейнты NOT NULL и чек из таблицы для создания*/