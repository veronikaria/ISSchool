-- количество учеников отличников и хорошистов
CREATE FUNCTION QuantityPupilsWith4And5Mark(@quarter INT)
RETURNS INT
AS
BEGIN
	DECLARE @quantity INT
	SELECT @quantity=COUNT(*)
	FROM
	(SELECT DISTINCT PupilId FROM Marks
	WHERE PupilId NOT IN
	(SELECT DISTINCT PupilId 
	FROM Marks
	WHERE Mark IN (2, 3)
	AND Quarter=@quarter)) t
	RETURN @quantity
END

