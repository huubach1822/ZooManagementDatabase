create database ZooManagement
go

use ZooManagement

create table Animal
(
	ID int not null,
	Vietnamese_name nvarchar(50) not null,
	Specie_ID int,
	Quantity int,
	Red_list bit,
	Sciene_name nvarchar(50),
	English_name nvarchar(50),
	Type_of_birth nvarchar(50),
	Gender bit,
	Date_of_joint datetime,
	Origin nvarchar(50),
	Feature nvarchar(50),
	Date_of_birth datetime,
	Picture nvarchar(50),
	Age int,
	constraint pk_ID primary key(ID),

)