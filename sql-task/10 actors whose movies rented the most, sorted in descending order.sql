SELECT a.actor_id,
       CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
       COUNT(r.rental_id) AS total_rentals
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY a.actor_id, actor_name
ORDER BY total_rentals DESC
LIMIT 10;
