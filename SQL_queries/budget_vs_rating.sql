SELECT
    title,
    budget_usd,
    rating
FROM imdb_movies
WHERE budget_usd IS NOT NULL
AND rating IS NOT NULL;

