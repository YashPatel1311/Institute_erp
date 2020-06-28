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
    classcourseid INT UNSIGNED,
    starttime TIME,
    endtime TIME,
    room CHAR(4),
    FOREIGN KEY (facultyid)
        REFERENCES faculty (facultyid),
    FOREIGN KEY (classcourseid)
        REFERENCES class_course (classcourseid)
        ON UPDATE CASCADE,
    FOREIGN KEY (weekday)
        REFERENCES weeknames (weekday),
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