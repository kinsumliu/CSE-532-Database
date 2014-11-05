/***********************************************************
              CSE532 - Project 2
    File name: tss_data.sql
    Authors: Kin Sum Liu (109247869)
              Hao-Tsung Yang (109892492)
    Brief description: This file contains the SQL queries
      to insert the necessary data for the system

We pledge our honor that all parts of this project were done
by us alone and without collaboration with anybody else

***********************************************************/

INSERT INTO Contestants (name) VALUES ('Joe'), ('Bob'), ('Mary'), ('Ann'), ('Bess'), ('Tom'), ('Don');
INSERT INTO Pieces (name) VALUES ('Barcarolle'), ('Giselle'), ('Besame Mucho'), ('Swan Lake'), ('Habanera'), ('The Tramp');
INSERT INTO Judges (name) VALUES ('Judy'), ('Lucy'), ('Irving'), ('Phil'), ('Oscar');
INSERT INTO Shows (showdate) VALUES ('2014-02-02'), ('2014-04-02'), ('2014-06-02'), ('2014-08-02'), ('2014-10-05');

-- SHOW 1 -------------------------------------------------------
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

-- SHOW 2 -------------------------------------------------------
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
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Mary'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Judy', 9), ('Phil', 10)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';
-- Ann / Habanera:       7,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Ann'),
    (SELECT oid FROM Pieces WHERE name = 'Habanera'),
    ARRAY[('Judy', 7), ('Phil', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';
-- Bess / Giselle:       8,7
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bess'),
    (SELECT oid FROM Pieces WHERE name = 'Giselle'),
    ARRAY[('Judy', 8), ('Phil', 7)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';
-- Tom / Besame Mucho:   5,5
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Tom'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Judy', 5), ('Phil', 5)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';
-- Tom / The Tramp:      7,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Tom'),
    (SELECT oid FROM Pieces WHERE name = 'The Tramp'),
    ARRAY[('Judy', 7), ('Phil', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-04-02';

-- SHOW 3 -------------------------------------------------------
--  Bob / The Tramp:      8,7,9
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bob'),
    (SELECT oid FROM Pieces WHERE name = 'The Tramp'),
    ARRAY[('Irving', 8), ('Phil', 7), ('Oscar', 9)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-06-02';
--  Ann / Besame Mucho:   7,6,4
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Ann'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Irving', 7), ('Phil', 6), ('Oscar', 4)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-06-02';
--  Bess / Swan Lake:     6,8,7
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bess'),
    (SELECT oid FROM Pieces WHERE name = 'Swan Lake'),
    ARRAY[('Irving', 6), ('Phil', 8), ('Oscar', 7)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-06-02';
--  Tom / Barcarolle:     9,7,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Tom'),
    (SELECT oid FROM Pieces WHERE name = 'Barcarolle'),
    ARRAY[('Irving', 9), ('Phil', 7), ('Oscar', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-06-02';
--  Don / Giselle:        8,6,9
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Don'),
    (SELECT oid FROM Pieces WHERE name = 'Giselle'),
    ARRAY[('Irving', 8), ('Phil', 6), ('Oscar', 9)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-06-02';

-- SHOW 4 -------------------------------------------------------
--  Joe / The Tramp:      7,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Joe'),
    (SELECT oid FROM Pieces WHERE name = 'The Tramp'),
    ARRAY[('Lucy', 7), ('Oscar', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-08-02';
--  Bob / Barcarolle:     6,8
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bob'),
    (SELECT oid FROM Pieces WHERE name = 'Barcarolle'),
    ARRAY[('Lucy', 6), ('Oscar', 8)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-08-02';
--  Ann / Besame Mucho:   9,8
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Ann'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Lucy', 9), ('Oscar', 8)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-08-02';
--  Tom / The Tramp:      8,10
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Tom'),
    (SELECT oid FROM Pieces WHERE name = 'The Tramp'),
    ARRAY[('Lucy', 8), ('Oscar', 10)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-08-02';
--  Tom / Barcarolle:     5,5
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Tom'),
    (SELECT oid FROM Pieces WHERE name = 'Barcarolle'),
    ARRAY[('Lucy', 5), ('Oscar', 5)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-08-02';

-- SHOW 5 -------------------------------------------------------
-- Bob / Swan Lake:     3,5,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bob'),
    (SELECT oid FROM Pieces WHERE name = 'Swan Lake'),
    ARRAY[('Lucy', 3), ('Irving', 5), ('Phil', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Bob / Giselle:       4,6,8
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bob'),
    (SELECT oid FROM Pieces WHERE name = 'Giselle'),
    ARRAY[('Lucy', 4), ('Irving', 6), ('Phil', 8)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Mary / Barcarolle:   5,7,10
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Mary'),
    (SELECT oid FROM Pieces WHERE name = 'Barcarolle'),
    ARRAY[('Lucy', 5), ('Irving', 7), ('Phil', 10)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Mary / Besame Mucho: 6,8,7
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Mary'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Lucy', 6), ('Irving', 8), ('Phil', 7)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Ann / Besame Mucho:  7,9,6
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Ann'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Lucy', 7), ('Irving', 9), ('Phil', 6)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Bess / Besame Mucho: 9,8,8
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bess'),
    (SELECT oid FROM Pieces WHERE name = 'Besame Mucho'),
    ARRAY[('Lucy', 9), ('Irving', 8), ('Phil', 8)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
-- Bess / Habanera:     8,7,10
WITH P AS (
  INSERT INTO Performances (contestant, piece, results)
  VALUES (
    (SELECT oid FROM Contestants WHERE name = 'Bess'),
    (SELECT oid FROM Pieces WHERE name = 'Habanera'),
    ARRAY[('Lucy', 8), ('Irving', 7), ('Phil', 10)]::ResultType[]
  ) RETURNING oid
)
INSERT INTO Show_Performances (show, performance)
select S.oid, P.oid
FROM P, Shows S
WHERE S.showdate = '2014-10-05';
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
