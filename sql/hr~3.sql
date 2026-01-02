select sysdate from dual;


SELECT CURRENT_DATE FROM DUAL;

--3. TO_DATE
--Converts a string to a date using a specified format.
SELECT TO_DATE('02-10-2025','DD-MM-YYYY') from dual;

--4. TO_CHAR
--Converts a date to a string using a specified format
SELECT TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH24:MI:SS') FROM dual;

SELECT TO_CHAR(TO_DATE('02-10-2025','DD-MM-YYYY'),'DD-MM-YY' )FROM DUAL;

--ADD_MONTHS
SELECT ADD_MONTHS(SYSDATE,1) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,-1) FROM DUAL;

--MONTHS BETWEEN
SELECT MONTHS_BETWEEN(SYSDATE,'20-11-2025') FROM DUAL;

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2025-01-01', 'YYYY-MM-DD')) FROM dual;

--NEXT DAY
SELECT NEXT_DAY(SYSDATE,'MON') FROM DUAL;

--LAST DAY
SELECT LAST_DAY(SYSDATE) FROM DUAL;
--
--9 EXTRACT
--Extracts a specific part (year, month, day, etc.) from a date.
SELECT EXTRACT(YEAR FROM SYSDATE) AS current_year FROM dual;
SELECT EXTRACT(MONTH FROM SYSDATE) AS current_month FROM dual;
SELECT EXTRACT(DAY FROM SYSDATE) AS current_day FROM dual;

SELECT SALARY, HIRE_DATE FROM EMPLOYEES  WHERE EXTRACT(YEAR FROM HIRE_DATE) = '2003';

SELECT FIRST_NAME FROM EMPLOYEES WHERE EXTRACT(YEAR FROM hire_date) = '2003' and EXTRACT(MONTH FROM HIRE_DATE) = '06';

--Advanced Date Functions
--10. TRUNC
--Truncates a date to a specified unit (e.g., year, month, day).
SELECT TRUNC(SYSDATE, 'YYYY') FROM dual; -- Start of the year
SELECT TRUNC(SYSDATE, 'MM') FROM dual;   -- Start of the month
SELECT TRUNC(SYSDATE, 'DD') FROM dual;   -- Start of the day


--11. ROUND
--Rounds a date to a specified unit.

SELECT ROUND(SYSDATE, 'YYYY') FROM dual; -- Mid-year
SELECT ROUND(SYSDATE, 'MM') FROM dual;   -- Mid-month

--12. TO_TIMESTAMP
--Converts a string to a timestamp using a specified format.

SELECT TO_TIMESTAMP('2025-10-02 15:30:00', 'YYYY-MM-DD HH24:MI:SS') FROM dual;

--13. SYSTIMESTAMP
--Returns the current timestamp with time zone from the database server.

SELECT SYSTIMESTAMP FROM dual;

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE TRUNC(SYSDATE) - TRUNC(hire_date) = 1095;




