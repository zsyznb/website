import re
from pydub.utils import make_chunks
from pydub import AudioSegment
from django.http.response import HttpResponseRedirect
from django.shortcuts import render
import hashlib
import base64
import os

context = {}

def error(request):
    context['message'] = request.GET.get("message")
    context['goUrl'] = request.GET.get("goUrl")
    context['adrUrl'] = request.GET.get("adrUrl")
    context['goTime'] = request.GET.get("goTime")
    return render(request, "status/error.html", context)

def success(request):
    context['message'] = request.GET.get("message")
    context['goUrl'] = request.GET.get("goUrl")
    context['adrUrl'] = request.GET.get("adrUrl")
    context['goTime'] = request.GET.get("goTime")
    return render(request, "status/success.html", context)

def makeSql():
    os.system("python manage.py inspectdb > ./students/models.py")

def md5s(str):
    md = hashlib.md5()
    md.update(str.encode(encoding='utf-8'))
    return md.hexdigest()


def similar(str1, str2):
    str1 = str1 + ' ' * (len(str2) - len(str1))
    str2 = str2 + ' ' * (len(str1) - len(str2))
    return sum(1 if i == j else 0
               for i, j in zip(str1, str2)) / float(len(str1))


def checkLogin(request):
    if None == request.session.get("userid"):
        return False

def ToBase64(file):
    file1 = open(file, "rb").read()
    text = base64.b64encode(file1)
    return text.decode()

def find_samenumber(list1,list2):
    A = set(list1).intersection(set(list2))
    B = set(list1).union(set(list2))
    C = set(list1).difference(set(list2))
    D = set(list2).difference(set(list1))
    return A,B,C,D
