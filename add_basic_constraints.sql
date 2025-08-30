ALTER TABLE base.allstar_games ADD PRIMARY KEY (game);
ALTER TABLE base.allstar_games ALTER COLUMN date SET NOT NULL;
ALTER TABLE base.allstar_games ALTER COLUMN host SET NOT NULL;

ALTER TABLE base.allstar_players ADD PRIMARY KEY (game, player);
ALTER TABLE base.allstar_players ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.allstar_players ALTER COLUMN played SET NOT NULL;
-- ALTER TABLE base.allstar_players ALTER COLUMN starting_position SET NOT NULL;

ALTER TABLE base.appearances ADD PRIMARY KEY (player, year, franchise);
ALTER TABLE base.appearances ALTER COLUMN games SET NOT NULL;
-- ALTER TABLE base.appearances ALTER COLUMN started SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN batting SET NOT NULL;
-- ALTER TABLE base.appearances ALTER COLUMN defense SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN pitcher SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN catcher SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN first_base SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN second_base SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN third_base SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN shortstop SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN left_field SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN center_field SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN right_field SET NOT NULL;
ALTER TABLE base.appearances ALTER COLUMN outfield SET NOT NULL;
-- ALTER TABLE base.appearances ALTER COLUMN designated_hitter SET NOT NULL;
-- ALTER TABLE base.appearances ALTER COLUMN pinch_hitter SET NOT NULL;
-- ALTER TABLE base.appearances ALTER COLUMN pinch_runner SET NOT NULL;

ALTER TABLE base.awards ADD PRIMARY KEY (award);

ALTER TABLE base.batting ADD PRIMARY KEY (player, year, stint);
ALTER TABLE base.batting ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN at_bats SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN runs SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN hits SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN doubles SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN triples SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN home_runs SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN runs_batted_in SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN stolen_bases SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN caught_stealing SET NOT NULL;
ALTER TABLE base.batting ALTER COLUMN walks SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN strikeouts SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN intentional_walks SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN hit_by_pitch SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN sac_hits SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN sac_flies SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN double_plays SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN "G_batting" SET NOT NULL;
-- ALTER TABLE base.batting ALTER COLUMN "G_old" SET NOT NULL;

ALTER TABLE base.birth_cities ADD PRIMARY KEY (person);
ALTER TABLE base.birth_cities ALTER COLUMN country SET NOT NULL;
ALTER TABLE base.birth_cities ALTER COLUMN state SET NOT NULL;
ALTER TABLE base.birth_cities ALTER COLUMN city SET NOT NULL;

ALTER TABLE base.birth_dates ADD PRIMARY KEY (person);
ALTER TABLE base.birth_dates ADD CHECK
    (CAST(CAST(year AS CHARACTER VARYING) || '-' || CAST(month AS CHARACTER VARYING) || '-' || CAST(day AS CHARACTER VARYING) AS DATE) <= DATE '9999-12-31');
ALTER TABLE base.birth_dates ALTER COLUMN year SET NOT NULL;
-- ALTER TABLE base.birth_dates ALTER COLUMN month SET NOT NULL;
-- ALTER TABLE base.birth_dates ALTER COLUMN day SET NOT NULL;

ALTER TABLE base.cancelled_allstar_games ADD PRIMARY KEY (game);

ALTER TABLE base.catching ADD PRIMARY KEY (player, year, stint, franchise);
ALTER TABLE base.catching ALTER COLUMN passed_balls SET NOT NULL;
-- ALTER TABLE base.catching ALTER COLUMN wild_pitches SET NOT NULL;
-- ALTER TABLE base.catching ALTER COLUMN stolen_bases SET NOT NULL;
-- ALTER TABLE base.catching ALTER COLUMN caught_stealing SET NOT NULL;

ALTER TABLE base.cities ADD PRIMARY KEY (country, state, city);

ALTER TABLE base.college_playing ADD PRIMARY KEY (player, school, year);

ALTER TABLE base.countries ADD PRIMARY KEY (country);

ALTER TABLE base.death_cities ADD PRIMARY KEY (person);
ALTER TABLE base.death_cities ALTER COLUMN country SET NOT NULL;
ALTER TABLE base.death_cities ALTER COLUMN state SET NOT NULL;
ALTER TABLE base.death_cities ALTER COLUMN city SET NOT NULL;

