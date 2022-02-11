-- Удаление завучем данных об ученике отчисленных из школы
CREATE TRIGGER DeleteDeductedPupil
ON Pupil
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @id INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT Id  FROM deleted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		UPDATE Pupil 
		SET IsStudy = 0
		WHERE Id=@id
		FETCH NEXT FROM mycursor into @id
	END
	CLOSE mycursor
	DEALLOCATE mycursor
END