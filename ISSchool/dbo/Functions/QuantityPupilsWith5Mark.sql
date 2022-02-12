-- количество учеников отличников
CREATE FUNCTION QuantityPupilsWith5Mark(@quarter INT)
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
	WHERE Mark IN (2, 3, 4)
	AND Quarter=@quarter)) t
	RETURN @quantity
END