-- средний балл по каждому классу
CREATE PROCEDURE AverageMarkAllClasses
AS
BEGIN
	SELECT c.Code, AVG(m.Mark) AS AverageMark
	FROM Marks m
	FULL JOIN Pupil p ON m.PupilId=p.Id
	FULL JOIN Class c ON c.Code=p.ClassCode 
	GROUP BY c.Code
END