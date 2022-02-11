GO
CREATE LOGIN HeadTeacher WITH PASSWORD = 'head';
CREATE USER HeadTeacher FOR LOGIN HeadTeacher; 
GO


USE ISSchool
GRANT SELECT ON Schedule TO HeadTeacher;
GRANT SELECT ON Marks TO HeadTeacher;
GRANT SELECT ON Pupil TO HeadTeacher;
GRANT SELECT ON Class TO HeadTeacher;
GRANT SELECT ON Teacher_Subject TO HeadTeacher;
GRANT SELECT ON Teacher TO HeadTeacher;
GRANT SELECT ON Cabinet TO HeadTeacher;
GRANT SELECT ON Subject TO HeadTeacher;
GRANT INSERT ON Pupil TO HeadTeacher;
GRANT UPDATE ON Pupil TO HeadTeacher;
GRANT DELETE ON Pupil TO HeadTeacher;
GRANT INSERT ON Teacher TO HeadTeacher;
GRANT UPDATE ON Teacher TO HeadTeacher;
GRANT DELETE ON Teacher TO HeadTeacher;
GRANT INSERT ON Marks TO HeadTeacher;
GRANT UPDATE ON Marks TO HeadTeacher;
GRANT DELETE ON Marks TO HeadTeacher;
GRANT INSERT ON Schedule TO HeadTeacher;
GRANT UPDATE ON Schedule TO HeadTeacher;
GRANT DELETE ON Schedule TO HeadTeacher;




-- Какой предмет будет в заданном классе, в заданный день недели на заданном уроке?

-- В классе 7-А в понедельник на первом уроке
EXECUTE AS USER='HeadTeacher'
SELECT Subject.Name 
FROM Subject 
JOIN Schedule ON  Subject.Id=Schedule.SubjectId
WHERE Schedule.Day=N'Понеділок'
AND Schedule.ClassCode=N'7-А'
AND Schedule.Number=1
REVERT
GO




-- В классе 7-А в среду на втором уроке
EXECUTE AS USER='HeadTeacher'
SELECT Subject.Name 
FROM Subject 
JOIN Schedule ON  Subject.Id=Schedule.SubjectId
WHERE Schedule.Day=N'Середа'
AND Schedule.ClassCode=N'7-А'
AND Schedule.Number=2
REVERT
GO



-- В классе 7-Б в пятницу на пятом уроке
EXECUTE AS USER='HeadTeacher'
SELECT Subject.Name 
FROM Subject 
JOIN Schedule ON  Subject.Id=Schedule.SubjectId
WHERE Schedule.Day=N'П''ятниця'
AND Schedule.ClassCode=N'7-Б'
AND Schedule.Number=5
REVERT
GO


-- Кто из учителей преподает в заданном классе?

-- в классе 7-А
EXECUTE AS USER='HeadTeacher'
SELECT DISTINCT t.Lastname, t.Firstname, t.Middlename
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
AND s.ClassCode=N'7-А'
REVERT
GO


-- в классе 7-Б
EXECUTE AS USER='HeadTeacher'
SELECT DISTINCT t.Lastname, t.Firstname, t.Middlename
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
AND s.ClassCode=N'7-Б'
REVERT
GO



-- В каком кабинете будет 5 урок в среду у некоторого класса?

-- классе 7-А
EXECUTE AS USER='HeadTeacher'
SELECT s.CabinetId
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
WHERE s.Number=5
AND s.Day=N'Середа'
AND s.ClassCode=N'7-А'
REVERT
GO


-- классе 7-Б
EXECUTE AS USER='HeadTeacher'
SELECT s.CabinetId
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
WHERE s.Number=5
AND s.Day=N'Середа'
AND s.ClassCode=N'7-Б'
REVERT
GO


-- В каких классах преподает заданный предмет учитель?

-- предмет Алгебра, преподаватель Іванов Іван Іванович
EXECUTE AS USER='HeadTeacher'
SELECT DISTINCT s.ClassCode
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
JOIN Subject sb ON sb.Id=s.SubjectId
WHERE sb.Name=N'Алгебра'
AND t.Lastname=N'Іванов' 
AND t.Firstname=N'Іван' 
AND t.Middlename = N'Іванович'
REVERT
GO


