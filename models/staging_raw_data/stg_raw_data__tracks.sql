{{ config(materialized='table') }}

with

source as (

    select * from {{ source('raw_data', 'tracks') }}

),

renamed as (

    select
        id as id,
        name as name,
        popularity as popularity,
        duration_ms as duration_ms,
        explicit as explicit,
        artists as artists,
        id_artists as id_artists,
        release_date as release_date,
        danceability as danceability,
        energy as energy,
        key as key,
        loudness as loudness,
        mode as mode,
        speechiness as speechiness,
        acousticness as acousticness,
        instrumentalness as instrumentalness,
        liveness as liveness,
        valence as valence,
        tempo as tempo,
        time_signature as time_signature

    from source

)

select * from renamed
