INSERT INTO Contestants (name) VALUES ('Joe'), ('Bob'), ('Mary'), ('Ann'), ('Bess'), ('Tom'), ('Don');
INSERT INTO Pieces (name) VALUES ('Barcarolle'), ('Giselle'), ('Besame Mucho'), ('Swan Lake'), ('Habanera'), ('The Tramp');
INSERT INTO Judges (name) VALUES ('Judy'), ('Lucy'), ('Irving'), ('Phil'), ('Oscar');

-- any all http://www.postgresql.org/docs/9.1/static/arrays.html
-- http://stackoverflow.com/questions/11957925/psycopg2-mapping-python-list-of-dicts-to-postgres-array-of-composite-type
INSERT INTO Performances VALUES ('Joe', 'Barcarolle',  ARRAY[('Judy', 7), ('Lucy', 8), ('Irving', 6)]::ResultType[]);
