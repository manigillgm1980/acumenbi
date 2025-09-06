{{ config(
    materialized='table',
    schema='silver'
) }}

select distinct
    org_code_1 as regionid,
    region_1 as region
from {{ ref('ext_regionmapping') }}

UNION ALL
SELECT 99 AS regionid, 'Unknown' AS region