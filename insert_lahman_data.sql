/*
 * This table needs to be populated out of alphabetical order because other
 * INSERTs depend on its contents.
 */

/* TODO: replace with row pattern recognition when available in PostgreSQL. */
INSERT INTO base.franchises
    WITH
        find_changes AS (
            SELECT
                "franchID" AS franchise,
                "yearID" AS year,
                "teamID" AS team,
                name AS team_name,
                "lgID" AS league,
                "divID" AS division,
                name <> LAG(name, 1, '') OVER w AS change
            FROM import."Teams"
            WINDOW
                w AS (PARTITION BY "franchID" ORDER BY "yearID")
        ),

        group_changes AS (
            SELECT
                *,
                COUNT(*) FILTER (WHERE change) OVER w
            FROM find_changes
            WINDOW
                w AS (PARTITION BY franchise ORDER BY year)
        )

    SELECT
        franchise,
        MIN(year) AS first_year,
        MAX(year) AS last_year,
        team,
        team_name,
        league,
        division
    FROM group_changes
    GROUP BY franchise, team, team_name, league, division, count
;
analyze base.franchises;

INSERT INTO base.allstar_games (game, date)
    SELECT DISTINCT
        "gameID",
        to_date(SUBSTRING("gameID" FROM 4 FOR 8), 'YYYYMMDD')
    FROM import."AllstarFull"
    WHERE "gameID" IS NOT NULL
;

