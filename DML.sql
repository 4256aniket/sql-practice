/*markdown
### DML commands
- INSERT
- UPDATE
- DELETE
- REPLACE
*/

CREATE DATABASE temp;

use temp;

CREATE TABLE Customer(
    id integer primary key,
    cname varchar(255),
    Address varchar(255),
    Gender char(2),
    City varchar(255),
    Pincode integer
);

/*markdown
#### INSERT
*/

INSERT INTO Customer 
(id, cname, Address, Gender, City, Pincode) VALUES
(1215, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(1300, 'Shyam Singh', 'Ludhiana H.O', 'M', 'Jalandhar', 144001),
(1216, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
(1217, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
(1218, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Jalandhar', 144001);

SELECT * FROM Customer;

INSERT INTO Customer VALUES(1, 'codehelp', 'delhi', 'M', 'Delhi', 110004)

SELECT * FROM Customer;

-- if we don't provides all values, remaining values are set to default
-- here we didn't specify default, so default is null by-default
INSERT INTO Customer (id, cname)
VALUES(2, 'bob');

SELECT * FROM Customer;

/*markdown
#### UPDATE
*/

-- updating single row
UPDATE Customer SET Address = 'Mumbai', Gender = 'M' WHERE id = 2;

SELECT * FROM Customer;

UPDATE Customer SET Address = 'Mumbai', Gender = 'M' WHERE id = 1215;

SELECT * FROM Customer;

-- updateing multiple rows
-- change pincode of each customer to 110075
UPDATE Customer SET pincode = 110075;

SELECT * FROM Customer;

