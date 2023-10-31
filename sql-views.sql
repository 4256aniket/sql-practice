/*markdown
### View
- if we want to show some specific data we create view
*/

SELECT * FROM employee;

/*markdown
CREATING A VIEW 
*/

CREATE VIEW employee_view AS SELECT fname, age FROM employee;

/*markdown
Viewing from view
*/

SELECT * FROM employee_view;

/*markdown
Altering the view
*/

ALTER VIEW employee_view AS SELECT fname, lname, age FROM employee;

SELECT * FROM employee_view;

DROP VIEW IF EXISTS employee_view;