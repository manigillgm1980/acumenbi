{{ config(
    materialized='table',
    schema='silver'
) }}

SELECT 
    BUSINESSENTITYID AS EMPLOYEEID
    , JOBTITLE
    , IFNULL(ORGANIZATIONLEVEL,0) ORGANIZATIONLEVEL
    , CASE 
        WHEN MARITALSTATUS= 'S' THEN 'Single'
        WHEN MARITALSTATUS= 'M' THEN 'Married'
        ELSE 'Unknown' END AS MARITALSTATUS
    , CASE 
        WHEN GENDER = 'M' THEN 'Male'
        WHEN GENDER = 'F' THEN 'Female'
        ELSE 'Unknown' END AS GENDER
    , CASE WHEN SALARIEDFLAG = 'TRUE' THEN 'Yes' ELSE 'No' END AS SALARIED
from {{ ref('vw_employee') }}