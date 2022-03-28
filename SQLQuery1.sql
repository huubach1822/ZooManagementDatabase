create database ZooManagement
go

use ZooManagement

create table Species
(
	ID int not null,
	Species_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Species primary key(ID)
)

create table Animal
(
	ID int not null,
	Vietnamese_name nvarchar(50),
	Species_ID int,
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
	constraint pk_Animal primary key(ID),
	constraint fk_Animal_SpeciesID
		foreign key(Species_ID)
		references Species(ID)

)

create table Incident
(
	ID int not null,
	Incident_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Incident primary key(ID)
)

create table Food
(
	ID int not null,
	Food_name nvarchar(50),
	Uses nvarchar(50),
	Unit int,
	constraint pk_Food primary key(ID)
)

create table Employee
(
	ID int not null,
	Employee_name nvarchar(50),
	Date_of_birth datetime,
	Gender bit,
	Employee_Address nvarchar(50),
	Phone int,
	constraint pk_Employee primary key(ID)
)

create table Animal_Food
(
	ID int not null,
	Breakfast_ID int,
	Amount_of_breakfast int,
	Lunch_ID int,
	Amount_of_lunch int,
	Dinner_ID int,
	Amount_of_dinner int,
	constraint pk_AnimalFood primary key(ID)
)

create table Food_Price
(
	ID int not null,
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
	ID int not null,
	Reason_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Reason primary key(ID)
)

create table Fix
(
	ID int not null,
	Fix_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Fix primary key(ID)
)

create table Condition
(
	ID int not null,
	Condition_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Condition primary key(ID)
)

create table Area
(
	ID int not null,
	Area_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Area primary key(ID)
)

create table Countryside
(
	ID int not null,
	Countryside_name nvarchar(50),
	constraint pk_Countryside primary key(ID)
)

create table Origin
(
	ID int not null,
	Birth_type_name nvarchar(50),
	Note nvarchar(50),
	constraint pk_Origin primary key(ID)
)

create table Animal_Incident
(
	Incident_ID int not null,
	Animal_ID int not null,
	Start_day datetime,
	Reason_ID int,
	Fix_ID int,
	End_day datetime,
	constraint pk_AnimalIncident primary key(Incident_ID,Animal_ID),
	constraint fk_AnimalIncident_IncidentID 
		foreign key(Incident_ID)
		references Incident(ID),
	constraint fk_AnimalIncident_AnimalID 
		foreign key(Animal_ID)
		references Animal(ID),
	constraint fk_AnimalIncident_ReasonID 
		foreign key(Reason_ID)
		references Reason(ID),
	constraint fk_AnimalIncident_FixID 
		foreign key(Fix_ID)
		references Fix(ID)
)

create table Cage 
(
	ID int not null,
	Species_ID int,
	Area_ID int,
	Cage_area int,
	Height int,
	Capacity int,
	Condition_ID int,
	Employee nvarchar(50),
	Note nvarchar(50),
	constraint pk_Cage primary key(ID),
	constraint fk_Cage_SpeciesID 
		foreign key(Species_ID)
		references Species(ID),
	constraint fk_Cage_AreaID 
		foreign key(Area_ID)
		references Area(ID),
	constraint fk_Cage_ConditionID 
		foreign key(Condition_ID)
		references Condition(ID)
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

create table TypeOfBirth
(
	ID int not null,
	Name_Birth nvarchar(50),
	Note nvarchar(50),
	constraint pk_TypeOfBirth primary key(ID)
)