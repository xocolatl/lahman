DROP SCHEMA if exists base CASCADE;
CREATE SCHEMA base;

CREATE TABLE base.allstar_games (
    game CHARACTER VARYING,
    date DATE,
    host CHARACTER VARYING
);

CREATE TABLE base.allstar_players (
    game CHARACTER VARYING,
    player CHARACTER VARYING,
    franchise CHARACTER VARYING,
    played BOOLEAN,
    starting_position INTEGER
);

CREATE TABLE base.appearances (
    player CHARACTER VARYING,
    year INTEGER,
    franchise CHARACTER VARYING,
    games INTEGER,
    started INTEGER,
    batting INTEGER,
    defense INTEGER,
    pitcher INTEGER,
    catcher INTEGER,
    first_base INTEGER,
    second_base INTEGER,
    third_base INTEGER,
    shortstop INTEGER,
    left_field INTEGER,
    center_field INTEGER,
    right_field INTEGER,
    outfield INTEGER,
    designated_hitter INTEGER,
    pinch_hitter INTEGER,
    pinch_runner INTEGER
);

CREATE TABLE base.awards (
    award CHARACTER VARYING
);

CREATE TABLE base.shared_manager_awards (
    manager CHARACTER VARYING,
    award CHARACTER VARYING,
    year INTEGER,
    league CHARACTER VARYING,
    points_won INTEGER,
    points_max INTEGER,
    votes_first INTEGER
);

CREATE TABLE base.shared_player_awards (
    player CHARACTER VARYING,
    award CHARACTER VARYING,
    year INTEGER,
    league CHARACTER VARYING,
    points_won INTEGER,
    points_max INTEGER,
    votes_first INTEGER
);

CREATE TABLE base.batting (
    player CHARACTER VARYING,
    year INTEGER,
    stint INTEGER,
    franchise CHARACTER VARYING,
    games INTEGER,
    at_bats INTEGER,
    runs INTEGER,
    hits INTEGER,
    doubles INTEGER,
    triples INTEGER,
    home_runs INTEGER,
    runs_batted_in INTEGER,
    stolen_bases INTEGER,
    caught_stealing INTEGER,
    walks INTEGER,
    strikeouts INTEGER,
    intentional_walks INTEGER,
    hit_by_pitch INTEGER,
    sac_hits INTEGER,
    sac_flies INTEGER,
    double_plays INTEGER,
    /* I don't know what these are, but we need them to reproduce the
     * original data.
     */
    "G_batting" INTEGER,
    "G_old" INTEGER
);

CREATE TABLE base.birth_cities (
    person CHARACTER VARYING,
    country CHARACTER VARYING,
    state CHARACTER VARYING,
    city CHARACTER VARYING
);

CREATE TABLE base.birth_dates (
    person CHARACTER VARYING,
    year INTEGER,
    month INTEGER,
    day INTEGER
);

CREATE TABLE base.cancelled_allstar_games (
    game CHARACTER VARYING
);

CREATE TABLE base.catching (
    player CHARACTER VARYING,
    year INTEGER,
    stint INTEGER,
    franchise CHARACTER VARYING,
    passed_balls INTEGER,
    wild_pitches INTEGER,
    stolen_bases INTEGER,
    caught_stealing INTEGER
);

CREATE TABLE base.cities (
    country CHARACTER VARYING,
    state CHARACTER VARYING,
    city CHARACTER VARYING
);

CREATE TABLE base.college_playing (
    player CHARACTER VARYING,
    school CHARACTER VARYING,
    year INTEGER
);

CREATE TABLE base.countries (
    country CHARACTER VARYING
);

CREATE TABLE base.death_cities (
    person CHARACTER VARYING,
    country CHARACTER VARYING,
    state CHARACTER VARYING,
    city CHARACTER VARYING
);

CREATE TABLE base.death_dates (
    person CHARACTER VARYING,
    year INTEGER,
    month INTEGER,
    day INTEGER
);

