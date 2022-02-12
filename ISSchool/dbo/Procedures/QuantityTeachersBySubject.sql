-- количество учителей по каждому предмету
CREATE PROCEDURE QuantityTeachersBySubject
AS 
BEGIN
	SELECT s.Name, COUNT(*) AS QuantityTeachers FROM Teacher t
	JOIN Teacher_Subject ts ON t.Id=ts.TeacherId
	JOIN Subject s ON s.Id=ts.SubjectId
	GROUP BY s.Name
END
