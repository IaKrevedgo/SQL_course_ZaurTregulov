/*DDL команды*/
select object_type, count(object_type) from user_objects
group by object_type order by object_type;

select object_type, count(object_type) from all_objects
group by object_type order by object_type;

select table_name from user_tables;

select column_name, data_type, nullable from user_tab_columns 
where table_name = UPPER('departments');                                        /*ИМЕНА должны быть азшглавными буквами*/


select last_name, salary from employees where rowid > 'AAAR9oAAHAAAADOAAF';     /*Зашифрованный тип данных показывающий адрес строки*/