CREATE TABLE base.divisions (
    division CHARACTER VARYING,
    name CHARACTER VARYING
);

CREATE TABLE base.fielding (
    player CHARACTER VARYING,
    year INTEGER,
    stint INTEGER,
    franchise CHARACTER VARYING,
    position CHARACTER VARYING,
    games INTEGER,
    started INTEGER,
    outs_played INTEGER,
    putouts INTEGER,
    assists INTEGER,
    errors INTEGER,
    double_plays INTEGER,
    zone_rating INTEGER
);

CREATE TABLE base.fielding_outfield (
    player CHARACTER VARYING,
    year INTEGER,
    stint INTEGER,
    left_field INTEGER,
    center_field INTEGER,
    right_field INTEGER
);

CREATE TABLE base.fielding_outfield_split (
    player CHARACTER VARYING,
    year INTEGER,
    stint INTEGER,
    franchise CHARACTER VARYING,
    position CHARACTER VARYING,
    games INTEGER,
    started INTEGER,
    outs_played INTEGER,
    putouts INTEGER,
    assists INTEGER,
    errors INTEGER,
    double_plays INTEGER
);

CREATE TABLE base.franchises (
    franchise CHARACTER VARYING,
    first_year INTEGER,
    last_year INTEGER,
    team CHARACTER VARYING,
    team_name CHARACTER VARYING,
    league CHARACTER VARYING,
    division CHARACTER VARYING
);

CREATE TABLE base.hall_of_fame (
    person CHARACTER VARYING,
    year INTEGER,
    voting_body CHARACTER VARYING,
    ballots INTEGER,
    needed INTEGER,
    votes INTEGER,
    inducted BOOLEAN,
    category CHARACTER VARYING,
    notes CHARACTER VARYING
);

CREATE TABLE base.hall_of_fame_categories (
    category CHARACTER VARYING
);

CREATE TABLE base.hall_of_fame_voters (
    voters CHARACTER VARYING
);

CREATE TABLE base.handedness (
    code CHARACTER VARYING,
    description CHARACTER VARYING
);

CREATE TABLE base.home_games (
    year INTEGER,
    franchise CHARACTER VARYING,
    park CHARACTER VARYING,
    first_game DATE,
    last_game DATE,
    games INTEGER,
    openings INTEGER,
    attendance INTEGER
);

CREATE TABLE base.leagues (
    league CHARACTER VARYING,
    name CHARACTER VARYING
);

CREATE TABLE base.manager_awards (
    manager CHARACTER VARYING,
    award CHARACTER VARYING,
    year INTEGER,
    league CHARACTER VARYING,
    tie BOOLEAN,
    notes CHARACTER VARYING
);

CREATE TABLE base.managers (
    manager CHARACTER VARYING,
    year INTEGER,
    franchise CHARACTER VARYING,
    season_order INTEGER,
    games INTEGER,
    wins INTEGER,
    losses INTEGER,
    rank INTEGER,
    player_manager BOOLEAN
);

CREATE TABLE base.managers_half (
    manager CHARACTER VARYING,
    year INTEGER,
    franchise CHARACTER VARYING,
    season_order INTEGER,
    half INTEGER,
    games INTEGER,
    wins INTEGER,
    losses INTEGER,
    rank INTEGER
);

CREATE TABLE base.park_names (
    park CHARACTER VARYING,
    name CHARACTER VARYING,
    sort_key INTEGER
);

CREATE TABLE base.parks (
    park CHARACTER VARYING,
    name CHARACTER VARYING,
    country CHARACTER VARYING,
    state CHARACTER VARYING,
    city CHARACTER VARYING,
    id INTEGER /* used only to reproduce the csv files */
);

CREATE TABLE base.people (
    person CHARACTER VARYING,
    first_name CHARACTER VARYING,
    last_name CHARACTER VARYING,
    given_name CHARACTER VARYING,
    weight INTEGER,
    height INTEGER,
    lahman_id INTEGER, /* used only to reproduce the csv files */
    bbref_id CHARACTER VARYING,
    retro_id CHARACTER VARYING
);

