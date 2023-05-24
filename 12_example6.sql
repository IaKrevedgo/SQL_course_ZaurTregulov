/*INDEX*/
/*B-TREE*/
select * from employees where rowid = 'AAAR3GAAEAAAKTuAAK';                     /*ROWID ������� ������� ������� � ������������� ������. ��������� ��� ���� ������*/

/*  B-TREE ������  ���������� ����:
    1)����� � ������� ����� �����
    2)���������� ����� � ������� / �� ����� ��������� ����� ���������
    3)����� ���������� ��������
    4)������������� WHERE, JOIN �� ����� �������
*/
DROP TABLE students;   
DROP TABLE faculties;
CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,
    faculty_id number
);

CREATE TABLE faculties(                                                         /*������� ������� ������� � �������� ���*/
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
CREATE INDEX in3 ON students (name, ID);                                        /*����� ��� ���������� �������� ���������*/

CREATE UNIQUE INDEX stud_in1 ON students (id); 
CREATE UNIQUE INDEX fuc_in1 ON faculties (id);
CREATE UNIQUE INDEX stud_in2 ON students (course); 
CREATE UNIQUE INDEX stud_in3 ON students (name);

ALTER TABLE students add constraint st_pk primary key (id);
ALTER TABLE students add constraint st_un unique (id);
ALTER TABLE faculties add constraint f_pk primary key (id);
ALTER TABLE students add constraint st_fk foreign key (faculty_id)
    references faculties (id);

DROP INDEX stud_in2;                                                            /*������� ������, ���� �� �� �������� ���*/


/*BITMAP*/
/*��� �������� � ����� ���������� �����*/
CREATE BITMAP INDEX b_ind1 ON students (faculty_id);
select * from v$version;