SELECT {{ dbt_utils.generate_surrogate_key(['shiftid']) }} as shift_sk,
shiftid, shiftname
FROM {{ref("transform_dimShift")}}