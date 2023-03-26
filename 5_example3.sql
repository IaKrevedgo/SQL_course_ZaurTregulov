/*Вложенная функция*/

select LENGTH(UPPER(Sysdate)) from dual; /* Глубина 2*/

select SUBSTR (sysdate, add_months('23-mar-23',3)) from dual; /* Несработает так как возвращает дату а нужно число*/

select first_name, LENGTH (first_Name), ROUND (123.456789, LENGTH (first_name))
from employees;                                                         /* округляем число по количеству символов в first_name*/

SELECT first_name, employee_id, LENGTH(first_name),
SUBSTR (first_name, LENGTH(employee_id)),
LENGTH (SUBSTR (first_name, LENGTH(employee_id)))
from employees;

SELECT TO_DATE('23-03-23', 'dd-MM-RR'), /*из текста дату*/
TO_CHAR(TO_DATE('23-03-23', 'dd-MM-RR'), 'day'),    /*день из даты*/
LENGTH(TO_CHAR (TO_DATE('23-03-23','dd-MM-RR'), 'fmday')) /*длину дня*/
FROM DUAL;

select first_name, last_name, phone_number,
TO_NUMBER (SUBSTR(phone_number, INSTR(phone_number, '.') + 1), '999.9999') * 10000 as form_numb
from employees where employee_id < 130;



/*GENERAL FUNCIONS*/

/*NVL*/

select NVL(18,19) from dual;                        /*если первый параметр не null то возвращает его*/

select NVL(null, 19) from dual;                     /*если первый параметр null то возвращает второй параметр*/

select NVL(null, null) from dual;

select first_name, commission_pct, NVL(commission_pct,0) from employees;            /*Заменяет все null на 0*/

select first_name, NVL(SUBSTR(first_name, 6), 'Name is too short') from employees; /* выводит предпреждение о коротком имени если имя меньiе 6*/

select first_name, commission_pct, NVL(salary*commission_pct, 500) bonus from employees; /*если процента нет то бонус 500, если есть процент то бонус усножаем на комиссию*/

select first_name, commission_pct, NVL(salary*commission_pct, 0)+500 bonus from employees; /*если процента нет то бонус 500, если есть процент то бонус усножаем на комиссию*/



/*NVL2*/

select NVL2(18,19,20) from dual;

select NVL2(null,19,20) from dual;

select first_name,NVL2(commission_pct, commission_pct, 0) from employees;

select first_name, NVL2(commission_pct,'ЕСТЬ','НЕТ') from employees;            /*если не нулл то выводим второй параметр, если нулл то третий параметр*/


/*NULIF*/

select NULLIF(19,19) from dual;                                                 /*возвращает NULL если значения равны и 1 значение есил не равны*/

select NULLIF(18,19) from dual;                                                 /*возвращает NULL если значения равны и 1 значение есил не равны*/

select NULLIF('dff','dff') from dual;                                           /*возвращает NULL если значения равны и 1 значение есил не равны*/

select NULLIF(1||5, '15') from dual;

select NULLIF(TO_DATE('18-sep-87'),TO_DATE('18/sep/87')) from dual;

select country_id, country_name,
NVL2(NULLIF(country_id, UPPER(SUBSTR(country_name,1,2))), 'Совпадения нет', 'Sovpadenie naydeno') sravnenie
from countries;


/*COALESCE*/

select COALESCE (3,4,5,6-5,Null) from dual;                                     /*возвращает первй не NULL*/

select COALESCE (null,4,5,6-5,Null) from dual;                                  /*возвращает первй не NULL*/

select COALESCE (null,null,Null) from dual;                                     /*возвращает первй не NULL, если первый не нулл возвращает нулл*/

select COALESCE (17,18) from dual;                                              /*С двумя параметрами аналог NVL(val1,val2)*/

select first_name, commission_pct, manager_id, salary,
COALESCE (commission_pct, manager_id, salary) info
from employees;
