SELECT year, sum(credits)

/*
 My first intuition was to do a product of (course, section)
 which was wrong, the correct product is (course, takes) beacause
 credits are given to students so in order to get the total amount of
 them over the year we need to make a link between all the students for that we use
 the `takes` relation and the credit of each course which we know is obviously in
 the `course` relation.
 */
FROM course, takes

WHERE
	course.course_id = takes.course_id

GROUP BY
	year
;
