-- Find the name of the student who has taken the most classes.

select student.name

from student, takes

where student.id=takes.id

group by student.name

having count(*)=(
	select max(num)
	
	from (
		select count(*) as num

		from takes

		group by id) as mytable ) ;
