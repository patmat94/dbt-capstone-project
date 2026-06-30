WITH src_runways AS (
    select * from {{ ref('src_runways') }}
)

SELECT 
    runway_id,
    airport_ident,
    runway_length_ft,
    runway_width_ft,
    NVL(runway_surface, '__UNKNONW__') AS runway_surface,
    runway_lighted,
    runway_closed
FROM src_runways
