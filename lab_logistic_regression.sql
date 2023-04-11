-- 1.Create a query or queries to extract the information you think may be relevant
-- for building the prediction model. It should include some film features and some rental features.

SELECT 
    f.film_id, 
    f.release_year,
    f.rental_rate, 
    f.length, 
    f.rating, 
    r.rental_id, 
    r.rental_date, 
    r.last_update
FROM 
    sakila.film f 
    JOIN sakila.rental r ON f.film_id = f.film_id;