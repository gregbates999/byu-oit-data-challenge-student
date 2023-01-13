-- 1. How many students are enrolled in a course on a specific day?

--Given TargetCourseId ('C00002', below)
--Given TargetDate ('2022-12-20' below) (or 22 or 24 or 28)

Select SnapshotDate, c.CourseId, c.CourseName, c.CourseTitle, count(c.CourseId) as EnrolledStudentCount
From ActiveEnrollmentSnapshots snap
	join Courses c on c.CourseId = snap.CourseId
Where '2022-12-24' = SnapshotDate
	and 'C00002' = c.CourseId
Group By SnapshotDate, c.CourseId, c.CourseName, c.CourseTitle;
