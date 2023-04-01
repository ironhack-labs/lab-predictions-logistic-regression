# In order to optimize our inventory, we would like to know which films will be rented next month and we are asked to create a model to predict it.
#1. Create a query or queries to extract the information you think may be relevant for building the prediction model. It should include some film features and some rental features.

select * 
from sakila.inventory i
join film f on i.film_id = f.film_id
join rental r on i.inventory_id = r.inventory_id
;

