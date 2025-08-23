DROP SCHEMA if exists import CASCADE;
CREATE SCHEMA import;

SET search_path TO import;

CREATE TABLE "AllstarFull" (
    "playerID" text,
    "yearID" INTEGER,
    "gameNum" INTEGER,
    "gameID" text,
    "teamID" text,
    "lgID" text,
    "GP" text,
    "startingPos" text
);

\copy "AllstarFull" from imports/AllstarFull.csv with csv header

CREATE TABLE "Appearances" (
    "yearID" INTEGER NOT NULL,
    "teamID" text NOT NULL,
    "lgID" text,
    "playerID" text NOT NULL,
    "G_all" INTEGER,
    "GS" INTEGER,
    "G_batting" INTEGER,
    "G_defense" INTEGER,
    "G_p" INTEGER,
    "G_c" INTEGER,
    "G_1b" INTEGER,
    "G_2b" INTEGER,
    "G_3b" INTEGER,
    "G_ss" INTEGER,
    "G_lf" INTEGER,
    "G_cf" INTEGER,
    "G_rf" INTEGER,
    "G_of" INTEGER,
    "G_dh" INTEGER,
    "G_ph" INTEGER,
    "G_pr" INTEGER
);

\copy "Appearances" from imports/Appearances.csv with csv header

CREATE TABLE "AwardsManagers" (
    "playerID" text NOT NULL,
    "awardID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "lgID" text NOT NULL,
    "tie" text,
    "notes" text
);

\copy "AwardsManagers" from imports/AwardsManagers.csv with csv header

CREATE TABLE "AwardsPlayers" (
    "playerID" text,
    "awardID" text,
    "yearID" INTEGER,
    "lgID" text,
    "tie" text,
    "notes" text
);

\copy "AwardsPlayers" from imports/AwardsPlayers.csv with csv header

CREATE TABLE "AwardsShareManagers" (
    "awardID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "lgID" text NOT NULL,
    "playerID" text NOT NULL,
    "pointsWon" INTEGER,
    "pointsMax" INTEGER,
    "votesFirst" INTEGER
);

\copy "AwardsShareManagers" from imports/AwardsShareManagers.csv with csv header

CREATE TABLE "AwardsSharePlayers" (
    "awardID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "lgID" text NOT NULL,
    "playerID" text NOT NULL,
    "pointsWon" NUMERIC,
    "pointsMax" INTEGER,
    "votesFirst" NUMERIC
);

\copy "AwardsSharePlayers" from imports/AwardsSharePlayers.csv with csv header

CREATE TABLE "Batting" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "stint" INTEGER NOT NULL,
    "teamID" text,
    "lgID" text,
    "G" INTEGER,
    "G_batting" INTEGER,
    "AB" INTEGER,
    "R" INTEGER,
    "H" INTEGER,
    "2B" INTEGER,
    "3B" INTEGER,
    "HR" INTEGER,
    "RBI" INTEGER,
    "SB" INTEGER,
    "CS" INTEGER,
    "BB" INTEGER,
    "SO" INTEGER,
    "IBB" INTEGER,
    "HBP" INTEGER,
    "SH" INTEGER,
    "SF" INTEGER,
    "GIDP" INTEGER,
    "G_old" INTEGER
);

\copy "Batting" from imports/Batting.csv with csv header

CREATE TABLE "BattingPost" (
    "yearID" INTEGER NOT NULL,
    "round" text NOT NULL,
    "playerID" text NOT NULL,
    "teamID" text,
    "lgID" text,
    "G" INTEGER,
    "AB" INTEGER,
    "R" INTEGER,
    "H" INTEGER,
    "2B" INTEGER,
    "3B" INTEGER,
    "HR" INTEGER,
    "RBI" INTEGER,
    "SB" INTEGER,
    "CS" INTEGER,
    "BB" INTEGER,
    "SO" INTEGER,
    "IBB" INTEGER,
    "HBP" INTEGER,
    "SH" INTEGER,
    "SF" INTEGER,
    "GIDP" INTEGER
);

\copy "BattingPost" from imports/BattingPost.csv with csv header

CREATE TABLE "CollegePlaying" (
    "playerID" text NOT NULL,
    "schoolID" text,
    "yearID" INTEGER
);

\copy "CollegePlaying" from imports/CollegePlaying.csv with csv header

CREATE TABLE "Fielding" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "stint" INTEGER NOT NULL,
    "teamID" text,
    "lgID" text,
    "POS" text NOT NULL,
    "G" INTEGER,
    "GS" INTEGER,
    "InnOuts" INTEGER,
    "PO" INTEGER,
    "A" INTEGER,
    "E" INTEGER,
    "DP" INTEGER,
    "PB" INTEGER,
    "WP" INTEGER,
    "SB" INTEGER,
    "CS" INTEGER,
    "ZR" NUMERIC
);

