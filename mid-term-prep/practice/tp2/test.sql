WITH

tbl1 as (
	SELECT id, count(*) as c

	FROM takes

	GROUP BY id) ,

tbl2 as (
	SELECT id, max(c)

	FROM tbl1)
SELECT *

FROM tbl2;
