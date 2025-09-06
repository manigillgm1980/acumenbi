{% snapshot dimEmployee %}

{{
  config(
    target_schema='gold',     
    unique_key='EMPLOYEEID',
    strategy='timestamp', 
    updated_at='updated_at' 
  )
}}

select
    EMPLOYEEID,
    JOBTITLE,
    ORGANIZATIONLEVEL,
    EmployeeName,
    MARITALSTATUS,
    GENDER,
    SALARIED,
    current_timestamp() as updated_at   -- SCD2 tracking column
from {{ ref('transform_dimEmployee') }}

{% endsnapshot %}
