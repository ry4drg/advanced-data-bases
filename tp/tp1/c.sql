SELECT c.title, s1.semester as semester1, s1.year as year1, s2.semester as semester2, s2.year as year2

FROM  course as c,section as s1, section as s2

WHERE  s1.course_id  = s2.course_id  
   and c.course_id = s1.course_id 
   and ((s1.semester = 'Fall' and s1.year = 2009 and s2.semester = 'Spring' and s2.year = 2010)
	or
        (s1.semester = 'Spring' and s1.year = 2010 and s2.semester = 'Fall' and s2.year = 2010))
;
