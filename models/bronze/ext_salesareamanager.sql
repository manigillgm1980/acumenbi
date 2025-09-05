{{ config(
    materialized='table'
) }}

with source as (

    select
        $1::int    as salespersonid,
        $2::string as area,
        $3::int    as org_code_1
    from @ACUMENBI.RAW.LANDING/salesareamanager.csv
    (file_format => 'RAW.csv_format')

)

select * from source