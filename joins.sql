/*markdown
### Inner Join
- applied on columns
Inner joins returns a table having tuples where primary key is equal to foreign key
*/

SELECT c.*, o.* FROM Customer AS c INNER JOIN Orders AS o ON c.id = o.cust_id;

/*markdown
### Left (Outer) Join
Returns complete left table and corresponding matching values from right tables with null values where data does not match
*/

SELECT c.*, o.* FROM Customer AS c LEFT JOIN  Orders as o ON c.id = o.cust_id;

/*markdown
### Right (Outer) Join
Returns complete right table and corresponding matching values from left with null values where data does not match
*/

SELECT c.*, o.* FROM Customer AS c RIGHT JOIN  Orders as o ON c.id = o.cust_id;

/*markdown
### Full Join
- Return complete left and right tables with null where data doesn't match
- There is no keyword in SQL for full join
- We simulate this by left_join U right_join (U stands for union)
*/

SELECT * FROM left_table AS l LEFT JOIN  right_table as r ON l.key = r.key
UNION
SELECT * FROM left_table AS l RIGHT JOIN  right_table as r ON l.key = r.key

/*markdown
### Cross Join
- Cartesian Product
- no industrial use
*/

SELECT column_name(s)
FROM table1
CROSS JOIN table2;

/*markdown
### Self Join
- used for uninary relation
- there is no operator in SQL for SELF JOIN
- it is emulated using INNER JOIN and Alias AS
*/

SELECT e1.id, e2.id, e2.name FROM employee as e1 INNER JOIN employee as e2 ON e1.id = e2.id;

/*markdown
#### Examples of JOINS
*/

CREATE TABLE project(
    id int primary key,
    empId int not null,
    name varchar(256),
    startdate datetime,
    clientId int, 
    foreign key (clientId) 
        references client(id)
        ON DELETE CASCADE
);

CREATE TABLE client(
    id int primary key,
    first_name varchar(256),
    last_name varchar(256),
    age int,
    emailID varchar(256),
    PhoneNo int,
    City varchar(256),
    empID int,
    foreign key(empID)
        references employee(id)
        ON DELETE CASCADE
);

CREATE TABLE employee(
    id int primary key,
    fname varchar(256),
    lname varchar(256),
    age int,
    emailID varchar(256),
    PhoneNo int,
    City varchar(256)
);

INSERT INTO project (id, empID, name, startdate, clientID) VALUES
(1,1,'A','2021-04-21', 3),
(2,2,'B','2021-03-12', 1),
(3,3,'C','2021-01-16', 5),
(4,3,'D','2021-04-27', 2),
(5,5,'E','2021-05-01', 4);

INSERT INTO employee (id, fname, lname, age, emailID, PhoneNo, City) VALUES
(1, 'Aman', 'Proto' ,32,'aman@gmail.com', 898, 'Delhi'),
(2, 'Yagya', 'Narayan', 44,'yagya@gmail.com', 222, 'Palam'),
(3, 'Rahul', 'BD', 22,'rahul@gmail.com', 444, 'Kolkata'),
(4, 'Jatin', 'Hermit', 31,'jatin@gmail.com', 666, 'Raipur'),
(5, 'PK', 'Pandey', 21,'pk@gmail.com', 555, 'Jaipur');

INSERT INTO client (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3),
(2, 'Max', 'Poiries', 27, 'max@gmail.com', 222, 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', 111, 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hydrabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', 777767, 'Mumbai', 2);

Select * from project;

select * from employee;

select * from client;

/*markdown
Q. Enlist all the employees ID's, names along with the project allocated to them
*/

SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e INNER JOIN project as p ON e.id = p.empID;

-- * selects too many columns
SELECT * FROM employee as e INNER JOIN project as p ON e.id = p.empID;

/*markdown
Q. Fetch out all the employee ID's and their contact detail who have been working from jaipur
and with the clients name working in hydrabad
*/

SELECT e.id, e.emailID, e.PhoneNo, c.first_name, c.last_name FROM employee as e
INNER JOIN client as c ON e.id = c.empID WHERE e.City = 'jaipur' AND c.city = 'hydrabad';

/*markdown
Q. Fetch out each project allocated to each employee
*/

SELECT * FROM employee as e LEFT JOIN project as p ON e.id = p.empID;

/*markdown
Q. List out all the projects along with the employee's name and projects that can exist
*/

SELECT p.id, p.name, e.fname, e.lname, e.emailId FROM employee as e RIGHT JOIN project as p ON e.id = p.empID;

/*markdown
Q. List out all the combinations possible for the employee's name and projects that can exist.
*/

SELECT e.fname, e.lname, p.id, p.name FROM employee as e CROSS JOIN project as p;

/*markdown
### Q.  Can we use JOIN w/o using JOIN keyword
- Yes we can
* SELECT * FROM left_table, right_table WHERE left_table.id = right_table.id

*/

SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e, project as p WHERE e.id = p.empID;