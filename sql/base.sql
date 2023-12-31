create table if not exists provider(
    id integer not null primary key UNIQUE,
    directing_number integer not null,
    film_number integer not null,
    time_film time not null);

create table if not exists  client(
    id integer not null primary key UNIQUE,
    address varchar(50) UNIQUE,
    phone_number varchar(50) UNIQUE,
    surname varchar(50) not null UNIQUE);

create table if not exists cashier(
    id integer not null primary key UNIQUE,
    surname varchar(50) not null);

create table if not exists schedule_seance(
    id integer not null primary key UNIQUE,
    session_date date not null,
    session_time time not null,
    hall_number integer not null,
    film_number integer,
    foreign key (film_number)
        references list_films(id)
        on delete set null on update no action);

create table if not exists  directing_films(
    id integer not null primary key UNIQUE,
    directing_number integer not null,
    provider_number integer not null,
    date_of_delivery date not null,
    rental_start_date date not null,
    rental_end_date date,
    price_delivery integer,
    foreign key (provider_number)
        references provider(id)
        on delete set null on update no action);

create table if not exists list_films(
    id integer not null primary key UNIQUE,
    film_number integer not null,
    directing_number integer not null,
    film_name varchar(50) not null,
    film_time time not null,
    foreign key (directing_number)
        references directing_films(id)
        on delete set null on update no action);

create table if not exists  ticket_sales(
    id integer not null primary key UNIQUE,
    payment_number integer not null,
    client_number integer not null,
    cashier_number integer not null,
    the_payment_date date not null,
    time_payment time not null,
    price_payment integer not null,
    foreign key (cashier_number)
        references cashier(id)
        on delete set null on update no action,
    foreign key (client_number)
        references client(id)
        on delete set null on update no action);

create table if not exists ticket_list(
    id integer not null primary key UNIQUE,
    ticket_number integer not null ,
    payment_number integer not null,
    session_data date not null,
    session_time time not null,
    hall_number integer not null,
    order_number integer not null,
    place_number int not null,
    foreign key (payment_number)
        references ticket_sales (payment_number)
        on delete set null on update no action,
    foreign key (session_data)
        references schedule_seance(session_date)
        on delete set null on update no action,
    foreign key (session_time)
        references schedule_seance(session_time)
        on delete set null on update no action,
    foreign key (hall_number)
        references schedule_seance(hall_number)
        on delete set null on update no action);

INSERT INTO cashier(id, surname) VALUES (1,'Агапов');
INSERT INTO cashier(ID, SURNAME) VALUES (2,'Дмитриенко');
INSERT INTO cashier(ID, SURNAME) VALUES (3,'Жолобов');

INSERT INTO client(ID, ADDRESS, PHONE_NUMBER, SURNAME) VALUES(1,'Ленина 1','652355','Фролов');
INSERT INTO client(ID, ADDRESS, PHONE_NUMBER, SURNAME) VALUES(2,'Ленина 2','652356','Смирнов');
INSERT INTO client(ID, ADDRESS, PHONE_NUMBER, SURNAME) VALUES(3,'Ленина 3','652357','Мирнов');

INSERT INTO directing_films(id, directing_number, provider_number, date_of_delivery, rental_start_date, rental_end_date, price_delivery) values (1,1,1,'31:12:1999','31:12:1999','31:12:1999',20);
INSERT INTO directing_films(id, directing_number, provider_number, date_of_delivery, rental_start_date, rental_end_date, price_delivery) values (2,2,2,'01:01:2000','01:01:2000','01:01:2000',20);
INSERT INTO directing_films(id, directing_number, provider_number, date_of_delivery, rental_start_date, rental_end_date, price_delivery) values (3,3,3,'02:01:2000','02:01:2000','02:01:2000',30);

INSERT INTO list_films(id, film_number, directing_number, film_name, film_time) values (1,1,1,'Фрик хоррор','19:30:00');
INSERT INTO list_films(id, film_number, directing_number, film_name, film_time) values (2,2,2,'Индийский хоррор','20:00:00');
INSERT INTO list_films(id, film_number, directing_number, film_name, film_time) values (3,3,3,'Российский хоррор','23:30:00');

INSERT INTO schedule_seance(id,session_date,session_time,hall_number,film_number) values(1,'01.01.2000','19:30:00',1,1);
INSERT INTO schedule_seance(id,session_date,session_time,hall_number,film_number) values(2,'02.01.2000','20:00:00',2,2);
INSERT INTO schedule_seance(id,session_date,session_time,hall_number,film_number) values(3,'01.01.2000','21:30:00',3,3);

INSERT INTO ticket_sales(id,payment_number,client_number,cashier_number,the_payment_date,time_payment,price_payment) values (1,1,1,1,'01.01.2000','19:30:00',300);
INSERT INTO ticket_sales(id,payment_number,client_number,cashier_number,the_payment_date,time_payment,price_payment) values (2,2,2,2,'02.01.2000','20:00:00',300);
INSERT INTO ticket_sales(id,payment_number,client_number,cashier_number,the_payment_date,time_payment,price_payment) values (3,3,3,3,'03.01.2000','21:30:00',300);

INSERT INTO ticket_list(id,ticket_number,payment_number,session_data,session_time,hall_number,order_number,place_number) values(1,1,1,'01.01.2000','19:30:00',1,1,1);
INSERT INTO ticket_list(id,ticket_number,payment_number,session_data,session_time,hall_number,order_number,place_number) values(2,2,2,'02.01.2000','20:00:00',2,2,2);
INSERT INTO ticket_list(id,ticket_number,payment_number,session_data,session_time,hall_number,order_number,place_number) values(3,3,3,'03.01.2000','21:30:00',3,3,3);

INSERT INTO provider(id,directing_number,film_number,time_film) VALUES (1,1,20,'19:30:00');
INSERT INTO provider(id,directing_number,film_number,time_film) values(2,2,21,'20:00:00');
INSERT INTO provider(id,directing_number,film_number,time_film) values(3,3,22,'21:30:00');

