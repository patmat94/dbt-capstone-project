

WITH silver_airports_snapshot AS (
    SELECT * FROM {{ ref('scd_silver_airports') }}
 )


SELECT * FROM silver_airports_snapshot
WHERE airport_ident = '01CN'
