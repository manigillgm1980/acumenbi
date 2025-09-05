{{ config(
    materialized='table',
    schema='silver'
) }}

SELECT SHIFTID, NAME AS ShiftName
from {{ ref('vw_shift') }}