SELECT cohorts.name as name, avg(completed_at - started_at) as average_assistance_request_duraiton
FROM assistance_requests
JOIN students on student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_request_duraiton