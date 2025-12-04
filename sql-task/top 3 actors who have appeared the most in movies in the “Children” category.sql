WITH actor_counts AS (
    SELECT a.actor_id,
           CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
           COUNT(*) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Children'
    GROUP BY a.actor_id, actor_name
),
top3 AS (
    SELECT film_count
    FROM actor_counts
    ORDER BY film_count DESC
    LIMIT 1 OFFSET 2
)
SELECT ac.*
FROM actor_counts ac
WHERE ac.film_count >= (SELECT film_count FROM top3)
ORDER BY ac.film_count DESC;
