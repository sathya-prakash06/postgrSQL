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

#### ....................

```

-- car table

SELECT * FROM public.car;

-- MIN , MAX & AVG

-- SELECT maximum price in car table
SELECT MAX(price) FROM public.car;

-- SELECT average price in car table
SELECT AVG(price) FROM public.car;

-- select min price and group by make
SELECT make, MIN(price) FROM public.car GROUP BY make;

-- select max price and group by make
SELECT make, MAX(price) FROM public.car GROUP BY make;

---- select avg price and group by make
SELECT make, AVG(price) FROM public.car GROUP BY make;

-- SUM

-- get sum of price
SELECT SUM(price) FROM public.car;

-- get all the sum and group by make
SELECT make, SUM(price) FROM public.car GROUP BY make;

-- Basic Arithematic Operations

SELECT 10 + 2;
SELECT 10 - 2;
SELECT 10 * 2;
SELECT 10 / 2;
SELECT 10^2;
SELECT 10 % 4;

-- select id, make, model, price and add 10% offer price column to car table
SELECT id, make, model, price, price * 0.10 as round FROM public.car;

-- alternate for above
SELECT id, make, model, price, ROUND(price * 0.10, 2) FROM public.car;

-- -- select id, make, model, price and add 10% offer price column to car table and add fianl price
SELECT id, make, model, price, ROUND(price * 0.10, 2), ROUND(price - (price * 0.10), 2) FROM public.car;


-- ALIAS

-- adding column name for above using AS
SELECT id, make, model, price AS original_price, ROUND(price * 0.10, 2) AS ten_percent, ROUND(price - (price * 0.10), 2) AS discounted_price FROM public.car;


-- COALESCE

SELECT * FROM public.person;
-- If email is null then add 'Email not provided'
SELECT COALESCE(email, 'Email not provided') FROM public.person;


-- NULL IF

-- TIMESTAMS & DATE

SELECT NOW();
SELECT NOW()::DATE;
SELECT NOW()::TIME;
SELECT NOW() - INTERVAL '10 YEARS';
SELECT NOW() - INTERVAL '10 MONTHS';
SELECT NOW() - INTERVAL '100 DAYS';

SELECT EXTRACT(YEAR FROM NOW());
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(DAY FROM NOW());

-- AGE FUNCTIONS

SELECT * FROM public.person;
SELECT first_name, last_name, gender, date_of_birth, country_of_birth, AGE(NOW(),date_of_birth ) AS age FROM public.person;


-- PRIMARY KEYS (PK)
-- uniquely identify a record in tables


-- UNIQUE CONTRAINTS
-- unique value per column
SELECT * FROM public.person;

-- email as unique constraint
-- ALTER TABLE public.person ADD CONSTRAINT unique_email_address UNIQUE(email);
-- alternate for above
-- ALTER TABLE public.person UNIQUE(email);


-- CHECK CONSTRAINTS
SELECT DISTINCT gender FROM public.person;

-- ALTER TABLE public.person ADD CONSTRAINT gender_constraint CHECK(gender = 'Female' OR 'Male');


-- DELETE RECORDS

SELECT * FROM public.person WHERE gender = 'Genderqueer';
DELETE FROM public.person WHERE id = '27';
SELECT * FROM public.person WHERE gender = 'Genderqueer';
DELETE FROM public.person WHERE gender = 'Genderqueer';
SELECT * FROM public.person WHERE gender = 'Genderqueer';


-- UPDATE RECORDS

SELECT * FROM public.person;
UPDATE public.person SET email = 'newwupdate@gmail.com' WHERE id = '2';
SELECT * FROM public.person;
SELECT * FROM public.person WHERE email = 'newwupdate@gmail.com';

UPDATE public.person SET first_name ='sathya', last_name ='prakash' WHERE id = '2';



```

### .................

```
SELECT * FROM public.person2;
SELECT * FROM public.car2;

UPDATE person2 SET car_id = 1 WHERE id = 1;
SELECT * FROM public.person2;
UPDATE person2 SET car_id = 2 WHERE  id = 2;
SELECT * FROM public.person2;
UPDATE person2 SET car_id = 3 WHERE  id = 3;
SELECT * FROM public.person2;

-- INNER JOINS
--car2+ person2

SELECT * FROM person2 JOIN car2 ON person2.car_id = car2.id;

-- LEFT JOINS

SELECT * FROM person2 LEFT JOIN car2 ON person2.car_id = car2.id;

```
