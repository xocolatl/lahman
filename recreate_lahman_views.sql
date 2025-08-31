DROP SCHEMA if exists lahman CASCADE;
CREATE SCHEMA lahman;

CREATE VIEW base.parks_by_year AS
    SELECT
        f.franchise,
        hg.year,
        string_agg(p.name, ' / ' ORDER BY hg.first_game) AS park
    FROM base.franchises AS f
    JOIN base.home_games AS hg
        ON hg.franchise = f.franchise
            AND hg.year BETWEEN f.first_year AND f.last_year
    JOIN base.parks AS p ON p.park = hg.park
    GROUP BY f.franchise, hg.year
;

CREATE VIEW lahman."AllstarFull" AS
    SELECT
        asp.player AS "playerID",
        asg.year AS "yearID",
        asg.game_num AS "gameNum",
        CASE WHEN asg.year <> 1945
             THEN asp.game
        END AS "gameID",
        f.team AS "teamID",
        f.league AS "lgID",
        CASE WHEN asp.played
             THEN 1
             ELSE 0
        END AS "GP",
        CASE WHEN asp.starting_position = 110
             THEN '1;10'
             ELSE CAST(starting_position AS text)
        END AS "startingPos"
    FROM base.franchises AS f
    JOIN base.allstar_players AS asp ON asp.franchise = f.franchise
    JOIN (
        SELECT
            game,
            EXTRACT(YEAR FROM asg.date) AS year,
            CASE WHEN COUNT(*) OVER w < 2
                 THEN 0
                 ELSE ROW_NUMBER() OVER w
            END AS game_num
        FROM base.allstar_games AS asg
        WINDOW
            w AS (
                PARTITION BY EXTRACT(YEAR FROM asg.date)
                ORDER BY asg.date
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    ) AS asg
        ON asg.game = asp.game
            AND asg.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."Appearances" AS
    SELECT
        a.year AS "yearID",
        f.team AS "teamID",
        f.league AS "lgID",
        a.player AS "playerID",
        a.games AS "G_all",
        a.started AS "GS",
        a.batting AS "G_batting",
        a.defense AS "G_defense",
        a.pitcher AS "G_p",
        a.catcher AS "G_c",
        a.first_base AS "G_1b",
        a.second_base AS "G_2b",
        a.third_base AS "G_3b",
        a.shortstop AS "G_ss",
        a.left_field AS "G_lf",
        a.center_field AS "G_cf",
        a.right_field AS "G_rf",
        a.outfield AS "G_of",
        a.designated_hitter AS "G_dh",
        a.pinch_hitter AS "G_ph",
        a.pinch_runner AS "G_pr"
    FROM base.franchises AS f
    JOIN base.appearances AS a ON a.franchise = f.franchise
        AND a.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."AwardsManagers" AS
    SELECT
        manager AS "playerID",
        award AS "awardID",
        year AS "yearID",
        league AS "lgID",
        CASE WHEN     tie THEN 'Y'
             WHEN NOT tie THEN 'N'
        END AS "tie",
        notes as "notes"
    FROM base.manager_awards
;

CREATE VIEW lahman."AwardsPlayers" AS
    SELECT
        player AS "playerID",
        award AS "awardID",
        year AS "yearID",
        league AS "lgID",
        CASE WHEN     tie THEN 'Y'
             WHEN NOT tie THEN 'N'
        END AS "tie",
        notes as "notes"
    FROM base.player_awards

    UNION ALL

    SELECT
        player AS "playerID",
        award AS "awardID",
        EXTRACT(YEAR FROM first_month) AS "yearID",
        league AS "lgID",
        CASE WHEN     tie THEN 'Y'
             WHEN NOT tie THEN 'N'
        END AS "tie",
        CASE WHEN last_month IS NULL
             THEN TRIM(to_char(first_month, 'Month'))
             ELSE TRIM(to_char(first_month, 'Month')) || '–' || TRIM(to_char(last_month, 'Month'))
        END AS "notes"
    FROM base.player_awards_by_month

    UNION ALL

    SELECT
        player AS "playerID",
        award AS "awardID",
        year AS "yearID",
        league AS "lgID",
        CASE WHEN     tie THEN 'Y'
             WHEN NOT tie THEN 'N'
        END AS "tie",
        position AS "notes"
    FROM base.player_awards_by_position

    UNION ALL

    SELECT
        player AS "playerID",
        award AS "awardID",
        EXTRACT(YEAR FROM week_ending) AS "yearID",
        league AS "lgID",
        CASE WHEN     tie THEN 'Y'
             WHEN NOT tie THEN 'N'
        END AS "tie",
        to_char(week_ending, '"Week of "YYYY-MM-DD') as "notes"
    FROM base.player_awards_by_week
;

CREATE VIEW lahman."AwardsShareManagers" AS
    SELECT
        award AS "awardID",
        year AS "yearID",
        league AS "lgID",
        manager AS "playerID",
        points_won AS "pointsWon",
        points_max AS "pointsMax",
        votes_first AS "votesFirst"
    FROM base.shared_manager_awards
;

CREATE VIEW lahman."AwardsSharePlayers" AS
    SELECT
        award AS "awardID",
        year AS "yearID",
        league AS "lgID",
        player AS "playerID",
        points_won AS "pointsWon",
        points_max AS "pointsMax",
        votes_first AS "votesFirst"
    FROM base.shared_player_awards
;

CREATE VIEW lahman."Batting" AS
    SELECT
        b.player AS "playerID",
        b.year AS "yearID",
        b.stint AS "stint",
        f.team AS "teamID",
        f.league AS "lgID",
        b.games AS "G",
        b."G_batting",
        b.at_bats AS "AB",
        b.runs AS "R",
        b.hits AS "H",
        b.doubles AS "2B",
        b.triples AS "3B",
        b.home_runs AS "HR",
        b.runs_batted_in AS "RBI",
        b.stolen_bases AS "SB",
        b.caught_stealing AS "CS",
        b.walks AS "BB",
        b.strikeouts AS "SO",
        b.intentional_walks AS "IBB",
        b.hit_by_pitch AS "HBP",
        b.sac_hits AS "SH",
        b.sac_flies AS "SF",
        b.double_plays AS "GIDP",
        b."G_old"
    FROM base.franchises AS f
    JOIN base.batting AS b ON b.franchise = f.franchise
        AND b.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."BattingPost" AS
    SELECT
        pb.year AS "yearID",
        pb.round,
        pb.player AS "playerID",
        f.team AS "teamID",
        f.league AS "lgID",
        pb.games AS "G",
        pb.at_bats AS "AB",
        pb.runs AS "R",
        pb.hits AS "H",
        pb.doubles AS "2B",
        pb.triples AS "3B",
        pb.home_runs AS "HR",
        pb.runs_batted_in AS "RBI",
        pb.stolen_bases AS "SB",
        pb.caught_stealing AS "CS",
        pb.walks AS "BB",
        pb.strikeouts AS "SO",
        pb.intentional_walks AS "IBB",
        pb.hit_by_pitch AS "HBP",
        pb.sac_hits AS "SH",
        pb.sac_flies AS "SF",
        pb.double_plays AS "GIDP"
    FROM base.franchises AS f
    JOIN base.postseason_batting AS pb
        ON pb.franchise = f.franchise
            AND pb.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."CollegePlaying" AS
    SELECT
        player AS "playerID",
        school AS "schoolID",
        year AS "yearID"
    FROM base.college_playing
;

CREATE VIEW lahman."Fielding" AS
    SELECT
        f.player AS "playerID",
        f.year AS "yearID",
        f.stint AS "stint",
        fr.team AS "teamID",
        fr.league AS "lgID",
        f.position AS "POS",
        f.games AS "G",
        f.started AS "GS",
        f.outs_played AS "InnOuts",
        f.putouts AS "PO",
        f.assists AS "A",
        f.errors AS "E",
        f.double_plays AS "DP",
        c.passed_balls AS "PB",
        c.wild_pitches AS "WP",
        c.stolen_bases AS "SB",
        c.caught_stealing AS "CS",
        f.zone_rating AS "ZR"
    FROM base.fielding AS f
    LEFT JOIN base.catching AS c
        ON (c.player, c.year, c.stint, c.franchise, 'C')
         = (f.player, f.year, f.stint, f.franchise, f.position)
    JOIN base.franchises AS fr
        ON fr.franchise = f.franchise
            AND f.year BETWEEN fr.first_year AND fr.last_year
;

CREATE VIEW lahman."FieldingOF" AS
    SELECT
        player AS "playerID",
        year AS "yearID",
        stint AS "stint",
        left_field AS "Glf",
        center_field AS "Gcf",
        right_field AS "Grf"
    FROM base.fielding_outfield
;

CREATE VIEW lahman."FieldingOFsplit" AS
    SELECT
        fos.player AS "playerID",
        fos.year AS "yearID",
        fos.stint AS "stint",
        f.team AS "teamID",
        f.league AS "lgID",
        fos.position AS "POS",
        fos.games AS "G",
        fos.started AS "GS",
        fos.outs_played AS "InnOuts",
        fos.putouts AS "PO",
        fos.assists AS "A",
        fos.errors AS "E",
        fos.double_plays AS "DP",
        CAST(NULL AS text) AS "PB",
        CAST(NULL AS text) AS "WP",
        CAST(NULL AS text) AS "SB",
        CAST(NULL AS text) AS "CS",
        CAST(NULL AS text) AS "ZR"
    FROM base.fielding_outfield_split AS fos
    JOIN base.franchises AS f
        ON f.franchise = fos.franchise
            AND fos.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."FieldingPost" AS
    SELECT
        -- TODO
        f.player AS "playerID",
        CAST(f.year AS text) AS "yearID",
        fr.team AS "teamID",
        fr.league AS "lgID",
        f.round AS "round",
        f.position AS "POS",
        CAST(f.games AS text) AS "G",
        CAST(f.started AS text) AS "GS",
        CAST(f.outs_played AS text) AS "InnOuts",
        CAST(f.putouts AS text) AS "PO",
        CAST(f.assists AS text) AS "A",
        CAST(f.errors AS text) AS "E",
        CAST(f.double_plays AS text) AS "DP",
        CAST(f.triple_plays AS text) AS "TP",
        CAST(c.passed_balls AS text) AS "PB",
        CAST(c.stolen_bases AS text) AS "SB",
        CAST(c.caught_stealing AS text) AS "CS"
    FROM base.postseason_fielding AS f
    LEFT JOIN base.postseason_catching AS c
        ON (c.player, c.year, c.franchise, c.round, 'C')
         = (f.player, f.year, f.franchise, f.round, f.position)
    JOIN base.franchises AS fr
        ON fr.franchise = f.franchise
            AND f.year BETWEEN fr.first_year AND fr.last_year
;

CREATE VIEW lahman."HallOfFame" AS
    SELECT
        person AS "playerID",
        year AS "yearID",
        voting_body AS "votedBy",
        ballots,
        needed,
        votes,
        CASE WHEN     inducted THEN 'Y'
             WHEN NOT inducted THEN 'N'
        END AS inducted,
        category,
        notes AS "needed_note"
    FROM base.hall_of_fame
;

CREATE VIEW lahman."HomeGames" AS
    SELECT
        hg.year AS yearkey,
        f.league AS leaguekey,
        f.team AS teamkey,
        hg.park AS parkkey,
        hg.first_game AS "spanFirst",
        hg.last_game AS "spanLast",
        hg.games AS games,
        hg.openings AS openings,
        hg.attendance AS attendance
    FROM base.home_games AS hg
    JOIN base.franchises AS f
        ON f.franchise = hg.franchise
            AND hg.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."Managers" AS
    SELECT
        m.manager AS "playerID",
        m.year AS "yearID",
        f.team AS "teamID",
        f.league AS "lgID",
        m.season_order AS "inseason",
        m.games AS "G",
        m.wins AS "W",
        m.losses AS "L",
        m.rank AS "rank",
        CASE WHEN m.player_manager
             THEN 'Y'
             ELSE 'N'
        END AS plyrMgr
    FROM base.managers AS m
    JOIN base.franchises AS f
        ON f.franchise = m.franchise
            AND m.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."ManagersHalf" AS
    SELECT
        mh.manager AS "playerID",
        mh.year AS "yearID",
        f.team AS "teamID",
        f.league AS "lgID",
        mh.season_order AS "inseason",
        mh.half AS "half",
        mh.games AS "G",
        mh.wins AS "W",
        mh.losses AS "L",
        mh.rank AS "rank"
    FROM base.managers_half AS mh
    JOIN base.franchises AS f
        ON f.franchise = mh.franchise
            AND mh.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."Parks" AS
    SELECT
        p.id AS "ID",
        string_agg(pn.name, '; ' ORDER BY pn.sort_key) AS parkalias,
        p.park AS parkkey,
        p.name AS parkname,
        NULLIF(pc.city, '-') AS city,
        NULLIF(pc.state, '-') AS state,
        pc.country
    FROM base.parks AS p
    JOIN base.park_cities AS pc ON pc.park = p.park
    LEFT JOIN base.park_names AS pn ON pn.park = p.park
    GROUP BY p.park, pc.park
;

CREATE VIEW lahman."People" AS
    SELECT
        p.lahman_id AS "ID",
        p.person AS "playerID",
        bd.year AS "birthYear",
        bd.month AS "birthMonth",
        bd.day AS "birthDay",
        NULLIF(bc.city, '-') AS "birthCity",
        bc.country AS "birthCountry",
        NULLIF(bc.state, '-') AS "birthState",
        dd.year AS "deathYear",
        dd.month AS "deathMonth",
        dd.day AS "deathDay",
        dc.country AS "deathCountry",
        NULLIF(dc.state, '-') AS "deathState",
        NULLIF(dc.city, '-') AS "deathCity",
        p.first_name AS "nameFirst",
        p.last_name AS "nameLast",
        p.given_name AS "nameGiven",
        p.weight,
        p.height,
        pl.bats,
        pl.throws,
        pl.first_game,
        p.bbref_id AS "bbrefID",
        pl.last_game AS "finalGame",
        p.retro_id AS "retroID"
    FROM base.people AS p
    LEFT JOIN base.players AS pl ON pl.player = p.person
    LEFT JOIN base.birth_dates AS bd ON bd.person = p.person
    LEFT JOIN base.birth_cities AS bc ON bc.person = p.person
    LEFT JOIN base.death_dates AS dd ON dd.person = p.person
    LEFT JOIN base.death_cities AS dc ON dc.person = p.person
    WHERE p.lahman_id <> -1
;

CREATE VIEW lahman."Pitching" AS
    SELECT
        p.player AS "playerID",
        p.year AS "yearID",
        p.stint,
        f.team AS "teamID",
        f.league AS "lgID",
        p.wins AS "W",
        p.losses AS "L",
        p.games AS "G",
        p.started AS "GS",
        p.complete_games AS "CG",
        p.shutouts AS "SHO",
        p.saves AS "SV",
        p.outs_pitched AS "IPouts",
        p.hits AS "H",
        p.earned_runs AS "ER",
        p.home_runs AS "HR",
        p.walks AS "BB",
        p.strikeouts AS "SO",
        p.opp_batting_average AS "BAOpp",
        p.earned_run_average AS "ERA",
        p.intentional_walks AS "IBB",
        p.wild_pitches AS "WP",
        p.hit_batsmen AS "HBP",
        p.balks AS "BK",
        p.batters_faced AS "BFP",
        p.games_finished AS "GF",
        p.runs_allowed AS "R",
        p.sac_hits AS "SH",
        p.sac_flies AS "SF",
        p.double_plays AS "GIDP"
    FROM base.pitching AS p
    JOIN base.franchises AS f ON f.franchise = p.franchise
        AND p.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."PitchingPost" AS
    SELECT
        pp.player AS "playerID",
        pp.year AS "yearID",
        pp.round,
        f.team AS "teamID",
        f.league AS "lgID",
        pp.wins AS "W",
        pp.losses AS "L",
        pp.games AS "G",
        pp.started AS "GS",
        pp.complete_games AS "CG",
        pp.shutouts AS "SHO",
        pp.saves AS "SV",
        pp.outs_pitched AS "IPouts",
        pp.hits AS "H",
        pp.earned_runs AS "ER",
        pp.home_runs AS "HR",
        pp.walks AS "BB",
        pp.strikeouts AS "SO",
        pp.opp_batting_average AS "BAOpp",
        pp.earned_run_average AS "ERA",
        pp.intentional_walks AS "IBB",
        pp.wild_pitches AS "WP",
        pp.hit_batsmen AS "HBP",
        pp.balks AS "BK",
        pp.batters_faced AS "BFP",
        pp.games_finished AS "GF",
        pp.runs_allowed AS "R",
        pp.sac_hits AS "SH",
        pp.sac_flies AS "SF",
        pp.double_plays AS "GIDP"
    FROM base.postseason_pitching AS pp
    JOIN base.franchises AS f
        ON f.franchise = pp.franchise
            AND pp.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."Salaries" AS
    SELECT
        s.year AS "yearID",
        f.team AS "teamID",
        f.league AS "lgID",
        s.person AS "playerID",
        s.salary
    FROM base.salaries AS s
    JOIN base.franchises AS f
        ON f.franchise = s.franchise
            AND s.year BETWEEN f.first_year AND f.last_year
;

CREATE VIEW lahman."Schools" AS
    SELECT
        school AS "schoolID",
        name AS name_full,
        city,
        state,
        country
    FROM base.schools
;

CREATE VIEW lahman."SeriesPost" AS
    SELECT
        ps.year AS "yearID",
        ps.round,
        fw.team AS "teamIDwinner",
        fw.league AS "lgIDwinner",
        fl.team AS "teamIDloser",
        fl.league AS "lgIDloser",
        ps.wins AS "wins",
        ps.losses AS "losses",
        ps.ties AS "ties"
    FROM base.postseason_series AS ps
    JOIN base.franchises AS fw
        ON fw.franchise = ps.winning_franchise
            AND ps.year BETWEEN fw.first_year AND fw.last_year
    JOIN base.franchises AS fl
        ON fl.franchise = ps.losing_franchise
            AND ps.year BETWEEN fl.first_year AND fl.last_year
;

CREATE VIEW lahman."Teams" AS
    SELECT
        t.year AS "yearID",
        f.league AS "lgID",
        f.team AS "teamID",
        f.franchise AS "franchID",
        f.division AS "divID",
        t.ranking AS "Rank",
        t.games AS "G",
        t.home_games AS "Ghome",
        t.wins AS "W",
        t.losses AS "L",
        CASE WHEN     t.won_division THEN 'Y'
             WHEN NOT t.won_division THEN 'N'
        END AS "DivWin",
        CASE WHEN     t.won_wildcard THEN 'Y'
             WHEN NOT t.won_wildcard THEN 'N'
        END AS "WCWin",
        CASE WHEN     t.won_league THEN 'Y'
             WHEN NOT t.won_league THEN 'N'
        END AS "LgWin",
        CASE WHEN     t.won_world_series THEN 'Y'
             WHEN NOT t.won_world_series THEN 'N'
        END AS "WSWin",
        t.runs AS "R",
        t.at_bats AS "AB",
        t.hits AS "H",
        t.doubles AS "2B",
        t.triples AS "3B",
        t.home_runs AS "HR",
        t.walks AS "BB",
        t.strikeouts AS "SO",
        t.stolen_bases AS "SB",
        t.caught_stealing AS "CS",
        t.hit_by_pitch AS "HBP",
        t.sacrifice_flies AS "SF",
        t.runs_allowed AS "RA",
        t.earned_runs_allowed AS "ER",
        t.earned_run_average AS "ERA",
        t.complete_games AS "CG",
        t.team_shutouts AS "SHO",
        t.saves AS "SV",
        t.outs_pitched AS "IPouts",
        t.hits_allowed AS "HA",
        t.home_runs_allowed AS "HRA",
        t.walks_allowed AS "BBA",
        t.pitcher_strikeouts AS "SOA",
        t.errors AS "E",
        t.team_double_plays AS "DP",
        t.fielding_percentage AS "FP",
        f.team_name AS "name",
        pby.park AS "park",
        hg.attendance AS "attendance",
        t.batter_park_factor AS "BPF",
        t.pitcher_park_factor AS "PPF",
        t.bbref_id AS "teamIDBR",
        t.lahman45_id AS "teamIDlahman45",
        t.retrosheet_id AS "teamIDretro"
    FROM base.franchises AS f
    JOIN base.teams AS t ON t.franchise = f.franchise
        AND t.year BETWEEN f.first_year AND f.last_year
    LEFT JOIN LATERAL (
        SELECT year, franchise, NULLIF(SUM(hg.attendance), 0)
        FROM base.home_games AS hg
        WHERE (year, franchise) = (t.year, t.franchise)
        GROUP BY year, franchise
    ) AS hg (year, franchise, attendance) ON TRUE
    JOIN base.parks_by_year AS pby
        ON (pby.franchise, pby.year) = (t.franchise, t.year)
;

/* TODO: Simplify this with QUALIFY when available in PostgreSQL. */
CREATE VIEW lahman."TeamsFranchises" AS
    WITH
        latest (franchise, name, active, "NAassoc", row_num) AS (
            SELECT
                franchise,
                team_name,
                last_year = (SELECT year FROM base.version),
                '',
                ROW_NUMBER() OVER w
            FROM base.franchises
            WINDOW
                w AS (PARTITION BY franchise
                      ORDER BY last_year DESC)
        )
    SELECT
        franchise AS "franchID",
        name AS "franchName",
        CASE WHEN active THEN 'Y' ELSE 'N' END AS active,
        CAST(NULL AS CHARACTER VARYING) AS "NAassoc"
    FROM latest
    WHERE row_num = 1
;

CREATE VIEW lahman."TeamsHalf" AS
    SELECT
        th.year AS "yearID",
        f.league AS "lgID",
        f.team AS "teamID",
        th.half AS "Half",
        f.division AS "divID",
        CASE WHEN th.division_winner
             THEN 'Y'
             ELSE 'N'
        END AS "DivWin",
        th.rank AS "Rank",
        th.games AS "G",
        th.wins AS "W",
        th.losses AS "L"
    FROM base.franchises AS f
    JOIN base.teams_half AS th ON th.franchise = f.franchise
        AND th.year BETWEEN f.first_year AND f.last_year
;
