-- Create a query to get the list of films and a boolean indicating if it was rented last month.

SELECT DISTINCT f.title, 
	CASE WHEN max(r.rental_date) = (SELECT max(rental_date) FROM sakila.rental) THEN 'True'
    ELSE 'False'
    END AS 'boolean'
FROM sakila.film f 
JOIN sakila.inventory i USING(film_id)
JOIN sakila.rental r USING(inventory_id)
GROUP BY 1;


SELECT max(rental_date) FROM sakila.rental;

SELECT DISTINCT f.title, max(r.rental_date) as max_rental,
	CASE WHEN max_rental = max(r.rental_date) THEN 'True'
    ELSE 'False'
    END AS 'boolean'
FROM sakila.film f 
JOIN sakila.inventory i USING(film_id)
JOIN sakila.rental r USING(inventory_id)
GROUP BY 1;