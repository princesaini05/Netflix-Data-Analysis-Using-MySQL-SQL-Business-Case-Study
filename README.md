# Netflix MySQL Analysis

## Project Overview

This project uses **MySQL** to explore a Netflix titles and credits
dataset and answer business-oriented questions about movies, TV shows,
ratings, genres, release trends, cast members, directors, and runtime.

The analysis is organized as a collection of SQL queries in
`Netflix MySQL Analysis.sql`. It creates and selects the
`netflix_analysis` database, then runs queries against the `titles` and
`credits` tables.

## Objectives

-   Compare movie and TV-show ratings.
-   Identify the highest- and lowest-rated titles.
-   Explore title releases by decade and year.
-   Analyze production countries, genres, and age certifications.
-   Find actors and directors with the most credits.
-   Examine directors, cast members, and recurring characters.
-   Compare average runtime for movies and shows.

## Tools & Technologies

-   **MySQL** --- SQL querying and analysis
-   **MySQL Workbench** (optional) --- running and reviewing SQL queries
-   **CSV datasets** --- source data for the `titles` and `credits`
    tables

## Dataset

The SQL script expects two tables:

### `titles`

The queries use fields including:

`id`, `title`, `type`, `release_year`, `imdb_score`, `tmdb_score`,
`tmdb_popularity`, `production_countries`, `age_certification`,
`seasons`, `genres`, and `runtime`.

### `credits`

The queries use fields including:

`id`, `name`, `role`, and `character`.

The `id` field is used to connect titles with their associated credits.

> Make sure the CSV data is imported into MySQL with the table names and
> column names expected by the SQL script before running the analysis.

## Business Questions & SQL Analysis

The project contains 21 business questions, covering:

1.  Top 10 movies by IMDb score
2.  Top 10 shows by IMDb score
3.  Bottom 10 movies by IMDb score
4.  Bottom 10 shows by IMDb score
5.  Average IMDb and TMDB scores by content type
6.  Movie and show counts by decade
7.  Average IMDb and TMDB scores by production country
8.  Five most common movie age certifications
9.  Top 20 actors by number of movie/show credits
10. Top 20 directors by number of movie/show credits
11. Movie titles and directors for releases from 2010 onward
12. Shows with the most seasons
13. Genres with the most movies
14. Genres with the most shows
15. Directors and titles meeting IMDb and TMDB popularity thresholds
16. Number of titles released in each year
17. Actors appearing in highly rated titles
18. Actors associated with the same character in multiple titles
19. Three most common movie genres
20. Average runtime for movies and shows
21. Average IMDb score for leading actors/actresses

## How to Run the Project

1.  Install **MySQL Server** and, optionally, **MySQL Workbench**.
2.  Create the `titles` and `credits` tables and import the
    corresponding CSV data.
3.  Open `Netflix MySQL Analysis.sql` in MySQL Workbench or another
    MySQL client.
4.  Execute the script. It creates and selects the `netflix_analysis`
    database.
5.  Review the result set returned by each business query.

**Important:** The script creates the database but does not define the
table schemas or import the CSV files. Those setup steps must be
completed before running the analysis queries.

## Repository Structure

``` text
Netflix-MySQL-Analysis/
│
├── Netflix MySQL Analysis.sql
├── titles.csv
├── credits.csv
└── README.md
```

The CSV files are shown above as the expected dataset files; include
them in the repository if you intend to distribute the data with the
project.

## Key SQL Concepts Practiced

-   `SELECT`, `WHERE`, and `ORDER BY`
-   Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
-   `GROUP BY` and `HAVING`
-   `JOIN`
-   `CASE` expressions
-   `UNION ALL`
-   `DISTINCT`
-   `LIMIT`
-   NULL filtering
-   Date/year-based grouping and calculations

## Project Outcome

This project demonstrates how SQL can be used to investigate a
streaming-content dataset, summarize catalog characteristics, compare
ratings, and answer practical business questions using relational data.

------------------------------------------------------------------------

**Author:** Prince Saini
