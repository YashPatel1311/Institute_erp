drop database if exists project;
create database project;
use project;

CREATE TABLE branch (
    branchid CHAR(2) PRIMARY KEY,
    bname VARCHAR(35) NOT NULL,
    capacity INT NOT NULL,
	check (branchid in ('cs','it'))
);

CREATE TABLE course (
    courseid VARCHAR(6) PRIMARY KEY,
    cname VARCHAR(100) NOT NULL,
    credit INT NOT NULL
);
                    
CREATE TABLE faculty (
    facultyid int primary key,
    facultyname VARCHAR(60) NOT NULL,
    gender CHAR(1),
    dob DATE,
    mobile CHAR(10),
    CHECK (gender IN ('M' , 'F', 'T')),
    Foreign key(facultyid) references user(id)
);
                    
CREATE TABLE class (
	classid_ai int primary key auto_increment,
    classid char(7) default null,
    branch CHAR(2) NOT NULL,
    batch YEAR NOT NULL,
    section CHAR(1) DEFAULT NULL,
    labgroup CHAR(1) DEFAULT NULL,
    unique KEY (classid),
    FOREIGN KEY (branch)
        REFERENCES branch (branchid),
    CHECK (section IN ('1' , '2', NULL)),
    CHECK (labgroup IN ('a' , 'b', 'c', 'd', NULL))
);

create table class_course(classcourseid int unsigned primary key auto_increment,
						  classid char(7),
						  facultyid int,
                          courseid char(6),
                          ac_year year,
                          sem tinyint,
                          unique key (classid,courseid,ac_year,sem),
                          FOREIGN KEY (facultyid) REFERENCES faculty (facultyid),
                          FOREIGN KEY (classid) REFERENCES class (classid),
                          FOREIGN KEY (courseid) REFERENCES course (courseid) ON UPDATE cascade,
                          check (sem in(1,2)));

CREATE TABLE lecture (
    lectureid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    facultyid INT NOT NULL,
    classcourseid int unsigned,
    timedate TIMESTAMP,
    FOREIGN KEY (facultyid)
        REFERENCES faculty (facultyid),
    FOREIGN KEY (classcourseid)
        REFERENCES class_course (classcourseid),
        unique key(facultyid,classcourseid,timedate)
);
                    
CREATE TABLE student (
	UID int unique key,
    studentid CHAR(9) PRIMARY KEY,
    first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR(1),
    dob DATE,
    mobile CHAR(10),
    address VARCHAR(50) DEFAULT NULL,
    city VARCHAR(20) DEFAULT NULL,
    state VARCHAR(20) DEFAULT NULL,
    CHECK (gender IN ('M' , 'F', 'T')),
    Foreign  Key(UID) references user(id)
);
                    
CREATE TABLE enrollment (
    enrollid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    courseid VARCHAR(6),
    studentid CHAR(9),
    ac_year year,
	sem tinyint,
    CHECK (sem in(1,2)),
    FOREIGN KEY (courseid)
        REFERENCES course (courseid),
    FOREIGN KEY (studentid)
        REFERENCES student (studentid),
    UNIQUE KEY (courseid , studentid)
);
                        
CREATE TABLE exam (
    examid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    classcourseid int unsigned,
    examtype CHAR(6) NOT NULL,
    edate DATE,
    total TINYINT unsigned NOT NULL,
    FOREIGN KEY (classcourseid)
        REFERENCES class_course (classcourseid),
    UNIQUE KEY (classcourseid,examtype,edate)
);
                        
CREATE TABLE marks (
	marksid INT UNSIGNED AUTO_INCREMENT Primary Key,
    examid INT UNSIGNED,
    studentid VARCHAR(9) NOT NULL,
    obtained INT NOT NULL,
    FOREIGN KEY (studentid)
        REFERENCES student (studentid),
    FOREIGN KEY (examid)
        REFERENCES exam (examid),
    UNIQUE KEY (examid , studentid)
);
                  
CREATE TABLE branch_course (
    branchid VARCHAR(3),
    courseid VARCHAR(6),
    PRIMARY KEY (branchid , courseid),
    FOREIGN KEY (branchid)
        REFERENCES branch (branchid),
    FOREIGN KEY (courseid)
        REFERENCES course (courseid)
);
                          
                          
CREATE TABLE attendance (
	attendanceid int unsigned primary key auto_increment,
    lectureid INT UNSIGNED,
    studentid VARCHAR(9),
    attended BOOL default true,
    FOREIGN KEY (lectureid)
        REFERENCES lecture (lectureid),
    FOREIGN KEY (studentid)
        REFERENCES student (studentid) on update cascade
);

CREATE TABLE timetable (
    weekday TINYINT UNSIGNED,
    facultyid INT,
    classcourseid int unsigned,
    starttime TIME,
    endtime TIME,
    room char(4),
    FOREIGN KEY (facultyid)
        REFERENCES faculty (facultyid),
    FOREIGN KEY (classcourseid)
        REFERENCES class_course (classcourseid) on update cascade,
    CHECK (weekday BETWEEN 2 AND 7)
);

