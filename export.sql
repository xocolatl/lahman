\copy (TABLE import."AllstarFull" ORDER BY "playerID", "yearID", "gameNum") to exports/input/AllstarFull.csv with csv header
\copy (TABLE lahman."AllstarFull" ORDER BY "playerID", "yearID", "gameNum") to exports/output/AllstarFull.csv with csv header
\copy (TABLE import."Appearances" ORDER BY "playerID", "yearID", "teamID") to exports/input/Appearances.csv with csv header
\copy (TABLE lahman."Appearances" ORDER BY "playerID", "yearID", "teamID") to exports/output/Appearances.csv with csv header
\copy (TABLE import."AwardsManagers" ORDER BY "playerID", "yearID") to exports/input/AwardsManagers.csv with csv header
\copy (TABLE lahman."AwardsManagers" ORDER BY "playerID", "yearID") to exports/output/AwardsManagers.csv with csv header
\copy (TABLE import."AwardsPlayers" ORDER BY "playerID", "yearID", "awardID", "lgID", notes) to exports/input/AwardsPlayers.csv with csv header
\copy (TABLE lahman."AwardsPlayers" ORDER BY "playerID", "yearID", "awardID", "lgID", notes) to exports/output/AwardsPlayers.csv with csv header
\copy (TABLE import."AwardsShareManagers" ORDER BY "playerID", "yearID") to exports/input/AwardsShareManagers.csv with csv header
\copy (TABLE lahman."AwardsShareManagers" ORDER BY "playerID", "yearID") to exports/output/AwardsShareManagers.csv with csv header
\copy (TABLE import."AwardsSharePlayers" ORDER BY "playerID", "yearID", "awardID", "lgID") to exports/input/AwardsSharePlayers.csv with csv header
\copy (TABLE lahman."AwardsSharePlayers" ORDER BY "playerID", "yearID", "awardID", "lgID") to exports/output/AwardsSharePlayers.csv with csv header
\copy (TABLE import."Batting" ORDER BY "playerID", "yearID", "teamID", "lgID", stint) to exports/input/Batting.csv with csv header
\copy (TABLE lahman."Batting" ORDER BY "playerID", "yearID", "teamID", "lgID", stint) to exports/output/Batting.csv with csv header
\copy (TABLE import."BattingPost" ORDER BY "playerID", "yearID", "teamID", "lgID", round) to exports/input/BattingPost.csv with csv header
\copy (TABLE lahman."BattingPost" ORDER BY "playerID", "yearID", "teamID", "lgID", round) to exports/output/BattingPost.csv with csv header
\copy (TABLE import."CollegePlaying" ORDER BY "playerID", "schoolID", "yearID") to exports/input/CollegePlaying.csv with csv header
\copy (TABLE lahman."CollegePlaying" ORDER BY "playerID", "schoolID", "yearID") to exports/output/CollegePlaying.csv with csv header
\copy (TABLE import."Fielding" ORDER BY "playerID", "yearID", "teamID", "lgID", stint, "POS") to exports/input/Fielding.csv with csv header
\copy (TABLE lahman."Fielding" ORDER BY "playerID", "yearID", "teamID", "lgID", stint, "POS") to exports/output/Fielding.csv with csv header
\copy (TABLE import."FieldingOF" ORDER BY "playerID", "yearID", stint) to exports/input/FieldingOF.csv with csv header
\copy (TABLE lahman."FieldingOF" ORDER BY "playerID", "yearID", stint) to exports/output/FieldingOF.csv with csv header
\copy (TABLE import."FieldingOFsplit" ORDER BY "playerID", "yearID", stint, "POS") to exports/input/FieldingOFsplit.csv with csv header
\copy (TABLE lahman."FieldingOFsplit" ORDER BY "playerID", "yearID", stint, "POS") to exports/output/FieldingOFsplit.csv with csv header
\copy (TABLE import."FieldingPost" ORDER BY "playerID", "yearID", "teamID") to exports/input/FieldingPost.csv with csv header
\copy (TABLE lahman."FieldingPost" ORDER BY "playerID", "yearID", "teamID") to exports/output/FieldingPost.csv with csv header
\copy (TABLE import."HallOfFame" ORDER BY "playerID", "yearID", "votedBy") to exports/input/HallOfFame.csv with csv header
\copy (TABLE lahman."HallOfFame" ORDER BY "playerID", "yearID", "votedBy") to exports/output/HallOfFame.csv with csv header
\copy (TABLE import."HomeGames" ORDER BY yearkey, leaguekey, teamkey, parkkey) to exports/input/HomeGames.csv with csv header
\copy (TABLE lahman."HomeGames" ORDER BY yearkey, leaguekey, teamkey, parkkey) to exports/output/HomeGames.csv with csv header
\copy (TABLE import."Managers" ORDER BY "yearID", "teamID", "lgID", inseason) to exports/input/Managers.csv with csv header
\copy (TABLE lahman."Managers" ORDER BY "yearID", "teamID", "lgID", inseason) to exports/output/Managers.csv with csv header
\copy (TABLE import."ManagersHalf" ORDER BY "yearID", "teamID", "lgID", inseason, half) to exports/input/ManagersHalf.csv with csv header
\copy (TABLE lahman."ManagersHalf" ORDER BY "yearID", "teamID", "lgID", inseason, half) to exports/output/ManagersHalf.csv with csv header
\copy (TABLE import."Parks" ORDER BY parkkey) to exports/input/Parks.csv with csv header
\copy (TABLE lahman."Parks" ORDER BY parkkey) to exports/output/Parks.csv with csv header
\copy (TABLE import."People" ORDER BY "playerID") to exports/input/People.csv with csv header
\copy (TABLE lahman."People" ORDER BY "playerID") to exports/output/People.csv with csv header
\copy (TABLE import."Pitching" ORDER BY "playerID", "yearID", "teamID", "lgID", stint) to exports/input/Pitching.csv with csv header
\copy (TABLE lahman."Pitching" ORDER BY "playerID", "yearID", "teamID", "lgID", stint) to exports/output/Pitching.csv with csv header
\copy (TABLE import."PitchingPost" ORDER BY "playerID", "yearID", "teamID", "lgID", round) to exports/input/PitchingPost.csv with csv header
\copy (TABLE lahman."PitchingPost" ORDER BY "playerID", "yearID", "teamID", "lgID", round) to exports/output/PitchingPost.csv with csv header
\copy (TABLE import."Salaries" ORDER BY "playerID", "yearID", "teamID", "lgID") to exports/input/Salaries.csv with csv header
\copy (TABLE lahman."Salaries" ORDER BY "playerID", "yearID", "teamID", "lgID") to exports/output/Salaries.csv with csv header
\copy (TABLE import."Schools" ORDER BY "schoolID") to exports/input/Schools.csv with csv header
\copy (TABLE lahman."Schools" ORDER BY "schoolID") to exports/output/Schools.csv with csv header
\copy (TABLE import."SeriesPost" ORDER BY "yearID", round, "teamIDwinner") to exports/input/SeriesPost.csv with csv header
\copy (TABLE lahman."SeriesPost" ORDER BY "yearID", round, "teamIDwinner") to exports/output/SeriesPost.csv with csv header
\copy (TABLE import."Teams" ORDER BY "yearID", "teamID") to exports/input/Teams.csv with csv header
\copy (TABLE lahman."Teams" ORDER BY "yearID", "teamID") to exports/output/Teams.csv with csv header
\copy (TABLE import."TeamsFranchises" ORDER BY "franchID") to exports/input/TeamsFranchises.csv with csv header
\copy (TABLE lahman."TeamsFranchises" ORDER BY "franchID") to exports/output/TeamsFranchises.csv with csv header
\copy (TABLE import."TeamsHalf" ORDER BY "yearID", "teamID", "Half") to exports/input/TeamsHalf.csv with csv header
\copy (TABLE lahman."TeamsHalf" ORDER BY "yearID", "teamID", "Half") to exports/output/TeamsHalf.csv with csv header
