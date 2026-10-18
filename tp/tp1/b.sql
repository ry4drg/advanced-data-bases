-- without using GROUP BY!
SELECT distinct s1.name, s2.name
FROM takes AS t1, student AS s1, takes AS t2, student AS s2
WHERE t1.course_id = t2.course_id and t1.sec_id = t2.sec_id and t1.semester = t2.semester and t1.year = t2.year and t1.id = s1.id and t2.id = s2.id and s1.id < s2.id;
