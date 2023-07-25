/*markdown
### ALTER
To change the structure of an existing table
*/

CREATE TABLE account(
    id int primary key,
    name varchar(255),
    balance int not null default 0
);

ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

INSERT INTO account(id, name)
values (1, 'A');

SELECT * FROM account;

-- changing data-type of some attribute
-- here we are changing interest from float to double 
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

SELECT * FROM account;

-- describe table
DESC account;

/*markdown
### Canging column
RENAME
*/

ALTER TABLE account CHANGE interest saving_interest FLOAT NOT NULL DEFAULT 0;

DESC account;

/*markdown
### DROP column
*/

ALTER TABLE account DROP COLUMN saving_interest;

DESC account;

/*markdown
### Rename Table
*/

ALTER TABLE account RENAME TO account_details;

DESC account_details;