SELECT
    a.BUSINESSENTITYID AS EMPLOYEEID,
    CONCAT(b.FirstName, ' ', b.LastName) AS EmployeeName,
    a.JOBTITLE AS jobtitle,
    IFNULL(a.ORGANIZATIONLEVEL, 0) AS organizationlevel,
    a.LOGINID AS loginid,
    CASE
        WHEN a.MARITALSTATUS = 'S' THEN 'Single'
        WHEN a.MARITALSTATUS = 'M' THEN 'Married'
        ELSE 'Unknown'
    END AS maritalstatus,
    CASE
        WHEN a.GENDER = 'M' THEN 'Male'
        WHEN a.GENDER = 'F' THEN 'Female'
        ELSE 'Unknown'
    END AS gender,
    CASE
        WHEN a.SALARIEDFLAG = TRUE THEN 'Yes'
        ELSE 'No'
    END AS salaried,
    a.VACATIONHOURS AS vacationhours,
    a.SICKLEAVEHOURS AS sickleavehours
FROM {{ ref('vw_employee') }} a
LEFT JOIN {{ ref('vw_person') }} b ON a.BUSINESSENTITYID = b.BusinessEntityID