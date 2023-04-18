/*Домашка*/
select * from countries;
CREATE TABLE locations2 AS (select * from locations WHERE 1=2);
select * from locations2;
select * from locations;
INSERT INTO locations2 (select * from locations WHERE country_id ='IT');
COMMIT;

INSERT INTO locations2 VALUES (3300, INITCAP('elfel street 1'),UPPER('450092d'),
    INITCAP('paris'),INITCAP('paris state'),UPPER('fr'));
INSERT INTO locations2 VALUES (3400, INITCAP('Montreal vision street 134'),
    UPPER('450074-m'),INITCAP('montreal'),INITCAP('montreal state'),UPPER('fr'));
COMMIT;

INSERT INTO locations2 (select * from locations where LENGTH(state_province) > 9);
COMMIT;

create table lacations4europe as (select * from locations where 1=2);
select * from lacations4europe;

INSERT ALL
WHEN 1=1 THEN
INTO locations2 
VALUES (location_id,street_address, postal_code, city, state_province, country_id)

WHEN country_id IN (select country_id from countries where region_id = 1) THEN  /*коунтри айди принадлежит первому региону (европа)*/
INTO lacations4europe (location_id, street_address, city, country_id)
VALUES (location_id, street_address, city, country_id)

SELECT * from locations;
COMMIT;

UPDATE locations2 SET postal_code = 'NERT' WHERE postal_code is NULL;
rollback;

UPDATE locations2 SET postal_code = (select postal_code from locations where location_id = 2600)
WHERE postal_code is null;
COMMIT;

DELETE FROM locations2 where country_id = 'IT';
savepoint s1;

UPDATE locations2 SET street_address = 'Sezam st. 18' WHERE location_id > 2500;
savepoint s2;

DELETE FROM locations2 WHERE street_address = 'Sezam st. 18';
ROLLBACK TO SAVEPOINT s1;
COMMIT;



INSERT ALL

WHEN 1=1 THEN
INTO locations2 (location_id,street_address, postal_code, city, state_province, country_id)

WHEN country_id IN (select country_id from countries WHERE region_id = 1) THEN
INTO lacations4europe (location_id,street_address, city, country_id)
VALUES (location_id,street_address, city, country_id)

SELECT * from locations;

