CREATE TABLE Schedule
(
	Id INT IDENTITY(1,1) NOT NULL,
	Day NVARCHAR(20) NOT NULL,
	ClassCode NVARCHAR(4) NOT NULL,
	Number INT NOT NULL,
	SubjectId INT NOT NULL,
	TeacherId INT NOT NULL,
	CabinetId INT NOT NULL,

	CONSTRAINT PK_Schedule PRIMARY KEY (Id),
	CONSTRAINT FK_Schedule_Subject FOREIGN KEY (SubjectId) REFERENCES Subject(Id),
	CONSTRAINT FK_Schedule_Class FOREIGN KEY (ClassCode) REFERENCES Class(Code),
	CONSTRAINT FK_Schedule_Teacher FOREIGN KEY (TeacherId) REFERENCES Teacher(Id),
	CONSTRAINT FK_Schedule_Cabinet FOREIGN KEY (CabinetId) REFERENCES Cabinet(Id),
	CONSTRAINT Check_Number CHECK(Number>=1 AND Number<=8),
	CONSTRAINT Check_Day CHECK(Day IN (N'Понеділок', N'Вівторок', N'Середа', N'Четвер', N'П''ятниця')),
	CONSTRAINT UC_Day_Number_Teacher_Cabinet UNIQUE (Day, Number, TeacherId, CabinetId)
)
