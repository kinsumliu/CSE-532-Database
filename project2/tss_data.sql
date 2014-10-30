INSERT INTO Contestants (name) VALUES ('Joe'), ('Bob'), ('Mary'), ('Ann'), ('Bess'), ('Tom'), ('Don');
INSERT INTO Pieces (name) VALUES ('Barcarolle'), ('Giselle'), ('Besame Mucho'), ('Swan Lake'), ('Habanera'), ('The Tramp');
INSERT INTO Judges (name) VALUES ('Judy'), ('Lucy'), ('Irving'), ('Phil'), ('Oscar');
INSERT INTO Shows (showdate) VALUES ('2014-02-02'), ('2014-04-02'), ('2014-06-02'), ('2014-08-02'), ('2014-10-05');

-- Joe / Barcarolle:     7,8,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Joe'),
    (SELECT oid FROM Pieces WHERE name = 'Barcarolle'),
    ARRAY[('Judy', 7), ('Lucy', 8), ('Irving', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-02-02';
-- Mary / Barcarolle:    5,6,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Mary'),
    (SELECT oid FROM Pieces WHERE name = 'Barcarolle'),
    ARRAY[('Judy', 5), ('Lucy', 6), ('Irving', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-02-02';
-- Mary / Giselle:       9,6,8
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Mary'),
    (SELECT oid FROM Pieces WHERE name = 'Giselle'),
    ARRAY[('Judy', 9), ('Lucy', 6), ('Irving', 8)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-02-02';
-- Bess / Besame Mucho:  4,5,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bess'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Judy', 4), ('Lucy', 5), ('Irving', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-02-02';
-- Don / Besame Mucho:   9,9,7
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Don'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Judy', 9), ('Lucy', 9), ('Irving', 7)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-02-02';
--  Don / Swan Lake:      7,7,10
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Don'),
    (SELECT oid FROM Pieces WHERE name = 'Swan Lake'),
    ARRAY[('Judy', 7), ('Lucy', 7), ('Irving', 10)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-02-02';

-- Bob / Swan Lake:      8,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bob'),
    (SELECT oid FROM Pieces WHERE name = 'Swan Lake'),
    ARRAY[('Judy', 8), ('Phil', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';
-- Mary / Habanera:      3,5
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Mary'),
    (SELECT oid FROM Pieces WHERE name = 'Habanera'),
    ARRAY[('Judy', 3), ('Phil', 5)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';

-- Mary / Besame Mucho:  9,10
-- Ann / Habanera:       7,6
-- Bess / Giselle:       8,7
-- Tom / Besame Mucho:   5,5
-- Tom / The Tramp:      7,6

-- Tom / The Tramp:     6,6,8
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Tom'),
    (SELECT oid FROM Pieces WHERE name = 'The Tramp'),
    ARRAY[('Lucy', 6), ('Irving', 6), ('Phil', 8)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Don / The Tramp:     5,8,7
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Don'),
    (SELECT oid FROM Pieces WHERE name = 'The Tramp'),
    ARRAY[('Lucy', 5), ('Irving', 8), ('Phil', 7)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
