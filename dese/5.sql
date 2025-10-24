SELECT city, COUNT(*) AS schools_count
FROM schools
GROUP BY city
HAVING COUNT(*) < 4
ORDER BY schools_count DESC, city ASC;