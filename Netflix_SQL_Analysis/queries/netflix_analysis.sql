COPY netflix_titles
FROM 'C:\Users\HP\Documents\netflix_titles.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);



SELECT column_name
FROM information_schema.columns
WHERE table_name = 'netflix_titles'
ORDER BY ordinal_position;



SELECT COUNT(*)
FROM netflix_titles;



SELECT *
FROM netflix_titles
LIMIT 10;


--How many Movies vs TV Shows?

SELECT
    show_type,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY show_type;

--Top 10 countries by number of titles

SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

--Most common ratings

SELECT
    rating,
    COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;

--Top release years

SELECT 
	release_year,
	COUNT(*) AS titles
FROM netflix_titles
GROUP BY release_year
ORDER BY titles DESC
LIMIT 10;