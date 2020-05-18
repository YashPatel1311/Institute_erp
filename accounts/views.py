from django.shortcuts import render,HttpResponse,redirect
from django.contrib.auth.models import auth
from django.contrib import messages
from django.contrib.auth import login
from django.conf import settings


# Create your views here.
def index(request):
    if request.method == 'GET':
        return render(request,'index.html')

    else :

        email=request.POST['email']
        password=request.POST['password']

        
        user=auth.authenticate(username=email,password=password)


        if user==None:
            
            messages.info(request,"Invalid Username or password")
            return redirect('/')

        else:
            if user.student:
                return HttpResponse("The user is student")

            else: 
                return HttpResponse("The user is Faculty")