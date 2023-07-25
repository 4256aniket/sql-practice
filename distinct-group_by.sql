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

SELECT * FROM Worker;

/*markdown
#### Q. Find min salary for each department
*/

SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;

/*markdown
#### Q. Find sum of salary for eash department
*/

SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

/*markdown
### Having
used with GROUP BY to filter (similar to where in select)
*/

/*markdown
#### Q. List departments and no of employees in them, having more than 2 employees
*/

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;

/*markdown
Difference between HAVING and WHERE
- both have same function of filtering the row based on certain condition
- WHERE clause is used to filter the rows from the table based on specific condition
- HAVING clause is used to filter the rows from the groups based on the specific condition
- HAVING is used after GROUP BY while WHERE is used before GROUP BY clause
- If you are using HAVING, GROUP BY is necessary
*/