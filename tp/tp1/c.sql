SELECT c.title, t1.semester as semester1, t1.year as year1, t2.semester as semester2, t2.year as year2
FROM  course as c,teaches as t1, teaches as t2
WHERE t1.id = t2.id and c.course_id = t1.course_id and t1.semester = 'Fall' and t1.year = 2009 and t2.semester = 'Spring' and t2.year = 2010;
