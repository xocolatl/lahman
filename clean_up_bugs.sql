/*
 * This file corrects bugs in the data that should be reported.
 *
 * Version 2024.04
 */

/* wrong franchise */
DELETE FROM base.allstar_players
    WHERE (player, game, franchise) = ('contrwi02', 'NLS202207190', 'CHC');
;

/* the 1945 game was cancelled, but it still had a date so recreate its ID */
/* for the moment, we just assume the only "game IS NULL" is 1945 */
UPDATE base.allstar_players
    SET game = 'ALS194507100'
    WHERE game IS NULL
;

/* fat fingered award name */
DELETE FROM base.awards
    WHERE award = 'SIlver Slugger'
;
UPDATE base.player_awards_by_position
    SET award = 'Silver Slugger'
    WHERE award = 'SIlver Slugger'
;

/* Dick Woodson never went to college */
DELETE FROM base.college_playing
    WHERE player = 'woodsdi01';
;

/* thinko both/switch */
UPDATE base.players
    SET throws = 'B'
    WHERE throws = 'S'
;

/* Canberra is not in NSW */
UPDATE base.birth_cities
    SET state = 'ACT'
    WHERE (country, city) = ('Australia', 'Canberra')
      AND state <> 'ACT'
;
UPDATE base.death_cities
    SET state = 'ACT'
    WHERE (country, city) = ('Australia', 'Canberra')
      AND state <> 'ACT'
;

/* typo for kellyjo99 */
DELETE FROM base.people
    WHERE person = 'kellyho99'
;
DELETE FROM base.players
    WHERE player = 'kellyho99'
;
DELETE FROM base.birth_cities
    WHERE person = 'kellyho99'
;
DELETE FROM base.birth_dates
    WHERE person = 'kellyho99'
;
DELETE FROM base.death_cities
    WHERE person = 'kellyho99'
;
DELETE FROM base.death_dates
    WHERE person = 'kellyho99'
;

/* typo frazge99/frazege99 */
DELETE FROM base.people
    WHERE person = 'frazege99'
;
UPDATE base.people
    SET person = 'frazege99'
    WHERE person = 'frazge99'
;
DELETE FROM base.players
    WHERE player = 'frazege99'
;
UPDATE base.players
    SET player = 'frazege99'
    WHERE player = 'frazge99'
;
DELETE FROM base.birth_cities
    WHERE person = 'frazge99'
;
DELETE FROM base.birth_dates
    WHERE person = 'frazge99'
;
DELETE FROM base.death_cities
    WHERE person = 'frazge99'
;
DELETE FROM base.death_dates
    WHERE person = 'frazge99'
;

/* missing schools */
INSERT INTO base.schools
    VALUES
        ('ctpostu', 'C.W. Post College', 'USA', 'NY', 'Brookville'),
        ('txrange', 'Ranger College', 'USA', 'TX', 'Ranger'),
        ('txutper', 'University of Texas Permian Basin', 'USA', 'TX', 'Odessa')
;

/*
 * Houston was incorrectly entered as NL which got filtered out in the import
 * phase.
 */
INSERT INTO base.postseason_series
    VALUES (2022, 'WS', 'HOU', 'PHI', 4, 2, 0)
;

/* normalize cities */
UPDATE base.cities
    SET country = 'Australia'
    WHERE country = 'AU'
;
UPDATE base.cities
    SET state = 'NSW'
    WHERE (country, state) = ('Australia', 'New South Wales')
;
UPDATE base.cities
    SET state = 'ACT'
    WHERE (country, city) = ('Australia', 'Canberra')
      AND state <> 'ACT'
;
UPDATE base.cities
    SET city = 'Atílio Vivacqua'
    WHERE (country, city) = ('Brazil', 'Atilio Vivacqua')
;
UPDATE base.cities
    SET state = 'São Paulo'
    WHERE (country, state) = ('Brazil', 'Sao Paulo')
