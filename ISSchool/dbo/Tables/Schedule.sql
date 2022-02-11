CREATE TABLE Schedule
(
	Id INT IDENTITY(1,1) NOT NULL,
	ClassCode NVARCHAR(4) NOT NULL,
	Number INT NOT NULL,
	SubjectId INT NOT NULL,
	TeacherId INT NOT NULL,
	CabinetId INT NOT NULL,

	CONSTRAINT PK_Schedule PRIMARY KEY (Id),
	CONSTRAINT FK_Schedule_Subject FOREIGN KEY (SubjectId) REFERENCES Subject(Id),
	CONSTRAINT FK_Schedule_Class FOREIGN KEY (ClassCode) REFERENCES Class(Code),
	CONSTRAINT FK_Schedule_Teacher FOREIGN KEY (TeacherId) REFERENCES Teacher(Id),
	CONSTRAINT FK_Schedule_Cabinet FOREIGN KEY (CabinetId) REFERENCES Cabinet(Id)
)
