﻿CREATE TABLE Teacher
(
	Id INT IDENTITY(1,1) NOT NULL,
	Lastname NVARCHAR(40) NOT NULL,
	Firstname NVARCHAR(40) NOT NULL,
	Middlename NVARCHAR(40) NULL,
	CabinetId INT NULL,
	IsWork BIT NOT NULL DEFAULT 1,

	CONSTRAINT PK_Teacher PRIMARY KEY (Id),
	CONSTRAINT FK_Teacher_Cabinet FOREIGN KEY (CabinetId) REFERENCES Cabinet(Id)
)