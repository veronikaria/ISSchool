-- количество учеников по школе в целом
CREATE FUNCTION GeneralPupilsInSchool()
RETURNS INT
AS
BEGIN
	DECLARE @quantity INT;
	SELECT @quantity=COUNT(*) 
	FROM Pupil
	RETURN @quantity
END