SELECT COUNT(ss.student_id) AS no_of_siblings, COUNT(s.student_id) AS no_of_students
FROM student s
FULL JOIN sibling ss ON s.student_id = ss.student_id
WHERE ss.sibling_id IS NULL

UNION ALL

	SELECT no_of_siblings, COUNT(*) AS no_of_students
FROM (
	SELECT COUNT(*) AS no_of_siblings
	FROM (
		SELECT student_id AS s_id FROM sibling

		UNION ALL

		SELECT sibling_id AS s_id FROM sibling
	)
	GROUP BY s_id
)

GROUP BY no_of_siblings
ORDER BY no_of_siblings;