SELECT department.dept_name, count(*) -- `find the total number of times`

FROM teaches, course, section, department, teacher

WHERE 
	-- `a course was taught in that departments building`
	teacher.id = teaches.id and
	teaches.course_id = course.course_id and
	course.dept_name = department.dept_name and
        section.course_id = course.course_id and
	section.building = department.building and	
	
	-- `by that departments teachers`
	teacher.dept_name = department.dept_name
	
GROUP BY department.dept_name -- `for each department`
;
