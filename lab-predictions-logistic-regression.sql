#In order to optimize our inventory, we would like to know which films 
#will be rented next month and we are asked to create a model to predict it.

-- 1. Create a query or queries to extract the information you think may be relevant for building the prediction model. 
-- It should include some film features and some rental features.

SELECT f.film_id, f.title, count(r.rental_id) as frequency, f.rating, f.special_features, f.rental_rate, f.replacement_cost, r.rental_date, f.rental_duration
FROM sakila.film f
JOIN sakila.inventory i USING (film_id)
JOIN sakila.rental r ON i.inventory_id = r.inventory_id
GROUP BY 1,8;
SELECT DISTINCT f.film_id, f.title FROM sakila.film f;


# 4. Create a query to get the list of films and a boolean indicating if it was rented last month. 
# This would be our target variable.
SELECT f.title, month(r.rental_date), year(r.rental_date),
case 	
	when cast(month(r.rental_date) as float) = 2  AND cast(year(r.rental_date) as float) = 2006
    Then 'True'
	else 'False'
	end as 'Rented_02_2006'
FROM sakila.rental r
JOIN sakila.inventory i USING (inventory_id)
JOIN sakila.film f USING (film_id);

