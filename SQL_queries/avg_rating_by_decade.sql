SELECT 
	(year/10) * 10 as decade,
	COUNT(*) as movie_count,
	ROUND(AVG(rating)::numeric, 2) AS avg_rating
FROM imdb_movies
WHERE rating IS NOT NULL
GROUP BY decade
ORDER BY decade;
