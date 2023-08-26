USE NEW;

CREATE TABLE Title (
	Worker_REF_ID INT,
	Worker_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (Worker_REF_ID)
		REFERENCES Worker(Worker_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(Worker_REF_ID, Worker_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

select * FROM Title;

CREATE TABLE Bonus (
	Worker_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (Worker_REF_ID)
		REFERENCES Worker(Worker_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(Worker_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

SELECT * FROM Bonus;

SELECT * FROM Worker;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <Worker_NAME>.
select first_name AS Worker_NAME from Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(first_name) from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT distinct department from Worker;
-- using group by without condition works like distinct
SELECT department from Worker group by department;


-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name, 1, 3) from Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
-- INSTR keyword --> case insensitive search finds in some char or string in string
select INSTR(first_name, 'B') from Worker where first_name = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
-- RTRIM removes spaces from right side
select RTRIM(first_name) from Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
-- LTRIM removes spaces from left side
select LTRIM(first_name) from Worker;

select department, count(Worker_ID) from Worker group by department;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length(no of characters).
select distinct department, LENGTH(department) from Worker;
-- can also be done using group by
select department, LENGTH(department) from Worker group by department;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select REPLACE(first_name, 'a', 'A')  from Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select concat(first_name," ", last_name) as full_name from Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker order by first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker order by first_name, department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from Worker where first_name in('Vipul', 'Satish');

-- Q-14. Write an SQL query to print details of Workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from Worker where first_name not in('Vipul', 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select * from Worker where department like 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker where first_name like '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from Worker where month(joining_date) = '02' and year(joining_date) = 2014;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(Worker_id) as no_of_emp_in_Admin from Worker where department = 'Admin' group by department ;

-- Q-22. Write an SQL query to fetch Worker full names with salaries >= 50000 and <= 100000.
select concat(first_name," ", last_name) as full_name, salary from Worker where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of Workers for each department in the descending order.
select count(Worker_id) as no_of_Workers, department from Worker group by department order by count(first_name) desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.* from Worker as w inner join title as t on w.Worker_id = t.Worker_ref_id where t.Worker_title = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select Worker_title, count(Worker_ref_id) as no_of_Workers from title group by Worker_title having count(*) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from Worker where MOD (Worker_ID, 2) != 0; 

-- Q-27. Write an SQL query to show only even rows from a table. 
select * from Worker where mod(Worker_id, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
-- create table Worker_clone like Worker;
-- insert into Worker_clone select * from Worker;
select * from Worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from Worker as w inner join Worker_clone as c using(Worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
select * from Worker left join Worker_clone using(Worker_id) where Worker_clone.Worker_id is null;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select curdate();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from Worker order by salary desc limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- select * from Worker order by salary desc limit 5;
select * from Worker order by salary desc limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
-- select * from Worker order by salary desc limit 4,1;
select * from Worker w1
where 4 = (
    select count(distinct (w2.salary))
    from Worker w2 
    where w2.salary >= w1.salary
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.* from Worker w1, Worker w2 where w1.salary = w2.salary and w1.Worker_id != w2.Worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from Worker
where salary not in (select max(salary) from Worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from Worker
union all
select * from Worker order by Worker_ID;

-- Q-38. Write an SQL query to list Worker_id who does not get bonus.
select w.* from Worker as w left join bonus as b on w.Worker_id = b.Worker_ref_id where b.Worker_ref_id is null;
select * from Worker where Worker_id not in (select Worker_ref_id from bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from Worker where Worker_id <= (select count(Worker_id) from Worker)/2;

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department, count(Worker_id) from Worker group by department having count(Worker_id) < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(Worker_id) from Worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from Worker where Worker_id = (select max(Worker_id) from Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from Worker where Worker_id = (select min(Worker_id) from Worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
select * from Worker where Worker_id >= ((select count(Worker_id) from Worker) - 4);
(select * from Worker order by Worker_id desc limit 5) order by Worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select w.department, w.first_name, w.salary from 
(select max(salary) as max_salary, department from Worker group by department) temp
inner join Worker w on temp.department = w.department and temp.max_salary = w.salary;
;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
-- select * from Worker order by salary desc limit 3;
select distinct salary from Worker w1
where 3 >= (
    select count(distinct (w2.salary))
    from Worker w2 
    where w2.salary >= w1.salary
) order by w1.salary desc;

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.
select distinct salary from Worker order by salary desc limit 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from Worker w1
where 3 >= (
    select count(distinct (w2.salary))
    from Worker w2 
    where w2.salary <= w1.salary
) order by w1.salary desc;

-- Q-48. Write an SQL query to fetch nth(4) max salaries from a table.
select distinct salary from Worker w1
where 4 >= (
    select count(distinct (w2.salary))
    from Worker w2 
    where w2.salary >= w1.salary
) order by w1.salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) as dep_salary from Worker group by department order by dep_salary desc;

-- Q-50. Write an SQL query to fetch the names of Workers who earn the highest salary.
select first_name, salary from Worker where salary = (select max(salary) from Worker);

/*markdown
-- Q-51. remove all the reversed number pairs from given table
| A | B |
| - | - |
| 1 | 2 |
| 2 | 4 |
| 2 | 1 |
| 3 | 2 |
| 4 | 2 |
| 5 | 6 |
| 6 | 5 |
| 7 | 8 |

Expected output:
| A | B |
| - | - |
| 1 | 2 |
| 2 | 4 |
| 3 | 2 |
| 5 | 6 |
| 7 | 8 |
*/

-- Sol-51. remove all reversed pairs from given table
create table pairs (
    A int, 
    B int
);

insert into pairs values (1, 2), (2,4), (2,1), (3,2), (4,2), (5,6), (6,5), (7,8);

select * from pairs;

-- method 1. Using joins (left join)
select lt.* from pairs lt left join pairs rt on lt.A = rt.B and lt.B = rt.A
where rt.A is null or lt.A < rt.A;

-- method 2. Using co-related subquery
select * from pairs p1 where not exists (select * from pairs p2 where p1.B = p2.A and p1.A = p2.B and p1.A > p2.A);