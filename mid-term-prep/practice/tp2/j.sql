-- Find the names and salaries of the teachers among the 3 lowest salaries, sorted by increasing salary. You must write this query using HAVING.

SELECT T1.name, T1.salary

FROM teacher AS T1, teacher AS T2

WHERE T1.salary >= T2.salary

GROUP BY T1.name, T1.salary

HAVING count(*) <= 3 

ORDER BY T1.salary ;
