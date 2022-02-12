-- проверка процедуры SuccessForQuarter
EXECUTE SuccessForQuarter 1

-- проверка процедуры AverageMarkAllSubjects
EXEC AverageMarkAllSubjects

-- проверка процедуры AverageMarkAllClasses
EXEC AverageMarkAllClasses

-- проверка процедуры AverageMarkInSchool
EXEC AverageMarkInSchool

-- проверка функции GeneralPupilsInClass
SELECT dbo.GeneralPupilsInClass(N'7-А') AS Quantity
SELECT dbo.GeneralPupilsInClass(N'7-Б') AS Quantity
SELECT dbo.GeneralPupilsInClass(N'8-А') AS Quantity
SELECT dbo.GeneralPupilsInClass(N'8-Б') AS Quantity

-- проверка функции GeneralPupilsInSchool
SELECT dbo.GeneralPupilsInSchool() AS TotalQuantity

-- проверка функции QuantityPupilsWith5Mark
SELECT dbo.QuantityPupilsWith5Mark(1) AS QuantityPupilsWith5Mark

-- проверка функции QuantityPupilsWith4And5Mark
SELECT dbo.QuantityPupilsWith4And5Mark(1) AS QuantityPupilsWith4And5Mark

-- проверка функции QuantityPupilsAtListOne3Mark
SELECT dbo.QuantityPupilsAtListOne3Mark(1) AS QuantityPupilsAtListOne3Mark

-- проверка функции QuantityPupilsAtListOne2Mark
SELECT dbo.QuantityPupilsAtListOne2Mark(1) AS QuantityPupilsAtListOne2Mark

-- проверка процедуры HeaderTeacherForClasses
EXECUTE HeaderTeacherForClasses

-- проверка процедуры QuantityTeachersBySubject
EXECUTE QuantityTeachersBySubject

-- проверка функции QuantityCabinets
SELECT dbo.QuantityCabinets() AS TotalQuantityCabinetsInSchool


