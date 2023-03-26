/*CONDITION FUNCTIONS*/

/*DECODE*/ /*работает только в оракле*/

select DECODE(3*4, 12, 'dvenadcat') from dual;                                   /*есил второй параметр равен первому то выводится третий параметр*/

select DECODE(3*4, 13, 'dvenadcat') from dual;                                  /* есил не совпадает то null*/

SELECT DECODE(4*4, 12, 'dvenadcat', 14, 'cheturka', 15,'pytnadcat', 16,'shestnadcat')
from dual;

SELECT DECODE(4*5, 12, 'dvenadcat', 14, 'cheturka', 15,'pytnadcat', 16,'shestnadcat','NET SOVPADENY') result /*если в конце добавить одиночный параметр то он будет ответом на NULL*/
from dual;

Select DECODE(null,5,'ok',null,55) from dual;

select DECODE(2+2*2, 5,'five', 12/2, 'six1', 6,'six2','!!!') from dual;               /*выводит первое найденное выражение*/

select first_name, commission_pct,
DECODE(commission_pct, null, 'NOT COMMISION',0.1,'MALO',0.4,'MNOGO','standart') result
from employees
where employee_id between 140 and 180;



/*CASE*/
/*SIMPLE*/

select 
CASE 3*4
WHEN 12 THEN 100
END
from dual;

select 
CASE 3*4
WHEN 12 THEN 'twelve'
END
from dual;

select 
CASE 3*4
WHEN 11 THEN 'eleven'
WHEN 12 THEN 'twelve1'
WHEN 24/2 THEN 'twelve2'
END
from dual;

select 
    CASE 3*5
        WHEN 11 THEN 'eleven'
        WHEN 12 THEN 'twelve1'
        WHEN 24/2 THEN 'twelve2'
    ELSE 'milloin'
END
from dual;

select first_name,
    CASE LENGTH (first_name)
        WHEN 4 THEN 'ochen korotkoe imya'
        WHEN 5 THEN 'korotkoe imya'
        WHEN 6 THEN 'srednee imya'
        WHEN 7 THEN 'dlinnoe imya'
        WHEN 8 THEN 'ochen dlinnoe imya'
    ELSE 'dlina ne izvestna'
    END result
from employees
order by LENGTH(first_name);


/*SEARCHED CASE*/

select
    CASE
        WHEN 3*4=12 THEN 100
    END
from dual;

select 
    CASE 
        WHEN 3*4=12 THEN 'twelve'
    END
from dual;

select 
    CASE 
        WHEN 3*4=11 THEN 'eleven'
        WHEN 3*4=12 THEN 'twelve1'
        WHEN 3*4=24/2 THEN 'twelve2'
END
from dual;


select 
    CASE 
        WHEN 3*4=11 THEN 'eleven'
        WHEN 'ok'='ok' THEN 'twelve1'
        WHEN 50/2*4=24/2 THEN 'twelve2'
END
from dual;


select 
    CASE 
        WHEN 3*4=11 THEN 'eleven'
        WHEN 'ok'='Ok' THEN 'twelve1'
        WHEN 50/2*4=24/2 THEN 'twelve2'
    ELSE '!!!!'
    END result
from dual;

select first_name,
    CASE 
        WHEN LENGTH (first_name) = 4 THEN 'ochen korotkoe imya'
        WHEN LENGTH (first_name) = 5 THEN 'korotkoe imya'
        WHEN LENGTH (first_name) = 6 THEN 'srednee imya'
        WHEN LENGTH (first_name) = 7 THEN 'dlinnoe imya'
        WHEN LENGTH (first_name) = 8 THEN 'ochen dlinnoe imya'
        WHEN LENGTH (first_name) < 4 THEN 'too small'
        WHEN LENGTH (first_name) > 8 THEN 'too BIG'
    ELSE 'dlina ne izvestna'
    END result
from employees
order by LENGTH(first_name);


select first_name, salary, commission_pct,                                      
    CASE                                                                        /*Срабатывают условия по порядку*/
        WHEN LENGTH (first_name) <= 5 THEN 'Srabotalo uslovie 1'
        WHEN salary*10 > 100000 THEN 'Srabotalo uslovie 2'
        WHEN commission_pct is not null THEN 'Srabotalo uslovie 3'
    ELSE 'Ni odno uslovir ne srabotalo'
    END result
from employees;