{{ config(materialized='view') }}

select 1 AS LeaveType_SK, 'Vacation' AS LeaveType
UNION ALL
select 2 AS LeaveType_SK,'Sick' AS LeaveType
UNION ALL
select 3 AS LeaveType_SK,'Other' AS LeaveType