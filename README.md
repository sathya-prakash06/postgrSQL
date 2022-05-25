# postgrSQL

- PostgreSQL : The world's most advanced open source relational database.

- Create a database :

```
CREATE DATABASE my_database;
```

- drop a database :

```
DROP DATABASE my_database;
```

- create a table :

  ```
   CREATE TABLE < table_name > ( < column_name > < data_type >, < column_name > < data_type >, < column_name > < data_type > )

   CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
    );
  ```

- Add values to a table :

```
INSERT INTO < table_name > ( < column_name >, < column_name >, < column_name > )

INSERT INTO person (first_name, last_name, email, password)
VALUES ('John', 'Doe', 'xyz@gmail.com', 'password');
```

- To drop a table :

```
DROP TABLE < table_name >;

DROP TABLE person;

```

```
-- select all from the table
SELECT * FROM public.person;

-- select id , first_name, last_name only from person table
SELECT id,first_name, last_name FROM public.person;

-- ASC & DESC

-- select all from person table and order country_of_birth in ascending order
SELECT * FROM public.person ORDER BY country_of_birth ASC;

-- select all from person table and order country_of_birth in descending order
SELECT * FROM public.person ORDER BY country_of_birth DESC;

-- select all from person table and order id in descending order
SELECT * FROM public.person ORDER BY id DESC;

-- select all from person table and order date_of_birth in descending order
SELECT * FROM public.person ORDER BY date_of_birth DESC;

-- select all distinct names of country_of_birth
SELECT DISTINCT(country_of_birth) FROM public.person ORDER BY country_of_birth ASC;

-- WHERE CLAUSE

-- select all from person table where gender is Male
SELECT * FROM public.person WHERE gender = 'Male';

-- select all from person table where gender is 'Male' AND country_of_birth is 'Poland'
SELECT * FROM public.person WHERE gender = 'Male' AND country_of_birth = 'Poland';

-- select all from person table where gender is 'Male' AND country_of_birth is 'Poland' Or 'China'
SELECT * FROM public.person WHERE gender = 'Male' AND country_of_birth = 'Poland' OR country_of_birth ='China';

-- LIMIT , OFFSET & FETCH

-- select first 10 records of person table
SELECT * FROM public.person LIMIT 10;

-- Skip first 10 records and get next 10 records from person table
SELECT * FROM public.person OFFSET 10 LIMIT 10;

-- Skip first 10 records and get next 5 records ( alternate for LIMIT)
SELECT * FROM public.person OFFSET 10 FETCH FIRST 5 ROW ONLY;

-- IN

-- select all from person table where country_of_birth is 'Poland' or 'China' or 'Brazil'
SELECT * FROM public.person WHERE country_of_birth IN('China', 'Poland', 'Brazil');

-- select all from person table where country_of_birth is 'Poland' or 'China' or 'Brazil' and order by country_of_birth
SELECT * FROM public.person WHERE country_of_birth IN('China', 'Poland', 'Brazil') ORDER BY country_of_birth;

-- BETWEEN

-- select all the records between 300 and 400
SELECT * FROM public.person  WHERE id BETWEEN  '300' AND '400';

-- LIKE

-- select all the emails with .com domain
SELECT * FROM public.person WHERE email LIKE '%.com';

-- select all the emails with .com domain
SELECT * FROM public.person WHERE email LIKE '%.com.%';

-- select all the emails with 8 character followed by @
SELECT * FROM public.person WHERE email LIKE '_________@%';

-- select all the records where country name starts from k
SELECT * FROM public.person WHERE country_of_birth ILIKE 'k%';


-- GROUP BY

-- Get country count and order by country_of_birth
SELECT country_of_birth ,COUNT(*) FROM public.person GROUP BY country_of_birth ORDER BY country_of_birth;


-- HAVING

-- Get country count atleast greater than 55 and order by country_of_birth
SELECT country_of_birth ,COUNT(*) FROM public.person GROUP BY country_of_birth HAVING COUNT(*) > 55 ORDER BY country_of_birth;




```
