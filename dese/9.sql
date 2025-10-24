SELECT d."name"
FROM "expenditures" e
JOIN "districts" d ON e."district_id" = d."id"
WHERE e."pupils" IN (
    SELECT MIN(d2."pupils") FROM "expenditures" d2
);