ALTER TABLE base.death_dates ADD PRIMARY KEY (person);
ALTER TABLE base.death_dates ADD CHECK
    (CAST(CAST(year AS CHARACTER VARYING) || '-' || CAST(month AS CHARACTER VARYING) || '-' || CAST(day AS CHARACTER VARYING) AS DATE) <= DATE '9999-12-31');
ALTER TABLE base.death_dates ALTER COLUMN year SET NOT NULL;
-- ALTER TABLE base.death_dates ALTER COLUMN month SET NOT NULL;
-- ALTER TABLE base.death_dates ALTER COLUMN day SET NOT NULL;

ALTER TABLE base.divisions ADD PRIMARY KEY (division);
ALTER TABLE base.divisions ALTER COLUMN name SET NOT NULL;

ALTER TABLE base.fielding ADD PRIMARY KEY (player, year, stint, position);
ALTER TABLE base.fielding ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.fielding ALTER COLUMN games SET NOT NULL;
-- ALTER TABLE base.fielding ALTER COLUMN started SET NOT NULL;
-- ALTER TABLE base.fielding ALTER COLUMN outs_played SET NOT NULL;
ALTER TABLE base.fielding ALTER COLUMN putouts SET NOT NULL;
ALTER TABLE base.fielding ALTER COLUMN assists SET NOT NULL;
-- ALTER TABLE base.fielding ALTER COLUMN errors SET NOT NULL;
ALTER TABLE base.fielding ALTER COLUMN double_plays SET NOT NULL;
-- ALTER TABLE base.fielding ALTER COLUMN zone_rating SET NOT NULL;

ALTER TABLE base.fielding_outfield ADD PRIMARY KEY (player, year, stint);
-- ALTER TABLE base.fielding_outfield ALTER COLUMN left_field SET NOT NULL;
-- ALTER TABLE base.fielding_outfield ALTER COLUMN center_field SET NOT NULL;
-- ALTER TABLE base.fielding_outfield ALTER COLUMN right_field SET NOT NULL;

ALTER TABLE base.fielding_outfield_split ADD PRIMARY KEY (player, year, stint, position);
ALTER TABLE base.fielding_outfield_split ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN started SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN outs_played SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN putouts SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN assists SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN errors SET NOT NULL;
ALTER TABLE base.fielding_outfield_split ALTER COLUMN double_plays SET NOT NULL;

ALTER TABLE base.franchises ADD PRIMARY KEY (franchise, first_year);
ALTER TABLE base.franchises ADD CHECK (first_year <= last_year);
ALTER TABLE base.franchises ALTER COLUMN last_year SET NOT NULL;
ALTER TABLE base.franchises ALTER COLUMN team SET NOT NULL;
ALTER TABLE base.franchises ALTER COLUMN team_name SET NOT NULL;
ALTER TABLE base.franchises ALTER COLUMN league SET NOT NULL;
-- ALTER TABLE base.franchises ALTER COLUMN division SET NOT NULL;

ALTER TABLE base.hall_of_fame ADD PRIMARY KEY (person, year, voting_body);
-- ALTER TABLE base.hall_of_fame ALTER COLUMN ballots SET NOT NULL;
-- ALTER TABLE base.hall_of_fame ALTER COLUMN needed SET NOT NULL;
-- ALTER TABLE base.hall_of_fame ALTER COLUMN votes SET NOT NULL;
-- ALTER TABLE base.hall_of_fame ALTER COLUMN inducted SET NOT NULL;
ALTER TABLE base.hall_of_fame ALTER COLUMN category SET NOT NULL;
-- ALTER TABLE base.hall_of_fame ALTER COLUMN notes SET NOT NULL;

ALTER TABLE base.hall_of_fame_categories ADD PRIMARY KEY (category);

ALTER TABLE base.hall_of_fame_voters ADD PRIMARY KEY (voters);

ALTER TABLE base.handedness ADD PRIMARY KEY (code);
ALTER TABLE base.handedness ALTER COLUMN description SET NOT NULL;

ALTER TABLE base.home_games ADD PRIMARY KEY (year, franchise, park);
ALTER TABLE base.home_games ALTER COLUMN first_game SET NOT NULL;
ALTER TABLE base.home_games ALTER COLUMN last_game SET NOT NULL;
ALTER TABLE base.home_games ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.home_games ALTER COLUMN openings SET NOT NULL;
ALTER TABLE base.home_games ALTER COLUMN attendance SET NOT NULL;

ALTER TABLE base.leagues ADD PRIMARY KEY (league);
ALTER TABLE base.leagues ALTER COLUMN name SET NOT NULL;

