--Find the ids and names of all students who have not taken any course before 2010.

WITH before_ten AS (
	SELECT id

	FROM takes

	WHERE year < 2010 )

SELECT id, name

FROM student

WHERE id NOT IN ( 
	SELECT *

	FROM before_ten ) ;