-- предмет Английский язык, преподаватель Ярешко Іванна Сергіївна
EXECUTE AS USER='HeadTeacher'
SELECT DISTINCT s.ClassCode
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
JOIN Subject sb ON sb.Id=s.SubjectId
WHERE sb.Name=N'Англійська мова'
AND t.Lastname=N'Ярешко' 
AND t.Firstname=N'Іванна' 
AND t.Middlename = N'Сергіївна'
REVERT
GO



-- Расписание на день недели для указанного класса?

-- на понедельник для класса 7-А
EXECUTE AS USER='HeadTeacher'
SELECT s.Number, sb.Name, CONCAT(t.Lastname, ' ', t.Firstname, ' ', t.Middlename) AS Teacher
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
JOIN Subject sb ON sb.Id=s.SubjectId
WHERE s.Day=N'Понеділок'
AND s.ClassCode=N'7-А'
REVERT
GO


-- на четверг для класса 7-Б
EXECUTE AS USER='HeadTeacher'
SELECT s.Number, sb.Name, CONCAT(t.Lastname, ' ', t.Firstname, ' ', t.Middlename) AS Teacher
FROM Schedule s
JOIN Teacher t ON  s.TeacherId=t.Id
JOIN Subject sb ON sb.Id=s.SubjectId
WHERE s.Day=N'Четвер'
AND s.ClassCode=N'7-Б'
REVERT
GO



-- Сколько учащихся в классе?

-- в классе 7-А
EXECUTE AS USER='HeadTeacher'
SELECT COUNT(*) AS Quantity
FROM Pupil 
WHERE ClassCode = N'7-А'
REVERT
GO


-- в классе 8-Б
EXECUTE AS USER='HeadTeacher'
SELECT COUNT(*) AS Quantity
FROM Pupil 
WHERE ClassCode = N'8-Б'
REVERT
GO



-- Добавление нового ученика завучем
EXECUTE AS USER='HeadTeacher'
INSERT INTO Pupil
(
	Lastname,
	Firstname,
	ClassCode
)
VALUES
(N'Гаврилов', N'Андрій', N'7-А')
REVERT
GO



-- Добавление нового учителя завучем
EXECUTE AS USER='HeadTeacher'
INSERT INTO Teacher
(
	Lastname,
	Firstname,
	Middlename,
	CabinetId
)
VALUES
(N'Федишин', N'Петро', N'Іванович', 11)
REVERT
GO



-- Внесение завучем оценки учащихся
EXECUTE AS USER='HeadTeacher'
INSERT INTO Marks
(
	PupilId,
	SubjectId,
	Mark,
	Quarter
)
VALUES
(5, 1, 2, 2),
(5, 2, 5, 2),
(5, 3, 3, 2),
(5, 4, 4, 2),
(5, 5, 4, 2),
(5, 6, 5, 2),
(5, 7, 4, 2)
REVERT
GO



-- Проверка работы триггера DeleteDeductedPupil
-- удаление преподавателя Федишин Петро Іванович
EXECUTE AS USER='HeadTeacher'
DELETE FROM Teacher
WHERE Lastname=N'Федишин'
AND Firstname=N'Петро'
AND Middlename=N'Іванович'
REVERT
GO

-- таблица после удаления
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Teacher
REVERT
GO




-- Проверка работы триггера DeleteDeductedPupil
-- удаление ученика Гаврилов Андрій, что учится в 7-А классе
EXECUTE AS USER='HeadTeacher'
DELETE FROM Pupil
WHERE Lastname=N'Гаврилов'
AND Firstname=N'Андрій'
AND ClassCode=N'7-А'
REVERT
GO

-- таблица после удаления
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Pupil
REVERT
GO



