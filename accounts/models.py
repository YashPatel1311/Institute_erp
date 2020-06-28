from django.db import models
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager

# Create your models here.

class UserManager(BaseUserManager):

    def create_user(self,email,password):

        if not email:
            raise ValueError("User must haave an email address")

        if not password:
            raise ValueError("User must haave a password")

        user_obj=self.model(
            email=self.normalize_email(email)
        )
        user_obj.set_password(password)
        user_obj.save(using=self._db)
        return user_obj

    def create_superuser(self,email,password):

        user_obj=self.create_user(email=email,password=password)
        user_obj.admin=True
        user_obj.staff=True
        user_obj.role=None
        user_obj.save(using=self._db)
        return user_obj

    def create_staffuser(self,email,password):

        user_obj=self.create_user(email=email,password=password)
        user_obj.staff=True
        user_obj.role=False
        user_obj.save(using=self._db)
        return user_obj


class User(AbstractBaseUser):

    email=models.EmailField(max_length=255,blank=True,null=False,unique=True)
    active=models.BooleanField(default=True)
    role=models.BooleanField(default=True,blank=True,null=True)
    staff=models.BooleanField(default=False)
    admin=models.BooleanField(default=False)

    objects=UserManager()

    USERNAME_FIELD='email'


    def __str__(self):
        return self.email

    def has_perm(self,perm, obj=None):
        return True

    def has_module_perms(self,app_label):
        return True

    @property
    def is_active(self):
        return self.active

    @property
    def is_admin(self):
        return self.admin    

    @property
    def is_staff(self):
        return self.staff

    def is_role(self):
        return self.role

    # def is_STUDENT(self):
    #     return self.is_student

    class Meta:
        db_table="user"


class Student(models.Model):
    uid = models.OneToOneField(User, on_delete=models.CASCADE, db_column='UID', blank=True, null=True)  # Field name made lowercase.
    studentid = models.CharField(primary_key=True, max_length=9)
    first_name = models.CharField(max_length=20, blank=True, null=True)
    middle_name = models.CharField(max_length=20, blank=True, null=True)
    last_name = models.CharField(max_length=20, blank=True, null=True)
    gender = models.CharField(max_length=1, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    mobile = models.CharField(max_length=10, blank=True, null=True)
    address = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=20, blank=True, null=True)
    state = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table="student"
        managed =False

class Faculty(models.Model):
    facultyid = models.OneToOneField(User, on_delete=models.CASCADE, db_column='facultyid', primary_key=True)
    facultyname = models.CharField(max_length=60)
    gender = models.CharField(max_length=1, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    mobile = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        db_table="faculty"
        managed =False

class Branch(models.Model):
    branchid = models.CharField(primary_key=True, max_length=2)
    bname = models.CharField(max_length=35)
    capacity = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'branch'


class Course(models.Model):
    courseid = models.CharField(primary_key=True, max_length=6)
    cname = models.CharField(max_length=100)
    credit = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'course'


class Class(models.Model):
    classid_ai = models.AutoField(primary_key=True)
    classid = models.CharField(unique=True, max_length=7, blank=True, null=True)
    branch = models.ForeignKey(Branch, models.DO_NOTHING, db_column='branch')
    batch = models.TextField()  # This field type is a guess.
    section = models.CharField(max_length=1, blank=True, null=True)
    labgroup = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'class'


class ClassCourse(models.Model):
    classcourseid = models.AutoField(primary_key=True)
    classid = models.ForeignKey(Class, models.DO_NOTHING, db_column='classid', blank=True, null=True)
    facultyid = models.ForeignKey(Faculty, models.DO_NOTHING, db_column='facultyid', blank=True, null=True)
    courseid = models.ForeignKey('Course', models.DO_NOTHING, db_column='courseid', blank=True, null=True)
    ac_year = models.TextField(blank=True, null=True)  # This field type is a guess.
    sem = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'class_course'
        unique_together = (('classid', 'courseid', 'ac_year', 'sem'),)

class Lecture(models.Model):
    lectureid = models.AutoField(primary_key=True)
    facultyid = models.ForeignKey(Faculty, models.DO_NOTHING, db_column='facultyid')
    classcourseid = models.ForeignKey(ClassCourse, models.DO_NOTHING, db_column='classcourseid', blank=True, null=True)
    timedate = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lecture'
        unique_together = (('facultyid', 'classcourseid', 'timedate'),)


class Enrollment(models.Model):
    enrollid = models.AutoField(primary_key=True)
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='courseid', blank=True, null=True)
    studentid = models.ForeignKey(Student, models.DO_NOTHING, db_column='studentid', blank=True, null=True)
    ac_year = models.TextField(blank=True, null=True)  # This field type is a guess.
    sem = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'enrollment'
        unique_together = (('courseid', 'studentid'),)


