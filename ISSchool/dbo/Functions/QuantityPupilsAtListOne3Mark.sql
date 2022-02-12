--  количество учеников, имеющих в четверти хотя бы одну оценку "3"
CREATE FUNCTION QuantityPupilsAtListOne3Mark(@quarter INT)
RETURNS INT
AS
BEGIN
	DECLARE @quantity INT
	SELECT @quantity=COUNT(*)
	FROM
	(SELECT DISTINCT PupilId FROM Marks
	WHERE Mark=3 AND Quarter=@quarter) t
	RETURN @quantity
END