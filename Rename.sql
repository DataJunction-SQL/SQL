Create Database HumanResourceDB;
GO
USE HumanResourceDB;
GO
CREATE SCHEMA Employee;
GO

CREATE TABLE Employee.Person
(
    PersonID INT PRIMARY KEY, -- Primary Key constraint
    FirstName NVARCHAR(50) NOT NULL, -- NOT NULL constraint
    LastName NVARCHAR(50) NOT NULL, -- NOT NULL constraint
    BirthDate DATE, -- Date data type
    Email NVARCHAR(100) UNIQUE, -- Unique constraint
    PhoneNumber CHAR(10) CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), -- Check constraint
    HireDate DATETIME DEFAULT GETDATE(), -- Default constraint
    Salary DECIMAL(18, 2) CHECK (Salary >= 0), -- Check constraint
    IsActive BIT DEFAULT 1 -- Default constraint
);
GO
-- Rename the Table
EXEC sp_rename 'Employee.Person', 'PersonDetails';

--Rename the Column
EXEC sp_rename 'Employee.PersonDetails.Email', 'EmailAddress', 'COLUMN';

--Rename the Index
CREATE NONCLUSTERED INDEX IX_FirstName on Employee.PersonDetails(FirstName);

EXEC sp_rename 'Employee.PersonDetails.IX_FirstName', 'INDEX_FIRST_NAME', 'INDEX';

