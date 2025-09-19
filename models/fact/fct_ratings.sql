{{
    config(
        materialized='incremental',
        on_schema_chnage='fail',
        schema='DEV',
        alias='scd_ratings',

    )
}}

with c as (
    select * from {{ref('src_ratings')}}
)

select movie_id,
user_id,rating, rating_timestamp from c
where rating is NOT NULL

{% if is_incremental() %} AND
rating_timestamp > (select max(rating_timestamp) from {{this}})

{% endif %}
