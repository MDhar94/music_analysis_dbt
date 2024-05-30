{{ config(materialized='table') }}

SELECT
    genres,
    COUNT(*) AS artist_count,
    ROUND(AVG(popularity), 2) AS avg_popularity,
    ROUND(AVG(followers), 2) AS avg_followers,
    MAX(popularity) AS max_popularity,
    MAX(followers) AS max_followers,
    MIN(popularity) AS min_popularity,
    MIN(followers) AS min_followers
FROM {{ ref('stg_raw_data__artists') }}
GROUP BY genres
ORDER BY artist_count, avg_followers DESC
