SELECT city, COUNT(*) AS school_count
FROM schools WHERE "type" = 'Public School'
GROUP BY city
ORDER BY school_count DESC, city ASC
LIMIT 10;