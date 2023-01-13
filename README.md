# byu-oit-data-challenge-student

This design is incomplete. I suggest converting the table for the ActiveEnrollmentSnapshots to be a fact/dimentions star schema. If we assume the student and course fields are static, then we don't need to duplicate them here, othewise we should. It needs to have the enrollment information. The ETL process should (of course) filter out the inactive enrollments (already dropped).

The indexes are not complete.

The SQL statements are not tested. Doing so would find enhancements we would want.

I suggest creating some test datasets for testing the queries.

## Update on 2023-01-12

As requested, I created mock data for this model and imported them into a SQLite database to demo. I corrected the queries and put them in separate files 1.sql through 6.sql. A sample output for each query is in 1.pdf through 6.pdf.
