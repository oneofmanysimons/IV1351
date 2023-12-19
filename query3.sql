SELECT a.instructor_id,a.name,COUNT(lesson_id) AS number_of_lessons
FROM instructor a 
FULL JOIN lesson b ON a.instructor_id = b.instructor_id
WHERE EXTRACT('month' FROM b.date) = EXTRACT('month' FROM NOW())
AND EXTRACT('year' FROM b.date) = EXTRACT('year' FROM NOW())
GROUP BY a.instructor_id
HAVING COUNT(lesson_id) > 0
ORDER BY number_of_lessons DESC;