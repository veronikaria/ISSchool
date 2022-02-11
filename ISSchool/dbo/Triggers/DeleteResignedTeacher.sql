-- Удаление завучем данных об увольненном учителе
CREATE TRIGGER DeleteResignedTeacher
ON Teacher
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
		UPDATE Teacher 
		SET IsWork = 0
		WHERE Id=@id
		FETCH NEXT FROM mycursor into @id
	END
	CLOSE mycursor
	DEALLOCATE mycursor
END
