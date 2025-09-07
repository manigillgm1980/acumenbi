select 
    a.DATE AS date_sk,
    a.BUSINESSENTITYID employee_sk, a.EmployeeName
    , c.departmentid, c.departmentname
    , l.leavetype, l.leavetype_sk
    , IFNULL(r.regionid,99) regionid, IFNULL(r.region, 'Unknown') region
    , s.shiftid, s.shiftname
    , a.Hours
from {{ ref("vw_factLeave") }} a
LEFT JOIN {{ ref("vw_employeedepartmenthistory") }} b ON a.BUSINESSENTITYID = b.businessentityid
LEFT JOIN {{ ref("transform_dimDepartment")}} c ON b.departmentid = c.departmentid
LEFT JOIN {{ ref("transform_dimShift")}} s ON b.shiftid = s.shiftid
LEFT JOIN {{ ref("transform_dimRegion")}} r ON c.departmentid = r.REGIONID
LEFT JOIN {{ ref("transform_dimLeaveType")}} l ON l.leavetype = a.LeaveType




