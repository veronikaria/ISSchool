-- общее количество кабинетов в школе
CREATE FUNCTION QuantityCabinets()
RETURNS INT
AS 
BEGIN
	DECLARE @quantity INT
	SELECT @quantity=COUNT(*) 
	FROM Cabinet
	RETURN @quantity
END