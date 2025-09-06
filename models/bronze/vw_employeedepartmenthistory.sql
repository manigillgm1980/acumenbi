{{ config(materialized='view') }}

select * 
from {{ source('adventureworks', 'employeedepartmenthistory') }}
WHERE ENDDATE IS NULL