-- внесение изменений завучем об ученике Рибак Денис (ученика перевели из 8-Б класса в 8-А)
EXECUTE AS USER='HeadTeacher'
UPDATE Pupil
SET ClassCode=N'8-А'
WHERE Lastname=N'Рибак'
AND Firstname=N'Денис'
AND ClassCode=N'8-Б'
REVERT
GO


-- таблица после перемен
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Pupil
REVERT
GO


-- внесение изменений зачем об преподавателе Малинов Ігор Ігорович, закрепить за ним кабинет 24
EXECUTE AS USER='HeadTeacher'
UPDATE Teacher
SET CabinetId=24
WHERE Lastname=N'Малинов'
AND Firstname=N'Ігор'
AND Middlename=N'Ігорович'
REVERT
GO


-- таблица после перемен
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Teacher
REVERT
GO



-- изменить оценку в 1 четверти по предмету Алгебра на 5 у ученика Яблонський Руслан что учится в 7-А классе

-- перед переменами
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Marks
WHERE Quarter=1
AND PupilId=(SELECT Id FROM Pupil WHERE Lastname=N'Яблонський' AND Firstname=N'Руслан' AND ClassCode=N'7-А')
AND SubjectId=(SELECT Id FROM Subject WHERE Name=N'Алгебра')
REVERT
GO


EXECUTE AS USER='HeadTeacher'
UPDATE Marks
SET Mark=5
WHERE SubjectId=(SELECT Id FROM Subject WHERE Name=N'Алгебра')
AND Quarter=1
AND PupilId=(SELECT Id FROM Pupil WHERE Lastname=N'Яблонський' AND Firstname=N'Руслан' AND ClassCode=N'7-А')
REVERT
GO


-- после перемен
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Marks
WHERE Quarter=1
AND PupilId=(SELECT Id FROM Pupil WHERE Lastname=N'Яблонський' AND Firstname=N'Руслан' AND ClassCode=N'7-А')
AND SubjectId=(SELECT Id FROM Subject WHERE Name=N'Алгебра')
REVERT
GO


-- внесение изменений заучем об ученике Рибак Денис (учащегося перевели из 8-Б класса в 8-А)
EXECUTE AS USER='HeadTeacher'
UPDATE Pupil
SET ClassCode=N'8-А'
WHERE Lastname=N'Рибак'
AND Firstname=N'Денис'
AND ClassCode=N'8-Б'
REVERT
GO


-- таблица после перемен
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Pupil
REVERT
GO


-- внесение изменений зачем об преподавателе Малинов Ігор Ігорович, закрепить за ним кабинет 24
EXECUTE AS USER='HeadTeacher'
UPDATE Teacher
SET CabinetId=24
WHERE Lastname=N'Малинов'
AND Firstname=N'Ігор'
AND Middlename=N'Ігорович'
REVERT
GO


-- таблица после перемен
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Teacher
REVERT
GO



-- изменить оценку в 1 четверти по предмету Алгебра на 5 у ученика Яблонський Руслан, обучающийся в 7-А классе

-- перед переменами
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Marks
WHERE Quarter=1
AND PupilId=(SELECT Id FROM Pupil WHERE Lastname=N'Яблонський' AND Firstname=N'Руслан' AND ClassCode=N'7-А')
AND SubjectId=(SELECT Id FROM Subject WHERE Name=N'Алгебра')
REVERT
GO


EXECUTE AS USER='HeadTeacher'
UPDATE Marks
SET Mark=5
WHERE SubjectId=(SELECT Id FROM Subject WHERE Name=N'Алгебра')
AND Quarter=1
AND PupilId=(SELECT Id FROM Pupil WHERE Lastname=N'Яблонський' AND Firstname=N'Руслан' AND ClassCode=N'7-А')
REVERT
GO


-- после перемен
EXECUTE AS USER='HeadTeacher'
SELECT * FROM Marks
WHERE Quarter=1
AND PupilId=(SELECT Id FROM Pupil WHERE Lastname=N'Яблонський' AND Firstname=N'Руслан' AND ClassCode=N'7-А')
AND SubjectId=(SELECT Id FROM Subject WHERE Name=N'Алгебра')
REVERT
GO


