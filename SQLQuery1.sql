use master;
create database BankSystemManagment
on
(
name='Bank_System_Data',
filename='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Bank_System_Data.mdf',
size=10,
maxsize=50,
filegrowth=10%
)
log on
(
name='BankSystemLog',
filename='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Bank_System_Log.ldf',
size=10,
maxsize=50,
filegrowth=10%
)
use [BankSystemManagment]

create table Client
(
first_name nvarchar(20) not null,
Last_name nvarchar(20) not null,
Age int not null,
country nvarchar(20) not null,
phone_number varchar(11) not null,
pass_word nvarchar(10) not null,
Email varchar(255) not null,
VisaCardNumber int not null,
constraint client_pk primary key (Email),
constraint phone_check check(len(phone_number)=11)
)

create table Account
(
account_id int not null,
acouunt_type nvarchar(20) default 'premieum',
Amount float not null,
client_Email varchar(255) not null,
constraint Account_pk primary key(account_id),
constraint Account_fk foreign key (client_Email) references Client(Email)
)
 create table Contact_us
 (
 message_id int not null,
 message_contnent nvarchar(200) not null
 constraint Contact_us_pk primary key( message_id)
 )
  create table Internet_Bill
  (
  Amount float not null,
  client_Email varchar(255) not null,
  company_name varchar(20) not null,
  Bill_date date not null
  constraint Internet_Bill_pk primary key( Amount,client_Email, Bill_date,company_name),
  constraint Internet_Bill_fk foreign key (client_Email) references Client(Email)
  )

  create table Mobile_Recharge_Bill
  (
  Amount float not null,
  client_Email varchar(255) not null,
  company_name varchar(20) not null,
  Bill_date date not null
  constraint Mobile_Recharge_pk primary key(Amount,client_Email,Bill_date, company_name),
  constraint Mobile_Recharge_fk foreign key (client_Email) references Client(Email)
  )

   create table Electricity_Water_Bill
  (
  Amount float not null,
  client_Email varchar(255) not null,
   company_name varchar(20) not null,
  Bill_date date not null
  constraint Electricity_Water_Bill_pk primary key(company_name,client_Email,Bill_date),
  constraint Electricity_Water_Bill_fk foreign key (client_Email) references Client(Email)
  )

   create table Book_Ticket_Bill
  (
  Amount float not null,
  client_Email varchar(255) not null,
  company_name varchar(20) not null,
  Bill_date date not null
  constraint Book_Ticket_pk primary key(company_name,client_Email,Bill_date),
  constraint Book_Ticket_fk foreign key (client_Email) references Client(Email)
  )

  create table Visa_card_Amount
  (
  visa_card_id int not null,
  Amount float not null default 0
  constraint  Visa_card_Amount_pk primary key(visa_card_id)

  )