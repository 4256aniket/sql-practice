/*markdown
### SUB QUERIES
- alternate to JOINS
- q1(q2)
- generally outer query depends upon inner query
- alternative of JOINS
*/

SELECT * FROM  table_1 WHERE id IN (SELECT id FROM table_1 WHERE name = 'lakshay');

/*markdown
### WHERE clause on same table
- employee with age  > 30
*/

SELECT * FROM employee WHERE age in (SELECT age FROM employee WHERE age > 30);

/*markdown
Q. emp details working in more than 1 projects
*/

SELECT * FROM employee WHERE id IN (SELECT empID FROM project GROUP BY empID HAVING count(empID) > 1);

/*markdown
Q. emp details having age > avg(age)
*/

SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);

/*markdown
### FROM clause in Sub Queries 
- returns derived tables so we have to use alias
*/

/*markdown
Q. select max age person whose first name has 'a'
*/

SELECT MAX(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

/*markdown
## Correlated Subquery
*/

/*markdown
- both queries are collrelated
- inner query also refers outer query
*/

/*markdown
Q. Find 3rd oldest employee
*/

SELECT * FROM employee AS e1
WHERE 3 = (
    SELECT COUNT(e2.age) FROM employee AS e2 WHERE e2.age >= e1.age
);