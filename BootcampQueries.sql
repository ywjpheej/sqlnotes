
/*
-------------------- EP.3: Creating Tables
*/
CREATE TABLE EmployeeDemographics
(EmployeeID int, 
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)

INSERT INTO EmployeeDemographics VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

INSERT INTO EmployeeSalary VALUES
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)



/*
-------------------- EP.4: Select + From Statements
*/
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

SELECT AVG(Salary)
FROM EmployeeSalary

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeSalary



/*
-------------------- EP.5: Where Statement
*/
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE Age > 30

SELECT *
FROM EmployeeDemographics
WHERE Age >= 30

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')



/*
-------------------- EP.6: Group By + Order By Statements
*/
SELECT Gender, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount DESC

SELECT * 
FROM EmployeeDemographics
ORDER BY Age, Gender DESC

SELECT * 
FROM EmployeeDemographics
ORDER BY 4, 5 DESC

SELECT * 
FROM EmployeeDemographics
ORDER BY 4, 5 DESC



/*
-------------------- Episode 7: Inner/Outer Joins
*/
SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeSalary

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Inner Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Full Outer Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Left Outer Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Right Outer Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Inner Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Right Outer Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Deducting the highest paid salary (I am Michael)
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Inner Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

-- Average salary for salesman
SELECT JobTitle, AVG(Salary) as AVGSalary 
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Inner Join [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle



/*
-------------------- Episode 8: Unions | Union Operator
*/
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
UNION ALL
-- UNION removes duplicates
-- UNION ALL shows data as it is
SELECT *
FROM [SQL Tutortial Ep. 3].dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID

SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
Full Outer Join [SQL Tutortial Ep. 3].dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID =
	  WareHouseEmployeeDemographics.EmployeeID

SELECT EmployeeID, FirstName, Age
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM [SQL Tutortial Ep. 3].dbo.EmployeeSalary
ORDER BY EmployeeID
-- Be careful when reviewing different tables that have
-- different titles

/*
-------------------- Episode 9: Case Statement | Use Cases
*/
SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'	-- Executes first condition met
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END 
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

-- Employees get a raise
SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
JOIN [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



/*
-------------------- Episode 10: Having Clause
*/
SELECT JobTitle, COUNT(JobTitle)
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
JOIN [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary)
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
JOIN [SQL Tutortial Ep. 3].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)



/*
-------------------- Episode 11: Updating/Deleting Data
*/
SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics

UPDATE [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
WHERE EmployeeID = 1005

-- TO PREVENT ACCIDENTAL DELETION... DO THIS
SELECT *
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics
WHERE EmployeeID = 1004



/*
-------------------- Episode 12: Aliasing
*/
SELECT FirstName + ' ' + LastName AS FullName
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics

SELECT AVG(Age) as AvgAge
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics AS Demo
JOIN [SQL Tutortial Ep. 3].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

-- THIS IS WHAT YOU DO NOT WANT TO DO WHEN ALIASING
SELECT a.EmployeeID, a.FirstName, a.FirstName, b.JobTitle, c.Age
FROM [SQL Tutortial Ep. 3].dbo.EmployeeDemographics AS a
LEFT JOIN [SQL Tutortial Ep. 3].dbo.EmployeeSalary AS b
	ON a.EmployeeID = b.EmployeeID
LEFT JOIN [SQL Tutortial Ep. 3].dbo.WareHouseEmployeeDemographics AS c
	ON a.EmployeeID = c.EmployeeID



/*
-------------------- Episode 13: Partition By
*/
SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics AS dem
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary AS sal
	ON dem.EmployeeID = sal.EmployeeID

--VERSUS GROUP BY

SELECT FirstName, LastName, Gender, Salary, COUNT(Gender)
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics AS dem
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary AS sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary

SELECT Gender, COUNT(Gender)
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics AS dem
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary AS sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender



/*
-------------------- Episode 14: CTEs (Common Table Expression)
*/
-- CTEs act like a sub-query 
-- CTEs are not saved in memory
WITH CTE_Employee as 
(SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics AS emp
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary AS sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)
SELECT *
FROM CTE_Employee



/*
-------------------- Episode 15: Temp Tables
*/
CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001', 'HR', '45000'
)

INSERT INTO #temp_Employee
SELECT *
FROM [SQL Tutortial Ep. 3]..EmployeeSalary

DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics AS emp
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary AS sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2



/*
-------------------- Episode 16: String Functions + Use Cases
*/
CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM
Select EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(EmployeeID) as IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(EmployeeID) as IDLTRIM
FROM EmployeeErrors 

-- Using Replace
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors

-- Using Substring (Fuzzy matching)
Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)

-- Using UPPER and lower
Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors



/*
-------------------- Episode 17: Stored Procedures + Use Cases
*/
CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics emp
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee
GO;

EXEC Temp_Employee

CREATE PROCEDURE Temp_Employee2 
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQL Tutortial Ep. 3]..EmployeeDemographics emp
JOIN [SQL Tutortial Ep. 3]..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle --- make sure to change this in this script from original above
group by JobTitle

Select * 
From #temp_employee3
GO;

exec Temp_Employee2 @jobtitle = 'Salesman'
exec Temp_Employee2 @jobtitle = 'Accountant'



/*
-------------------- Episode 18: Subqueries (in the Select, From, and Where Statement)
*/

Select *
From [SQL Tutortial Ep. 3]..EmployeeSalary

-- Subquery in Select
Select EmployeeID, Salary, (Select AVG(Salary) From [SQL Tutortial Ep. 3]..EmployeeSalary) as AllAvgSalary
From [SQL Tutortial Ep. 3]..EmployeeSalary

-- How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From [SQL Tutortial Ep. 3]..EmployeeSalary

-- Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From [SQL Tutortial Ep. 3]..EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID

-- Subquery in From
Select a.EmployeeID, AllAvgSalary
From (Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
		From [SQL Tutortial Ep. 3]..EmployeeSalary) as a

-- Subquery in Where
Select EmployeeID, JobTitle, Salary
From [SQL Tutortial Ep. 3]..EmployeeSalary as sal
Where EmployeeID in (
		Select EmployeeID
		From [SQL Tutortial Ep. 3]..EmployeeDemographics as dem
		Where Age > 30)


