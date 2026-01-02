select * from employees;

select avg(salary),job_id
from employees
group by job_id;

select avg(salary) from employees
group by job_id;

--name = <10000 ==>90 order by emp id
select first_name from employees where salary > 10000 and department_id < 90
order by employee_id desc;

select first_name,salary from employees where salary > 10000 and department_id < 90 
order by employee_id;

select EMPLOYEE_ID,FIRST_NAME ,PHONE_NUMBER from employees;

select 
    employee_id,
    first_name ,
    phone_number
    from employees;
    

select salary from employees
where salary>10000 ;

select salary from employees where salary 
> 1000;

-- DATA RESTRICTION
select * from employees where employee_id = 100;
select * from employees where FIRST_NAME = 'Lex';

select * from employees where first_name = 'Lex';

select salary,first_name,job_id from employees where FIRST_NAME = 'David';
select first_name, employee_id,salary from employees where First_name ='Alexander';

--in and Not
select first_name from employees where first_name in ('Neena','Steven');

select * from employees where FIRST_NAME in( 'Neena','Steven');
select * from employees where DEPARTMENT_ID  in (50 , 60);
select FIRST_NAME,SALARY,email from employees where MANAGER_ID  in (100 , 101);
select * from employees where first_name not in ('Steven','Neena');
--like
select * from employees where first_name  like '%a';--for end name 
select * from employees where first_name  like 'A%';--for start name
select * from employees where first_name  like '%a%'; --if we have letter in that name 
select * from employees where first_name  like '___a%';--it gives second letter in name ,

--dual

select 1 from dual;
select sysdate from  dual;
select sysdate+1 from  dual;

--Add months
select add_months(sysdate,1) from dual;
select add_months(sysdate,-1) from dual;

--months_betwen
select MONTHS_BETWEEN(sysdate,'17-07-2024') from dual;
select round(months_between('18-06-2025','17-05-2024'),9) from dual;

--Next Day
select next_day(sysdate,2) from dual;

--Last day
select last_day(sysdate) from dual;

--Data type
--To char
select to_char(sysdate,'Dd-Mon-YYYY') from dual;--yy LAST TWO NUM
select to_date('03-march-2005') from dual;

SELECT TO_CHAR(SYSDATE,'DAY-MON-YYYY') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DD-MON-YYYY') FROM DUAL;

--TO DATE
SELECT SYSDATE FROM DUAL;
SELECT TO_DATE('22/JULY/2025') FROM DUAL;--  22-05-25

--30-05-2004

SELECT TO_DATE('30-07-2004') FROM DUAL;
SELECT TO_CHAR(TO_DATE('30-05-2004'),'Day - Month - Year ')FROM DUAL;

-- 30-05-2025
select to_char(to_date('30-05-2025','dd-mm-yyyy'),'day-month-year') from dual;

--GENERAL FUNCTIONS

--GREATEST
SELECT GREATEST(3,4,5) FROM DUAL;

--LEAST
SELECT LEAST(3,4,5) FROM DUAL;

SELECT FIRST_NAME,UPPER(FIRST_NAME),LOWER(FIRST_NAME),INITCAP(FIRST_NAME) FROM EMPLOYEES;

--SUBSTR
SELECT FIRST_NAME,SUBSTR(FIRST_NAME,3,2) FROM EMPLOYEES;--INTERVIEW QUESTION

--INSTR
SELECT FIRST_NAME,INSTR(FIRST_NAME,'n',1,2) FROM EMPLOYEES;
--LENGTH
SELECT FIRST_NAME ,LENGTH(FIRST_NAME) FROM EMPLOYEES;

--REVERSE
SELECT FIRST_NAME, REVERSE(FIRST_NAME) FROM EMPLOYEES;

--REPLACE

SELECT FIRST_NAME, REPLACE(FIRST_NAME,'e') FROM EMPLOYEES;---ITS REMOVED "THAT CHARACTER " FROM NAME

SELECT FIRST_NAME, REPLACE(FIRST_NAME,'Ellen','king') AS ALTER_NAME FROM EMPLOYEES;--ITS REPLACE FROM HERE

