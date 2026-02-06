SELECT 
CORR(budget_usd, rating) AS budget_rating_correlation
FROM imdb_movies
WHERE budget_usd IS NOT NULL
AND rating IS NOT NULL;