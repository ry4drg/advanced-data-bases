-- For each department, find the maximum salary, and then return the minimum of all these maximum values. Return both the dept name as well as the corresponding salary.

SELECT teacher.dept_name, teacher.salary

FROM teacher

WHERE teacher.salary = ( 
				SELECT min(max_salary) AS min_of_max_salaries

				FROM (
        				SELECT dept_name, max(salary) AS max_salary

        				FROM teacher 

        				GROUP BY dept_name ) AS myTable ) ;
