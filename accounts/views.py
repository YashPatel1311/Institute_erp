from django.shortcuts import render,redirect
from django.http import HttpResponse,request

# Create your views here.
def index(request):
    return HttpResponse("Hi there!")