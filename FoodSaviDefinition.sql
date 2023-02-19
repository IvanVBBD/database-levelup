USE master;
IF EXISTS(select * from sys.databases where name='FoodSavi')
DROP DATABASE FoodSavi

CREATE DATABASE FoodSavi

GO

USE FoodSavi;

GO

CREATE TABLE FoodType (
	FoodTypeID [int] IDENTITY(1,1) NOT NULL,
	FoodType [varchar](120) NOT NULL
	CONSTRAINT [PK_FoodType] PRIMARY KEY CLUSTERED 
	(
		FoodTypeID ASC
	)

);

CREATE TABLE [Address] (
	AddressID [int] IDENTITY(1,1) NOT NULL,
	Number [varchar](7) NOT NULL,
	Street [varchar](95) NOT NULL,
	ZipCode [varchar](1) NOT NULL
	CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
	(
		AddressID ASC
	)
);

CREATE TABLE Store (
	StoreID [int] IDENTITY(1,1) NOT NULL,
	StoreName [varchar] NOT NULL,
	[Address] [int] NOT NULL,
	StoreNumber [varchar] (15) NOT NULL
	CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
	(
		StoreID ASC
	)
);

CREATE TABLE Charity (
	CharityID [int] IDENTITY(1,1) NOT NULL,
	CharityName [varchar] NOT NULL,
	[Address] [int] NOT NULL,
	CharityNumber [varchar](15) NOT NULL
	CONSTRAINT [PK_Charity] PRIMARY KEY CLUSTERED 
	(
		CharityID ASC
	)
);

CREATE TABLE FoodStock (
	FoodID [int] IDENTITY(1,1) NOT NULL,
	FoodTypeID [int] NOT NULL,
	StoreID [int] NOT NULL,
	SellByDate [date] NOT NULL,
	ExpirationDate [date] NOT NULL,
	Barcode [varchar](30) NOT NULL
	CONSTRAINT [PK_FoodStock] PRIMARY KEY CLUSTERED 
	(
		FoodID ASC
	)
);

CREATE TABLE Donation (
	DonationID [int] IDENTITY(1,1) NOT NULL,
	FoodID [int] NOT NULL,
	CharityID [int] NOT NULL,
	DateDonated [date] NOT NULL
	CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED 
	(
		DonationID ASC
	)
);

GO


