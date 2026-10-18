/*
	The main reason for my previous mistake is that, I didnt take into consideration that
	a course is characterized by: its (course_id, sec_id, semester, year).
 */
SELECT department.dept_name, count(*) -- `find the total number of times`

FROM teaches, section, department, teacher

WHERE 
	-- `a course was taught`
	(section.course_id, 
		section.sec_id, 
		section.semester, 
		section.year) = (teaches.course_id, 
		teaches.sec_id, 
		teaches.semester, 
		teaches.year) and
	
	-- `in that departments building by that departments teachers`
	teacher.id = teaches.id and
	teacher.dept_name = department.dept_name and
	section.building = department.building 
	
GROUP BY department.dept_name -- `for each department`
;