--TRANSLATE
SELECT FIRST_NAME, TRANSLATE(FIRST_NAME,'e','a') FROM EMPLOYEES;
SELECT FIRST_NAME, TRANSLATE(FIRST_NAME,'el','10') FROM EMPLOYEES;--HERE IT REPLACE WITH SEPARATELY e-->a,l-->b

select replace('BCA','BCA','mcom') from dual;
SELECT REPLACE('Hello World', 'World', 'Oracle') AS result FROM dual;
-- Output: 'Hello Oracle'

SELECT TRANSLATE('Hello World', 'HW', 'JY') AS result FROM dual;
-- Output: 'Jello Yorld'


SELECT TRANSLATE('BCBA', 'BCA', 'MBA') FROM dual;


--PAD

--RPAD(RIGH TPAD)
SELECT FIRST_NAME, RPAD(FIRST_NAME,'6','.') FROM EMPLOYEES;---EACH NUMBER HAS EQUAL NUMBER LENGTH ADDS X IN RIGHT 


--LPAD-LEFT PAD
--The LPAD function adds characters to the left side of a string until it reaches a specified length.
SELECT FIRST_NAME, LPAD(FIRST_NAME,'8','X') FROM EMPLOYEES;---EACH NUMBER HAS EQUAL NUMBER LENGTH ADDS X IN LEFT 

--TRIM
--LTRIM
--RTRIM
SELECT FIRST_NAME, LTRIM('XXX HELLO WORLD XXX','X') FROM EMPLOYEES;---EACH NUMBER HAS EQUAL NUMBER LENGTH ADDS X IN LEFT 

--RTRIM
SELECT FIRST_NAME, RTRIM('XiX HELLO WORLD oo','o') FROM EMPLOYEES;---EACH NUMBER HAS EQUAL NUMBER LENGTH ADDS X IN LEFT 

--
SELECT FIRST_NAME, REPLACE('XXX HELLO WORLD XXX','X') FROM EMPLOYEES;--REPLACE

--ABS
SELECT ABS(5-8) FROM DUAL;--DONT GET SIGN
--TRUNK
SELECT TRUNC(1.7) FROM DUAL;--it removes fractional point
--CEIL
SELECT CEIL(2.1) FROM DUAL;--IT GIVE NEXT NUMBER
--ROUND
SELECT ROUND(2.5) FROM DUAL;--3 5 AND GREATER THAN 5 IT GIVES NEXT VALUE
SELECT ROUND(2.1) FROM DUAL;--2


--SIGN
SELECT SIGN(0) FROM DUAL;--0 IF ITS 0
SELECT SIGN(3) FROM DUAL;--1 IF WE GIVE POSITIIVE VALUE IT GIVES 1
SELECT SIGN(-3) FROM DUAL;--IT  IF WE GIVE NEGATIVE VALUE IT GIVES -1

--MOD
SELECT MOD(5,2) FROM DUAL;-- IT GIVES REMINDER


--CONTROL STATEMENTS
SELECT DEPARTMENT_ID FROM EMPLOYEES;
--DECODE
SELECT DEPARTMENT_ID,DECODE(DEPARTMENT_ID,10,'A',90,'B','X')FROM EMPLOYEES ;

select first_name,department_id,
case
when department_id in (10,20) then 'A'
when department_id in(90,60) then 'B'
else
'C'
end as Grade 
 from employees;
 
 select first_name , decode(department_id ,10,'A',20,'B',30,'C','D') from employees;
 SELECT DEPARTMENT_ID,DECODE(DEPARTMENT_ID,10,'A',90,'B','X')FROM EMPLOYEES ;
 
 select first_name , 
 case
 when department_id = 10 then 'A'
 when department_id = 20 then 'B'
 else 
 'x'
 end
 from employees;




















--CASE----DECODE IS FASTER (WHICH ONE IS FASTER)
SELECT DEPARTMENT_ID,
CASE
WHEN DEPARTMENT_ID = 10 THEN 'A'
WHEN DEPARTMENT_ID  =20 THEN 'B'
ELSE 'X'
END -- END AS NAME
FROM DEPARTMENTS;

select * from employees;


select  min(salary),max(salary),avg(salary),sum(salary),count(salary) from employees;


--max
select department_id, max(salary)
from employees
group by department_id
order by department_id ;
--min
select department_id,min(salary)
from employees
group by department_id 
order by department_id;

