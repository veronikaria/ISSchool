GO
CREATE LOGIN HeadTeacher WITH PASSWORD = 'head';
CREATE USER HeadTeacher FOR LOGIN HeadTeacher; 
GO


USE ISSchool
GRANT SELECT ON Schedule TO HeadTeacher;
GRANT SELECT ON Marks TO HeadTeacher;
GRANT SELECT ON Pupil TO HeadTeacher;
GRANT SELECT ON Class TO HeadTeacher;
GRANT SELECT ON Teacher_Subject TO HeadTeacher;
GRANT SELECT ON Teacher TO HeadTeacher;
GRANT SELECT ON Cabinet TO HeadTeacher;
GRANT SELECT ON Subject TO HeadTeacher;
GRANT INSERT ON Pupil TO HeadTeacher;
GRANT UPDATE ON Pupil TO HeadTeacher;
GRANT DELETE ON Pupil TO HeadTeacher;
GRANT INSERT ON Teacher TO HeadTeacher;
GRANT UPDATE ON Teacher TO HeadTeacher;
GRANT DELETE ON Teacher TO HeadTeacher;
GRANT INSERT ON Marks TO HeadTeacher;
GRANT UPDATE ON Marks TO HeadTeacher;
GRANT DELETE ON Marks TO HeadTeacher;
GRANT INSERT ON Schedule TO HeadTeacher;
GRANT UPDATE ON Schedule TO HeadTeacher;
GRANT DELETE ON Schedule TO HeadTeacher;




