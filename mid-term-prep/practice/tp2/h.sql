-- For each teacher, list all the student names of those students who have taken at least 2 classes from that teacher. You must write this query without HAVING.

SELECT teachers_name, students_name, nbr_of_classes

FROM ( 
	SELECT teacher.name AS teachers_name, student.name AS students_name, count(*) AS nbr_of_classes

	FROM student, takes, teacher, teaches

	WHERE 
        	student.id = takes.id and
        	teacher.id = teaches.id and
        	(takes.course_id, takes.sec_id, takes.semester, takes.year) = (teaches.course_id, teaches.sec_id, teaches.semester, teaches.year)

	GROUP BY (teacher.name, student.name) ) AS myTable

WHERE nbr_of_classes >= 2 ;
