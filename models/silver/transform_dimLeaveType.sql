SELECT LeaveType_SK, LeaveType
FROM {{ ref('vw_leaveType') }}