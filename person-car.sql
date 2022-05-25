create table car2 (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	price NUMERIC(19,2) NOT NULL
);


create table person2 (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150),
	gender VARCHAR(7),
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car2(id),
    UNIQUE(car_id)
);



insert into person2 (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Prudy', 'Alberts', 'palberts0@symantec.com', 'Female', '2021-12-01', 'China');
insert into person2 (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Claudine', 'Bramo', 'cbramo1@skyrock.com', 'Female', '2021-12-15', 'Czech Republic');
insert into person2 (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Sondra', 'Extil', null, 'Female', '2021-09-30', 'Bangladesh');


insert into car2 (make, model, price) values ('GMC', 'Sonoma Club Coupe', 2240592);
insert into car2 (make, model, price) values ('Dodge', 'Ram 3500', 8271469);
insert into car2 (make, model, price) values ('Toyota', 'Camry', 8233366);