CREATE TABLE base.players (
    player CHARACTER VARYING,
    bats CHARACTER VARYING,
    throws CHARACTER VARYING,
    first_game DATE,
    last_game DATE
);

CREATE TABLE base.schools (
    school CHARACTER VARYING,
    name CHARACTER VARYING,
    country CHARACTER VARYING,
    state CHARACTER VARYING,
    city CHARACTER VARYING
);

CREATE TABLE base.player_awards (
    player CHARACTER VARYING,
    award CHARACTER VARYING,
    year INTEGER,
    league CHARACTER VARYING,
    tie BOOLEAN,
    notes CHARACTER VARYING
);

CREATE TABLE base.player_awards_by_month (
    player CHARACTER VARYING,
    award CHARACTER VARYING,
    league CHARACTER VARYING,
    tie BOOLEAN,
    first_month DATE,
    last_month DATE
);


CREATE TABLE base.player_awards_by_position (
    player CHARACTER VARYING,
    award CHARACTER VARYING,
    year INTEGER,
    league CHARACTER VARYING,
    tie BOOLEAN,
    position CHARACTER VARYING
);

CREATE TABLE base.player_awards_by_week (
    player CHARACTER VARYING,
    award CHARACTER VARYING,
    league CHARACTER VARYING,
    tie BOOLEAN,
    week_ending DATE
);

CREATE TABLE base.pitching (
    player CHARACTER VARYING,
    year INTEGER,
    stint INTEGER,
    franchise CHARACTER VARYING,
    wins INTEGER,
    losses INTEGER,
    games INTEGER,
    started INTEGER,
    complete_games INTEGER,
    shutouts INTEGER,
    saves INTEGER,
    outs_pitched INTEGER,
    hits INTEGER,
    earned_runs INTEGER,
    home_runs INTEGER,
    walks INTEGER,
    strikeouts INTEGER,
    opp_batting_average NUMERIC,
    earned_run_average NUMERIC,
    intentional_walks INTEGER,
    wild_pitches INTEGER,
    hit_batsmen INTEGER,
    balks INTEGER,
    batters_faced INTEGER,
    games_finished INTEGER,
    runs_allowed INTEGER,
    sac_hits INTEGER,
    sac_flies INTEGER,
    double_plays INTEGER
);

CREATE TABLE base.positions (
    number INTEGER,
    code CHARACTER VARYING,
    position CHARACTER VARYING
);

CREATE TABLE base.postseason_batting (
    year INTEGER,
    round CHARACTER VARYING,
    franchise CHARACTER VARYING,
    player CHARACTER VARYING,
    games INTEGER,
    at_bats INTEGER,
    runs INTEGER,
    hits INTEGER,
    doubles INTEGER,
    triples INTEGER,
    home_runs INTEGER,
    runs_batted_in INTEGER,
    stolen_bases INTEGER,
    caught_stealing INTEGER,
    walks INTEGER,
    strikeouts INTEGER,
    intentional_walks INTEGER,
    hit_by_pitch INTEGER,
    sac_hits INTEGER,
    sac_flies INTEGER,
    double_plays INTEGER
);

CREATE TABLE base.postseason_catching (
    player CHARACTER VARYING,
    year INTEGER,
    franchise CHARACTER VARYING,
    round CHARACTER VARYING,
    passed_balls INTEGER,
    stolen_bases INTEGER,
    caught_stealing INTEGER
);

CREATE TABLE base.postseason_fielding (
    player CHARACTER VARYING,
    year INTEGER,
    franchise CHARACTER VARYING,
    round CHARACTER VARYING,
    position CHARACTER VARYING,
    games INTEGER,
    started INTEGER,
    outs_played INTEGER,
    putouts INTEGER,
    assists INTEGER,
    errors INTEGER,
    double_plays INTEGER,
    triple_plays INTEGER
);

