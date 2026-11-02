-- Find courses that have sections taught in different buildings. Use HAVING.

SELECT section.course_id

FROM section, course

WHERE section.course_id = course.course_id

GROUP BY section.course_id

HAVING count(DISTINCT section.building) >= 2 ;
