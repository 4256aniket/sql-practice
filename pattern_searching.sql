/*markdown
### Pattern Searching/Wildcard (%, _)
##### '%' behaves like "*", any no of characters from 0 to n
##### '_' only one character
*/

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
-- selects all first_names which contains i, anywhere in first_name

SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';
-- selects all first_names where i occur at second position 