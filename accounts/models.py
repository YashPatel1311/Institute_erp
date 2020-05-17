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
        user_obj.student=False
        user_obj.save(using=self._db)
        return user_obj

    def create_staffuser(self,email,password):

        user_obj=self.create_user(email=email,password=password)
        user_obj.staff=True
        user_obj.student=False
        user_obj.save(using=self._db)
        return user_obj


class User(AbstractBaseUser):

    email=models.EmailField(max_length=255,blank=True,null=False,unique=True)
    active=models.BooleanField(default=True)
    student=models.BooleanField(default=True)
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
    def is_student(self):
        return self.student
    
    @property
    def is_staff(self):
        return self.staff

    @property
    def is_admin(self):
        return self.admin







