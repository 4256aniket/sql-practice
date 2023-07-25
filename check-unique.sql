/*markdown
### CHECK
To add integrity constraints
*/

CREATE TABLE account(
    id int primary key,
    name varchar(255) unique,
    balance int,
    constraint acc_balance_check CHECK(balance > 1000)
);

INSERT INTO account(id, name, balance)
values (1, 'A', 10000);

SELECT * FROM account;

INSERT INTO account(id, name, balance)
values (1, 'A', 10000);
-- duplicate name can't be added

INSERT INTO account(id, name, balance)
values (1, 'A', 100);
-- check constraint is working

/*markdown
#### DEFAULT
to give default value
*/

DROP TABLE account;

CREATE TABLE account(
    id int primary key,
    name varchar(255) unique,
    balance int not null default 0
);

INSERT INTO account(id, name)
values (1, 'A');

SELECT * FROM account;
-- we didn't insert account, it took 0 by default due to DEFAULT used while declaring the table

DROP TABLE account;