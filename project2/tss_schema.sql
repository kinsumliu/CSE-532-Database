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
	contestant text,
	piece text,
	results ResultType[]
);

-- CREATE TYPE ShowType AS (
-- 	showdate date,
-- 	performances REF(PerformanceType) SCOPE Performances MULTISET
-- );

-- CREATE TYPE ShowType AS (
-- 	showdate date,
-- 	performances PerformanceType[]
-- );

CREATE TABLE Contestants OF PersonType (
	UNIQUE(name),
	PRIMARY KEY(name)
);

CREATE TABLE Judges OF PersonType (
	UNIQUE(name),
	PRIMARY KEY(name)
);

CREATE TABLE Pieces OF PieceType(
	UNIQUE(name),
	PRIMARY KEY(name)
);

CREATE TABLE Performances OF PerformanceType (
	FOREIGN KEY (contestant) REFERENCES Contestants,
	FOREIGN KEY (piece) REFERENCES Pieces
);
-- CREATE TABLE Shows OF ShowType;
