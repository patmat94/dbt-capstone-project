WITH silver_airport_comments AS (
    SELECT * FROM {{ ref('silver_airport_comments') }}
)

SELECT * FROM silver_airport_comments
WHERE comment_timestamp < '2000-01-01'