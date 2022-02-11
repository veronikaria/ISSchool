CREATE TRIGGER ControlInsertFixedCabinetForTeacher
ON Teacher
INSTEAD OF INSERT 
AS
BEGIN
	DECLARE @lastname NVARCHAR(40)
	DECLARE @firstname NVARCHAR(40)
	DECLARE @middlename NVARCHAR(40)
	DECLARE @cabinet INT
	DECLARE mycursor CURSOR FAST_FORWARD FOR 
	SELECT Lastname, Firstname, Middlename, CabinetId  FROM inserted
	OPEN mycursor
	FETCH NEXT FROM mycursor into @lastname, @firstname, @middlename, @cabinet
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
		INSERT INTO Teacher
		(Lastname,Firstname,Middlename,CabinetId)
		VALUES
		(@lastname, @firstname, @middlename, @cabinet)
		END
		FETCH NEXT FROM mycursor into @lastname, @firstname, @middlename, @cabinet
	END
	CLOSE mycursor
	DEALLOCATE mycursor
END