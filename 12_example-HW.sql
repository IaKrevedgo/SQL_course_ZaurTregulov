/*Домашка 12 раздел*/

CREATE TABLE address (
    id number CONSTRAINT ad_in_un UNIQUE,
    country VARCHAR(15),
    city VARCHAR(64)
    );

CREATE TABLE friends (
    id number, 
    name VARCHAR(20),
    email VARCHAR(20),
    adress_id number CONSTRAINT ad_FK REFERENCES address(id) ON DELETE SET NULL,
    birthday date,
    CHECK (LENGTH(name) > 3)
    );
    
CREATE UNIQUE INDEX fr_un1 ON friends(id);

ALTER TABLE friends ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

CREATE INDEX fr_email_in ON friends (email);

ALTER TABLE friends MODIFY (
    email CONSTRAINT fr_email_nn NOT NULL
    );

DROP TABLE friends;

DROP TABLE address;