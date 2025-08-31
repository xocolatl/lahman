/*
ALTER TABLE base.allstar_games
    ADD FOREIGN KEY (host)
        REFERENCES base.franchises
        ON UPDATE CASCADE
;
*/

ALTER TABLE base.allstar_players
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.allstar_players
    ADD FOREIGN KEY (starting_position)
        REFERENCES base.positions (number)
        ON UPDATE CASCADE
;

ALTER TABLE base.batting
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.birth_cities
    ADD FOREIGN KEY (person)
        REFERENCES base.people
        ON UPDATE CASCADE
;
ALTER TABLE base.birth_cities
    ADD FOREIGN KEY (country, state, city)
        REFERENCES base.cities
        ON UPDATE CASCADE
;

ALTER TABLE base.birth_dates
    ADD FOREIGN KEY (person)
        REFERENCES base.people
        ON UPDATE CASCADE
;

ALTER TABLE base.catching
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.cities
    ADD FOREIGN KEY (country, state)
        REFERENCES base.states
        ON UPDATE CASCADE
;

ALTER TABLE base.college_playing
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.college_playing
    ADD FOREIGN KEY (school)
        REFERENCES base.schools
        ON UPDATE CASCADE
;

ALTER TABLE base.death_cities
    ADD FOREIGN KEY (person)
        REFERENCES base.people
        ON UPDATE CASCADE
;
ALTER TABLE base.death_cities
    ADD FOREIGN KEY (country, state, city)
        REFERENCES base.cities
        ON UPDATE CASCADE
;

ALTER TABLE base.death_dates
    ADD FOREIGN KEY (person)
        REFERENCES base.people
        ON UPDATE CASCADE
;

ALTER TABLE base.fielding
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.fielding
    ADD FOREIGN KEY (position)
        REFERENCES base.positions (code)
        ON UPDATE CASCADE
;

ALTER TABLE base.fielding_outfield
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.fielding_outfield_split
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.fielding_outfield_split
    ADD FOREIGN KEY (position)
        REFERENCES base.positions (code)
        ON UPDATE CASCADE
;

ALTER TABLE base.franchises
    ADD FOREIGN KEY (division)
        REFERENCES base.divisions
        ON UPDATE CASCADE
;

ALTER TABLE base.hall_of_fame
    ADD FOREIGN KEY (voting_body)
        REFERENCES base.hall_of_fame_voters
        ON UPDATE CASCADE
;
ALTER TABLE base.hall_of_fame
    ADD FOREIGN KEY (category)
        REFERENCES base.hall_of_fame_categories
        ON UPDATE CASCADE
;

ALTER TABLE base.home_games
    ADD FOREIGN KEY (park)
        REFERENCES base.parks
        ON UPDATE CASCADE
;

ALTER TABLE base.manager_awards
    ADD FOREIGN KEY (award)
        REFERENCES base.awards
        ON UPDATE CASCADE
;
ALTER TABLE base.manager_awards
    ADD FOREIGN KEY (manager)
        REFERENCES base.people
        ON UPDATE CASCADE
;
ALTER TABLE base.manager_awards
    ADD FOREIGN KEY (league)
        REFERENCES base.leagues
        ON UPDATE CASCADE
;

ALTER TABLE base.managers
    ADD FOREIGN KEY (manager)
        REFERENCES base.people
        ON UPDATE CASCADE
;

ALTER TABLE base.managers_half
    ADD FOREIGN KEY (manager)
        REFERENCES base.people
        ON UPDATE CASCADE
;

ALTER TABLE base.park_cities
    ADD FOREIGN KEY (country, state, city)
        REFERENCES base.cities
        ON UPDATE CASCADE
;

ALTER TABLE base.park_names
    ADD FOREIGN KEY (park)
        REFERENCES base.parks
        ON UPDATE CASCADE
;

ALTER TABLE base.pitching
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.players
    ADD FOREIGN KEY (player)
        REFERENCES base.people
        ON UPDATE CASCADE
;
ALTER TABLE base.players
    ADD FOREIGN KEY (bats)
        REFERENCES base.handedness
        ON UPDATE CASCADE
;
ALTER TABLE base.players
    ADD FOREIGN KEY (throws)
        REFERENCES base.handedness
        ON UPDATE CASCADE
;