\copy "Fielding" from imports/Fielding.csv with csv header

CREATE TABLE "FieldingOF" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "stint" INTEGER NOT NULL,
    "Glf" INTEGER,
    "Gcf" INTEGER,
    "Grf" INTEGER
);

\copy "FieldingOF" from imports/FieldingOF.csv with csv header

CREATE TABLE "FieldingOFsplit" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "stint" INTEGER NOT NULL,
    "teamID" text,
    "lgID" text,
    "POS" text NOT NULL,
    "G" INTEGER,
    "GS" INTEGER,
    "InnOuts" INTEGER,
    "PO" INTEGER,
    "A" INTEGER,
    "E" INTEGER,
    "DP" INTEGER,
    "PB" INTEGER,
    "WP" INTEGER,
    "SB" INTEGER,
    "CS" INTEGER,
    "ZR" NUMERIC
);

\copy "FieldingOFsplit" from imports/FieldingOFsplit.csv with csv header

CREATE TABLE "FieldingPost" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "teamID" text,
    "lgID" text,
    "round" text NOT NULL,
    "POS" text NOT NULL,
    "G" INTEGER,
    "GS" INTEGER,
    "InnOuts" INTEGER,
    "PO" INTEGER,
    "A" INTEGER,
    "E" INTEGER,
    "DP" INTEGER,
    "TP" INTEGER,
    "PB" INTEGER,
    "SB" INTEGER,
    "CS" INTEGER
);

\copy "FieldingPost" from imports/FieldingPost.csv with csv header

CREATE TABLE "HallOfFame" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "votedBy" text NOT NULL,
    "ballots" INTEGER,
    "needed" INTEGER,
    "votes" INTEGER,
    "inducted" text,
    "category" text,
    "needed_note" text
);

\copy "HallOfFame" from imports/HallOfFame.csv with csv header

CREATE TABLE "HomeGames" (
    "yearkey" INTEGER,
    "leaguekey" text,
    "teamkey" text,
    "parkkey" text,
    "spanfirst" text,
    "spanlast" text,
    "games" INTEGER,
    "openings" INTEGER,
    "attendance" INTEGER
);

\copy "HomeGames" from imports/HomeGames.csv with csv header

CREATE TABLE "Managers" (
    "playerID" text,
    "yearID" INTEGER NOT NULL,
    "teamID" text NOT NULL,
    "lgID" text,
    "inseason" INTEGER NOT NULL,
    "G" INTEGER,
    "W" INTEGER,
    "L" INTEGER,
    "rank" INTEGER,
    "plyrMgr" text
);

\copy "Managers" from imports/Managers.csv with csv header

CREATE TABLE "ManagersHalf" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "teamID" text NOT NULL,
    "lgID" text,
    "inseason" INTEGER,
    "half" INTEGER NOT NULL,
    "G" INTEGER,
    "W" INTEGER,
    "L" INTEGER,
    "rank" INTEGER
);

\copy "ManagersHalf" from imports/ManagersHalf.csv with csv header

CREATE TABLE "Parks" (
    "ID" INTEGER,
    "parkalias" text,
    "parkkey" text,
    "parkname" text,
    "city" text,
    "state" text,
    "country" text
);

\copy "Parks" from imports/Parks.csv with csv header

CREATE TABLE "People" (
    "ID" INTEGER,
    "playerID" text,
    "birthYear" INTEGER,
    "birthMonth" INTEGER,
    "birthDay" INTEGER,
    "birthCity" text,
    "birthCountry" text,
    "birthState" text,
    "deathYear" INTEGER,
    "deathMonth" INTEGER,
    "deathDay" INTEGER,
    "deathCountry" text,
    "deathState" text,
    "deathCity" text,
    "nameFirst" text,
    "nameLast" text,
    "nameGiven" text,
    "weight" INTEGER,
    "height" INTEGER,
    "bats" text,
    "throws" text,
    "debut" DATE,
    "bbrefID" text,
    "finalGame" DATE,
    "retroID" text
);

\copy "People" from imports/People.csv with csv header

CREATE TABLE "Pitching" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "stint" INTEGER NOT NULL,
    "teamID" text,
    "lgID" text,
    "W" INTEGER,
    "L" INTEGER,
    "G" INTEGER,
    "GS" INTEGER,
    "CG" INTEGER,
    "SHO" INTEGER,
    "SV" INTEGER,
    "IPouts" INTEGER,
    "H" INTEGER,
    "ER" INTEGER,
    "HR" INTEGER,
    "BB" INTEGER,
    "SO" INTEGER,
    "BAOpp" NUMERIC,
    "ERA" NUMERIC,
    "IBB" INTEGER,
    "WP" INTEGER,
    "HBP" INTEGER,
    "BK" INTEGER,
    "BFP" INTEGER,
    "GF" INTEGER,
    "R" INTEGER,
    "SH" INTEGER,
    "SF" INTEGER,
    "GIDP" INTEGER
);

