--Insert records into PersonDetails Table
INSERT INTO [Employee].[PersonDetails] ([PersonID], [FirstName], [LastName], [BirthDate], [EmailAddress], [PhoneNumber], [HireDate], [Salary], [IsActive])
VALUES
    (1, 'John', 'Doe', '1990-05-15', 'john.doe@example.com', '1234567890', '2010-07-01', 50000, 1),
    (2, 'Jane', 'Smith', '1985-09-20', 'jane.smith@example.com', '9876543210', '2008-03-15', 60000, 1),
    (3, 'Michael', 'Johnson', '1982-11-10', 'michael.johnson@example.com', '5551234567', '2005-12-10', 70000, 1),
    (4, 'Emily', 'Brown', '1993-03-25', 'emily.brown@example.com', '4442223333', '2012-09-30', 55000, 1),
    (5, 'David', 'Martinez', '1988-07-12', 'david.martinez@example.com', '7778889999', '2011-05-20', 65000, 1),
    (6, 'Sarah', 'Wilson', '1995-01-05', 'sarah.wilson@example.com', '1112223333', '2013-11-12', 60000, 1),
    (7, 'Christopher', 'Anderson', '1980-04-18', 'christopher.anderson@example.com', '3335557777', '2003-06-25', 75000, 1),
    (8, 'Jessica', 'Garcia', '1987-08-30', 'jessica.garcia@example.com', '6669991111', '2009-11-05', 70000, 1),
    (9, 'Daniel', 'Lopez', '1984-02-14', 'daniel.lopez@example.com', '2224446666', '2006-08-15', 80000, 1),
    (10, 'Amanda', 'Taylor', '1991-06-28', 'amanda.taylor@example.com', '9998887777', '2014-03-18', 55000, 1);

SELECT * FROM [Employee].[PersonDetails];

--Update HireDate with today's date
UPDATE [Employee].[PersonDetails]
SET [HireDate] = GETDATE();

--Delete Records below 70000 Salary
DELETE FROM [Employee].[PersonDetails]
--WHERE [Salary] < 70000.00 ;

--Truncate Table
TRUNCATE TABLE [Employee].[PersonDetails];