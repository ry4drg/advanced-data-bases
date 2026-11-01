-- Find the names and salaries of the teachers among the 3 lowest salaries, sorted by increasing salary. You must write this query with nested subqueries.

SELECT myTable.name1, myTable.salary1

FROM (  
	SELECT T1.name AS name1, T1.salary AS salary1, T2.name AS name2, T2.salary AS salary2

	FROM teacher AS T1, teacher AS T2

	WHERE T1.salary >= T2.salary ) AS myTable

GROUP BY myTable.name1, myTable.salary1

HAVING count(*) <= 3 

ORDER BY myTable.salary1 ;
