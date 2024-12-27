SELECT * FROM hr.employee;

#Which departments have the highest attrition rate, and how does this compare to the average monthly income in those departments?
SELECT 
    Department,
    COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) * 100.0 / COUNT(*) AS Attrition_Rate,
    AVG(MonthlyIncome) AS AVG_Monthly_Income
FROM
    hr.employee
GROUP BY Department;



#Is there a correlation between the number of years spent at the company and employee attrition?
SELECT 
    Attrition,
    AVG(YearsAtCompany) AS AvgYearsAtCompany,
    COUNT(*) AS EmployeeCount
FROM 
    employee
GROUP BY 
    Attrition;
    
    
  
  #What is the impact of overtime on employee attrition?

SELECT 
    OverTime,
    COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) * 100 / COUNT(*) AS Attrition_Rate,
    COUNT(*) AS Employee_Count
FROM
    employee
GROUP BY OverTime;



#Which job roles have the highest attrition rates and how does that relate to their average performance rating?

SELECT 
    JobRole,
    COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) * 100 / COUNT(*) AS Attrition_Rate,
    AVG(PerformanceRating) AS AVG_Performance_Rating,
    COUNT(*) AS Employee_Count
FROM
    employee
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;



#How does the number of years since the last promotion affect attrition rates across different job roles?

SELECT 
    JobRole,
    YearsSinceLastPromotion,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate,
    COUNT(*) AS TotalEmployees
FROM 
    employee
GROUP BY 
    JobRole, 
    YearsSinceLastPromotion
ORDER BY 
    JobRole, 
    YearsSinceLastPromotion;



#Are employees who receive frequent salary hikes less likely to leave the company?

SELECT 
    PercentSalaryHike,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate,
    COUNT(*) AS TotalEmployees
FROM 
    employee
GROUP BY 
    PercentSalaryHike
ORDER BY 
    PercentSalaryHike;



#What is the relationship between work-life balance and attrition for employees across different age groups?

SELECT 
    CASE 
        WHEN ï»¿Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN ï»¿Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN ï»¿Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN ï»¿Age > 50 THEN '50+'
    END AS AgeGroup,
    WorkLifeBalance,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate,
    COUNT(*) AS TotalEmployees
FROM 
    employee
GROUP BY 
    AgeGroup,
    WorkLifeBalance
ORDER BY 
    AgeGroup, 
    WorkLifeBalance;



#Do employees who have worked at multiple companies before joining have a higher attrition rate than those who haven’t?

SELECT 
    CASE 
        WHEN NumCompaniesWorked = 0 THEN 'No Previous Companies'
        ELSE 'Worked at Multiple Companies'
    END AS CompanyExperience,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate,
    COUNT(*) AS TotalEmployees
FROM 
    employee
GROUP BY 
    CompanyExperience
ORDER BY 
    AttritionRate DESC;




#What is the influence of job satisfaction and environment satisfaction on employee attrition across different job levels?

SELECT 
    JobLevel,
    JobSatisfaction,
    EnvironmentSatisfaction,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate,
    COUNT(*) AS TotalEmployees
FROM 
    employee
GROUP BY 
    JobLevel, 
    JobSatisfaction, 
    EnvironmentSatisfaction
ORDER BY 
    JobLevel, 
    AttritionRate DESC;



#How does the performance rating affect attrition rates for employees who have received stock options?

SELECT 
    PerformanceRating,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate,
    COUNT(*) AS TotalEmployees
FROM 
    employee
WHERE 
    StockOptionLevel > 0
GROUP BY 
    PerformanceRating
ORDER BY 
    AttritionRate DESC;
