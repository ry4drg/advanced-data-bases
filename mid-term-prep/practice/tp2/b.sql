-- Find the name and budget of all departments with the maximum budget.

SELECT dept_name, budget

FROM department

WHERE budget >= ( 
	SELECT max(budget)

	FROM department
	)
;
