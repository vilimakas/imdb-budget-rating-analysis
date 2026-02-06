SELECT 
	CASE
        WHEN budget_usd < 10000000 THEN 'Low (<10M)'
        WHEN budget_usd < 50000000 THEN 'Medium (10–50M)'
        WHEN budget_usd < 150000000 THEN 'High (50–150M)'
        ELSE 'Blockbuster (150M+)'
	END AS budget_amount,
	ROUND(AVG(rating)::numeric, 2) AS avg_rating,
	COUNT(*) AS movie_count,
	MAX (rating) AS highest_rating,
	MIN (rating) AS lowest_rating
FROM imdb_movies
WHERE rating IS NOT NULL
GROUP BY budget_amount
ORDER BY avg_rating DESC;

