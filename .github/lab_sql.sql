# 1 - Create a query or queries to extract the information you think may be relevant for building the prediction model. 
#It should include some film features and some rental features.

#4 Create a query to get the list of films and a boolean indicating if it was rented last month. 
#This would be our target variable.

with cte_view as (
select f.title, f.film_id, f.release_year, f.rental_duration, f.rental_rate, f.length, f.rating, f.special_features, r.rental_date,
case when month(r.rental_date) = 2 AND YEAR(r.rental_date) = 2006 
            THEN 'True' 
            ELSE 'False' 
       END AS rented_feb_2006  
from sakila.inventory i
join film f on i.film_id = f.film_id
join rental r on i.inventory_id = r.inventory_id)
select rented_feb_2006, count(*) from cte_view
group by 1
;

SELECT COUNT(*)
FROM sakila.inventory i
JOIN sakila.film f ON i.film_id = f.film_id
JOIN sakila.rental r ON i.inventory_id = r.inventory_id
WHERE MONTH(r.rental_date) = 2 AND YEAR(r.rental_date) = 2006;


select max(rental_date) from sakila.rental;

