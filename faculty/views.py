from django.shortcuts import render,HttpResponse,redirect
from accounts.models import Faculty,ClassCourse,Attendance,Marks
from .forms import Classcourseform
from django.http import HttpResponseRedirect
from django.db import connection
from django.views.decorators.csrf import csrf_exempt
import json
# Create your views here.

def faculty_home(request):
    
    current_user= request.user
    current_faculty=Faculty.objects.get(facultyid=current_user.id)

    # return render(request,"student_home.html")
    return render(request,"faculty_home.html",{'current_faculty':current_faculty})

# def faculty_attendance(request):

def faculty_course(request):
    current_user=request.user
    current_faculty=Faculty.objects.get(facultyid=current_user.id)

    if request.method == 'POST':
        form = Classcourseform(request.POST)
        if form.is_valid():
            year=form.cleaned_data['ac_year']
            sem=form.cleaned_data['semester']
            
            result=ClassCourse.objects.filter(facultyid=current_user.id).values('courseid').distinct()

            args={'form':form,'year':year,'sem':sem,'result':result}

            return render(request,'faculty_course.html',args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Classcourseform()
        return render(request, 'faculty_course.html', {'form': form})


def faculty_attendance(request,studentid):
    current_user=request.user
    current_faculty=Faculty.objects.get(facultyid=current_user.id)

    if request.method == 'POST':
        form = Classcourseform(request.POST)
        if form.is_valid():
            year=form.cleaned_data['ac_year']
            sem=form.cleaned_data['semester']
            temp=ClassCourse.objects.filter(facultyid=current_user.id).values('courseid').distinct()
            courseid=temp[0]['courseid']

            cursor=connection.cursor()   
            cursor.execute("call view_students_attendance_by_faculty(%s,%s,%s,%s);",[studentid,courseid,year,sem])
            result=cursor.fetchall()

            args={'form':form,'result':result,'courseid':courseid}

            return render(request,'faculty_attendance.html',args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Classcourseform()
        return render(request, 'faculty_attendance.html', {'form': form})

# @csrf_exempt
def faculty_attendance_update(request):

    data=request.POST['updates']
    python_data=json.loads(data)

    print(python_data)
    if python_data is not None:
        print("Data received")


        for key,value in python_data.items():
            attendance_obj=Attendance.objects.get(attendanceid=key)
            attendance_obj.attended=value
            attendance_obj.save()

    

    return HttpResponse("Successfully Updated!")



def faculty_all_attendance(request):
    current_user=request.user
    current_faculty=Faculty.objects.get(facultyid=current_user.id)

    if request.method == 'POST':
        form = Classcourseform(request.POST)
        if form.is_valid():
            year=form.cleaned_data['ac_year']
            sem=form.cleaned_data['semester']
            
            cursor=connection.cursor()   
            cursor.execute("call view_all_students_attendance_by_faculty(%s,%s,%s);",[current_user.id,year,sem])
            result=cursor.fetchall()

            args={'form':form,'result':result}

            return render(request,'faculty_all_attendance.html',args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Classcourseform()
        return render(request, 'faculty_all_attendance.html', {'form': form})




def faculty_marks(request,studentid):

    current_user=request.user
    current_faculty=Faculty.objects.get(facultyid=current_user.id)

    print(studentid)

    if request.method == 'POST':
        form = Classcourseform(request.POST)
        if form.is_valid():
            year=form.cleaned_data['ac_year']
            sem=form.cleaned_data['semester']

            temp=ClassCourse.objects.filter(facultyid=current_user.id).values('courseid').distinct()
            courseid=temp[0]['courseid']

            cursor=connection.cursor()   
            cursor.execute("call view_students_marks_by_faculty(%s,%s,%s,%s);",[studentid,courseid,year,sem])
            result=cursor.fetchall()

            args={'form':form,'studentid':studentid,'current_faculty':current_faculty,'result':result}

            return render(request,'faculty_marks.html',args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Classcourseform()
        return render(request, 'faculty_marks.html', {'form': form,'current_faculty':current_faculty})


def faculty_marks_update(request):

    data=request.POST.get('updates')
    python_data=json.loads(data)

    print(python_data)
    if python_data is not None:
        print("Data received")


        for key,value in python_data.items():
            marks_obj=Marks.objects.get(marksid=key)            
            marks_obj.obtained=value
            marks_obj.save()

    
    return HttpResponse("Successfully Updated!")




    
    
def faculty_all_marks(request):
    current_user=request.user



    if request.method == 'POST':
        form = Classcourseform(request.POST)
        if form.is_valid():
            year=form.cleaned_data['ac_year']
            sem=form.cleaned_data['semester']

            cursor=connection.cursor()   
            cursor.execute("call view_all_students_marks_by_faculty(%s,%s,%s);",[current_user.id,year,sem])
            result=cursor.fetchall()

            args={'form':form,'result':result}

            return render(request,'faculty_all_marks.html',args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Classcourseform()
        return render(request, 'faculty_all_marks.html', {'form': form})


def faculty_all_marks_update(request):

    data=request.POST.get('updates')
    python_data=json.loads(data)

    print(python_data)
    if python_data is not None:
        print("Data received")


        for key,value in python_data.items():
            marks_obj=Marks.objects.get(marksid=key)            
            marks_obj.obtained=value
            marks_obj.save()

    
    return HttpResponse("Successfully Updated!")


def faculty_timetable(request):

    current_user = request.user
    current_faculty = Faculty.objects.get(facultyid=current_user.id)

    if request.method == "POST":
        form = Classcourseform(request.POST)
        if form.is_valid():
            year = form.cleaned_data["ac_year"]
            sem = form.cleaned_data["semester"]

            cursor = connection.cursor()
            cursor.execute(
                "call view_timetable_faculty(%s,%s,%s);", [current_user.id, year, sem]
            )
            result = cursor.fetchall()

            args = {"form": form, "result": result, "current_faculty": current_faculty}

            return render(request, "faculty_timetable.html", args)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Classcourseform()
        return render(
            request,
            "faculty_timetable.html",
            {"form": form, "current_faculty": current_faculty},
        )