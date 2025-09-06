{{ config(materialized='view') }}


WITH employee_leave AS (
    -- Extract relevant columns from Employee table
    SELECT
        BusinessEntityID,
        REPLACE(LOGINID, 'adventure-works\\','') AS EmployeeName,
        HireDate,
        VacationHours,
        SickLeaveHours
    from {{ source('adventureworks', 'employee') }}
),
leave_types AS (
    -- Split into Vacation and Sick leave records
    SELECT
        BusinessEntityID,
        EmployeeName,
        'Vacation' AS LeaveType,
        VacationHours AS TotalHours,
        DATEADD('year', 1, HireDate) AS StartDate
    FROM employee_leave
    WHERE VacationHours > 0
    UNION ALL
    SELECT
        BusinessEntityID,
        EmployeeName,
        'Sick' AS LeaveType,
        SickLeaveHours AS TotalHours,
        DATEADD('year', 2, HireDate) AS StartDate
    FROM employee_leave
    WHERE SickLeaveHours > 0
),
leave_days AS (
    -- Calculate number of days needed for each leave type
    SELECT
        BusinessEntityID,
        EmployeeName,
        LeaveType,
        TotalHours,
        StartDate,
        CEIL(TotalHours / 8.0) AS num_days
    FROM leave_types
),
daily_leave AS (
    -- Generate one row per day using a fixed sequence table
    SELECT
        ld.BusinessEntityID,
        EmployeeName,
        ld.LeaveType,
        DATEADD('day', s.seq, ld.StartDate) AS leave_date,
        CASE
            WHEN s.seq < ld.num_days - 1 THEN 8
            ELSE ld.TotalHours - (8 * (ld.num_days - 1))
        END AS Hours
    FROM leave_days ld
    JOIN (
        -- Generate sequence up to 1000 (adjust if needed)
        SELECT ROW_NUMBER() OVER (ORDER BY seq4()) - 1 AS seq
        FROM TABLE(GENERATOR(ROWCOUNT => 1000))
    ) s ON s.seq < ld.num_days
)
SELECT
    TO_CHAR(leave_date, 'YYYYMMDD') AS Date,
    BusinessEntityID,
    EmployeeName,
    LeaveType,
    Hours
FROM daily_leave
WHERE Hours > 0
