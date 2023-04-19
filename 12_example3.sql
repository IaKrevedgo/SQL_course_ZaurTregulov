/*PRIMARY KEY*/
/*Сочетание UNIQUE и NOT NULL*/

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number DEFAULT 3,                                 
    faculty_id integer
    );
    
CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number DEFAULT 3,                                 
    faculty_id integer,
    CONSTRAINT pk1 PRIMARY KEY (id)                                             /*самое читабельное. Желательно, чтобы Праймари кей был один в таблице*/
    );
    
CREATE TABLE students (
    id number CONSTRAINT st_id_pk PRIMARY KEY,                                  /*Нельяз НУЛЛ и повторяющиеся ID*/                                
    name varchar2(15),
    course number DEFAULT 3,                                 
    faculty_id integer
    );
    
    
CREATE TABLE faculties(
    id number,
    name varchar2(15)
    );
       
DROP TABLE students;
DROP TABLE faculties;

select * from students;
select * from faculties;


INSERT INTO students VALUES 
    (5,'Zaur', NULL, 1);                                                        
INSERT INTO students VALUES
    (1,'Zaur', 3, 1);
INSERT INTO students VALUES
    (NULL,'Max', 3, 3);
INSERT INTO students VALUES
        (NULL,'MMMDF', NULL, 4);                                                /*Не дает создать NULL*/              
COMMIT;

ALTER TABLE students MODIFY (course constraint st_course_notnull PRIMARY KEY);  /*Так тож можно*/
ALTER TABLE students MODIFY (course PRIMARY KEY);                               /*И так тож можно*/