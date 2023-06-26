SELECT students.name as student, (sum(assignment_submissions.duration))/(count(assignment_submissions.*)) as average_assignment_duration
FROM assignment_submissions
JOIN students on student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;