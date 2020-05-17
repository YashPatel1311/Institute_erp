from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User,Students,Faculty
from .forms import UserAdminCreationForm,UserAdminChangeForm
from django.contrib.auth.models import Group


class StudentsInLine(admin.StackedInline):
    model=Students

class FacultyInLine(admin.StackedInline):
    model=Faculty

class UserAdmin(BaseUserAdmin):

    form=UserAdminChangeForm
    add_form=UserAdminCreationForm

    list_display = ('email', 'admin')
    list_filter = ('admin',)


    fieldsets=(
            ('Credentials',{'fields':('email','password')}),
            ('Permissions',{'fields':('active','student','staff','admin')}),  
              )

    add_fieldsets = (
            ('Credentials', {
            'fields': ('email', 'password1','password2'),
            
        }),
            ("Permissions", {
            'fields': (('active'),),
        }),
            (None, {
            'fields': (('student'),),
            'classes': ('toggle',)
        }),
            (None, {
            'fields': (('staff'),),
        }),

            (None, {
            'fields': (('admin'),),
        }),
                    )

    inlines=[StudentsInLine,FacultyInLine]

    
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()


admin.site.register(User, UserAdmin)
admin.site.unregister(Group)