ALTER TABLE base.manager_awards ADD PRIMARY KEY (manager, award, year, league);
-- ALTER TABLE base.manager_awards ALTER COLUMN tie SET NOT NULL;
-- ALTER TABLE base.manager_awards ALTER COLUMN notes SET NOT NULL;

ALTER TABLE base.managers ADD PRIMARY KEY (year, franchise, season_order);
ALTER TABLE base.managers ALTER COLUMN manager SET NOT NULL;
ALTER TABLE base.managers ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.managers ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.managers ALTER COLUMN losses SET NOT NULL;
ALTER TABLE base.managers ALTER COLUMN rank SET NOT NULL;
ALTER TABLE base.managers ALTER COLUMN player_manager SET NOT NULL;

ALTER TABLE base.managers_half ADD PRIMARY KEY (manager, year, franchise, half);
ALTER TABLE base.managers_half ALTER COLUMN season_order SET NOT NULL;
ALTER TABLE base.managers_half ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.managers_half ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.managers_half ALTER COLUMN losses SET NOT NULL;
ALTER TABLE base.managers_half ALTER COLUMN rank SET NOT NULL;

ALTER TABLE base.park_coordinates ADD PRIMARY KEY (park);
ALTER TABLE base.park_coordinates ALTER COLUMN latitude SET NOT NULL;
ALTER TABLE base.park_coordinates ALTER COLUMN longitude SET NOT NULL;

ALTER TABLE base.park_names ADD PRIMARY KEY (park, sort_key);
ALTER TABLE base.park_names ALTER COLUMN name SET NOT NULL;

ALTER TABLE base.parks ADD PRIMARY KEY (park);
ALTER TABLE base.parks ALTER COLUMN name SET NOT NULL;
ALTER TABLE base.parks ALTER COLUMN country SET NOT NULL;
-- ALTER TABLE base.parks ALTER COLUMN state SET NOT NULL;
ALTER TABLE base.parks ALTER COLUMN city SET NOT NULL;
ALTER TABLE base.parks ALTER COLUMN id SET NOT NULL;

ALTER TABLE base.people ADD PRIMARY KEY (person);
ALTER TABLE base.people ADD UNIQUE (bbref_id);
ALTER TABLE base.people ADD UNIQUE (retro_id);
-- ALTER TABLE base.people ALTER COLUMN first_name SET NOT NULL;
ALTER TABLE base.people ALTER COLUMN last_name SET NOT NULL;
--ALTER TABLE base.people ALTER COLUMN given_name SET NOT NULL;
ALTER TABLE base.people ALTER COLUMN lahman_id SET NOT NULL;
-- ALTER TABLE base.people ALTER COLUMN bbref_id SET NOT NULL;
-- ALTER TABLE base.people ALTER COLUMN retro_id SET NOT NULL;

ALTER TABLE base.pitching ADD PRIMARY KEY (player, year, stint);
ALTER TABLE base.pitching ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN losses SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN started SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN complete_games SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN shutouts SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN saves SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN outs_pitched SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN hits SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN earned_runs SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN home_runs SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN walks SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN strikeouts SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN opp_batting_average SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN earned_run_average SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN intentional_walks SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN wild_pitches SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN hit_batsmen SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN balks SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN batters_faced SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN games_finished SET NOT NULL;
ALTER TABLE base.pitching ALTER COLUMN runs_allowed SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN sac_hits SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN sac_flies SET NOT NULL;
-- ALTER TABLE base.pitching ALTER COLUMN double_plays SET NOT NULL;

/*
ALTER TABLE base.player_awards ADD PRIMARY KEY (player, award, year, league);

ERROR:  could not create unique index "player_awards_pkey"
DETAIL:  Key (player, award, year, league)=(claseem01, Reliever of the Month, 2022, AL) is duplicated.
*/
ALTER TABLE base.player_awards ALTER COLUMN player SET NOT NULL;
ALTER TABLE base.player_awards ALTER COLUMN award SET NOT NULL;
ALTER TABLE base.player_awards ALTER COLUMN year SET NOT NULL;
ALTER TABLE base.player_awards ALTER COLUMN league SET NOT NULL;
-- ALTER TABLE base.player_awards ALTER COLUMN tie SET NOT NULL;
-- ALTER TABLE base.player_awards ALTER COLUMN notes SET NOT NULL;

