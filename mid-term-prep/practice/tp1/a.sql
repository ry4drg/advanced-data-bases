SELECT course_id, sec_id, semester, year, count(*)
FROM takes
GROUP BY course_id, sec_id, semester, year;
