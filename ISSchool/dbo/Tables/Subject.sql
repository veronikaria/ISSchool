﻿CREATE TABLE Subject
(
	Id INT IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(100) NOT NULL,

	CONSTRAINT PK_Subject PRIMARY KEY (Id)
)