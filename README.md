# postgrSQL

- PostgreSQL : The world's most advanced open source relational database.

- create database

```
CREATE DATABASE mydb;

```

- View all the databases

```
\l

```

- connect to database

```
mysql -U postgres

```

- shift to created database

```
\c mydb

```

- create table

```
CREATE TABLE mytable (
  id bigserial PRIMARY KEY,
  name varchar(50) NOT NULL,
  age integer NOT NULL,
  email varchar(50) NOT NULL UNIQUE,
  phone varchar(50) NOT NULL

);

```

- to view table

  ```
  \d mytable

  ```

  - To drop table

  ```
    DROP TABLE mytable;
  ```

- Insert data into table

  ```
  INSERT INTO mytable (name, age, email, phone) VALUES ('John', 20, )
  ```

  - view all the data in the table

    ```
    SELECT * FROM mytable;
    ```
