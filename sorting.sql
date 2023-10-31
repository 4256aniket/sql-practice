/*markdown
### ORDER BY
used to sort data received from select
*/

SELECT * FROM Worker;
-- unsorted

SELECT * FROM Worker ORDER BY SALARY;
-- sorting in ascending order (default) or use ASC

SELECT * FROM Worker ORDER BY SALARY DESC;
-- sorted according to salary in descending order