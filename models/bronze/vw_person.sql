{{ config(materialized='view') }}

select * 
from {{ source('adventureworks_person', 'person') }}