select department_id,count(employee_id)
from employees
group by department_id 
order by department_id;

select* from employees;

select department_id,max(salary)
from employees
group by department_id
having  max(salary) > 10000
order by department_id;

select department_id,count(employee_id)
from employees
group by department_id
having count(employee_id) > 40
order by department_id;

--SELECT transaction_type,transaction_amont from transactions;

--select bname,sum(bamt)
--from sales
--group by bname
--order by;
--
--select baname,sum(bamt)
--from sales
--group by bname
--having sum(bamt) > 15000
--order by ;

select * from employees;

select HIRE_DATE,COUNT(DEPARTMENT_ID) AS DG FROM 
EMPLOYEES
GROUP BY HIRE_DATE ;


SELECT SALARY ,RANK() OVER(ORDER BY SALARY DESC) FROM EMPLOYEES;

SELECT SALARY,DENSE_RANK() OVER(ORDER BY SALARY DESC) FROM EMPLOYEES;


SELECT SALARY,ROW_NUMBER() OVER (ORDER BY SALARY DESC) FROM EMPLOYEES;

SELECT FIRST_NAME,LEAD(FIRST_NAME,3,'a') OVER(ORDER BY FIRST_NAME) AS LEAD FROM EMPLOYEES;

SELECT FIRST_NAME,LAG(FIRST_NAME,6,0) OVER(ORDER BY FIRST_NAME) AS LEAD FROM EMPLOYEES;

SELECT FIRST_NAME,LAG(FIRST_NAME,25,1) OVER(ORDER BY FIRST_NAME) FROM EMPLOYEES;

--CREATE TABLE
CREATE TABLE COURSES1
(
CID NUMBER(10) PRIMARY KEY,
C_NAME VARCHAR2(50)
);

SELECT * FROM COURSES;

CREATE TABLE STUDENTS(
SID NUMBER(10),
SNAME VARCHAR2(20) NOT NULL,
CID NUMBER(20),
PHNO NUMBER(10),
EMAIL VARCHAR2(10),
GENDER CHAR(1) NOT NULL,
DOJ TIMESTAMP NOT NULL,
ADD VARCHAR2(1000),

CONSTRAINT S1 PRIMARY KEY (SID,PHNO),
CONSTRAINT S2 UNIQUE (EMAIL),
CONSTRAINT S3 CHECK (LENGTH(PHNO)=10),
CONSTRAINT S4 CHECK (GENDER IN ('M','F')),
CONSTRAINT S5 FOREIGN KEY(CID) REFERENCES COURSES(CID));


CREATE TABLE T11
(
A NUMBER(10),
C VARCHAR2(10)
);

SELECT * FROM T11;
--alter
ALTER TABLE T11
ADD B NUMBER(10);--DESCRIBE IS USED TO CHECK THE STRUCTURE OF TABLE

ALTER TABLE T1
ADD CONSTRAINT C1 UNIQUE(B);

ALTER TABLE T1
MODIFY B VARCHAR(50);

DESC T11;

ALTER TABLE T11 
RENAME COLUMN B TO D;

ALTER TABLE T1
DROP COLUMN D;

--TRUNCATE ONLY DELETE DATA, STRUCTURE  REMAINS SAME
TRUNCATE TABLE T1;

--DROP DELETE BOTH STRUCTURE AND DATA 
DROP TABLE T1;


--DML
--SELECT 
--INSERT
--UPDATE
--DELETE

SELECT * FROM COURSES ORDER BY C_NAME DESC;

INSERT ALL 
INTO COURSES VALUES(12,'SQL')
INTO COURSES VALUES(13,'JAVA')
INTO COURSES VALUES(14,'PYTHON')
SELECT * FROM DUAL;


UPDATE COURSES 
SET C_NAME= 'SELENIUM' WHERE C_NAME = 3;

update courses
set c_name ='king' where c_name = 1;

UPDATE COURSES SET
C_NAME = 'k1ing' WHERE cid = 12;

SELECT * FROM COURSES;

UPDATE COURSES SET C_NAME ='ANALYTICS' WHERE CID IN (10,12);--IN FOR MUTIPLE VALUES

--DELETE DELETE THE SPECIFIC RECORD
DELETE FROM courses WHERE cid = 10;











 







