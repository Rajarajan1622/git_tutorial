{{config(
    materialized='table',
    alias ='fct_genome_score',
    schema='DEV'
)}}
WITH src_scores AS (
    SELECT 
        g.*, 
        m.title 
    FROM {{ ref('src_genome_score') }} g
    JOIN {{ ref('D_raw_movies') }} m 
      ON g.movie_id = m.movie_id
)

SELECT 
    s.movie_id,
    s.title,
    s.tag_id,
    ROUND(s.relevance, 4) AS relevance
FROM src_scores s