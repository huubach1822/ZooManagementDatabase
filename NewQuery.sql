create database ZooManagement
go

use ZooManagement

create table Species
(
	ID int IDENTITY(1,1) not null,
	Species_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Species primary key(ID)
)

create table TypeOfBirth
(
	ID int IDENTITY(1,1) not null,
	Name_Birth nvarchar(50),
	Note nvarchar(100),
	constraint pk_TypeOfBirth primary key(ID)
)

create table Origin
(
	ID int IDENTITY(1,1) not null,
	Birth_type_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Origin primary key(ID)
)

create table Animal
(
	ID int IDENTITY(1,1) not null,
	Vietnamese_name nvarchar(50),
	Species_ID int,
	Quantity int,
	Red_list bit,
	Sciene_name nvarchar(50),
	English_name nvarchar(50),
	TypeOfBirth_ID int,
	Gender bit,
	Date_of_joint datetime,
	Origin_ID int,
	Feature nvarchar(50),
	Date_of_birth datetime,
	Picture nvarchar(50),
	Age int,
	constraint pk_Animal primary key(ID),
	constraint fk_Animal_SpeciesID
		foreign key(Species_ID)
		references Species(ID),
	constraint fk_Animal_TypeOfBirthID
		foreign key(TypeOfBirth_ID)
		references TypeOfBirth(ID),
	constraint fk_Animal_OriginID
		foreign key(Origin_ID)
		references Origin(ID)
)

create table Accident
(
	ID int IDENTITY(1,1) not null,
	Accident_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Accident primary key(ID)
)

create table Food
(
	ID int IDENTITY(1,1) not null,
	Food_name nvarchar(50),
	Uses nvarchar(50),
	Unit int,
	constraint pk_Food primary key(ID)
)

create table Employee
(
	ID int IDENTITY(1,1) not null,
	Employee_name nvarchar(50),
	Date_of_birth datetime,
	Gender bit,
	Employee_Address nvarchar(50),
	Phone nvarchar(50),
	Password nvarchar(50),
	constraint pk_Employee primary key(ID)
)

create table Animal_Food
(
	Animal_ID int not null,
	Breakfast_ID int,
	Amount_of_breakfast int,
	Lunch_ID int,
	Amount_of_lunch int,
	Dinner_ID int,
	Amount_of_dinner int,
	constraint pk_AnimalFood primary key(Animal_ID),
	constraint fk_Animal_BreakfastID
		foreign key(Breakfast_ID)
		references Food(ID),
	constraint fk_Animal_LunchID
		foreign key(Lunch_ID)
		references Food(ID),
	constraint fk_Animal_DinnerID
		foreign key(Dinner_ID)
		references Food(ID),
	constraint fk_AnimalFood_AnimalID
		foreign key(Animal_ID)
		references Animal(ID)
)

create table Food_Price
(
	ID int IDENTITY(1,1) not null,
	Food_ID int,
	Price int,
	Applied_date datetime,
	constraint pk_FoodPrice primary key(ID),
	constraint fk_FoodPrice_FoodID
		foreign key(Food_ID)
		references Food(ID)
)

create table Reason
(
	ID int IDENTITY(1,1) not null,
	Reason_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Reason primary key(ID)
)

create table Fix
(
	ID int IDENTITY(1,1) not null,
	Fix_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Fix primary key(ID)
)

create table Condition
(
	ID int IDENTITY(1,1) not null,
	Condition_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Condition primary key(ID)
)

create table Area
(
	ID int IDENTITY(1,1) not null,
	Area_name nvarchar(50),
	Note nvarchar(100),
	constraint pk_Area primary key(ID)
)

create table Countryside
(
	ID int IDENTITY(1,1) not null,
	Countryside_name nvarchar(50),
	constraint pk_Countryside primary key(ID)
)

create table Animal_Accident
(
	Accident_ID int not null,
	Animal_ID int not null,
	Start_day datetime,
	Reason_ID int,
	Fix_ID int,
	End_day datetime,
	constraint pk_AnimalAccident primary key(Accident_ID,Animal_ID),
	constraint fk_AnimalAccident_AccidentID 
		foreign key(Accident_ID)
		references Accident(ID),
	constraint fk_AnimalAccident_AnimalID 
		foreign key(Animal_ID)
		references Animal(ID),
	constraint fk_AnimalAccident_ReasonID 
		foreign key(Reason_ID)
		references Reason(ID),
	constraint fk_AnimalAccident_FixID 
		foreign key(Fix_ID)
		references Fix(ID)
)

create table Cage 
(
	ID int IDENTITY(1,1) not null,
	Species_ID int,
	Area_ID int,
	Cage_area int,
	Height int,
	Capacity int default(0),
	Condition_ID int,
	Employee_ID int,
	Note nvarchar(100),
	constraint pk_Cage primary key(ID),
	constraint fk_Cage_SpeciesID 
		foreign key(Species_ID)
		references Species(ID),
	constraint fk_Cage_AreaID 
		foreign key(Area_ID)
		references Area(ID),
	constraint fk_Cage_ConditionID 
		foreign key(Condition_ID)
		references Condition(ID),
	constraint fk_Animal_EmployeeID
		foreign key(Employee_ID)
		references Employee(ID)
)

create table Animal_Cage
(
	Cage_ID int not null,
	Species_ID int not null,
	Day_in datetime,
	Reason_in nvarchar(50),
	constraint pk_AnimalCage primary key(Cage_ID,Species_ID),
	constraint fk_AnimalCage_CageID 
		foreign key(Cage_ID)
		references Cage(ID),
	constraint fk_AnimalCage_SpeciesID 
		foreign key(Species_ID)
		references Species(ID)
)

--Sua Bang Animal_Cage
use ZooManagement
alter table Animal_Cage
drop constraint fk_AnimalCage_SpeciesID 

exec sp_rename 'Animal_Cage.Species_ID', 'Animal_ID', 'COLUMN'

alter table Animal_Cage
add constraint fk_AnimalCage_AnimalID 
		foreign key(Animal_ID)
		references Animal(ID)

select * from Animal_Cage

alter table Animal_Food
	add Start_day datetime

alter table Animal_Food
	add End_day datetime

select * from Animal_Food