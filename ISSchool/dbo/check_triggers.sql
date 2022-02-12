
-- Проверка триггера ControlInsertFixedCabinetForTeacher:
INSERT INTO Teacher
(
	Lastname,
	Firstname,
	Middlename,
	CabinetId
)
VALUES
(N'Петров', N'Григоій', N'Іванович', 14)

SELECT * FROM Teacher




-- Проверка триггера ControlUpdateFixedCabinetForTeacher:
UPDATE Teacher
SET CabinetId=25
WHERE Id=1


SELECT * FROM Teacher
