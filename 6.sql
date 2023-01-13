--6. How does daily enrollment activity during last semester’s open enrollment period compare to the same period the year prior?

--Given CurSemesterId ('Sem555' below)
--Given PrevSemesterId ('Sem111' below)

Select 'Sem555' as CurrentSemesterId,
sem.EnrollStartDate as CurrentEnrollmentPeriodStart,
(
	Select Cast(Count(*) as FLOAT) / Count(Distinct(snap1.SnapshotDate))
	From Semesters sem1
		join Courses c1 on c1.SemesterId = sem1.SemesterId
		join Enrollments e1 on e1.CourseId = c1.CourseId
		join ActiveEnrollmentSnapshots snap1 on snap1.StudentId = e1.StudentId
			and snap1.CourseId = e1.CourseId
	Where 'Sem555' = sem1.SemesterId
) as CurrentAverageDailyChanges,
'Sem111' as PriorSemesterId,
(
    Select sem1.EnrollStartDate
    From Semesters sem1
    Where 'Sem111' = sem1.SemesterId
) as PriorEnrollmentPeriodStart,
(
	Select Cast(Count(*) as FLOAT) / Count(Distinct(snap1.SnapshotDate))
	From Semesters sem1
		join Courses c1 on c1.SemesterId = sem1.SemesterId
		join Enrollments e1 on e1.CourseId = c1.CourseId
		join ActiveEnrollmentSnapshots snap1 on snap1.StudentId = e1.StudentId
			and snap1.CourseId = e1.CourseId
	Where 'Sem111' = sem1.SemesterId
) as PriorAverageDailyChanges
From Semesters sem
Where sem.SemesterId = 'Sem555';
