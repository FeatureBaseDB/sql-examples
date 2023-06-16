-- much of what's in this file is specifically wrong, with the valid things
-- only present to make it possible to make further and more interesting
-- mistakes

-- this won't work because t1 hasn't been created yet.
SELECT * from t1;

-- this won't work because semicolons are needed between statements.
CREATE TABLE t1 (id id, foo string)
SELECT * from t1;

-- this won't work, because the ID column actually has to be named _id.
CREATE TABLE t1 (id id, foo string);

-- create a table t1 which just correlates IDs to sets of IDs, and has
-- other fields which exist to give us values of types.
CREATE TABLE t1 (_id id, data idset, s1 string, i1 int);

-- this won't work because data is a set, not a single value, even though the
-- corresponding PQL would express this as Row(data=3).
SELECT * FROM t1 WHERE data = 3;

-- this is the correct way to express the presence of 3 in a set.
SELECT * FROM t1 WHERE setcontains(data, 3);

-- this will not work because you can't insert an ID value into an IDSET field.
BULK INSERT INTO t1 (_id, data)
MAP (0 ID, 0 ID)
FROM x'
0,0
0,1
0,2
1,2
1,3
'
WITH
  FORMAT 'CSV'
  INPUT 'STREAM';

-- you can use keyed objects for ndjson if you need to.
BULK INSERT INTO t1 (_id, data)
MAP ('$.id' ID, '$.data' IDSET)
FROM x'{"id": 0, "data": [0, 1, 2]}'
WITH
  FORMAT 'NDJSON'
  INPUT 'STREAM';

-- you can't use NDJSON without a MAP clause to tell the parser
-- what the JSON means.
BULK INSERT INTO t1 (_id, data)
FROM x'{"id": 0, "data": [0, 1, 2]}'
WITH
  FORMAT 'NDJSON'
  INPUT 'STREAM';

-- it's probably significantly more efficient to use indexed arrays
-- to reduce the amount of JSON parsing that needs to happen.
BULK INSERT INTO t1 (_id, data, i1)
MAP ('$[0]' ID, '$[1]' IDSET, '$[2]' ID)
FROM x'
[1, [2, 3, 4], 4]
[2, [3, 4, 5], 2]
'
WITH
  FORMAT 'NDJSON'
  INPUT 'STREAM';

-- this won't work because you can't add integers to strings
SELECT i1 + s1 FROM t1;

-- this won't work because you can't add strings to strings either
SELECT s1 + s1 FROM t1;

-- this works because you can add integers to integers
SELECT i1 + i1 FROM t1;

-- this won't work because strings don't admit ordering
SELECT * FROM t1 WHERE s1 > 'a';

-- this won't work because double quotes denote a column reference, not a
-- string, and there is no column named a.
SELECT * FROM t1 WHERE s1 = "a";

-- this won't work because sets are also not comparable
SELECT * FROM t1 WHERE data > 3;

-- this won't work because integers can't be compared to strings
SELECT * FROM t1 WHERE i1 > s1;

-- this works but is very slow in the current implementation because
-- the comparison can't be done in the backend engine. i1 > -3 would
-- be fine.
SELECT * FROM t1 WHERE i1 + 3 > 0;

-- this won't work because the order of clauses matters and LIMIT clauses
-- have to go after the specification of what's being selected and from
-- what source or sources.
SELECT LIMIT 5 * FROM t1;

-- this won't work because strings aren't comparable even if you hide the comparison.
SELECT * from t1 where s1 BETWEEN 'a' and 'c';

-- this won't work because the BETWEEN range is ordered; it always uses the
-- left side of the range as a lower bound and the right side as an upper bound.
SELECT * FROM t1 WHERE i1 BETWEEN 4 and 2;

-- this won't work because IS and IS NOT work only with NULL.
SELECT * FROM t1 WHERE i1 IS 3;

-- this won't work because IS and IS NOT work only with NULL.
SELECT * FROM t1 WHERE i1 IS NOT 3;

-- this won't select records where i1 is NULL, because no operation other than
-- IS NULL on a NULL just produces more NULL. NULL is neither equal to, nor
-- not equal to, 3.
SELECT * FROM t1 WHERE i1 != 3;

-- this won't work because i1 is an integer and 4.0 is a floating point
-- value, so they're not comparable, even though 4.0 happens to be an
-- integer. variable type "INT" is a language feature, not a mathematical
-- concept.
SELECT * FROM t1 WHERE i1 = 4.0;

-- this won't work because i1 is not a string. in some SQL implementations,
-- this would produce the records where i1 was 4. ours is stricter.
SELECT * FROM t1 WHERE i1 = "4";

-- this probably works but restores us to a clean state so the file
-- runs as expected next time.
DROP TABLE t1;
