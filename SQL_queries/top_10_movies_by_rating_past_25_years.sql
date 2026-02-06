SELECT 
title,
rating,
year
FROM imdb_movies
WHERE rating IS NOT NULL
ORDER BY rating DESC
LIMIT 10;