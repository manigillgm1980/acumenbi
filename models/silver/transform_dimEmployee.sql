{{ config(
    materialized='table',
    schema='silver'
) }}

SELECT 
    BUSINESSENTITYID AS EMPLOYEEID
    , REPLACE(LOGINID, 'adventure-works\\','') AS EmployeeName
    , JOBTITLE
    , IFNULL(ORGANIZATIONLEVEL,0) ORGANIZATIONLEVEL
    , LOGINID
    , CASE 
        WHEN MARITALSTATUS= 'S' THEN 'Single'
        WHEN MARITALSTATUS= 'M' THEN 'Married'
        ELSE 'Unknown' END AS MARITALSTATUS
    , CASE 
        WHEN GENDER = 'M' THEN 'Male'
        WHEN GENDER = 'F' THEN 'Female'
        ELSE 'Unknown' END AS GENDER
    , CASE WHEN SALARIEDFLAG = 'TRUE' THEN 'Yes' ELSE 'No' END AS SALARIED
    , VACATIONHOURS, SICKLEAVEHOURS
from {{ ref('vw_employee') }}