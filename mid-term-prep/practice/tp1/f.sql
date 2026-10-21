SELECT student.name, sum(course.credits)

FROM student, course, takes

WHERE
	student.id = takes.id and
	course.course_id = takes.course_id and
	course.dept_name <> student.dept_name

GROUP BY student.name
;
