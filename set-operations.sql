/*markdown
### Set Operations (are applied on rows)
* Union
* Intersection
* Minus

##### they combine two or more select statements
columns must be same in no and data-type wise
*/

/*markdown
### UNION
*/

/*markdown
* SELECT * FROM table_1 UNION SELECT * FROM table_2;
*/

/*markdown
### INTERSECTION
* SELECT DISTINCT id FROM table_1 INNER JOIN table_2 USING(id);
* SQL does not has INTERSECT keyword so we need to emulate it
*/

/*markdown
### MINUS
* SQL does not has MINUS keyword so we need to emulate it
* SELECT id FROM table_1 LEFT JOIN table_2 USING(id) WHERE table_2.id = NULL;
*/

CREATE TABLE DEPT1 (
    empID int primary key,
    name varchar(256),
    role varchar(256)
);

CREATE TABLE DEPT2 (
    empID int primary key,
    name varchar(256),
    role varchar(256)
);

INSERT INTO DEPT1 (empID, name, role) VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

INSERT INTO DEPT2 (empID, name, role) VALUES
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

SELECT * FROM DEPT1;

SELECT * FROM DEPT2;

/*markdown
Q. List all the employees in the company
*/

SELECT * FROM DEPT1 
UNION 
SELECT * FROM DEPT2;

/*markdown
Q. List out all the employees in all departments who work as salesman
*/

SELECT * FROM DEPT1 WHERE role = 'salesman'
UNION 
SELECT * FROM DEPT2 WHERE role = 'salesman';

/*markdown
Q. List out all the employees who work for both the departments
*/

-- intersection of dept1 and dept2
SELECT DEPT1.* FROM DEPT1 INNER JOIN DEPT2 USING(empID);

/*markdown
Q. List out all the employees who work in dept1 but not in dept2
*/

-- minus
SELECT DEPT1.* FROM DEPT1 LEFT JOIN DEPT2 USING(empID) 
WHERE DEPT2.empID IS NULL;

