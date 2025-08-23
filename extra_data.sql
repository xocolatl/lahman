INSERT INTO base.countries
    SELECT DISTINCT
        country
    FROM base.cities
;

INSERT INTO base.states
    SELECT DISTINCT
        country,
        state
    FROM base.cities
;

