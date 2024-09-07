Use HumanResourcesDB;

Select * From Employee.Person;

--Add a new column

Alter Table Employee.Person
Add MiddleName NVARCHAR(50);

--Add a Constraint
Alter Table Employee.Person
Add Constraint CHK_FirstName Check (FirstName NOT LIKE '%[^a-zA-Z]%');

--Drop an Existing Column
Alter Table Employee.Person
Drop Column MiddleName;

--Drop an Existing Constraint
Alter Table Employee.Person
Drop Constraint CHK_FirstName;

