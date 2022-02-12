-- указать общее количество учащихся в классе и школе
CREATE FUNCTION GeneralPupilsInClass(@class NVARCHAR(4))
RETURNS INT
AS
BEGIN
	DECLARE @quantity INT;
	SELECT @quantity=COUNT(*) 
	FROM Pupil
	WHERE ClassCode=@class
	RETURN @quantity
END