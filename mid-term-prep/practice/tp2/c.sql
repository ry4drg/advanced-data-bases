-- Find the lowest, across all departments, of the per-department maximum salary.

SELECT min(max_salary) 

FROM (
	SELECT dept_name, max(salary) AS max_salary

	FROM teacher

	GROUP BY dept_name) AS mytable ;
