from django.urls import include,path
from . import views

urlpatterns=[
    path("home/",views.student_home),
    path("attendance/",views.student_attendance),
    path("marks/",views.student_marks),
    path("course/",views.student_course),
    path("timetable/",views.student_timetable),
    
]