select name, salary, avg(salary) over w

from teacher

window w as (order by salary
	groups between 1 preceding and 1 following);
