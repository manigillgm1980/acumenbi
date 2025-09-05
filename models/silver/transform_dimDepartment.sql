{{ config(
    materialized='table',
    schema='silver'
) }}

select 
    DEPARTMENTID
    , NAME AS DEPARTMENTNAME
    , GROUPNAME
from {{ ref("vw_department")}}
