with dim_movies as (
    select * from {{ref('D_raw_movies')}}
)
select 
movie_id,initcap(trim(title)) AS MOVIE_TITLE,split(genres,'|') AS genres_array, genres
from dim_movies