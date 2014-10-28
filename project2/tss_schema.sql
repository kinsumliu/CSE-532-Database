CREATE TYPE PersonType AS (
	name CHAR(20)
);

CREATE TYPE PieceType AS (
	name CHAR(20)
);

CREATE TYPE PerformanceType AS (
	contestant REF(PersonType) SCOPE Contestants
	judgements ROW(judge REF(PersonType) SCOPE Judges, score integer ) MULTISET
);

CREATE TYPE ShowType AS (
	showdate date,
	performances REF(PerformanceType) SCOPE Performances MULTISET
);

CREATE TABLE Contestants OF PersonType;

CREATE TABLE Judges OF PersonType;

CREATE TABLE Performances OF PerformanceType;

CREATE TABLE Shows OF ShowType;