ALTER TABLE base.player_awards_by_month ADD PRIMARY KEY (player, award, league, first_month);
-- ALTER TABLE base.player_awards_by_month ALTER COLUMN tie SET NOT NULL;
-- ALTER TABLE base.player_awards_by_month ALTER COLUMN last_month SET NOT NULL;

ALTER TABLE base.player_awards_by_position ADD PRIMARY KEY (player, award, year, league, position);
-- ALTER TABLE base.player_awards_by_position ALTER COLUMN tie SET NOT NULL;

ALTER TABLE base.player_awards_by_week ADD PRIMARY KEY (player, award, league, week_ending);
-- ALTER TABLE base.player_awards_by_week ALTER COLUMN tie SET NOT NULL;

ALTER TABLE base.players ADD PRIMARY KEY (player);
-- ALTER TABLE base.players ALTER COLUMN weight SET NOT NULL;
-- ALTER TABLE base.players ALTER COLUMN height SET NOT NULL;
-- ALTER TABLE base.players ALTER COLUMN bats SET NOT NULL;
-- ALTER TABLE base.players ALTER COLUMN throws SET NOT NULL;
-- ALTER TABLE base.players ALTER COLUMN first_game SET NOT NULL;
-- ALTER TABLE base.players ALTER COLUMN last_game SET NOT NULL;

ALTER TABLE base.positions ADD PRIMARY KEY (number);
ALTER TABLE base.positions ADD UNIQUE (code);
ALTER TABLE base.positions ALTER COLUMN code SET NOT NULL;
ALTER TABLE base.positions ALTER COLUMN "position" SET NOT NULL;

ALTER TABLE base.postseason_batting ADD PRIMARY KEY (year, round, player);
ALTER TABLE base.postseason_batting ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN at_bats SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN runs SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN hits SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN doubles SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN triples SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN home_runs SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN runs_batted_in SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN stolen_bases SET NOT NULL;
-- ALTER TABLE base.postseason_batting ALTER COLUMN caught_stealing SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN walks SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN strikeouts SET NOT NULL;
ALTER TABLE base.postseason_batting ALTER COLUMN intentional_walks SET NOT NULL;
-- ALTER TABLE base.postseason_batting ALTER COLUMN hit_by_pitch SET NOT NULL;
-- ALTER TABLE base.postseason_batting ALTER COLUMN sac_hits SET NOT NULL;
-- ALTER TABLE base.postseason_batting ALTER COLUMN sac_flies SET NOT NULL;
-- ALTER TABLE base.postseason_batting ALTER COLUMN double_plays SET NOT NULL;

ALTER TABLE base.postseason_catching ADD PRIMARY KEY (player, year, franchise, round);
ALTER TABLE base.postseason_catching ALTER COLUMN passed_balls SET NOT NULL;
-- ALTER TABLE base.postseason_catching ALTER COLUMN stolen_bases SET NOT NULL;
-- ALTER TABLE base.postseason_catching ALTER COLUMN caught_stealing SET NOT NULL;

ALTER TABLE base.postseason_fielding ADD PRIMARY KEY (player, year, franchise, round, position);
ALTER TABLE base.postseason_fielding ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.postseason_fielding ALTER COLUMN started SET NOT NULL;
ALTER TABLE base.postseason_fielding ALTER COLUMN outs_played SET NOT NULL;
ALTER TABLE base.postseason_fielding ALTER COLUMN putouts SET NOT NULL;
ALTER TABLE base.postseason_fielding ALTER COLUMN assists SET NOT NULL;
ALTER TABLE base.postseason_fielding ALTER COLUMN errors SET NOT NULL;
ALTER TABLE base.postseason_fielding ALTER COLUMN double_plays SET NOT NULL;
-- ALTER TABLE base.postseason_fielding ALTER COLUMN triple_plays SET NOT NULL;

ALTER TABLE base.postseason_pitching ADD PRIMARY KEY (player, year, round);
ALTER TABLE base.postseason_pitching ALTER COLUMN franchise SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN losses SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN started SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN complete_games SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN shutouts SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN saves SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN outs_pitched SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN hits SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN earned_runs SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN home_runs SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN walks SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN strikeouts SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN opp_batting_average SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN earned_run_average SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN intentional_walks SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN wild_pitches SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN hit_batsmen SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN balks SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN batters_faced SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN games_finished SET NOT NULL;
ALTER TABLE base.postseason_pitching ALTER COLUMN runs_allowed SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN sac_hits SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN sac_flies SET NOT NULL;
-- ALTER TABLE base.postseason_pitching ALTER COLUMN double_plays SET NOT NULL;

