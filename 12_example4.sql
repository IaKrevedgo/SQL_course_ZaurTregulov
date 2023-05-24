/*CONSTRANIT. БИЗНЕС ПРАВИЛА*/
/*FOREIGN KEY*/
/*В чайлд таблице столбец должен быть PRIMARY KEY или UNIQUE и одинаковым типом данных*/

DROP TABLE students;
DROP TABLE faculties;

select * from students;
select * from faculties;

truncate table faculties;

CREATE TABLE faculties(                                                         /*Сначала создаем таблицу с праймари кей*/
    id number primary key,
    name varchar2(15)
    );

CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    course number,                                 
    faculty_id integer REFERENCES faculties                                     /*Столбец ссылается на столбец ИД таблицы ФАКУЛЬТЕТ*/
    );
    
CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    course number,                                 
    faculty_id integer CONSTRAINT st_fac_FK REFERENCES faculties(id)            /*Столбец ссылается на столбец ИД таблицы ФАКУЛЬТЕТ*/
    );

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,                                 
    faculty_id integer,
    CONSTRAINT fk FOREIGN KEY (faculty_id) REFERENCES faculties(id)              /*То же самое*/
    );
    
INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Marketing');
INSERT INTO faculties VALUES (3, 'Programming');

INSERT INTO students VALUES 
    (1,'Zaur', 3, 3);                                                           /*Так будет ошибка, так как в факультетеах нету с номером 5*/
    
INSERT INTO students VALUES 
    (1,'Zaur', 3, 1);     
INSERT INTO students VALUES 
    (2,'Den', 2, 2);
INSERT INTO students VALUES 
    (3,'Nina', 1, 1);
    
    
    select r.region_name, COUNT(*) 
from employees e, departments d, locations l, countries c, regions r 
where 
    e.department_id = d.department_id AND d.location_id = l.location_id 
    AND l.country_id = c. country_id AND c.region_id = r.region_id
GROUP BY r.region_name;

ALTER TABLE students MODIFY (id primary key);

delete from faculties where id = 1;                                             /*Если есть связаные столбцы то не даст удалить*/


/*----------------------*/
CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    course number,                                 
    faculty_id integer REFERENCES faculties ON DELETE CASCADE                   /*При удалении удаляет связаные строки в обоих таблицах*/
    );

delete from faculties where id = 1; 

CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    course number,                                 
    faculty_id integer REFERENCES faculties ON DELETE SET NULL                  /*При удалении заменяет значения в связанных столбцах на NULL*/
    );
    
delete from faculties where id = 1; 

CREATE TABLE students (
    id number primary key,                                                                  
    name varchar2(15),
    course number,                                 
    faculty_id integer NOT NULL, 
    CONSTRAINT fk FOREIGN KEY  (faculty_id) 
        REFERENCES faculties ON DELETE SET NULL                                 /*При удалении выдаст ошику так как не сможет вставить NULL*/
    ); 