;
UPDATE base.cities
    SET city = 'São Paulo'
    WHERE (country, city) = ('Brazil', 'Sao Paulo')
;
UPDATE base.cities
    SET city = 'Dolní Lukavice'
    WHERE (country, city) = ('Bohemia', 'Dolni Lukavice')
;
UPDATE base.cities
    SET country = 'Canada'
    WHERE country IN ('CA', 'CAN')
;
UPDATE base.cities
    SET country = 'Colombia'
    WHERE country = 'Columbia'
;
UPDATE base.cities
    SET state = 'Atlántico'
    WHERE (country, state) = ('Colombia', 'Atlantico')
;
UPDATE base.cities
    SET country = 'Cuba',
        state = 'La Habana',
        city = 'Havana'
    WHERE (country, state, city) = ('Havana', 'Cuba', 'La Habana')
;
UPDATE base.cities
    SET city = 'Dajabón'
    WHERE (country, state, city) = ('Cuba', 'Dajabón', 'Dajabon')
;
UPDATE base.cities
    SET country = 'Curaçao'
    WHERE country = 'Curacao'
;
UPDATE base.cities
    SET country = 'Dominican Republic'
    WHERE country = 'D.R.'
;
UPDATE base.cities
    SET country = 'England',
        state = 'London'
    WHERE (country, city) = ('UK', 'London')
;
UPDATE base.cities
    SET country = 'Japan'
    WHERE country = 'JP'
;
UPDATE base.cities
    SET country = 'Mexico'
    WHERE country = 'MX'
;
UPDATE base.cities
    SET country = 'Northern Ireland'
    WHERE (country, state, city) = ('Ireland', 'Belfast', 'Belfast')
;
UPDATE base.cities
    SET country = 'Puerto Rico'
    WHERE country IN ('PR', 'P.R.')
;
UPDATE base.cities
    SET country = 'USA'
    WHERE country = 'US'
;

/* remove duplicate cities */
CREATE TEMPORARY TABLE tmpcities (LIKE base.cities) ON COMMIT DROP;
INSERT INTO tmpcities SELECT DISTINCT * FROM base.cities; 
TRUNCATE base.cities;
INSERT INTO base.cities TABLE tmpcities;

/* update city references in base.parks */
UPDATE base.parks
    SET country = 'Australia'
    WHERE country = 'AU'
;
UPDATE base.parks
    SET state = 'NSW'
    WHERE (country, state) = ('Australia', 'New South Wales')
;
UPDATE base.parks
    SET country = 'Canada'
    WHERE country IN ('CA', 'CAN')
;
UPDATE base.parks
    SET country = 'Dominican Republic'
    WHERE country = 'D.R.'
;
UPDATE base.parks
    SET country = 'England',
        state = 'London'
    WHERE (country, city) = ('UK', 'London')
;
UPDATE base.parks
    SET country = 'Japan'
    WHERE country = 'JP'
;
UPDATE base.parks
    SET country = 'Mexico'
    WHERE country = 'MX'
;
UPDATE base.parks
    SET country = 'Puerto Rico'
    WHERE country IN ('PR', 'P.R.')
;
UPDATE base.parks
    SET country = 'USA'
    WHERE country = 'US'
;

/* update city references in base.birth_cities */
UPDATE base.birth_cities
    SET city = 'Dolní Lukavice'
    WHERE (country, city) = ('Bohemia', 'Dolni Lukavice')
;
UPDATE base.birth_cities
    SET state = 'São Paulo'
    WHERE (country, state) = ('Brazil', 'Sao Paulo')
;
UPDATE base.birth_cities
    SET city = 'São Paulo'
    WHERE (country, city) = ('Brazil', 'Sao Paulo')
;
UPDATE base.birth_cities
    SET country = 'Canada'
    WHERE country IN ('CA', 'CAN')
;
UPDATE base.birth_cities
    SET country = 'Colombia'
    WHERE country = 'Columbia'
;
UPDATE base.birth_cities
    SET state = 'Atlántico'
    WHERE (country, state) = ('Colombia', 'Atlantico')
