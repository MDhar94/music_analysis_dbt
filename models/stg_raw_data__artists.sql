{{ config(materialized='view') }}

with

source as (

    select * from {{ source('raw_data', 'artists') }}

),

renamed as (

    select
        id as id,
        followers as followers,
        genres as genres,
        name as name,
        popularity as popularity

    from source

)

select * from renamed
