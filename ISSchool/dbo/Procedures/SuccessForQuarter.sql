-- успеваемость за четверть по каждому предмету для каждого класса, Порядок прохождения классов в отчете – от младших до старших
CREATE PROCEDURE SuccessForQuarter(@quarter INT)
AS
BEGIN
	SELECT s.Name,  p.ClassCode, AVG(Mark) AS Success
	FROM Marks m
	JOIN Pupil p ON m.PupilId=p.Id
	JOIN Subject s ON s.Id=m.SubjectId
	WHERE Quarter=@quarter
	GROUP BY s.Name, p.ClassCode 
	ORDER BY p.ClassCode ASC
END