CREATE TABLE base.postseason_pitching (
    player CHARACTER VARYING,
    year INTEGER,
    round CHARACTER VARYING,
    franchise CHARACTER VARYING,
    wins INTEGER,
    losses INTEGER,
    games INTEGER,
    started INTEGER,
    complete_games INTEGER,
    shutouts INTEGER,
    saves INTEGER,
    outs_pitched INTEGER,
    hits INTEGER,
    earned_runs INTEGER,
    home_runs INTEGER,
    walks INTEGER,
    strikeouts INTEGER,
    opp_batting_average NUMERIC,
    earned_run_average NUMERIC,
    intentional_walks INTEGER,
    wild_pitches INTEGER,
    hit_batsmen INTEGER,
    balks INTEGER,
    batters_faced INTEGER,
    games_finished INTEGER,
    runs_allowed INTEGER,
    sac_hits INTEGER,
    sac_flies INTEGER,
    double_plays INTEGER
);

CREATE TABLE base.postseason_rounds (
    round CHARACTER VARYING,
    description CHARACTER VARYING
);

CREATE TABLE base.postseason_series (
    year INTEGER,
    round CHARACTER VARYING,
    winning_franchise CHARACTER VARYING,
    losing_franchise CHARACTER VARYING,
    wins INTEGER,
    losses INTEGER,
    ties INTEGER
);

CREATE TABLE base.salaries (
    person CHARACTER VARYING,
    year INTEGER,
    franchise CHARACTER VARYING,
    salary NUMERIC
);

CREATE TABLE base.states (
    country CHARACTER VARYING,
    state CHARACTER VARYING
);

CREATE TABLE base.team_franchises (
    franchise CHARACTER VARYING,
    name CHARACTER VARYING,
    active BOOLEAN,
    "NAassoc" CHARACTER VARYING
);

CREATE TABLE base.teams (
    franchise CHARACTER VARYING,
    year INTEGER,
    park CHARACTER VARYING,
    ranking INTEGER,
    games INTEGER,
    home_games INTEGER,
    wins INTEGER,
    losses INTEGER,
    won_division BOOLEAN,
    won_wildcard BOOLEAN,
    won_league BOOLEAN,
    won_world_series BOOLEAN,
    runs INTEGER,
    at_bats INTEGER,
    hits INTEGER,
    doubles INTEGER,
    triples INTEGER,
    home_runs INTEGER,
    walks INTEGER,
    strikeouts INTEGER,
    stolen_bases INTEGER,
    caught_stealing INTEGER,
    hit_by_pitch INTEGER,
    sacrifice_flies INTEGER,
    runs_allowed INTEGER,
    earned_runs_allowed INTEGER,
    earned_run_average NUMERIC,
    complete_games INTEGER,
    team_shutouts INTEGER,
    saves INTEGER,
    outs_pitched INTEGER,
    hits_allowed INTEGER,
    home_runs_allowed INTEGER,
    walks_allowed INTEGER,
    pitcher_strikeouts INTEGER,
    errors INTEGER,
    team_double_plays INTEGER,
    fielding_percentage numeric,
    home_attendance INTEGER,
    batter_park_factor INTEGER,
    pitcher_park_factor INTEGER,
    lahman45_id CHARACTER VARYING,
    bbref_id CHARACTER VARYING,
    retrosheet_id CHARACTER VARYING
);

CREATE TABLE base.teams_half (
    franchise CHARACTER VARYING,
    year INTEGER,
    half INTEGER,
    division_winner BOOLEAN,
    rank INTEGER,
    games INTEGER,
    wins INTEGER,
    losses INTEGER
);

CREATE TABLE base.umpire_crew_members (
    year INTEGER,
    crew CHARACTER VARYING,
    umpire CHARACTER VARYING
);

CREATE TABLE base.umpire_crews (
    year INTEGER,
    crew CHARACTER VARYING,
    chief CHARACTER VARYING
);

CREATE TABLE base.umpires (
    umpire CHARACTER VARYING,
    jersey INTEGER,
    first_game DATE,
    last_game DATE
);

