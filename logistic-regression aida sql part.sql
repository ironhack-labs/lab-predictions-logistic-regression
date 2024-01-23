-- Create a query or queries to extract the information you think may be relevant for building the prediction model. 
  -- It should include some film features and some rental features.
  
use sakila;

SELECT
  c.customer_id,
  f.film_id,
  r.rental_id,
  r.rental_date,
  r.return_date,
  r.inventory_id,
  TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date) AS rental_duration,
  cat.category_id,
  cat.name AS category_name,
  f.rating
FROM
  film f
JOIN
  inventory i ON f.film_id = i.film_id
JOIN
  rental r ON i.inventory_id = r.inventory_id
JOIN
  customer c ON r.customer_id = c.customer_id
JOIN
  film_category fc ON f.film_id = fc.film_id
JOIN
  category cat ON fc.category_id = cat.category_id;


-- Create a query to get the list of films and a boolean indicating if it was rented last month. 

SELECT
    f.film_id,
    f.title,
    MAX(f.rating) AS Target
FROM
    film f
LEFT JOIN
    inventory i ON f.film_id = i.film_id
LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id, f.title;