INSERT INTO base.allstar_players
    SELECT
        asf."gameID",
        asf."playerID",
        f.franchise,
        CAST(asf."GP" AS BOOLEAN),
        CASE asf."startingPos"
            WHEN '1;10'
            THEN 110
            ELSE CAST("startingPos" AS INTEGER)
        END
    FROM base.franchises AS f
    JOIN import."AllstarFull" AS asf
        ON (asf."teamID", asf."lgID") = (f.team, f.league)
            AND asf."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.appearances
    SELECT
        a."playerID",
        a."yearID",
        f.franchise,
        a."G_all",
        a."GS",
        a."G_batting",
        a."G_defense",
        a."G_p",
        a."G_c",
        a."G_1b",
        a."G_2b",
        a."G_3b",
        a."G_ss",
        a."G_lf",
        a."G_cf",
        a."G_rf",
        a."G_of",
        a."G_dh",
        a."G_ph",
        a."G_pr"
    FROM base.franchises AS f
    JOIN import."Appearances" AS a
        ON (a."teamID", a."lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND a."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.awards
    SELECT "awardID" FROM import."AwardsManagers"
    UNION DISTINCT
    SELECT "awardID" FROM import."AwardsPlayers"
    UNION DISTINCT
    SELECT "awardID" FROM import."AwardsShareManagers"
    UNION DISTINCT
    SELECT "awardID" FROM import."AwardsSharePlayers"
;

INSERT INTO base.batting
    SELECT
        b."playerID",
        b."yearID",
        b."stint",
        f.franchise,
        b."G",
        b."AB",
        b."R",
        b."H",
        b."2B",
        b."3B",
        b."HR",
        b."RBI",
        b."SB",
        b."CS",
        b."BB",
        b."SO",
        b."IBB",
        b."HBP",
        b."SH",
        b."SF",
        b."GIDP",
        b."G_batting",
        b."G_old"
    FROM base.franchises AS f
    JOIN import."Batting" AS b
        ON (b."teamID", b."lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND b."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.birth_cities
    SELECT
        "playerID",
        "birthCountry",
        COALESCE("birthState", '-'),
        COALESCE("birthCity", '-')
    FROM import."People"
    WHERE "birthCountry" IS NOT NULL
;

INSERT INTO base.birth_dates
    SELECT
        "playerID",
        "birthYear",
        "birthMonth",
        "birthDay"
    FROM import."People"
    WHERE "birthYear" IS NOT NULL
;

INSERT INTO base.catching
    SELECT
        f."playerID",
        f."yearID",
        f."stint",
        fr.franchise,
        f."PB",
        f."WP",
        f."SB",
        f."CS"
    FROM base.franchises AS fr
    JOIN import."Fielding" AS f
        ON (f."teamID", f."lgID") IS NOT DISTINCT FROM (fr.team, fr.league)
            AND f."yearID" BETWEEN fr.first_year AND fr.last_year
    WHERE f."POS" = 'C'
;

INSERT INTO base.cities
    SELECT
        country,
        COALESCE(state, '-'),
        COALESCE(city, '-')
    FROM import."Parks"

    UNION DISTINCT

    SELECT
        "birthCountry",
        COALESCE("birthState", '-'),
        COALESCE("birthCity", '-')
    FROM import."People"
    WHERE "birthCountry" IS NOT NULL

    UNION DISTINCT

    SELECT
        "deathCountry",
        COALESCE("deathState", '-'),
        COALESCE("deathCity", '-')
    FROM import."People"
    WHERE "deathCountry" IS NOT NULL

    UNION DISTINCT

    SELECT
        country,
        COALESCE(state, '-'),
        COALESCE(city, '-')
    FROM import."Schools"
    WHERE country IS NOT NULL

    UNION DISTINCT

    VALUES
        ('Mexico', 'Michoacán', '-')
;

INSERT INTO base.college_playing (player, school, year)
    TABLE import."CollegePlaying"
;

INSERT INTO base.death_cities
    SELECT
        "playerID",
        "deathCountry",
        COALESCE("deathState", '-'),
        COALESCE("deathCity", '-')
    FROM import."People"
    WHERE "deathCountry" IS NOT NULL
;

INSERT INTO base.death_dates
    SELECT
        "playerID",
        "deathYear",
        NULLIF("deathMonth", 0),
        NULLIF("deathDay", 0)
    FROM import."People"
    WHERE "deathYear" IS NOT NULL
;

INSERT INTO base.fielding
    SELECT
        f."playerID",
        f."yearID",
        f."stint",
        fr.franchise,
        f."POS",
        f."G",
        f."GS",
        f."InnOuts",
        f."PO",
        f."A",
        f."E",
        f."DP",
        f."ZR"
    FROM base.franchises AS fr
    JOIN import."Fielding" AS f
        ON (f."teamID", f."lgID") IS NOT DISTINCT FROM (fr.team, fr.league)
            AND f."yearID" BETWEEN fr.first_year AND fr.last_year
;

INSERT INTO base.fielding_outfield
    TABLE import."FieldingOF"
;

INSERT INTO base.fielding_outfield_split
    SELECT
        foss."playerID",
        foss."yearID",
        foss."stint",
        f.franchise,
        foss."POS",
        foss."G",
        foss."GS",
        foss."InnOuts",
        foss."PO",
        foss."A",
        foss."E",
        foss."DP"
    FROM base.franchises AS f
    JOIN import."FieldingOFsplit" AS foss
        ON (foss."teamID", foss."lgID") = (f.team, f.league)
            AND foss."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.hall_of_fame
    SELECT
        "playerID",
        "yearID",
        "votedBy",
        "ballots",
        "needed",
        "votes",
        CAST("inducted" AS BOOLEAN),
        "category",
        "needed_note"
    FROM import."HallOfFame"
;

INSERT INTO base.hall_of_fame_categories
    SELECT DISTINCT
        category
    FROM import."HallOfFame"
;

INSERT INTO base.hall_of_fame_voters
    SELECT DISTINCT
        "votedBy"
    FROM import."HallOfFame"
;

INSERT INTO base.home_games
    SELECT
        CAST(hg.yearkey AS INTEGER),
        f.franchise,
        hg.parkkey,
        CAST(hg.spanfirst AS DATE),
        CAST(hg.spanlast AS DATE),
        CAST(hg.games AS INTEGER),
        CAST(hg.openings AS INTEGER),
        CAST(hg.attendance AS INTEGER)
    FROM base.franchises AS f
    JOIN import."HomeGames" AS hg
        ON (hg.teamkey, hg.leaguekey) = (f.team, f.league)
            AND hg.yearkey BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.manager_awards
    SELECT
        "playerID",
        "awardID",
        "yearID",
        "lgID",
        CAST("tie" AS BOOLEAN),
        "notes"
    FROM import."AwardsManagers"
;

INSERT INTO base.managers
    SELECT
        m."playerID",
        m."yearID",
        f.franchise,
        m."inseason",
        m."G",
        m."W",
        m."L",
        m."rank",
        CAST(m."plyrMgr" AS BOOLEAN)
    FROM base.franchises AS f
    JOIN import."Managers" AS m
        ON (m."teamID", m."lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND m."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.managers_half
    SELECT
        mh."playerID",
        mh."yearID",
        f.franchise,
        mh.inseason,
        mh.half,
        mh."G",
        mh."W",
        mh."L",
        mh.rank
    FROM base.franchises AS f
    JOIN import."ManagersHalf" AS mh
        ON (mh."teamID", mh."lgID") = (f.team, f.league)
            AND mh."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.park_cities
    SELECT
        parkkey,
        country,
        COALESCE(state, '-'),
        COALESCE(city, '-')
    FROM import."Parks"
;

INSERT INTO base.park_factors
    SELECT hg.parkkey, hg.yearkey, t."franchID", t."BPF", t."PPF"
    FROM import."Teams" AS t
    JOIN LATERAL (
        SELECT hg.parkkey, hg.yearkey
        FROM import."HomeGames" AS hg
        WHERE (hg.yearkey, hg.leaguekey, hg.teamkey) = (t."yearID", t."lgID", t."teamID")
        ORDER BY hg.games DESC
        FETCH FIRST ROW ONLY
    ) AS hg ON TRUE
    WHERE t."BPF" IS NOT NULL
      AND t."PPF" IS NOT NULL
;

INSERT INTO base.park_names
    SELECT
        p.parkkey,
        u.name,
        u.sort_key
    FROM import."Parks" AS p
    CROSS JOIN LATERAL UNNEST(string_to_array(p.parkalias, '; '))
        WITH ORDINALITY AS u (name, sort_key)
;

INSERT INTO base.parks
    SELECT
        parkkey,
        parkname,
        "ID"
    FROM import."Parks"
;

INSERT INTO base.people
    SELECT
        "playerID",
        "nameFirst",
        "nameLast",
        "nameGiven",
        "weight",
        "height",
        "ID",
        "bbrefID",
        "retroID"
    FROM import."People"
;

INSERT INTO base.pitching
    SELECT
        p."playerID",
        p."yearID",
        p."stint",
        f.franchise,
        p."W",
        p."L",
        p."G",
        p."GS",
        p."CG",
        p."SHO",
        p."SV",
        p."IPouts",
        p."H",
        p."ER",
        p."HR",
        p."BB",
        p."SO",
        p."BAOpp",
        p."ERA",
        p."IBB",
        p."WP",
        p."HBP",
        p."BK",
        p."BFP",
        p."GF",
        p."R",
        p."SH",
        p."SF",
        p."GIDP"
    FROM base.franchises AS f
    JOIN import."Pitching" AS p
        ON (p."teamID", p."lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND p."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.player_awards
    SELECT
        "playerID",
        "awardID",
        "yearID",
        "lgID",
        CAST("tie" AS BOOLEAN),
        "notes"
    FROM import."AwardsPlayers" AS ap
    WHERE "awardID" NOT LIKE '%of the Week'
      AND "awardID" NOT LIKE '%of the Month'
      AND NOT EXISTS (
        SELECT 1
        FROM base.positions AS p
        WHERE p.code = ap.notes)
;

INSERT INTO base.player_awards_by_month
    SELECT
        ap."playerID",
        ap."awardID",
        ap."lgID",
        CAST(ap."tie" AS BOOLEAN),
        CAST(ap."yearID" || s[1] || '01' AS DATE),
        CAST(ap."yearID" || s[2] || '01' AS DATE)
    FROM import."AwardsPlayers" AS ap
    CROSS JOIN LATERAL regexp_split_to_array(ap.notes, '[/–]') AS s
    WHERE ap."awardID" LIKE '%of the Month'
;

INSERT INTO base.player_awards_by_position
    SELECT DISTINCT
        ap."playerID",
        ap."awardID",
        ap."yearID",
        ap."lgID",
        CAST(ap."tie" AS BOOLEAN),
        ap."notes"
    FROM import."AwardsPlayers" AS ap
    JOIN base.positions AS p ON p.code = ap.notes
;

INSERT INTO base.player_awards_by_week
    SELECT
        "playerID",
        "awardID",
        "lgID",
        CAST("tie" AS BOOLEAN),
        to_date("notes", '"Week of "YYYY-MM-DD')
    FROM import."AwardsPlayers"
    WHERE "awardID" LIKE '%of the Week'
;

INSERT INTO base.players
    SELECT
        "playerID",
        "bats",
        "throws",
        "debut",
        "finalGame"
    FROM import."People"
;

INSERT INTO base.postseason_batting
    SELECT
        bp."yearID",
        bp.round,
        f.franchise,
        bp."playerID",
        bp."G",
        bp."AB",
        bp."R",
        bp."H",
        bp."2B",
        bp."3B",
        bp."HR",
        bp."RBI",
        bp."SB",
        bp."CS",
        bp."BB",
        bp."SO",
        bp."IBB",
        bp."HBP",
        bp."SH",
        bp."SF",
        bp."GIDP"
    FROM base.franchises AS f
    JOIN import."BattingPost" AS bp
        ON (bp."teamID", "lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND bp."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.postseason_catching
    SELECT
        fp."playerID",
        fp."yearID",
        f.franchise,
        fp."round",
        fp."PB",
        fp."SB",
        fp."CS"
    FROM base.franchises AS f
    JOIN import."FieldingPost" AS fp
        ON (fp."teamID", fp."lgID") = (f.team, f.league)
            AND fp."yearID" BETWEEN f.first_year AND f.last_year
    WHERE fp."POS" = 'C'
;

INSERT INTO base.postseason_fielding
    SELECT
        fp."playerID",
        fp."yearID",
        f.franchise,
        fp."round",
        fp."POS",
        fp."G",
        fp."GS",
        fp."InnOuts",
        fp."PO",
        fp."A",
        fp."E",
        fp."DP",
        fp."TP"
    FROM base.franchises AS f
    JOIN import."FieldingPost" AS fp
        ON (fp."teamID", fp."lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND fp."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.postseason_pitching
    SELECT
        pp."playerID",
        pp."yearID",
        pp."round",
        f.franchise,
        pp."W",
        pp."L",
        pp."G",
        pp."GS",
        pp."CG",
        pp."SHO",
        pp."SV",
        pp."IPouts",
        pp."H",
        pp."ER",
        pp."HR",
        pp."BB",
        pp."SO",
        pp."BAOpp",
        pp."ERA",
        pp."IBB",
        pp."WP",
        pp."HBP",
        pp."BK",
        pp."BFP",
        pp."GF",
        pp."R",
        pp."SH",
        pp."SF",
        pp."GIDP"
    FROM base.franchises AS f
    JOIN import."PitchingPost" AS pp
        ON (pp."teamID", pp."lgID") = (f.team, f.league)
            AND pp."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.postseason_series
    SELECT
        sp."yearID",
        sp."round",
        fw.franchise,
        fl.franchise,
        sp."wins",
        sp."losses",
        sp."ties"
    FROM import."SeriesPost" AS sp
    JOIN base.franchises AS fw
        ON (sp."teamIDwinner", sp."lgIDwinner") = (fw.team, fw.league)
            AND sp."yearID" BETWEEN fw.first_year AND fw.last_year
    JOIN base.franchises AS fl
        ON (sp."teamIDloser", sp."lgIDloser") = (fl.team, fl.league)
            AND sp."yearID" BETWEEN fl.first_year AND fl.last_year
;

INSERT INTO base.salaries
    SELECT
        s."playerID",
        s."yearID",
        f.franchise,
        s.salary
    FROM base.franchises AS f
    JOIN import."Salaries" AS s
        ON (s."teamID", s."lgID") IS NOT DISTINCT FROM (f.team, f.league)
            AND s."yearID" BETWEEN f.first_year AND f.last_year
;

INSERT INTO base.schools
    SELECT
        "schoolID",
        name_full,
        country,
        state,
        city
    FROM import."Schools"
;

INSERT INTO base.shared_manager_awards
    SELECT
        "playerID",
        "awardID",
        "yearID",
        "lgID",
        "pointsWon",
        "pointsMax",
        "votesFirst"
    FROM import."AwardsShareManagers"
;

INSERT INTO base.shared_player_awards
    SELECT
        "playerID",
        "awardID",
        "yearID",
        "lgID",
        "pointsWon",
        "pointsMax",
        "votesFirst"
    FROM import."AwardsSharePlayers"
;

INSERT INTO base.teams
    SELECT
        "franchID",
        "yearID",
        "park",
        "Rank" ,
        "G",
        "Ghome",
        "W",
        "L",
        CAST("DivWin" AS BOOLEAN),
        CAST("WCWin" AS BOOLEAN),
        CAST("LgWin" AS BOOLEAN),
        CAST("WSWin" AS BOOLEAN),
        "R",
        "AB",
        "H",
        "2B",
        "3B",
        "HR",
        "BB",
        "SO",
        "SB",
        "CS",
        "HBP",
        "SF",
        "RA",
        "ER",
        "ERA",
        "CG",
        "SHO",
        "SV",
        "IPouts",
        "HA",
        "HRA",
        "BBA",
        "SOA",
        "E",
        "DP",
        "FP",
        "teamIDlahman45",
        "teamIDBR",
        "teamIDretro"
    FROM import."Teams"
;

INSERT INTO base.teams_half
    SELECT
        f.franchise,
        th."yearID",
        th."Half",
        CAST(th."DivWin" AS BOOLEAN),
        th."Rank",
        th."G",
        th."W",
        th."L"
    FROM base.franchises AS f
    JOIN import."TeamsHalf" AS th
        ON (th."lgID", th."teamID", th."divID") IS NOT DISTINCT FROM (f.league, f.team, f.division)
            AND th."yearID" BETWEEN f.first_year AND f.last_year
;
