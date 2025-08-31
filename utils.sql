DROP SCHEMA if exists utils CASCADE;
CREATE SCHEMA utils;

/*
 * Ideally, all of these views should return zero rows.
 * Contributions are welcome.
 */

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

