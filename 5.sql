--5. How many students passed their courses each semester?

Select sem.SemesterName, sem.StartDate, sem.EndDate, count(*) as PassedStudentCount, group_concat(e.StudentId) as StudentIds, group_concat(c.CourseName) as CourseNames
From Semesters sem
	join Courses c on c.SemesterId = sem.SemesterId
	join Enrollments e on e.CourseId = c.CourseId
Where e.Auditing <> 1 and e.Pass = 1
Group By sem.StartDate, sem.EndDate
Order By sem.StartDate;
