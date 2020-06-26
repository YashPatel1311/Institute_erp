from django import forms

class Classcourseform(forms.Form):

    ac_year=forms.IntegerField(label="Academic Year")
    semester=forms.ChoiceField(label="Semester",choices=(("1","Odd"),("2","Even")))


class FacultyAttendanceform(forms.Form):

    ac_year=forms.IntegerField(label="Academic Year")
    semester=forms.ChoiceField(label="Semester",choices=(("1","Odd"),("2","Even")))
    studentid=forms.CharField(label="Student ID",max_length=9)
