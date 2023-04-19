/*ƒŒÃ¿ÿ ¿*/
select * from employees;

CREATE TABLE friends AS 
    (select employee_id id, first_name name, last_name surname 
    from employees 
    WHERE commission_pct IS NOT NULL);                                          

select * from friends;

ALTER TABLE friends ADD (email varchar2(32));

ALTER TABLE friends MODIFY (email DEFAULT 'no email');

INSERT INTO friends (id, name, surname)
    VALUES (222, 'Denis', 'Sagi');
    
ALTER TABLE friends RENAME COLUMN id TO friends_id;

DROP TABLE friends;

ALTER TABLE friends MODIFY(
    id integer,
    name varchar2(15),
    surname varchar2(15),
    salary number(8,2) DEFAULT 500,
    city varchar2(15),
    birthday date DEFAULT TO_DATE('01-JAN-1901')
    );

CREATE TABLE friends (
    id integer,
    name varchar2(30),
    surname varchar2(30),
    salary number(8,2) DEFAULT 500,
    city varchar2(30),
    birthday date DEFAULT TO_DATE('01-JAN-1901','DD-MON-YYYY')
    );
    
INSERT INTO friends 
    VALUES (224, INITCAP('Dast'), INITCAP('asac'), 15000.34, INITCAP('moscow'),
    TO_DATE('03-AUG-1923'));
    
INSERT INTO friends (id, name, surname, city)
    VALUES (225, INITCAP('Newa'), INITCAP('firest'), INITCAP('berliin'));
    
select * from friends;   

COMMIT;

ALTER TABLE friends DROP COLUMN salary;

ALTER TABLE friends SET UNUSED COLUMN email;
ALTER TABLE friends SET UNUSED COLUMN birthday;

ALTER TABLE friends DROP UNUSED COLUMNS;  

ALTER TABLE friends READ ONLY;  

INSERT INTO friends (id, name, surname, city)
    VALUES (225, INITCAP('Newa'), INITCAP('firest'), INITCAP('berliin'));
    
TRUNCATE TABLE friends;

DROP TABLE friends;