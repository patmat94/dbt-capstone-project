WITH src_airports AS (
    select * from {{ ref('src_airports') }}
)

SELECT * FROM src_airports