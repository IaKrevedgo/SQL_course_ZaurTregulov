/*CONSTRANIT. БИЗНЕС ПРАВИЛА*/
/*FOREIGN KEY*/
/*В чайлд таблице столбец должен быть PRIMARY KEY или UNIQUE и одинаковым типом данных*/

select * from students;
select * from faculties;

CREATE TABLE faculties(                                                         /*Сначала создаем таблицу с праймари кей*/
    id number primary key,
    name varchar2(15)
    );
    
CREATE TABLE students (
    id number,                                                                  
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

INSERT INTO students VALUES 
    (1,'Zaur', 3, 5);                                                           /*Так будет ошибка, так как в факультетеах нету с номером 5*/
    
INSERT INTO students VALUES 
    (1,'Zaur', 3, 1);     
INSERT INTO students VALUES 
    (2,'Den', 3, 2);
INSERT INTO students VALUES 
    (3,'Nina', 3, 1);
    
    
    select r.region_name, COUNT(*) 
from employees e, departments d, locations l, countries c, regions r 
where 
    e.department_id = d.department_id AND d.location_id = l.location_id 
    AND l.country_id = c. country_id AND c.region_id = r.region_id
GROUP BY r.region_name;