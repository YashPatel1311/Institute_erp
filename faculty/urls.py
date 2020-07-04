from django.urls import include,path
from . import views

urlpatterns=[
    path("home/",views.faculty_home),
    path("attendance/",views.faculty_attendance),
    path("attendance_update/",views.faculty_attendance_update),
    path("marks/",views.faculty_marks),
    path("marks_update/",views.faculty_marks_update),
    path("all_marks/",views.faculty_all_marks),
    path("all_marks_update/",views.faculty_all_marks_update),
    path("course/",views.faculty_course),
    path("all_attendance/",views.faculty_all_attendance),
    path("timetable/",views.faculty_timetable),
]