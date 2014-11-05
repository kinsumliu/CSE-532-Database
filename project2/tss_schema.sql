/***********************************************************
							CSE532 - Project 2
		File name: tss_schema.sql
		Authors: Kin Sum Liu (109247869) Hao-Tsung Yang (109892492)
		Brief description: This file contains the definitions of user-defined types, creation of tables and views. The views are useful for query 1 and query 5

We pledge our honor that all parts of this project were done
by us alone and without collaboration with anybody else

***********************************************************/

CREATE TYPE PersonType AS (
	name text
);

CREATE TYPE PieceType AS (
	name text
);

CREATE TYPE ResultType AS (
	judge text,
	score integer
);

CREATE TYPE PerformanceType AS (
	Contestant oid,
	Piece oid,
	results ResultType[]
);

CREATE TYPE ShowType AS (
	showdate date
);

CREATE TABLE Contestants OF PersonType (
	UNIQUE(name),
	PRIMARY KEY (oid),
	name WITH OPTIONS CHECK (char_length(name) > 0)
) WITH (OIDS);

CREATE TABLE Judges OF PersonType (
	UNIQUE(name),
	PRIMARY KEY (oid),
	name WITH OPTIONS CHECK (char_length(name) > 0)
) WITH (OIDS);

CREATE TABLE Pieces OF PieceType(
	UNIQUE(name),
	PRIMARY KEY (oid),
	name WITH OPTIONS CHECK (char_length(name) > 0)
) WITH (OIDS);

CREATE TABLE Performances OF PerformanceType (
	Contestant WITH OPTIONS REFERENCES Contestants(oid),
	Piece WITH OPTIONS REFERENCES Pieces(oid),
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Shows OF ShowType(
	UNIQUE(showdate),
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Show_Performances (
	show oid REFERENCES Shows(oid),
	performance oid REFERENCES Performances(oid)
);

CREATE VIEW Shows3Judges AS
  SELECT oid, showdate
  FROM Shows S
  WHERE EXISTS(
    SELECT P.contestant
    FROM Show_Performances SP, Performances P
    WHERE S.oid = SP.show AND
      SP.performance = P.oid AND
      array_length(P.results, 1) > 2
  );

CREATE VIEW Direct_Coaudition AS (
	SELECT C1.name AS name1, C2.name AS name2
	FROM Contestants C1, Contestants C2,
	  Show_Performances SP1, Show_Performances SP2,
	  Performances P1, Performances P2
	WHERE SP1.show = SP2.show AND
	  SP1.performance = P1.oid AND
	  SP2.performance = P2.oid AND
	  P1.piece = P2.piece AND
	  P1.contestant = C1.oid AND
	  P2.contestant = C2.oid AND
	  C1.name != C2.name AND
	  P1.results && P2.results
);


CREATE RECURSIVE VIEW Coaudition (name1, name2) AS (
	SELECT *
	FROM Direct_Coaudition
  UNION
	SELECT C1.name1,C2.name2
	FROM Coaudition C1, Direct_Coaudition C2
	WHERE C1.name2 = C2.name1 AND
		C1.name1 != C2.name2
);