class Exam(models.Model):
    examid = models.AutoField(primary_key=True)
    classcourseid = models.ForeignKey(ClassCourse, models.DO_NOTHING, db_column='classcourseid', blank=True, null=True)
    examtype = models.CharField(max_length=6)
    edate = models.DateField(blank=True, null=True)
    total = models.PositiveIntegerField()

    class Meta:
        managed = False
        db_table = 'exam'
        unique_together = (('classcourseid', 'examtype', 'edate'),)


class Marks(models.Model):
    marksid = models.AutoField(primary_key=True)
    examid = models.ForeignKey(Exam, models.DO_NOTHING, db_column='examid', blank=True, null=True)
    studentid = models.ForeignKey('Student', models.DO_NOTHING, db_column='studentid')
    obtained = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'marks'
        unique_together = (('examid', 'studentid'),)

class BranchCourse(models.Model):
    branchid = models.OneToOneField(Branch, models.DO_NOTHING, db_column='branchid', primary_key=True)
    courseid = models.ForeignKey('Course', models.DO_NOTHING, db_column='courseid')

    class Meta:
        managed = False
        db_table = 'branch_course'
        unique_together = (('branchid', 'courseid'),)



class Attendance(models.Model):
    attendanceid = models.AutoField(primary_key=True)
    lectureid = models.ForeignKey('Lecture', models.DO_NOTHING, db_column='lectureid', blank=True, null=True)
    studentid = models.ForeignKey(Student, models.DO_NOTHING, db_column='studentid', blank=True, null=True)
    attended = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'attendance'


class Timetable(models.Model):
    weekday = models.PositiveIntegerField(blank=True, null=True)
    facultyid = models.ForeignKey(Faculty, models.DO_NOTHING, db_column='facultyid', blank=True, null=True)
    classcourseid = models.ForeignKey(ClassCourse, models.DO_NOTHING, db_column='classcourseid', blank=True, null=True)
    starttime = models.TimeField(blank=True, null=True)
    endtime = models.TimeField(blank=True, null=True)
    room = models.CharField(max_length=4, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'timetable'


class StudentClass(models.Model):
    studentid = models.ForeignKey(Student, models.DO_NOTHING, db_column='studentid', blank=True, null=True)
    section = models.ForeignKey(Class, models.DO_NOTHING, db_column='section', blank=True, null=True,related_name='class_section_identifier')
    labgroup = models.ForeignKey(Class, models.DO_NOTHING, db_column='labgroup', blank=True, null=True,related_name='class_labgroup_identifier')

    class Meta:
        managed = False
        db_table = 'student_class'


class StudentClasscourse(models.Model):
    studentid = models.OneToOneField(Student, models.DO_NOTHING, db_column='studentid', primary_key=True)
    classcourseid = models.ForeignKey(ClassCourse, models.DO_NOTHING, db_column='classcourseid')

    class Meta:
        managed = False
        db_table = 'student_classcourse'
        unique_together = (('studentid', 'classcourseid'),)