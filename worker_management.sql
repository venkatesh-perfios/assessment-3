-- Worker_Table_1:
create database Worker_Management;
use Worker_Management;

create table Worker_Table_1(WORKER_ID int auto_increment, FIRST_NAME varchar(20) not null, LAST_NAME varchar(20) not null, SALARY int not null, JOINING_DATE datetime not null, DEPARTMENT varchar(10) not null, primary key(WORKER_ID));

insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account');
insert into Worker_Table_1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values('Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

select * from Worker_Table_1;


-- Bonus_Table:
create table Bonus_Table(WORKER_REF_ID int not null, BONUS_DATE datetime not null, BONUS_AMOUNT int not null, foreign key(WORKER_REF_ID) references Worker_Table_1(WORKER_ID));

insert into Bonus_Table values(1, '2016-02-20 00:00:00', 5000);
insert into Bonus_Table values(2, '2016-06-11 00:00:00', 3000);
insert into Bonus_Table values(3, '2016-02-20 00:00:00', 4000);
insert into Bonus_Table values(1, '2016-02-20 00:00:00', 4500);
insert into Bonus_Table values(2, '2016-06-11 00:00:00', 3500); 

select * from Bonus_Table;


-- Worker_Table_2:
create table Worker_Table_2(WORKER_REF_ID int not null, WORKER_TITLE varchar(20) not null, AFFECTED_FROM datetime not null, foreign key(WORKER_REF_ID) references Worker_Table_1(WORKER_ID));

insert into Worker_Table_2 values(1, 'Manager', '2016-02-20 00:00:00');
insert into Worker_Table_2 values(2, 'Executive', '2016-06-11 00:00:00');
insert into Worker_Table_2 values(8, 'Executive', '2016-06-11 00:00:00');
insert into Worker_Table_2 values(5, 'Manager', '2016-06-11 00:00:00');
insert into Worker_Table_2 values(4, 'Asst. Manager', '2016-06-11 00:00:00');
insert into Worker_Table_2 values(7, 'Executive', '2016-06-11 00:00:00');
insert into Worker_Table_2 values(6, 'Lead', '2016-06-11 00:00:00');
insert into Worker_Table_2 values(3, 'Lead', '2016-06-11 00:00:00');

select * from Worker_Table_2;

