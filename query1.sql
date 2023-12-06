SELECT
CASE 
WHEN (EXTRACT('month' FROM date) = 1) THEN 'january'
WHEN (EXTRACT('month' FROM date) = 2) THEN 'februari'
WHEN (EXTRACT('month' FROM date) = 3) THEN 'mars'
WHEN (EXTRACT('month' FROM date) = 4) THEN 'april'
WHEN (EXTRACT('month' FROM date) = 5) THEN 'may'
WHEN (EXTRACT('month' FROM date) = 6) THEN 'juni'
WHEN (EXTRACT('month' FROM date) = 7) THEN 'juli'
WHEN (EXTRACT('month' FROM date) = 8) THEN 'august'
WHEN (EXTRACT('month' FROM date) = 9) THEN 'september'
WHEN (EXTRACT('month' FROM date) = 10) THEN 'oktober'
WHEN (EXTRACT('month' FROM date) = 11) THEN 'november'
WHEN (EXTRACT('month' FROM date) = 12) THEN 'december'
END AS month,
COUNT(a.lesson_id) AS total,
COUNT(b.lesson_id) AS individual,
COUNT(c.lesson_id) AS group,
COUNT(d.lesson_id) AS ensemble
FROM lesson a
LEFT JOIN individual_lesson b ON a.lesson_id = b.lesson_id
LEFT JOIN group_lesson c ON a.lesson_id = c.lesson_id
LEFT JOIN individual_lesson d ON a.lesson_id = d.lesson_id
WHERE EXTRACT('year' FROM date) = '2024'
GROUP BY month
ORDER BY month;