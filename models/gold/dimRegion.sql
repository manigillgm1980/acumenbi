{{ config(
    materialized='table',
    schema='gold'
) }}

select
    {{ dbt_utils.generate_surrogate_key(['regionid']) }} as region_sk,
    regionid,
    region
from {{ ref('transform_dimRegion') }}
