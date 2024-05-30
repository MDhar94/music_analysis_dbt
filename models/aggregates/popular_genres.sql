{{ config(materialized='table') }}

SELECT
  name,
  popularity
FROM {{ ref("stg_raw_data__artists") }}
WHERE popularity > 50 AND genres LIKE "%rock%"
ORDER BY popularity DESC
