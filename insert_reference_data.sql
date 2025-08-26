INSERT INTO base.divisions (division, name)
    VALUES ('C', 'Central'),
           ('E', 'East'),
           ('W', 'West')
;

INSERT INTO base.handedness (code, description)
    VALUES ('B', 'Both'),
           ('L', 'Left'),
           ('R', 'Right')
;

INSERT INTO base.leagues (league, name)
    VALUES ('AA', 'American Association'),
           ('AL', 'American League'),
           ('FL', 'Federal League'),
           ('ML', 'Major League'),
           ('NA', 'National Association'),
           ('NL', 'National League'),
           ('PL', 'Players'' League'),
           ('UA', 'Union Association')
;

INSERT INTO base.positions (number, code, position)
    VALUES (  0,  'UT', 'Utility Player'),
           (  1,   'P', 'Pitcher'),
           (  2,   'C', 'Catcher'),
           (  3,  '1B', 'First Base'),
           (  4,  '2B', 'Second Base'),
           (  5,  '3B', 'Third Base'),
           (  6,  'SS', 'Shortstop'),
           (  7,  'LF', 'Left Field'),
           (  8,  'CF', 'Center Field'),
           (  9,  'RF', 'Right Field'),
           ( 10,  'DH', 'Designated Hitter'),
           (110, 'PDH', 'Pitcher and Designated Hitter'),
           (789,  'OF', 'Outfield')
;

INSERT INTO base.postseason_rounds (round, description)
    VALUES ('AEDIV', 'American League Division Series East'),
           ( 'ALCS', 'American League Championship Series'),
           ('ALDS1', 'American League Division Series 1'),
           ('ALDS2', 'American League Division Series 2'),
           ( 'ALWC', 'American League Wild Card Series'),
           ('ALWC1', 'American League Wild Card Series 1'),
           ('ALWC2', 'American League Wild Card Series 2'),
           ('ALWC3', 'American League Wild Card Series 3'),
           ('ALWC4', 'American League Wild Card Series 4'),
           ('AWDIV', 'American League Division Series West'),
           (   'CS', 'Championship Series'),
           ('NEDIV', 'National League Division Series East'),
           ( 'NLCS', 'National League Championship Series'),
           ('NLDS1', 'National League Division Series 1'),
           ('NLDS2', 'National League Division Series 2'),
           ( 'NLWC', 'National League Wild Card Series'),
           ('NLWC1', 'National League Wild Card Series 1'),
           ('NLWC2', 'National League Wild Card Series 2'),
           ('NLWC3', 'National League Wild Card Series 3'),
           ('NLWC4', 'National League Wild Card Series 4'),
           ('NWDIV', 'National League Division Series West'),
           (   'WS', 'World Series')
;

INSERT INTO base.version (year, edition)
    VALUES (2024, 4)
;
