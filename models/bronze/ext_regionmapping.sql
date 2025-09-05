{{ config(
    materialized='table'
) }}

with source as (

    select
        $1::int    as org_code_1,
        $2::int    as org_code_2,
        $3::string as region_2,
        $4::string as region_1
    from @ACUMENBI.RAW.LANDING/regionmapping.csv
    (file_format => 'RAW.csv_format')  -- make sure you have a file format named 'csv_format'

)

select * from source