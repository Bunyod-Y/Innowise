SELECT ci.city,
       SUM(CASE WHEN cu.active = 1 THEN 1 ELSE 0 END) AS active_customers,
       SUM(CASE WHEN cu.active = 0 THEN 1 ELSE 0 END) AS inactive_customers
FROM city ci
JOIN address a ON ci.city_id = a.city_id
JOIN customer cu ON a.address_id = cu.address_id
GROUP BY ci.city_id, ci.city
ORDER BY inactive_customers DESC;
