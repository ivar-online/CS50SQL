SELECT "title", "id", "production_code" FROM episodes
WHERE "production_code" IS NOT NULL 
ORDER BY "production_code" ASC;