/*markdown
### Distinct values
*/

SELECT DEPARTMENT FROM Worker;
-- without distinct keyword

SELECT DISTINCT DEPARTMENT FROM Worker;
-- with distinct keyword

/*markdown
### GROUP BY
used with some aggegation function like - count, sum, min, max 
*/

SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;
-- if used w/o aggregation fun, it is executed same as distinct

/*markdown
LIST OF ATTRIBUTES AFTER SELECT MUST BE SAME AS LIST OF ATTRIBUTES AFTER GROUP BY
*/

SELECT DEPARTMENT, COUNT(*) FROM Worker GROUP BY DEPARTMENT;

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;
-- with aggregation function

/*markdown
##### Q. Find average salary for each department
*/

SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;

/*markdown
#### Q. Find min salary for each department
*/

SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;