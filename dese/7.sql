SELECT "name"
FROM "schools"
WHERE "district_id" IN (
    SELECT "id" FROM "districts"
    WHERE "name" = 'Cambridge'
) ORDER BY "name";

-- alternative using JOIN
SELECT s."name"
FROM "schools" s
JOIN "districts" d ON s."district_id" = d."id"
WHERE d."name" = 'Cambridge' ORDER BY s."name";