ALTER TABLE base.postseason_rounds ADD PRIMARY KEY (round);
ALTER TABLE base.postseason_rounds ALTER COLUMN description SET NOT NULL;

ALTER TABLE base.postseason_series ADD PRIMARY KEY (year, round);
ALTER TABLE base.postseason_series ALTER COLUMN winning_franchise SET NOT NULL;
ALTER TABLE base.postseason_series ALTER COLUMN losing_franchise SET NOT NULL;
ALTER TABLE base.postseason_series ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.postseason_series ALTER COLUMN losses SET NOT NULL;
ALTER TABLE base.postseason_series ALTER COLUMN ties SET NOT NULL;

ALTER TABLE base.salaries ADD PRIMARY KEY (person, year, franchise);
ALTER TABLE base.salaries ALTER COLUMN salary SET NOT NULL;

ALTER TABLE base.schools ADD PRIMARY KEY (school);
ALTER TABLE base.schools ALTER COLUMN name SET NOT NULL;
ALTER TABLE base.schools ALTER COLUMN country SET NOT NULL;
ALTER TABLE base.schools ALTER COLUMN state SET NOT NULL;
ALTER TABLE base.schools ALTER COLUMN city SET NOT NULL;

ALTER TABLE base.shared_manager_awards ADD PRIMARY KEY (manager, award, year, league);
ALTER TABLE base.shared_manager_awards ALTER COLUMN points_won SET NOT NULL;
ALTER TABLE base.shared_manager_awards ALTER COLUMN points_max SET NOT NULL;
ALTER TABLE base.shared_manager_awards ALTER COLUMN votes_first SET NOT NULL;

ALTER TABLE base.shared_player_awards ADD PRIMARY KEY (player, award, year, league);
ALTER TABLE base.shared_player_awards ALTER COLUMN points_won SET NOT NULL;
ALTER TABLE base.shared_player_awards ALTER COLUMN points_max SET NOT NULL;
-- ALTER TABLE base.shared_player_awards ALTER COLUMN votes_first SET NOT NULL;

ALTER TABLE base.states ADD PRIMARY KEY (country, state);

ALTER TABLE base.teams ADD PRIMARY KEY (franchise, year);
-- ALTER TABLE base.teams ALTER COLUMN park SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN ranking SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN games SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN home_games SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN losses SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN won_division SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN won_wildcard SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN won_league SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN won_world_series SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN runs SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN at_bats SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN hits SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN doubles SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN triples SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN home_runs SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN walks SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN strikeouts SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN stolen_bases SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN caught_stealing SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN hit_by_pitch SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN sacrifice_flies SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN runs_allowed SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN earned_runs_allowed SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN earned_run_average SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN complete_games SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN team_shutouts SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN saves SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN outs_pitched SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN hits_allowed SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN home_runs_allowed SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN walks_allowed SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN pitcher_strikeouts SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN errors SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN team_double_plays SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN fielding_percentage SET NOT NULL;
-- ALTER TABLE base.teams ALTER COLUMN home_attendance SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN batter_park_factor SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN pitcher_park_factor SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN lahman45_id SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN bbref_id SET NOT NULL;
ALTER TABLE base.teams ALTER COLUMN retrosheet_id SET NOT NULL;

ALTER TABLE base.teams_half ADD PRIMARY KEY (franchise, year, half);
ALTER TABLE base.teams_half ALTER COLUMN division_winner SET NOT NULL;
ALTER TABLE base.teams_half ALTER COLUMN rank SET NOT NULL;
ALTER TABLE base.teams_half ALTER COLUMN games SET NOT NULL;
ALTER TABLE base.teams_half ALTER COLUMN wins SET NOT NULL;
ALTER TABLE base.teams_half ALTER COLUMN losses SET NOT NULL;

ALTER TABLE base.umpire_crew_members ADD PRIMARY KEY (year, crew, umpire);

ALTER TABLE base.umpire_crews ADD PRIMARY KEY (year, crew);
ALTER TABLE base.umpire_crews ALTER COLUMN chief SET NOT NULL;

ALTER TABLE base.umpires ADD PRIMARY KEY (umpire);
ALTER TABLE base.umpires ALTER COLUMN jersey SET NOT NULL;
ALTER TABLE base.umpires ALTER COLUMN first_game SET NOT NULL;
--ALTER TABLE base.umpires ALTER COLUMN last_game SET NOT NULL;

ALTER TABLE base.version ADD PRIMARY KEY (year, edition);
