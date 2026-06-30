{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail',
        unique_key = 'comment_id'
    )
}}

WITH src_airport_comments AS (
    select * from {{ ref('src_airports_comments') }}
)

SELECT 
    comment_id,
    airport_ident,
    comment_timestamp,
    NVL(member_nickname, '__UNKNOWN__') AS member_nickname,
    comment_subject,
    comment_body,
    current_timestamp() AS loaded_at
FROM src_airport_comments
WHERE comment_body IS NOT NULL
{% if is_incremental() %}
    AND comment_id > (SELECT MAX(comment_id) FROM {{ this }})
{% endif %}
ORDER BY comment_id ASC