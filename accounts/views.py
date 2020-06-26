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
        login(request,user)

        if user==None:
            
            messages.info(request,"Invalid Username or password")
            return redirect('/')

        else:
            if user.role:
                if request.user.is_authenticated:
                    return redirect("student/home/")    
                        
                

            elif user.role== False: 
                if request.user.is_authenticated:
                    return redirect("faculty/home/")    

            else:
                return HttpResponse("<h1>Access Denied</h1>")


def logout_request(request):

    auth.logout(request)

    return redirect("/")