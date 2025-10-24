SELECT d."name", e."per_pupil_expenditure", g."graduated"
FROM "districts" d
JOIN "expenditures" e ON d."id" = e."district_id"
JOIN "graduation_rates" g ON d."id" = g."school_id"
ORDER BY e."per_pupil_expenditure" DESC, d."name";