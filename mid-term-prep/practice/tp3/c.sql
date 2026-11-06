--Find students who have taken all courses offered by their own department.

SELECT DISTINCT student.name

FROM student, takes, course

WHERE 
	student.id = takes.id and
	course.course_id = takes.course_id and
	student.dept_name = course.dept_name

GROUP BY student.name

HAVING count(*) = (
	SELECT count(*)

	FROM course

	GROUP BY dept_name ) ;
