{{ config(
    materialized='table',
    schema='silver'
) }}

SELECT LeaveType_SK, LeaveType
FROM {{ ref('vw_leaveType') }}