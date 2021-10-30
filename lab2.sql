-- 1 Write a query to display for each store its store ID, city, and country.
-- 2 Write a query to display how much business, in dollars, each store brought in.
-- 3 Which film categories are longest?

SELECT film.length , COUNT(length) AS category_length
FROM film JOIN film_category USING (film_id)
GROUP BY length
ORDER BY category_length DESC
limit 1;

-- 4 Display the most frequently rented movies in descending order.


-- 5 List the top five genres in gross revenue in descending order.

-- 6 Is "Academy Dinosaur" available for rent from Store 1?
-- Step 1 : Which copies are at Store 1?

select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory join store using (store_id) join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

-- Step 2 pick an inventory_id to rent:

select inventory.inventory_id
from inventory join store using (store_id)
     join film using (film_id)
     join rental using (inventory_id)
where film.title = 'Academy Dinosaur'
      and store.store_id = 1
      and not exists (select * from rental
                      where rental.inventory_id = inventory.inventory_id
                      and rental.return_date is null);


-- 7 Get all pairs of actors that worked together.
-- 8 Get all pairs of customers that have rented the same film more than 3 times.

SELECT film_id FROM film GROUP BY rating HAVING count(*) > 120;

-- 9 For each film, list actor that has acted in more films.