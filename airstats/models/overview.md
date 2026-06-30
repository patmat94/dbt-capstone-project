{% docs __overview__ %}

# AirStats

The **AIRSTATS** database holds global aviation data from [OurAirports](https://ourairports.com/data/), loaded into Snowflake under the `RAW` schema. It contains three source tables: `airports` (~72K rows), `runways` (~44K rows), and `airport_comments`.

The dbt project transforms this data through a bronze layer (`src_*` models) into three silver tables, all linked by **`airport_ident`** (the ICAO airport code):

- **`silver_airports`** is the central dimension table — one row per airport with location, type, and country attributes.
- **`silver_runways`** describes runways at each airport; each row references an `airport_ident` in `silver_airports`.
- **`silver_airport_comments`** stores user comments about airports, also joined to `silver_airports` via `airport_ident`.

Together, `silver_airports` acts as the hub, with runways and comments as related detail tables around it.

{% enddocs %}
