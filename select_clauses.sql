/*markdown
### WHERE 
reduces rows based on given conditions
*/

SELECT * FROM Worker WHERE SALARY > 40000;

SELECT * FROM Worker WHERE SALARY < 40000;

SELECT * FROM Worker WHERE SALARY > 80000;

SELECT * FROM Worker WHERE SALARY >= 80000;

SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

/*markdown
### Between
range is inclusive [l,r]
*/

SELECT * FROM Worker WHERE SALARY BETWEEN 60000 AND 80000;

/*markdown
### IN
reduces OR statements
*/

/*markdown
Select Workers who work in HR or ADMIN deparments
*/

SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';

SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin' OR DEPARTMENT = 'Account';

/*markdown
Now same thing Using IN (better way)
*/

SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin', 'Account') ;

SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin') ;

/*markdown
### NOT
*/

SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Admin', 'Account') ;

SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin') ;

/*markdown
### IS NULL
*/

-- SELECT * FROM Worker WHERE DEPARTMENT IS NULL;