select FirstName,
LEFT(FirstName,3) as LeftFunction,
RIGHT(FirstName,3) as RightFunction,
LEN(FirstName) as LenFunction,
SUBSTRING(FirstName,1,3) as SubstringFunction,
REPLACE(FirstName,'Ale','X-') as ReplaceFunction
from dbo.Employee

----------------------------------------------------------------------------------------------------------------------

-- Declare scalar variable for storing FirstName values.Assign value ‘Aleksandar’ to the FirstName variable
--Find all Employees having FirstName same as the variable
-- scalar variable
DECLARE @FirstName nvarchar(100)
set @FirstName = 'Aleksandar'

SELECT * 
FROM Employee
WHERE FirstName = @FirstName
GO

SELECT * 
FROM Employee
WHERE DateOfBirth > '1988.01.01'
GO


--Declare table variable that will contain EmployeeId and DateOfBirth
--Fill the table variable with all Female employees
-- table variable
DECLARE @EmployeeList TABLE 
(EmployeeId int, FirstName NVARCHAR(100), DateOfBirth date);

INSERT INTO @EmployeeList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Employee
WHERE Gender = 'F'

select * from @EmployeeList
GO


--Declare temp table that will contain LastName and HireDate columns
--Fill the temp table with all Male employees having First Name starting with ‘A’
-- Temp table 
CREATE TABLE #EmployeeList 
(LastName NVARCHAR(100), HireDate date);

INSERT INTO #EmployeeList
SELECT LastName, HireDate 
from dbo.Employee
where FirstName like 'A%'

SELECT * 
FROM #EmployeeList
where Len(LastName) = 7

drop table #EmployeeList
GO