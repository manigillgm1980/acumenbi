SELECT SHIFTID, NAME AS ShiftName
from {{ ref('vw_shift') }}