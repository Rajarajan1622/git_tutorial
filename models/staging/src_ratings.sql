with D_ratings as(
    select * from movielens.raw.raw_ratings
)

select userid as user_id, movieid as movie_id,rating,to_timestamp_ltz(timestamp) as rating_timestamp
from D_ratings