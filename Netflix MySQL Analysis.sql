-- create database netflix_analysis;
use netflix_analysis;

-- Business Queries
-- Q1 What were the top 10 movies according to IMDB score?
SELECT 
    title, type, imdb_score
FROM
    titles
WHERE
    type = 'MOVIE'
ORDER BY imdb_score DESC
LIMIT 10;

-- Q2 What were the top 10 shows according to IMDB score? 
SELECT 
    title, type, imdb_score
FROM
    titles
WHERE
    type = 'SHOW'
ORDER BY imdb_score DESC
LIMIT 10;

-- Q3 What were the bottom 10 movies according to IMDB score?
SELECT 
    title, type, imdb_score
FROM
    titles
WHERE
    type = 'MOVIE'
        AND imdb_score IS NOT NULL
ORDER BY imdb_score ASC
LIMIT 10;

-- Q4 What were the bottom 10 shows according to IMDB score?
SELECT 
    title, type, imdb_score
FROM
    titles
WHERE
    type = 'SHOW' AND imdb_score IS NOT NULL
ORDER BY imdb_score ASC
LIMIT 10;

-- Q5 What were the average IMDB and TMDB scores for shows and movies?
SELECT DISTINCT
    type,
    ROUND(AVG(imdb_score), 2) AS average_imdb_score,
    ROUND(AVG(tmdb_score), 2) AS average_tmdb_score
FROM
    titles
GROUP BY type;


-- Q6 Count of movies and shows in each decade
SELECT 
    CONCAT(FLOOR(release_year / 10) * 10, 's') AS Decade,
    SUM(CASE
        WHEN type = 'MOViE' THEN 1
        ELSE 0
    END) AS MOVIE_COUNT,
    SUM(CASE
        WHEN TYPE = 'SHOW' THEN 1
        ELSE 0
    END) AS SHOW_COUNT,
    COUNT(*)
FROM
    titles
GROUP BY Decade
ORDER BY Decade;


-- Q7 What were the average IMDB and TMDB scores for each production country?
SELECT DISTINCT
    production_countries,
    ROUND(AVG(imdb_score), 2) AS average_imdb_score,
    ROUND(AVG(tmdb_score), 2) AS average_tmdb_score
FROM
    titles
GROUP BY production_countries
HAVING average_imdb_score IS NOT NULL
    OR average_tmdb_score IS NOT NULL
ORDER BY average_imdb_score DESC;


-- Q8 What were the 5 most common age certifications for movies?
SELECT 
    age_certification, COUNT(*) AS certification_count
FROM
    titles
WHERE
    type = 'MOVIE'
        AND age_certification != 'Unknown'
GROUP BY age_certification
ORDER BY certification_count DESC
LIMIT 5;


-- Q9 Who were the top 20 actors that appeared the most in movies/shows?

SELECT 
    name, COUNT(*) AS Movie_show_count
FROM
    credits
WHERE
    role = 'Actor'
GROUP BY name
ORDER BY Movie_show_count DESC
LIMIT 20;


-- Q10 Who were the top 20 directors that directed the most movies/shows?
select name, count(*) as movie_show_count
from credits
where role = 'Director'
group by name
order by movie_show_count desc
limit 20;


-- Q11 Finding the titles and  directors of movies released on or after 2010
SELECT 
    t.title, c.name AS director, t.release_year
FROM
    titles AS t
        JOIN
    credits AS c ON t.id = c.id
WHERE
    t.release_year >= 2010
        AND c.role = 'director'
        and t.type='movie'
ORDER BY t.release_year DESC;

-- Q12 Which shows on Netflix have the most seasons?
SELECT 
    title, SUM(seasons) AS Total_season
FROM
    titles
WHERE
    type = 'show'
GROUP BY title
order by Total_season desc
limit 10;


-- Q13 Which genres had the most movies? 
SELECT 
    genres, COUNT(*) AS title_count
FROM
    titles
WHERE
    type = 'movie'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;


-- Q14 Which genres had the most shows?
SELECT 
    genres, COUNT(*) AS title_count
FROM
    titles
WHERE
    type = 'show'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;


-- Q15 Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>80)
SELECT 
    t.title, c.name AS director, t.imdb_score, t.tmdb_popularity
FROM
    titles AS t
        JOIN
    credits AS c ON c.id = t.id
WHERE
    c.role = 'director'
        AND t.imdb_score > 7.5
        AND t.tmdb_popularity > 80
ORDER BY title ASC;


-- Q16 What were the total number of titles for each year?
SELECT 
    release_year, COUNT(*) AS title_count
FROM
    titles
GROUP BY release_year
ORDER BY title_count DESC;


-- Q17 Actors who have starred in the most highly rated movies or shows
SELECT 
    c.name AS Actor, COUNT(*) AS num_highly_rated_titles
FROM
    credits AS c
        JOIN
    titles AS t ON t.id = c.id
WHERE
    c.role = 'Actor' 
    and (t.type='Movie' or t.type='show')
    AND t.imdb_score > 8.0
        AND t.tmdb_score > 8.0
GROUP BY c.name
ORDER BY num_highly_rated_titles DESC;


-- Q18 Which actors/actresses played the same character in multiple movies or TV shows?
SELECT 
    c.name AS actor_actress,
    c.character,
    COUNT(DISTINCT t.title) AS num_titles
FROM
    credits AS c
        JOIN
    titles AS t ON t.id = c.id
WHERE
    c.role = 'actor'
        OR c.role = 'actresses'
        AND c.character IS NOT NULL
GROUP BY c.name , c.character
having num_titles>1
ORDER BY num_titles DESC;


-- Q19 What were the top 3 most common genres?
SELECT 
    genres, COUNT(*) AS total_genres
FROM
    titles
WHERE
    type = 'movie'
GROUP BY genres
ORDER BY total_genres
LIMIT 3;


-- Q20 Calculating the average runtime of movies and TV shows separately
SELECT 
    'Movies' AS content_type,
    ROUND(AVG(runtime), 2) AS avg_runtime_min
FROM
    titles
WHERE
    type = 'Movie' 
UNION ALL SELECT 
    'Show' AS content_type,
    ROUND(AVG(runtime), 2) AS avg_runtime_min
FROM
    titles
WHERE
    type = 'Show';
    
    
    
-- Q21 Average IMDB score for leading actors/actresses in movies or shows 
SELECT 
    c.name AS actor_actress,
    ROUND(AVG(t.imdb_score)) AS Average_IMDB_score
FROM
    credits AS c
        JOIN
    titles AS t ON t.id = c.id
WHERE
    c.role = 'Actor'
        OR c.role = 'Actress'
        AND c.character = 'leading actor'
GROUP BY c.name
ORDER BY Average_IMDB_score DESC;