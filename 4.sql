--4. What is the cumulative GPA of an individual student?

--Given TargetStudentId ('St111111' below)

Select 'St111111' as StudentId, st.LastName || ', ' || st.FirstName as StudentName, Sum(e.Credits * Cast(e.CourseGpa as FLOAT)) / Sum(e.Credits) as CumulativeGpa, group_concat(e.Credits) as Credits, group_concat(e.Grade) as Grades, group_concat(e.Credits * e.CourseGpa) as GradePoints
From Students st
	join Enrollments e on e.StudentId = st.StudentId
Where 'St111111' = st.StudentId
	and e.Auditing <> 1 and e.Grade <> "I";