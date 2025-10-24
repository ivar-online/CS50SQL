SELECT d."name", e."per_pupil_expenditure", s."exemplary"
FROM "districts" d
JOIN "expenditures" e ON d."id" = e."district_id"
JOIN "staff_evaluations" s ON d."id" = s."district_id"
WHERE d."type" = 'Public School District' 
AND
e."per_pupil_expenditure" > (
    SELECT AVG(e2."per_pupil_expenditure") FROM "expenditures" e2
)
AND
s."exemplary" > (
    SELECT AVG(s2."exemplary") FROM "staff_evaluations" s2
)
ORDER BY s."exemplary" DESC, e."per_pupil_expenditure" DESC;
