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

-- CREATE TYPE PerformanceType AS (
-- 	contestant REF(PersonType) SCOPE Contestants
--	piece REF(PieceType) SCOPE Pieces
-- 	results ROW(judge REF(PersonType) SCOPE Judges, score integer CHECK(score > 0) ) MULTISET
-- );

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
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Judges OF PersonType (
	UNIQUE(name),
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Pieces OF PieceType(
	UNIQUE(name),
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Performances OF PerformanceType (
	Contestant WITH OPTIONS REFERENCES Contestants(oid),
	Piece WITH OPTIONS REFERENCES Pieces(oid),
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Shows OF ShowType(
	PRIMARY KEY (oid)
) WITH (OIDS);

CREATE TABLE Show_Performances (
	show oid REFERENCES Shows(oid),
	performance oid REFERENCES Performances(oid)
);
