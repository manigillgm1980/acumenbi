{{ config(
    materialized='table',
    schema='silver'
) }}

select 
    a.EMPLOYEEID, REPLACE(a.LOGINID, 'adventure-works\\','') AS EmployeeName
    , c.departmentid, c.departmentname
    , l.leavetype, l.leavetype_sk
    , r.regionid, r.region
    , s.shiftid, s.shiftname
    , a.vacationhours
    , 0 sickleavehours
from {{ ref("transform_dimEmployee") }} a
LEFT JOIN {{ ref("vw_employeedepartmenthistory") }} b ON a.EMPLOYEEID = b.businessentityid
LEFT JOIN {{ ref("transform_dimDepartment")}} c ON b.departmentid = c.departmentid
LEFT JOIN {{ ref("transform_dimShift")}} s ON b.shiftid = s.shiftid
LEFT JOIN {{ ref("transform_dimRegion")}} r ON c.departmentid = r.REGIONID
LEFT JOIN {{ ref("transform_dimLeaveType")}} l ON l.leavetype = 'Vacation'
WHERE a.VACATIONHOURS >0


UNION ALL

select 
    a.EMPLOYEEID, REPLACE(a.LOGINID, 'adventure-works\\','') AS EmployeeName
    , c.departmentid, c.departmentname
    , l.leavetype, l.leavetype_sk
    , r.regionid, r.region
    , s.shiftid, s.shiftname
    , 0 vacationhours
    , a.sickleavehours
from {{ ref("transform_dimEmployee") }} a
LEFT JOIN {{ ref("vw_employeedepartmenthistory") }} b ON a.EMPLOYEEID = b.businessentityid
LEFT JOIN {{ ref("transform_dimDepartment")}} c ON b.departmentid = c.departmentid
LEFT JOIN {{ ref("transform_dimShift")}} s ON b.shiftid = s.shiftid
LEFT JOIN {{ ref("transform_dimRegion")}} r ON c.departmentid = r.REGIONID
LEFT JOIN {{ ref("transform_dimLeaveType")}} l ON l.leavetype = 'Sick'
WHERE a.SICKLEAVEHOURS >0