ALTER TABLE base.player_awards
    ADD FOREIGN KEY (award)
        REFERENCES base.awards
        ON UPDATE CASCADE
;
ALTER TABLE base.player_awards
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.player_awards
    ADD FOREIGN KEY (league)
        REFERENCES base.leagues
        ON UPDATE CASCADE
;

ALTER TABLE base.player_awards_by_position
    ADD FOREIGN KEY (award)
        REFERENCES base.awards
        ON UPDATE CASCADE
;
ALTER TABLE base.player_awards_by_position
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.player_awards_by_position
    ADD FOREIGN KEY (league)
        REFERENCES base.leagues
        ON UPDATE CASCADE
;
ALTER TABLE base.player_awards_by_position
    ADD FOREIGN KEY (position)
        REFERENCES base.positions (code)
        ON UPDATE CASCADE
;

ALTER TABLE base.postseason_batting
    ADD FOREIGN KEY (round)
        REFERENCES base.postseason_rounds
        ON UPDATE CASCADE
;
ALTER TABLE base.postseason_batting
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.postseason_catching
    ADD FOREIGN KEY (round)
        REFERENCES base.postseason_rounds
        ON UPDATE CASCADE
;
ALTER TABLE base.postseason_catching
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.postseason_fielding
    ADD FOREIGN KEY (round)
        REFERENCES base.postseason_rounds
        ON UPDATE CASCADE
;
ALTER TABLE base.postseason_fielding
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.postseason_fielding
    ADD FOREIGN KEY (position)
        REFERENCES base.positions (code)
        ON UPDATE CASCADE
;

ALTER TABLE base.postseason_pitching
    ADD FOREIGN KEY (round)
        REFERENCES base.postseason_rounds
        ON UPDATE CASCADE
;
ALTER TABLE base.postseason_pitching
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;

ALTER TABLE base.postseason_series
    ADD FOREIGN KEY (round)
        REFERENCES base.postseason_rounds
        ON UPDATE CASCADE
;

ALTER TABLE base.salaries
    ADD FOREIGN KEY (person)
        REFERENCES base.people
        ON UPDATE CASCADE
;

ALTER TABLE base.schools
    ADD FOREIGN KEY (country, state, city)
        REFERENCES base.cities
        ON UPDATE CASCADE
;

ALTER TABLE base.shared_manager_awards
    ADD FOREIGN KEY (award)
        REFERENCES base.awards
        ON UPDATE CASCADE
;
ALTER TABLE base.shared_manager_awards
    ADD FOREIGN KEY (manager)
        REFERENCES base.people
        ON UPDATE CASCADE
;
ALTER TABLE base.shared_manager_awards
    ADD FOREIGN KEY (league)
        REFERENCES base.leagues
        ON UPDATE CASCADE
;

ALTER TABLE base.shared_player_awards
    ADD FOREIGN KEY (award)
        REFERENCES base.awards
        ON UPDATE CASCADE
;
ALTER TABLE base.shared_player_awards
    ADD FOREIGN KEY (player)
        REFERENCES base.players
        ON UPDATE CASCADE
;
ALTER TABLE base.shared_player_awards
    ADD FOREIGN KEY (league)
        REFERENCES base.leagues
        ON UPDATE CASCADE
;

ALTER TABLE base.states
    ADD FOREIGN KEY (country)
        REFERENCES base.countries
        ON UPDATE CASCADE
;

/* This can't work until period foreign keys are implemented.
ALTER TABLE base.teams
    ADD FOREIGN KEY (franchise)
        REFERENCES base.franchises
        ON UPDATE CASCADE
;
*/

ALTER TABLE base.umpire_crew_members
    ADD FOREIGN KEY (year, crew)
        REFERENCES base.umpire_crews
        ON UPDATE CASCADE
;

ALTER TABLE base.umpire_crew_members
    ADD FOREIGN KEY (umpire)
        REFERENCES base.people
        ON UPDATE CASCADE
;

ALTER TABLE base.umpire_crews
    ADD FOREIGN KEY (year, crew, chief)
        REFERENCES base.umpire_crew_members
        ON UPDATE CASCADE
;

ALTER TABLE base.umpires
    ADD FOREIGN KEY (umpire)
        REFERENCES base.people
        ON UPDATE CASCADE
;
