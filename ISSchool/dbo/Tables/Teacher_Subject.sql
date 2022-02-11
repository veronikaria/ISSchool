CREATE TABLE Teacher_Subject
(
	TeacherId INT NOT NULL,
	SubjectId INT NOT NULL,

	CONSTRAINT PK_Teacher_Subject PRIMARY KEY (TeacherId, SubjectId),
	CONSTRAINT FK_Teacher_Subject_Teacher FOREIGN KEY (TeacherId) REFERENCES Teacher(Id),
	CONSTRAINT FK_Teacher_Subject_Subject FOREIGN KEY (SubjectId) REFERENCES Subject(Id)
)
