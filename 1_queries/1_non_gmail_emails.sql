SELECT id, name, cohort_id
FROM students
WHERE email NOT LIKE 'gmail'
AND phone IS NULL;