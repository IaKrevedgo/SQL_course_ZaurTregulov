/*SEQUENCE*/
/*ѕоследоватльности*/

CREATE SEQUENCE S1;

select S1.nextval from dual;                                                    /*—ледущее значение последовтаельности. –аботает дл€ всех сессий*/
select S1.currval from dual;                                                    /*“екущее значение в текущей сессии*/

drop table students;
drop table faculties;
create table students (
id number primary key,
name varchar2(25)
);

CREATE TABLE faculties(
id number,
name varchar2(15)
);

CREATE SEQUENCE s5;

DROP SEQUENCE s5;

CREATE SEQUENCE seq_faculty start with 20 increment by 5;

INSERT INTO faculties VALUES(seq_faculty.nextval, 'IT');
INSERT INTO students VALUES(seq_st.nextval, 'Zaur', 3, seq_faculty.curval);     /**/
INSERT INTO faculties VALUES(seq_faculty.nextval, 'Marketing');
INSERT INTO faculties VALUES(seq_faculty.nextval, 'Philology');

INSERT INTO students VALUES(seq_st.nextval, 'Misha', 2, 25);                    /**/

select * from students;
select * from faculties;

create sequence s3 increment by 2 maxvalue 17;                                  /*дойдет до 17 и потом будет выдавать ошибку, так как достиг максимума*/

select s3.nextval from dual;

create sequence s4 increment by 2 maxvalue 17 cycle cache 3;
select s4.nextval from dual;

create sequence s5 start with 7 increment by 4 maxvalue 17 cycle cache 2;       /*начинаетс€ с 7, увеличиваетс€ на 4, максимальное 17*/
select s5.nextval from dual;

create sequence s10;

INSERT INTO students VALUES (s10.nextval,'Zaur');
INSERT INTO students VALUES (s10.nextval,'Masha');
INSERT INTO students VALUES (s10.nextval,'Kolya');
INSERT INTO students VALUES (s10.nextval,'Vasya');
drop table seq;
create table seq(
n number
);

select * from seq;
select * from students;

insert into seq values(1);
insert into students values ((select n from seq), 'Zaur');
update seq set n= n+1;                                                          /*увеличиваем значение в таблице сек*/

DROP sequence s10;

ALTER SEQUENCE s10 increment by 5;