;
UPDATE base.birth_cities
    SET country = 'Curaçao'
    WHERE country = 'Curacao'
;
UPDATE base.birth_cities
    SET country = 'Dominican Republic'
    WHERE country = 'D.R.'
;
UPDATE base.birth_cities
    SET country = 'Northern Ireland'
    WHERE (country, state, city) = ('Ireland', 'Belfast', 'Belfast')
;
UPDATE base.birth_cities
    SET country = 'Puerto Rico'
    WHERE country IN ('PR', 'P.R.')
;
UPDATE base.birth_cities
    SET city = 'Villa Riba'
    WHERE  (country, state, city) = ('Dominican Republic', 'Duarte', 'Villa Ribas')
;

/* update city references in base.deaths */
UPDATE base.death_cities
    SET city = 'Atílio Vivacqua'
    WHERE (country, city) = ('Brazil', 'Atilio Vivacqua')
;
UPDATE base.death_cities
    SET country = 'Canada'
    WHERE country IN ('CA', 'CAN')
;
UPDATE base.death_cities
    SET country = 'Cuba',
        state = 'La Habana',
        city = 'Havana'
    WHERE (country, state, city) = ('Havana', 'Cuba', 'La Habana')
;
UPDATE base.death_cities
    SET country = 'Curaçao'
    WHERE country = 'Curacao'
;
UPDATE base.death_cities
    SET country = 'Dominican Republic'
    WHERE country = 'D.R.'
;
UPDATE base.death_cities
    SET country = 'Puerto Rico'
    WHERE country IN ('PR', 'P.R.')
;

/* change giants park name */
UPDATE base.parks
    SET name = 'Oracle Park'
    WHERE park = 'SFO03'
;
INSERT INTO base.park_names
    VALUES ('SFO03', 'AT&T Park', 3)
;

/* add leagues for some awards */
UPDATE base.player_awards
    SET league = 'NL'
    WHERE (player, year, award) = ('ozunama01', 2020, 'Outstanding DH Award')
;
UPDATE base.player_awards
    SET league = 'AL'
    WHERE award = 'Outstanding DH Award'
      AND (player, year) IN (('daviskh01', 2018), ('cruzne02', 2019), ('ohtansh01', 2021))
;

/* these are obviously position awards */
WITH
    dh AS (
        DELETE FROM base.player_awards
            WHERE award = 'Outstanding DH Award'
        RETURNING *
    )
INSERT INTO base.player_awards_by_position
    SELECT
        player,
        award,
        year,
        league,
        tie,
        'DH'
    FROM dh
;

/* move some pitchers into player_awards_by_position */
WITH
    pitchers AS (
        DELETE FROM base.player_awards
            WHERE notes = 'Pitcher'
               OR award = 'Cy Young Award'
        RETURNING *
    )
INSERT INTO base.player_awards_by_position
    SELECT
        player,
        award,
        year,
        league,
        tie,
        'P'
    FROM pitchers
;

/* fixup NA franchises */
UPDATE base.allstar_players AS ap
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE ap.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.appearances AS a
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE a.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.batting AS b
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE b.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.catching AS c
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE c.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.fielding AS f
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE f.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.fielding_outfield_split AS fos
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE fos.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.franchises AS f
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE f.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.home_games AS hg
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE hg.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.managers AS m
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE m.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.managers_half AS mh
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE mh.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.pitching AS p
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE p.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.postseason_batting AS pb
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE pb.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.postseason_catching AS pc
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE pc.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.postseason_fielding AS pf
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE pf.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.postseason_pitching AS pp
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE pp.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.salaries AS s
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE s.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.teams AS th
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE th.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
UPDATE base.teams_half AS th
    SET franchise = tf."NAassoc"
    FROM import."TeamsFranchises" AS tf
    WHERE th.franchise = tf."franchID"
      AND tf."active" = 'NA'
      AND tf."NAassoc" IS NOT NULL
;
