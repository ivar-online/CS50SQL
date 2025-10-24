SELECT e."name" AS district_name, d."pupils"
FROM "expenditures" d
JOIN "districts" e ON d."district_id" = e."id"
ORDER BY "pupils" DESC LIMIT 30;