\copy "Pitching" from imports/Pitching.csv with csv header

CREATE TABLE "PitchingPost" (
    "playerID" text NOT NULL,
    "yearID" INTEGER NOT NULL,
    "round" text NOT NULL,
    "teamID" text,
    "lgID" text,
    "W" INTEGER,
    "L" INTEGER,
    "G" INTEGER,
    "GS" INTEGER,
    "CG" INTEGER,
    "SHO" INTEGER,
    "SV" INTEGER,
    "IPouts" INTEGER,
    "H" INTEGER,
    "ER" INTEGER,
    "HR" INTEGER,
    "BB" INTEGER,
    "SO" INTEGER,
    "BAOpp" NUMERIC,
    "ERA" NUMERIC,
    "IBB" INTEGER,
    "WP" INTEGER,
    "HBP" INTEGER,
    "BK" INTEGER,
    "BFP" INTEGER,
    "GF" INTEGER,
    "R" INTEGER,
    "SH" INTEGER,
    "SF" INTEGER,
    "GIDP" INTEGER
);

\copy "PitchingPost" from imports/PitchingPost.csv with csv header

CREATE TABLE "Salaries" (
    "yearID" INTEGER NOT NULL,
    "teamID" text NOT NULL,
    "lgID" text NOT NULL,
    "playerID" text NOT NULL,
    "salary" NUMERIC
);

\copy "Salaries" from imports/Salaries.csv with csv header

CREATE TABLE "Schools" (
    "schoolID" text NOT NULL,
    "name_full" text,
    "city" text,
    "state" text,
    "country" text
);

\copy "Schools" from imports/Schools.csv with csv header

CREATE TABLE "SeriesPost" (
    "yearID" INTEGER NOT NULL,
    "round" text NOT NULL,
    "teamIDwinner" text,
    "lgIDwinner" text,
    "teamIDloser" text,
    "lgIDloser" text,
    "wins" INTEGER,
    "losses" INTEGER,
    "ties" INTEGER
);

\copy "SeriesPost" from imports/SeriesPost.csv with csv header

CREATE TABLE "Teams" (
    "yearID" INTEGER NOT NULL,
    "lgID" text NOT NULL,
    "teamID" text NOT NULL,
    "franchID" text,
    "divID" text,
    "Rank" INTEGER,
    "G" INTEGER,
    "Ghome" INTEGER,
    "W" INTEGER,
    "L" INTEGER,
    "DivWin" text,
    "WCWin" text,
    "LgWin" text,
    "WSWin" text,
    "R" INTEGER,
    "AB" INTEGER,
    "H" INTEGER,
    "2B" INTEGER,
    "3B" INTEGER,
    "HR" INTEGER,
    "BB" INTEGER,
    "SO" INTEGER,
    "SB" INTEGER,
    "CS" INTEGER,
    "HBP" INTEGER,
    "SF" INTEGER,
    "RA" INTEGER,
    "ER" INTEGER,
    "ERA" NUMERIC,
    "CG" INTEGER,
    "SHO" INTEGER,
    "SV" INTEGER,
    "IPouts" INTEGER,
    "HA" INTEGER,
    "HRA" INTEGER,
    "BBA" INTEGER,
    "SOA" INTEGER,
    "E" INTEGER,
    "DP" INTEGER,
    "FP" NUMERIC,
    "name" text,
    "park" text,
    "attendance" INTEGER,
    "BPF" INTEGER,
    "PPF" INTEGER,
    "teamIDBR" text,
    "teamIDlahman45" text,
    "teamIDretro" text
);

\copy "Teams" from imports/Teams.csv with csv header

CREATE TABLE "TeamsFranchises" (
    "franchID" text NOT NULL,
    "franchName" text,
    "active" text,
    "NAassoc" text
);

\copy "TeamsFranchises" from imports/TeamsFranchises.csv with csv header

CREATE TABLE "TeamsHalf" (
    "yearID" INTEGER NOT NULL,
    "lgID" text NOT NULL,
    "teamID" text NOT NULL,
    "Half" INTEGER NOT NULL,
    "divID" text,
    "DivWin" text,
    "Rank" INTEGER,
    "G" INTEGER,
    "W" INTEGER,
    "L" INTEGER
);

\copy "TeamsHalf" from imports/TeamsHalf.csv with csv header

