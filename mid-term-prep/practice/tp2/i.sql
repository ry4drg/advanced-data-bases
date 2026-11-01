-- Find all departments where teachers’ total salary is greater than the average of the total salary of all departments.

SELECT teacher.dept_name

FROM teacher

GROUP BY teacher.dept_name

HAVING sum(teacher.salary) > ( 
	SELECT avg(T2.salary)

	FROM ( 
		SELECT sum(T1.salary) AS salary

		FROM teacher AS T1

		GROUP BY T1.dept_name ) AS T2 ) ;
