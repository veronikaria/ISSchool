-- средний балл по школе в целом
CREATE PROCEDURE AverageMarkInSchool
AS
BEGIN
	SELECT AVG(Mark) AS AverageMark
	FROM Marks  
END