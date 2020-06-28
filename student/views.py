from django.shortcuts import render, HttpResponse, redirect
from django.db import connection
from accounts.models import Student
from .forms import SemesterForm
from django.views.generic import TemplateView
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required


@login_required
def student_home(request):

    current_user = request.user
    current_student = Student.objects.get(uid=current_user.id)

    # return render(request,"student_home.html")
    return render(request, "student_home.html", {"current_student": current_student})

@login_required
def student_attendance(request):

    current_user = request.user
    current_student = Student.objects.get(uid=current_user.id)

    if request.method == "POST":
        form = SemesterForm(request.POST)
        if form.is_valid():
            year = form.cleaned_data["ac_year"]
            sem = form.cleaned_data["semester"]

            current_user = request.user
            current_student = Student.objects.get(uid=current_user.id)

            cursor = connection.cursor()
            cursor.execute(
                "call view_students_attendance(%s,%s,%s);",
                [current_student.studentid, year, sem],
            )
            result = cursor.fetchall()

            args = {"form": form, "result": result, "current_student": current_student}

            return render(request, "student_attendance.html", args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = SemesterForm()
        return render(
            request,
            "student_attendance.html",
            {"form": form, "current_student": current_student},
        )

@login_required
def student_marks(request):

    current_user = request.user
    current_student = Student.objects.get(uid=current_user.id)

    if request.method == "POST":
        form = SemesterForm(request.POST)
        if form.is_valid():
            year = form.cleaned_data["ac_year"]
            sem = form.cleaned_data["semester"]

            current_user = request.user
            current_student = Student.objects.get(uid=current_user.id)

            cursor = connection.cursor()
            cursor.execute(
                "call view_students_marks(%s,%s,%s);",
                [current_student.studentid, year, sem],
            )
            result = cursor.fetchall()

            args = {"form": form, "result": result, "current_student": current_student}

            return render(request, "student_marks.html", args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = SemesterForm()
        return render(
            request,
            "student_marks.html",
            {"form": form, "current_student": current_student},
        )

@login_required
def student_course(request):

    current_user = request.user
    current_student = Student.objects.get(uid=current_user.id)

    if request.method == "POST":
        form = SemesterForm(request.POST)
        if form.is_valid():
            year = form.cleaned_data["ac_year"]
            sem = form.cleaned_data["semester"]

            current_user = request.user
            current_student = Student.objects.get(uid=current_user.id)

            cursor = connection.cursor()
            cursor.execute("call view_student_courses(%s,%s,%s);",[current_student.studentid, year, sem])
            result = cursor.fetchall()

            args = {"form": form, "result": result, "current_student": current_student}

            return render(request, "student_course.html", args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = SemesterForm()
        return render(
            request,
            "student_course.html",
            {"form": form, "current_student": current_student},
        )

@login_required
def student_timetable(request):

    current_user = request.user
    current_student = Student.objects.get(uid=current_user.id)


    cursor = connection.cursor()
    cursor.execute(
        "call view_timetable_student(%s);", [current_student.studentid]
    )
    result = cursor.fetchall()

    args = {"result": result, "current_student": current_student}

    return render(request, "student_timetable.html", args)