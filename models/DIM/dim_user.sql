with ratings as (
    select distinct(user_id) from {{ref('src_ratings')}}
),
tags as (
    select distinct(user_id) from {{ref('src_tags')}}
)

select distinct (user_id) from (
  SELECT * FROM ratings
  UNION
  SELECT * FROM tags)