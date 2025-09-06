
{{ config(
    materialized='table',
    schema='gold'
) }}


SELECT a.date_sk, b.employeeid as employee_sk, c.department_sk, d.leavetype_sk, r.region_sk
,s.shift_sk, a.hours
FROM {{ref("transform_factLeave")}} a
LEFT JOIN {{ref("dimEmployee")}} b ON a.employee_sk = b.employeeid AND b.dbt_valid_to IS NULL
LEFT JOIN {{ref("dimDepartment")}} c ON a.departmentid = c.departmentid
LEFT JOIN {{ref("dimLeaveType")}} d ON a.leavetype = d.leavetype
LEFT JOIN {{ref("dimRegion")}} r ON a.regionid = r.regionid
LEFT JOIN {{ref("dimShift")}} s ON a.shiftid = s.shiftid