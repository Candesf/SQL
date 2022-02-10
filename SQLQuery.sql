----------  SQL Basics  ----------


----- Create Tables


Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)


Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)


----- Insert Data


Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')


Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)


----- SELECT Statement


SELECT *
FROM EmployeeDemographics


-- TOP


SELECT TOP 5 *
FROM EmployeeDemographics


-- DISTINCT


SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics


-- COUNT and AS


SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics


SELECT *
FROM EmployeeSalary


-- MAX


SELECT MAX(Salary)
FROM EmployeeSalary


-- MIN


SELECT MIN(Salary)
FROM EmployeeSalary


-- AVG


SELECT AVG(Salary)
FROM EmployeeSalary


----- WHERE Statement


SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'


-- <>


SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'


-- >


SELECT *
FROM EmployeeDemographics
WHERE Age > 30


-- >=


SELECT *
FROM EmployeeDemographics
WHERE Age >= 30


-- <=


SELECT *
FROM EmployeeDemographics
WHERE Age <= 32


-- AND


SELECT *
FROM EmployeeDemographics
WHERE Age > 30 AND Gender = 'Male'


-- OR


SELECT *
FROM EmployeeDemographics
WHERE Age > 30 OR Gender = 'Male'


-- LIKE


SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'


SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'


-- NULL / NOT NULL


SELECT *
FROM EmployeeDemographics
WHERE LastName is NOT NULL


-- IN


SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')


----- GROUP BY


SELECT Gender 
FROM EmployeeDemographics
GROUP BY Gender


-- COUNT


SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender


SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age


-- COUNT and WHERE


SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender


-- COUNT , AS , WHERE and ORDER BY


SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
ORDER BY CountGender ASC


----- ORDER BY


SELECT *
FROM EmployeeDemographics
ORDER BY Age ASC

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC



----------  SQL Intermediate  ----------

INSERT INTO EmployeeDemographics VALUES
(1011,'Ryan', 'Howard', 26,'MALE'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)


----- INNER JOIN


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics


SELECT *
FROM SQLBasics.dbo.EmployeeSalary


-- INNER


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
INNER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- FULL OUTER


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
FULL OUTER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- LEFT OUTER


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
LEFT OUTER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- RIGHT OUTER


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
RIGHT OUTER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- INNER JOIN


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLBasics.dbo.EmployeeDemographics
INNER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- INNER JOIN , WHERE , ORDER BY


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLBasics.dbo.EmployeeDemographics
INNER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC


-- INNER JOIN , WHERE , GROUP BY, AVG


SELECT JobTitle, AVG(Salary)
FROM SQLBasics.dbo.EmployeeDemographics
INNER JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle


----- UNION


Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')


Table 3 Query:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)


Table 3 Insert:
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
FULL OUTER JOIN SQLBasics.dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID


-- UNION


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
UNION
SELECT *
FROM SQLBasics.dbo.WareHouseEmployeeDemographics


-- UNION ALL


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM SQLBasics.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID


----- CASE STATEMENT


SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM SQLBasics.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


-- CASE and OPERATIONS


SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQLBasics.dbo.EmployeeDemographics
JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


----- CLAUSE


SELECT JobTitle, COUNT(JobTitle)
FROM SQLBasics.dbo.EmployeeDemographics
JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle


-- HAVING STATEMENT


SELECT JobTitle, COUNT(JobTitle)
FROM SQLBasics.dbo.EmployeeDemographics
JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1


-- HAVING , AVG


SELECT JobTitle, AVG(Salary)
FROM SQLBasics.dbo.EmployeeDemographics
JOIN SQLBasics.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)


----- UPDATING / DELETING DATA


SELECT *
FROM SQLBasics.dbo.EmployeeDemographics


-- UPDATE


UPDATE SQLBasics.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'


UPDATE SQLBasics.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'


-- DELETE


DELETE FROM SQLBasics.dbo.EmployeeDemographics
WHERE EmployeeID = 1012


----- ALIASING


SELECT FirstName + ' ' + LastName AS FullName
FROM [SQLBasics].[dbo].[EmployeeDemographics]


SELECT AVG(Age) AS AvgAge
FROM [SQLBasics].[dbo].[EmployeeDemographics]


SELECT Demo.EmployeeID, Sal.Salary
FROM [SQLBasics].[dbo].[EmployeeDemographics] AS Demo
JOIN [SQLBasics].[dbo].[EmployeeSalary] AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID


SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
FROM [SQLBasics].[dbo].EmployeeDemographics Demo
LEFT JOIN [SQLBasics].[dbo].EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQLBasics].[dbo].WareHouseEmployeeDemographics Ware
	ON Demo.EmployeeID = Ware.EmployeeID


----- PARTITION BY


SELECT *
FROM SQLBasics..EmployeeDemographics


SELECT *
FROM SQLBasics..EmployeeSalary


SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM SQLBasics..EmployeeDemographics DEM
JOIN SQLBasics..EmployeeSalary SAL
	ON DEM.EmployeeID = SAL.EmployeeID


-----  TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower


---  DROP TABLE EmployeeErrors;


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


-- TRIM , LTRIM, RTRIM


Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 


Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors 


Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors 

	
-- REPLACE


Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


-- SUBSTRING


Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


-- UPPER and LOWER


Select firstname, LOWER(firstname)
from EmployeeErrors


Select Firstname, UPPER(FirstName)
from EmployeeErrors

