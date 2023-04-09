use sakila;

select f.film_id, f.title, f.rental_duration, f.rental_rate, r.rental_date, r. return_date, r.rental_id, r.customer_id 
from sakila.inventory i
join film f on i.film_id = f.film_id
join rental r on i.inventory_id = r.inventory_id

;
