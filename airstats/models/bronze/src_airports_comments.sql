
{{
    config(
        materialized = 'ephemeral',
    )
}}

WITH raw_airports_comments AS (
    select * from {{ source('airstats', 'comments') }}
)

SELECT
    id AS comment_id,
    airport_ident,
    date AS comment_timestamp,
    member_nickname,
    subject AS comment_subject,
    body AS comment_body
FROM raw_airports_comments