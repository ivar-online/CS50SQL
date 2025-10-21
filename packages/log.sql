-- *** The Lost Letter ***

--- The contents
SELECT 'contents: The lost letter' AS label, "contents" AS value
FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '2 Finnigan Street'
)

UNION ALL

SELECT 'address: The lost letter' AS label, "address" AS value
FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "contents" = (
        SELECT "contents" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '2 Finnigan Street'
        )
    )
)

UNION ALL

SELECT 'type: The lost letter' AS label, "type" AS value
FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "contents" = (
        SELECT "contents" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '2 Finnigan Street'
        )
    )
);

-- *** The Devious Delivery ***

--- Content of the Devious Delivery
SELECT 'contents: The Devious Delivery' AS label, "contents" AS value
FROM "packages"
WHERE "from_address_id" IS NULL

UNION ALL

--- Current position
SELECT 'address: The Devious Delivery' AS label, "address" AS value
FROM "addresses" 
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' 
    AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
)

UNION ALL

--- Type of residential building

SELECT 'type: The Devious Delivery' AS label, "type" AS value
FROM "addresses" 
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' 
    AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);


-- *** The Forgotten Gift ***

--- contents
SELECT 'content: The forgotten gift' AS label, "contents" AS VALUE
FROM "packages" 
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" 
    WHERE "address" ='109 Tileston Street'
)

UNION ALL

SELECT 'Who has the package:' AS label, "name" AS VALUE
FROM "drivers"
WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" 
        WHERE "address" ='109 Tileston Street'
        )
    )
);

