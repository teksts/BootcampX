const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;
const limit = args[1] || 5;
const values = [`%${args[0]}%`, limit];

pool.query(queryString, values)
  .then(res => {
    console.log(res.rows);
  })
  .catch(err => console.error('query error', err.stack));
