select 
{{ dbt_utils.generate_surrogate_key(['DEPARTMENTID']) }} as department_sk,
departmentid, departmentname, GROUPNAME 
from {{ref("transform_dimDepartment")}}