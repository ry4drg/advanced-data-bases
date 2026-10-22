-- Find the names and ids of students who have taken only one class.

SELECT student.name, student.id

FROM student, takes

WHERE
	student.id = takes.id

GROUP BY
	student.name, student.id

HAVING
	count(*) = 1
;
