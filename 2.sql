--2. How many grades does a given instructor need to turn in?

--Given TargetInstructorId ('Ins33333' below)
--Given TargetSemesterId ('Sem555' below)

Select 'Ins88888' as InstructorId, i.LastName || ', ' || i.FirstName as Instructor, sem.SemesterName, c.CourseName, count(*) UngradedStudentCount, group_concat(StudentId) as StudentIds
From TeachingSchedule sched
	join Courses c on c.CourseId = sched.CourseId
	join Enrollments e on e.CourseId = c.CourseId
	join Semesters sem on sem.SemesterId = c.SemesterId
	join Instructors i on i.InstructorId = sched.InstructorId
Where 'Ins88888' = sched.InstructorId
	and 'Sem555' = sem.SemesterId
	and e.ActiveEnrollment <> 0 and e.Auditing <> 1
             and e.Grade is null;

/*
Select sem.SemesterId, sem.SemesterName, sched.InstructorId, count(*), group_concat(e.StudentId)
From TeachingSchedule sched
	join Courses c on c.CourseId = sched.CourseId
	join Enrollments e on e.CourseId = c.CourseId
	join Semesters sem on sem.SemesterId = c.SemesterId
--Where 'Ins44444' = sched.InstructorId
--	and 'Sem555' = sem.SemesterId
--	and e.ActiveEnrollment <> 0 and e.Auditing <> 1
Group By sem.SemesterId, sem.SemesterName, sched.InstructorId;
*/