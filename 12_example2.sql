/*CONSTRANIT. БИЗНЕС ПРАВИЛА*/
/*NOT NULL*/

select * from employees;

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number DEFAULT 3,                                 
    faculty_id integer
    );


CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number CONSTRAINT stud_course NOT NULL,                              /*Констрейнт НОТ  НУЛ*/
    faculty_id integer
    );

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number NOT NULL,                                                     /*Тоже самое. Констрейнт НОТ  НУЛ.*/
    faculty_id integer
    );
 
CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number NOT NULL,                                                     /*Тоже самое. Констрейнт НОТ  НУЛ.*/
    faculty_id integer,
    constraint con1 UNIQUE(course)                                              /*Добавляем еще один констрейнт на столбец курс*/
    
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
    (5,'Zaur', NULL, 1);                                                        /*Если дефолт значение даже есть. Писать NULL нельзя есил есть констрейнт*/
INSERT INTO students VALUES
    (1,'Zaur', 3, 1);
INSERT INTO students VALUES
    (2,'Max', 3, 3);
INSERT INTO students VALUES
        (NULL,'MMMDF', NULL, 4);                                                /*Не дает создать NULL*/              
COMMIT;


ALTER TABLE students MODIFY (course constraint st_course_notnull NOT NULL);     /*Так тож можно*/
ALTER TABLE students MODIFY (course NOT NULL);                                  /*И так тож можно*/

ALTER TABLE students MODIFY (course NULL);                                      /*Убираем констрейнт НОТ НУЛЛ*/