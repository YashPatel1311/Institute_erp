from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User,Student,Faculty
from .forms import UserAdminCreationForm,UserAdminChangeForm
from django.contrib.auth.models import Group


class StudentInLine(admin.StackedInline):
    
    model=Student
    verbose_name='Student'
    verbose_name_plural='Student'


class FacultyInLine(admin.StackedInline):
    model=Faculty
    verbose_name='Faculty'
    verbose_name_plural='Faculty'

class UserAdmin(BaseUserAdmin):

    form=UserAdminChangeForm
    add_form=UserAdminCreationForm

    list_display = ('email', 'admin')
    list_filter = ('admin',)


    fieldsets=(
            ('Credentials',{'fields':('email','password')}),
            ('Role',{'fields':('role',)}),
            # ('Role',{'fields':('is_student',)}),
            ('Permissions',{'fields':('active','staff','admin')}),  
              )

    add_fieldsets=(
        ('Credentials',{
            'fields':('email', 'password1','password2',)
        }),
        ('Role',{
            'fields':('role',)
        }),
        ('Permissions',{
            'fields':('active','staff','admin',)
        })
    )


    inlines=[StudentInLine,FacultyInLine]

    class Media:
        js=('//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js','js/base.js')
    
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()


admin.site.register(User, UserAdmin)
admin.site.unregister(Group)