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
