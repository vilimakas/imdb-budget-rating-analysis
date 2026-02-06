SELECT
    TRIM(
        regexp_replace(genre, '[\[\]'']', '', 'g')
    ) AS genre_clean,
    ROUND(AVG(rating)::numeric, 2) AS avg_rating,
    COUNT(*) AS movie_count
FROM imdb_movies,
LATERAL unnest(string_to_array(genres, ',')) AS genre
WHERE rating IS NOT NULL
GROUP BY genre_clean
HAVING COUNT(*) > 25
ORDER BY avg_rating DESC;

