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