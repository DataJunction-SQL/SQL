CREATE VIEW Employee.PersonSummary
AS
SELECT DISTINCT 
	PersonID,
	FirstName,
	LastName,
	BirthDate,
	Email,
	PhoneNumber,
	HireDate,
	Salary,
	IsActive,
	DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM 
	Employee.Person
WHERE
	HireDate >= DATEADD(YEAR, -5, GETDATE());
