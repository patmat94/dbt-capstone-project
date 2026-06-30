WITH silver_airports AS (
    SELECT * FROM {{ ref('silver_airports') }}
)

SELECT * FROM silver_airports
WHERE length(iso_country) != 2