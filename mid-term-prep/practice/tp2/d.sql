-- Find the names and salaries of all faculty that earn more than the average salary.

SELECT name, salary

FROM teacher

WHERE salary > (
	SELECT avg(salary)

	FROM teacher) ;
