-- средний балл по каждому предмету 
CREATE PROCEDURE AverageMarkAllSubjects
AS
BEGIN
	SELECT s.Name, AVG(m.Mark) AS AverageMark
	FROM Marks m
	JOIN Subject s ON s.Id=m.SubjectId
	GROUP BY s.Name 
END