create table student_class(
	studentid char(9),
    section char(7) default null,
    labgroup char(7) default null,
    foreign key (section) references class(classid),
    foreign key (labgroup) references class(classid),
    foreign key (studentid) references student(studentid));


create table student_classcourse(
	studentid char(9),
    classcourseid int unsigned,
    primary key(studentid,classcourseid),
    foreign key(studentid) references student(studentid),
    foreign key(classcourseid) references class_course(classcourseid));


DELIMITER |                
create trigger student_list
after insert
on class_course
for each row

BEGIN
	
    insert into student_classcourse(studentid,classcourseid)
    select studentid,new.classcourseid from
    (select studentid from student_class where section=new.classid or labgroup=new.classid)as s1
    natural join
    (select studentid from enrollment where enrollment.courseid=new.courseid and enrollment.ac_year=new.ac_year and enrollment.sem=new.sem)as s2;
    
    
    
END|
delimiter ;

DELIMITER |
create event issue_lecture
on SCHEDULE 
EVERY 90 MINUTE
STARTS '2020-05-16 9:00:00'
ON COMPLETION PRESERVE ENABLE


DO 
	BEGIN
		
	IF dayofweek(curdate()) BETWEEN 2 and 7 then
    
		insert  into lecture(facultyid,classcourseid,timedate) 
        select facultyid,classcourseid,timestamp(concat(curdate()," ",starttime)) 
		from timetable 
		where timetable.weekday=dayofweek(curdate()) and timetable.starttime<=curtime();
        
	END IF;
    END|
    DELIMITER ;



DELIMITER |                
create trigger batch_chk
before insert 
on class
for each row

BEGIN
	if new.batch <'2013' and new.batch > year(curdate()) then
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid batch!';
    END if;
    
END|
delimiter ;



delimiter |
Create trigger setbatch
before insert
on student for each row 

BEGIN

		if substring(new.studentid,6,1) ='1' then
		if cast(substring(new.studentid,7,3) as unsigned)>=(select capacity from branch where branchid="cs") then
		signal sqlstate '45000' set message_text = 'Branch capacity reached !';
        
        end if;
        
        else
        if cast(substring(new.studentid,7,3) as unsigned)>=(select capacity from branch where branchid="it") then
		signal sqlstate '45000' set message_text = 'Branch capacity reached !';
        end if;
        
	end if;
end|
delimiter ;



delimiter |
create trigger student_lecture 
after insert on lecture
for each row
begin
    insert into  attendance(lectureid,studentid)
    select new.lectureid,studentid from student_classcourse	
    where new.classcourseid=student_classcourse.classcourseid;
end|
delimiter ;



delimiter |
create trigger set_classid 
before insert 
ON class
for each row
BEGIN

	if new.section is not null then
	set new.classid= concat(new.branch,CAST(new.batch as char(4)),CAST(new.section as char(1)));
    
    else 
    set new.classid= concat(new.branch,CAST(new.batch as char(4)),CAST(new.labgroup as char(1)));
    
    end if;
END|
delimiter ;


DELIMITER |                
create trigger student_list_exam
after insert
on exam
for each row
BEGIN
    insert into marks(examid,studentid,obtained)
    select new.examid,studentid,0 from
	student_classcourse where student_classcourse.classcourseid=new.classcourseid;    
END|
delimiter ;





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
create procedure view_students_attendance_by_faculty(IN sid char(9),IN courseid char(6),IN academic_year year,IN semester tinyint)
READS SQL DATA
BEGIN

SET @count:=0;
select attendanceid,(@count:=@count+1) as '#',date(timedate) as 'date',dayname(timedate) as 'day',attended from attendance natural join(
select lectureid,studentid,timedate from lecture natural join
(select classcourseid,studentid from
(select * from student_classcourse where studentid=sid) as t1
natural join
(select * from class_course where courseid=courseid and ac_year=academic_year and sem=semester) as t2)as t3) as t4;    
    
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

call view_students_marks_by_faculty('201851084','CS401',2019,2);


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



drop procedure if exists `project`.`view_timitable_student`;
delimiter |
create procedure view_timitable_student(IN sid char(9),IN academic_year year,IN semester tinyint)
reads sql data
begin

select courseid,weekday as  'day',starttime,endtime from
(select classcourseid,courseid from
(select * from student_classcourse where studentid=sid) as t1
natural join
(select * from class_course where ac_year=academic_year and sem=semester) as t2)as t3
natural join 
timetable
order by weekday;

end |
delimiter ;

call view_timitable_student('201851084',2019,2);


drop procedure if exists `project`.`view_timetable_faculty`;
delimiter |
create procedure view_timetable_faculty(IN f_id char(9),IN academic_year year,IN semester tinyint)
reads sql data
begin

select weekday,courseid,starttime,endtime,room from timetable natural join
(select classcourseid,courseid from class_course where ac_year=academic_year and sem=semester and facultyid=f_id) as t1
order by weekday;

end |
delimiter ;

call view_timetable_faculty(2,2019,2);


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

