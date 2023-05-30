CREATE DATABASE Drugstore
USE Drugstore
CREATE TABLE Owners(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50),
	Surname nvarchar(50)
)
CREATE TABLE Drugstores(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) UNIQUE,
	Address nvarchar(50), 
	ContactNumber nvarchar(50) UNIQUE,
	CreationDate date ,
	OwnerId int FOREIGN KEY REFERENCES Owners(Id)
)

CREATE TABLE Druggist(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50),
	Surname nvarchar(50),
	Age int,
	Experience int,
	DrugstoreId int FOREIGN KEY REFERENCES Drugstores(Id)
)

CREATE TABLE Drug(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50),
	Price int CHECK (Price > 0),
	Count int CHECK (Count > 0),
	DrugstoreId int FOREIGN KEY REFERENCES Drugstores(Id)
)