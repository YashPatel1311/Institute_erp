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
        user_obj.role=False
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


class Student(models.Model):
    uid = models.OneToOneField(User, models.DO_NOTHING, db_column='UID', blank=True, null=True)  # Field name made lowercase.
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

class Faculty(models.Model):
    facultyid = models.OneToOneField(User, models.DO_NOTHING, db_column='facultyid', primary_key=True)
    facultyname = models.CharField(max_length=60)
    gender = models.CharField(max_length=1, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    mobile = models.CharField(max_length=10, blank=True, null=True)





