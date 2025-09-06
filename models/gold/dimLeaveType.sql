{{ config(
    materialized='table',
    schema='gold'
) }}

SELECT LeaveType_SK, LeaveType
FROM {{ref("transform_dimLeaveType")}}