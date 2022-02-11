CREATE TRIGGER ControlUpdateFixedCabinetForTeacher
ON Teacher
INSTEAD OF UPDATE 
AS
BEGIN
	DECLARE @id INT
	DECLARE @lastname NVARCHAR(40)
	DECLARE @firstname NVARCHAR(40)
	DECLARE @middlename NVARCHAR(40)
	DECLARE @cabinet INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT Id, Lastname, Firstname, Middlename, CabinetId  FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @id, @lastname, @firstname, @middlename, @cabinet
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF EXISTS 
		(SELECT * FROM Teacher
		WHERE CabinetId IS NOT NULL
		AND CabinetId=@cabinet)
		BEGIN 
		PRINT 'This Cabinet is busy by another teacher!'
		END
		ELSE
		BEGIN 
		UPDATE Teacher
		SET Lastname=@lastname,
		Firstname=@firstname,
		Middlename=@middlename,
		CabinetId=@cabinet
		WHERE Id=@id
		END
		FETCH NEXT FROM mycursor into @id, @lastname, @firstname, @middlename, @cabinet
	END
	CLOSE mycursor
	DEALLOCATE mycursor
END