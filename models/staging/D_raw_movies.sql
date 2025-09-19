{{config(alias='src_movies')}}
with d_movies as (
    select * from movielens.raw.raw_movies
)
select movieid as movie_id,
title,genres from d_movies