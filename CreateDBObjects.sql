--Create a new Database
CREATE DATABASE HumanResourcesDB;

USE HumanResourcesDB;
GO
--Create a new Schema
CREATE SCHEMA Employee;
GO
--Create a new Table
CREATE TABLE Employee.Person
(
    PersonID INT NOT NULL,
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

--Create Indexes

--1.Clustered Index
CREATE CLUSTERED INDEX IX_PersonID ON Employee.Person(PersonID);

--2.NonClustered Index
CREATE NONCLUSTERED INDEX IX_FirstName ON Employee.Person(FirstName);

--3.Unique Index
CREATE UNIQUE INDEX IX_Email ON Employee.Person(Email);

--4.Filtered Index
CREATE NONCLUSTERED INDEX IX_Salary_Filtered ON Employee.Person(Salary)
WHERE Salary IS NOT NULL;

--5.Composite Index
CREATE NONCLUSTERED INDEX IX_LastName_FirstName ON Employee.Person(LastName, FirstName);

--6.Covering Index
CREATE NONCLUSTERED INDEX IX_Covering ON Employee.Person(LastName) 
INCLUDE (FirstName, BirthDate);

--7.Full-Text Index
CREATE FULLTEXT CATALOG FullTextCatalog as Default;

CREATE FULLTEXT INDEX ON Employee.Person(FirstName, LastName, Email)
KEY INDEX PK_EmployeeID ON FullTextCatalog;

Alter Table Employee.Person
Add CONSTRAINT PK_EmployeeID PRIMARY KEY (PersonID); 