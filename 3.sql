--3. What is the GPA of an individual student for a given semester?

--Given TargetStudentId ('St777777' below)
--Given TargetSemesterId ('Sem333' below)

Select 'St777777' as StudentId, s.LastName || ', ' || s.FirstName as StudentName, Sum(e.Credits * Cast(e.CourseGpa as FLOAT)) / Sum(e.Credits) as SemGpa, group_concat(e.Credits) as Credits, group_concat(e.Grade) as Grades, group_concat(e.Credits * e.CourseGpa) as GradePoints
            --, group_concat(e.CourseGpa) as CourseGpa, sum(Credits) as TotalCredits
From Semesters sem
	join Courses c on c.SemesterId = sem.SemesterId
	join Enrollments e on e.CourseId = c.CourseId
             join Students s on s.StudentId = e.StudentId
Where 'Sem333' = sem.SemesterId
	and 'St777777' = e.StudentId
	and e.Auditing <> 1 and e.ActiveEnrollment <> 0 and Grade <> "I"
