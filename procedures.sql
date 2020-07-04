DROP PROCEDURE if exists `project`.`view_students_attendance`;
delimiter |
create procedure view_students_attendance(IN sid char(9),IN ac_year year,IN sem tinyint)
READS SQL DATA
BEGIN

select courseid,count(attendanceid),sum(attended) from(
select lectureid,courseid from(
select classcourseid,courseid from
(select * from student_class 
where studentid=sid) as t1
join 
(select * from class_course
where class_course.ac_year=ac_year and class_course.sem=sem) as t2
where t1.section=t2.classid or t1.labgroup=t2.classid) as t3  natural join lecture) as t4 natural join attendance
where studentid=sid
group by courseid;    
    
END|
delimiter ; 



DROP  PROCEDURE if exists `project`.`view_all_student_in_course_attendance` ;
delimiter |
create procedure view_all_student_in_course_attendance(IN course char(6),IN class char(7),IN ac_year year,IN sem int)
READS SQL DATA
BEGIN

select studentid,count(distinct lectureid)as total_lectures,sum(attended) as attended_lectures from( 
select lectureid from
(select classcourseid from class_course 
where courseid=course and classid=class and class_course.ac_year =ac_year and class_course.sem=sem)as t1 
natural join 
lecture) as t2
natural join attendance
group by studentid;

END|
delimiter ;



DROP PROCEDURE if exists `project`.`view_all_students_attendance_by_faculty`;
delimiter |
create procedure view_all_students_attendance_by_faculty(IN f_id int,IN academic_year year,IN semester tinyint)
READS SQL DATA
BEGIN

select studentid,count(distinct lectureid) as TotalLecutres,sum(attended) as AttendedLecutres from attendance natural join
(select lectureid,timedate from lecture natural join
(select classcourseid from class_course where facultyid=f_id and ac_year=academic_year and sem=semester)as t1)as t2
group by studentid
;
END|
delimiter ;

call view_all_students_attendance_by_faculty(2,2019,2);




DROP PROCEDURE if exists `project`.`view_students_attendance_by_faculty`;
delimiter |
create procedure view_students_attendance_by_faculty(IN sid char(9),IN f_id INT,IN academic_year year,IN semester tinyint)
READS SQL DATA
BEGIN

SET @count:=0;
select attendanceid,(@count:=@count+1) as '#',date(timedate) as 'date',dayname(timedate) as 'day',attended from attendance natural join
(select * from lecture natural join 
(select * from class_course natural join student_classcourse where facultyid=f_id and sem=semester and ac_year=academic_year and studentid=sid)as t1)as t2;    
END|
delimiter ;


DROP PROCEDURE if exists `project`.`view_students_marks_by_faculty`;
delimiter |
create procedure view_students_marks_by_faculty(IN sid char(9),IN c_id char(6),IN academic_year year,IN semester tinyint)
READS SQL DATA
BEGIN

select marksid,examid,examtype,obtained,total from marks natural join
(select courseid,examid,studentid,total,examtype from exam natural join
(select classcourseid,courseid,studentid from
(select * from class_course where ac_year=academic_year and sem=semester and courseid=c_id) as t1
natural join
(select * from student_classcourse where studentid =sid) as t2) as t3)as t4
order by courseid;
    
END|
delimiter ;


DROP PROCEDURE if exists `project`.`view_all_students_marks_by_faculty`;
delimiter |
create procedure view_all_students_marks_by_faculty(IN f_id int,IN academic_year year,IN semester tinyint)
READS SQL DATA
BEGIN

select marksid,studentid,examtype,obtained,total from marks natural join
(select examid,total,examtype from exam natural join
(select classcourseid from class_course where ac_year=academic_year and sem=semester and facultyid=f_id) as t1)as t2;
    
END|
delimiter ;

call view_all_students_marks_by_faculty(2,2019,2);
-- select classcourseid from class_course where ac_year=2019 and sem=2 and facultyid=2;

DROP  PROCEDURE if exists `project`.`classes_by_faculty` ;
delimiter |
create procedure classes_by_faculty(IN facid int)
READS SQL DATA
BEGIN
select classid,ac_year,sem from class_course where facultyid=facid;
END|
delimiter ;



DROP PROCEDURE if exists `project`.`view_students_marks`;
delimiter |
create procedure view_students_marks(IN sid char(9),IN academic_year year,IN semester tinyint)
READS SQL DATA
BEGIN
select courseid,examtype,obtained,total from marks natural join
(select courseid,examid,studentid,total,examtype from exam natural join
(select classcourseid,courseid,studentid from
(select * from class_course where ac_year=academic_year and sem=semester) as t1
natural join
(select * from student_classcourse where studentid =sid) as t2) as t3)as t4
order by courseid;
END|
delimiter ;



drop procedure if exists `project`.`view_timetable_student`;
delimiter |
create procedure view_timetable_student(IN sid char(9))
reads sql data
begin


select weeknames(weekday) as 'Day',courseid,starttime,endtime,room from timetable natural join 
(select * from student_classcourse where studentid= sid)as t1 natural join class_course
order by weekday ;

end |
delimiter ;

call view_timetable_student('201851084');


drop procedure if exists `project`.`view_timetable_faculty`;
delimiter |
create procedure view_timetable_faculty(IN f_id char(9))
reads sql data
begin

select weeknames(weekday),classid,starttime,endtime,room from class_course natural join
(select * from timetable where facultyid=f_id) as t1
order by weekday;

end |
delimiter ;

call view_timetable_faculty(2);


drop procedure if exists `project`.`view_student_courses`;
delimiter |
create procedure view_student_courses(IN sid char(9),IN academic_year year,IN semester tinyint)
reads sql data
begin

select * from (select courseid from enrollment
where studentid=sid and ac_year=academic_year and sem=semester)as t1 
natural join course;

end |
delimiter ;

Drop Function  if exists `project`.`weeknames`;
delimiter |
CREATE FUNCTION weeknames(day_of_week int)
RETURNS char(9)
DETERMINISTIC
NO SQL
BEGIN
DECLARE weekname char(9);

if day_of_week =1 then set weekname="Sunday";
elseif day_of_week =2 then set weekname='Monday';
elseif day_of_week =3 then set weekname='Tuesday';
elseif day_of_week =4 then set weekname='Wednesday';
elseif day_of_week =5 then set weekname='Thursday';
elseif day_of_week =6 then set weekname='Friday';
elseif day_of_week =7 then set weekname='Saturday';
END IF;

RETURN weekname;

end |
delimiter ;




-- delimiter |
-- create view classcourse_of_student as 
-- select 

-- END|
-- delimiter;