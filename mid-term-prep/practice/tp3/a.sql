--Find the name of the teacher with the 4-th highest salary. Assume the salaries are distinct. Write this query using WITH.

WITH desc_salary AS
	(
		SELECT *

		FROM teacher

		ORDER BY salary DESC
	)

SELECT S1.name

FROM desc_salary AS S1, desc_salary AS S2

WHERE S1.salary <= S2.salary

GROUP BY S1.salary, S1.name

HAVING count(*) = 4 ;
