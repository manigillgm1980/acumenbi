{{ config(materialized='table', schema='gold') }}

WITH date_series AS (
    -- Generate dates from 2007-06-30 to 2015-06-03
    SELECT
        DATEADD('day', seq4(), '2007-06-30') AS date_value
    FROM TABLE(GENERATOR(ROWCOUNT => 2896))
)
SELECT
    TO_CHAR(date_value, 'YYYYMMDD') AS Date_sk,
    date_value AS Date,
    YEAR(date_value) AS Year,
    QUARTER(date_value) AS Qtr,
    CONCAT('Q', QUARTER(date_value)) AS qtr_name,
    MONTH(date_value) AS Month,
    MONTHNAME(date_value) AS month_name
FROM date_series
WHERE date_value <= '2015-06-03'