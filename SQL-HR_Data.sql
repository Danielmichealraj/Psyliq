use [HR-Data_Analyst]


SELECT COUNT ("EmployeeID") AS "Q1-Total Employee Count" FROM dbo.General_Data

SELECT DISTINCT ("JobRole") AS "Q2-Job Roles" FROM dbo.General_Data

SELECT AVG ("Age") AS "Q3-Average Age of Employees" FROM dbo.General_Data

SELECT ("Emp_Name") AS "Q4-Emp Name", "Age" from dbo.General_Data 
WHERE TotalWorkingYears > 5;

SELECT COUNT ("EmployeeID") AS "Q5-Employee Count" , Department FROM dbo.General_Data
GROUP BY Department
ORDER BY COUNT("EmployeeID") DESC



SELECT (g.Emp_name) AS "Q6-Emp Name", s.JobSatisfaction
FROM dbo.General_Data g
JOIN dbo.employee_survey_data s on g.EmployeeID = s.EmployeeID
WHERE s.JobSatisfaction >3

SELECT MAX(MonthlyIncome) AS "Q7-Highest Income" FROM dbo.General_Data

SELECT Emp_Name AS "Q8-Emp Name" FROM dbo.General_Data
WHERE BusinessTravel = 'Travel_Rarely';

SELECT DISTINCT ("MaritalStatus") AS "Q9-Marital Status Categories" FROM dbo.General_Data

SELECT ("Emp_name") AS "Q10-Emp Name", "EmployeeID" FROM dbo.General_Data
WHERE YearsSinceLastPromotion BETWEEN 2 and 4

SELECT (Emp_name) AS "Q11-Emp Name", "EmployeeID" FROM dbo.General_Data
WHERE NOT YearsAtCompany = YearsSinceLastPromotion

SELECT  AVG(DistanceFromHome) AS "Q12-Average Distance", "Department" 
FROM dbo.General_Data
GROUP BY Department;

SELECT TOP 5 (Emp_name) AS "Q13-Top Paid Emp" FROM dbo.General_Data
ORDER BY (MonthlyIncome) DESC


SELECT (Count (EmployeeID) * 100 / (SELECT COUNT (*) FROM dbo.General_Data)) AS "Q14- Percentage of Employees"
FROM dbo.General_Data
WHERE YearsAtCompany > 0 AND YearsSinceLastPromotion < 2 

SELECT (g.Emp_Name) AS "Q15-High Satisfaction", s.EmployeeID, s.EnvironmentSatisfaction
FROM dbo.employee_survey_data s

JOIN General_data g  ON s.EmployeeID = g.EmployeeID
WHERE s.EnvironmentSatisfaction =4

SELECT (g.Emp_Name) AS "Q15-Low Satisfaction", s.EmployeeID, s.EnvironmentSatisfaction
FROM dbo.employee_survey_data s

JOIN General_data g  ON s.EmployeeID = g.EmployeeID
WHERE s.EnvironmentSatisfaction = 1

SELECT (g.Emp_Name) AS "Q15-High and Low Satisfaction", s.EmployeeID, s.EnvironmentSatisfaction
FROM dbo.employee_survey_data s

JOIN General_data g  ON s.EmployeeID = g.EmployeeID
WHERE s.EnvironmentSatisfaction =4 or s.EnvironmentSatisfaction = 1
ORDER BY s.EnvironmentSatisfaction


SELECT COUNT(Emp_name) AS "Q16-Employee_Count", JobRole, MaritalStatus  FROM General_Data
GROUP BY JobRole, MaritalStatus
HAVING COUNT(Emp_name) > 1;

SELECT (Emp_name) AS "Q17-Employee List", TotalWorkingYears, m.PerformanceRating FROM General_Data g
JOIN manager_survey_data m ON m.EmployeeID = g.EmployeeID
WHERE m.PerformanceRating = 4
ORDER BY TotalWorkingYears DESC

SELECT AVG(g.Age) AS "Q-18 Avg Age", AVG(e.JobSatisfaction) AS "Avg JobSatisfaction ", g.BusinessTravel FROM General_Data g
JOIN employee_survey_data e ON e.EmployeeID = g.EmployeeID
GROUP BY g.BusinessTravel

SELECT EducationField AS "Q19-EducationFields", COUNT (Emp_Name) AS "Emp Count" FROM General_Data
GROUP BY EducationField
ORDER BY COUNT(Emp_Name) DESC

SELECT Emp_name AS "Q20-Emp With No Promotion", YearsAtCompany FROM General_Data
WHERE YearsAtCompany = YearsSinceLastPromotion
ORDER BY  YearsAtCompany DESC