UPDATE base.allstar_games SET host = 'CHW' WHERE EXTRACT(YEAR FROM date) IN (1933, 1950, 1983, 2003);
UPDATE base.allstar_games SET host = 'SFG' WHERE EXTRACT(YEAR FROM date) IN (1934, 1942, 1984, 2007);
UPDATE base.allstar_games SET host = 'CLE' WHERE EXTRACT(YEAR FROM date) IN (1935, 1954, 1963, 1981, 1997, 2019);
UPDATE base.allstar_games SET host = 'ATL' WHERE EXTRACT(YEAR FROM date) IN (1936, 1955, 1972, 2000, 2025);
UPDATE base.allstar_games SET host = 'MIN' WHERE EXTRACT(YEAR FROM date) IN (1937, 1956, 1965, 1985, 2014);
UPDATE base.allstar_games SET host = 'CIN' WHERE EXTRACT(YEAR FROM date) IN (1938, 1953, 1970, 1988, 2015);
UPDATE base.allstar_games SET host = 'NYY' WHERE EXTRACT(YEAR FROM date) IN (1939, 1977, 2008);
UPDATE base.allstar_games SET host = 'STL' WHERE EXTRACT(YEAR FROM date) IN (1940, 1957, 1966, 2009);
UPDATE base.allstar_games SET host = 'DET' WHERE EXTRACT(YEAR FROM date) IN (1941, 1951, 1971, 2005);
UPDATE base.allstar_games SET host = 'OAK' WHERE EXTRACT(YEAR FROM date) IN (1943, 1987);
UPDATE base.allstar_games SET host = 'PIT' WHERE EXTRACT(YEAR FROM date) IN (1944, 1974, 1994, 2006);
INSERT INTO base.allstar_games (game, date, host) VALUES ('ALS194507100', DATE '1945-07-10', 'BOS');
UPDATE base.allstar_games SET host = 'BOS' WHERE EXTRACT(YEAR FROM date) IN (1946, 1999);
UPDATE base.allstar_games SET host = 'CHC' WHERE EXTRACT(YEAR FROM date) IN (1947, 1990);
UPDATE base.allstar_games SET host = 'BAL' WHERE EXTRACT(YEAR FROM date) IN (1948, 1958, 1993);
UPDATE base.allstar_games SET host = 'LAD' WHERE EXTRACT(YEAR FROM date) IN (1949, 1980, 2022);
UPDATE base.allstar_games SET host = 'PHI' WHERE EXTRACT(YEAR FROM date) IN (1952, 1976, 1996);
/* start two per year */
UPDATE base.allstar_games SET host = 'PIT' WHERE date = '1959-07-07';
UPDATE base.allstar_games SET host = 'LAD' WHERE date = '1959-08-03';
UPDATE base.allstar_games SET host = 'OAK' WHERE date = '1960-07-11';
UPDATE base.allstar_games SET host = 'NYY' WHERE date = '1960-07-13';
UPDATE base.allstar_games SET host = 'SFG' WHERE date = '1961-07-11';
UPDATE base.allstar_games SET host = 'BOS' WHERE date = '1961-07-31';
UPDATE base.allstar_games SET host = 'TEX' WHERE date = '1962-07-10';
UPDATE base.allstar_games SET host = 'CHC' WHERE date = '1962-07-30';
/* end two per year */
UPDATE base.allstar_games SET host = 'NYM' WHERE EXTRACT(YEAR FROM date) IN (1964, 2013);
UPDATE base.allstar_games SET host = 'ANA' WHERE EXTRACT(YEAR FROM date) IN (1967, 1989, 2010);
UPDATE base.allstar_games SET host = 'HOU' WHERE EXTRACT(YEAR FROM date) IN (1968, 1986, 2004);
UPDATE base.allstar_games SET host = 'TEX' WHERE EXTRACT(YEAR FROM date) IN (1969, 1995, 2024);
UPDATE base.allstar_games SET host = 'KCR' WHERE EXTRACT(YEAR FROM date) IN (1973, 2012);
UPDATE base.allstar_games SET host = 'MIL' WHERE EXTRACT(YEAR FROM date) IN (1975, 2002);
UPDATE base.allstar_games SET host = 'SDP' WHERE EXTRACT(YEAR FROM date) IN (1978, 1992, 2016);
UPDATE base.allstar_games SET host = 'SEA' WHERE EXTRACT(YEAR FROM date) IN (1979, 2001, 2023);
UPDATE base.allstar_games SET host = 'WSN' WHERE EXTRACT(YEAR FROM date) IN (1982, 2018);
UPDATE base.allstar_games SET host = 'TOR' WHERE EXTRACT(YEAR FROM date) IN (1991);
UPDATE base.allstar_games SET host = 'COL' WHERE EXTRACT(YEAR FROM date) IN (1998, 2021);
UPDATE base.allstar_games SET host = 'ARI' WHERE EXTRACT(YEAR FROM date) IN (2011);
UPDATE base.allstar_games SET host = 'FLA' WHERE EXTRACT(YEAR FROM date) IN (2017);
INSERT INTO base.allstar_games (game, date, host) VALUES ('NLS202007140', DATE '2020-07-14', 'LAD');

INSERT INTO base.cancelled_allstar_games (game)
    VALUES ('ALS194507100'),
           ('NLS202007140')
;
