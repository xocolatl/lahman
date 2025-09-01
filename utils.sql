DROP SCHEMA if exists utils CASCADE;
CREATE SCHEMA utils;

/*
 * Ideally, all of these views should return zero rows.
 * Contributions are welcome.
 */

CREATE VIEW utils.missing_parks AS
    WITH
        boundaries (city, min, max) AS (
            SELECT
                v.city,
                MIN(v.number),
                MAX(v.number)
            FROM base.parks AS p
            CROSS JOIN LATERAL (
                VALUES (SUBSTRING(park FOR 3),
                        CAST(SUBSTRING(park FROM 4) AS INTEGER))
            ) AS v (city, number)
            GROUP BY v.city
        )
    SELECT b.city || to_char(g.number, 'FM00') AS park
    FROM boundaries AS b
    CROSS JOIN LATERAL generate_series(b.min, b.max) AS g (number)
    LEFT JOIN base.parks AS p ON p.park = b.city || to_char(g.number, 'FM00')
    WHERE p.park IS NULL
;

CREATE VIEW utils.parks_without_coordinates AS
    SELECT DISTINCT ON (p.park)
        p.park,
        p.name,
        pc.country,
        pc.state,
        pc.city,
        hg.first_game,
        hg.last_game
    FROM base.parks AS p
    JOIN base.park_cities AS pc ON pc.park = p.park
    JOIN base.home_games AS hg ON hg.park = p.park
    WHERE NOT EXISTS (
        SELECT 1
        FROM base.park_coordinates AS pc
        WHERE pc.park = p.park)
;

CREATE VIEW utils.parks_with_same_coordinates AS
    SELECT
        ARRAY_AGG(p.name) AS parks,
        pc.latitude,
        pc.longitude
    FROM base.parks AS p
    JOIN base.park_coordinates AS pc ON pc.park = p.park
    GROUP BY pc.latitude, pc.longitude
    HAVING COUNT(*) > 1
;

