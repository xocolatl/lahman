DROP SCHEMA if exists utils;
CREATE SCHEMA utils;

CREATE VIEW utils.parks_without_coordinates AS
    SELECT DISTINCT ON (p.park)
        p.park,
        p.name,
        p.country,
        p.state,
        p.city,
        hg.first_game,
        hg.last_game
    FROM base.parks AS p
    JOIN base.home_games AS hg ON hg.park = p.park
    WHERE NOT EXISTS (
        SELECT 1
        FROM base.park_coordinates AS pc
        WHERE pc.park = p.park)
    ORDER BY p.park, hg.first_game, hg.last_game DESC
;

