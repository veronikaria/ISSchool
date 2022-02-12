-- количество учеников, имеющих в четверти хотя бы одну оценку "2".
CREATE FUNCTION QuantityPupilsAtListOne2Mark(@quarter INT)
RETURNS INT
AS
BEGIN
	DECLARE @quantity INT
	SELECT @quantity=COUNT(*)
	FROM
	(SELECT DISTINCT PupilId FROM Marks
	WHERE Mark=2 AND Quarter=@quarter) t
	RETURN @quantity
END