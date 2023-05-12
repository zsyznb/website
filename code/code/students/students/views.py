from django.shortcuts import render
from django.http import HttpResponseRedirect
from . import base
from hashlib import md5
import time
from django.views.decorators.csrf import csrf_exempt
from students.models import *
from students import models
from django.db import connection
import os

context = {}

'''
登录页面
'''
def login(request):
    
    contexts = syscontent(context)

    return render(request, 'login.html', contexts)
'''
注册页面
'''
def reg(request):
    
    contexts = syscontent(context)
    
    return render(request, 'reg.html', contexts)

# 退出登录
def logout(request):
    del request.session["userid"]
    del request.session["username"]
    return HttpResponseRedirect('/success?message=注销成功&goUrl=/login&adrUrl=登录页&goTime=3')

#登录操作
def loginaction(request):

    name = request.POST.get("name")
    pwd = request.POST.get("pwd")

    if(len(name) == 0 or len(pwd) == 0):
        return HttpResponseRedirect('/error?message=用户名或密码不能为空&goUrl=/login&adrUrl=登录页&goTime=3')

    data = Appuser.objects.get(username=name)

    if data == None:
        return HttpResponseRedirect('/error?message=用户名错误&goUrl=/login&adrUrl=登录页&goTime=3')

    if data.passwordhash != md5(pwd.encode('utf8')).hexdigest():
        return HttpResponseRedirect('/error?message=密码错误&goUrl=/login&adrUrl=登录页&goTime=3')

    request.session["userid"] = data.id
    request.session["username"] = data.username

    return HttpResponseRedirect('/success?message=登录成功&goUrl=/index&adrUrl=首页&goTime=3')

#注册操作
def regaction(request):

    name = request.POST.get("name")
    pwd = request.POST.get("pwd")

    if(len(name) == 0 or len(pwd) == 0):
        return HttpResponseRedirect('/error?message=用户名或密码不能为空&goUrl=/reg&adrUrl=注册页&goTime=3')

    data = Appuser.objects.filter(username=name)

    if len(data) != 0:
        return HttpResponseRedirect('/error?message=用户名称重复&goUrl=/reg&adrUrl=注册页&goTime=3')

    Appuser.objects.create(
        username=name,
        passwordhash=md5(pwd.encode('utf8')).hexdigest()
    )

    return HttpResponseRedirect('/success?message=注册成功&goUrl=/&adrUrl=登录页&goTime=3')
    
'''
首页
'''
def index(request):

    if(base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    context['localtime'] = time.asctime(time.localtime(time.time()))
    context['adr'] = 'index'

    contexts = syscontent(context)

    return render(request, 'index.html', contexts)

'''
view action
操作动作
'''

# 设备信息管理
def report(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    id = request.GET.get("id","")
    qs = request.GET.get("qs", "")

    if id == "":
        course = Course.objects.all()
        if len(course) == 0:
            return HttpResponseRedirect('/error?message=请先添加设备种类&goUrl=/course/&adrUrl=管理页面&goTime=1')
        id = course[0].id
    
    ctd = Course.objects.get(id=id)

    context['title'] = ctd.content
    context['dtitle'] = ctd.title
    klass = getattr(models,str(ctd.title).title())
    if qs == "":
        item = klass.objects.all()
    else:
        item = klass.objects.filter(did=qs).all()
    context['item'] = item
    context['adr'] = "report"
    context['id'] = id

    contexts = syscontent(context)
    
    return render(request, "report.html", contexts)

# 删除设备信息
def delth(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    id = request.GET.get("id")
    title = request.GET.get("title")

    klass = getattr(models, str(title).title())
    klass.objects.filter(id=id).delete()

    ctd = Course.objects.get(title=title)

    return HttpResponseRedirect('/success?message=删除成功&goUrl=/report/?id='+str(ctd.id)+'&adrUrl=管理页面&goTime=1')

@csrf_exempt
def adddetail(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    title = request.POST.get("title")
    did = request.POST.get("did")
    company = request.POST.get("company")
    paramter = request.POST.get("paramter")
    add_time = request.POST.get("add_time")

    klass = getattr(models, str(title).title())
    klass.objects.create(
        did=did,
        company=company,
        paramter=paramter,
        add_time=add_time,
    )

    ctd = Course.objects.get(title=title)

    return HttpResponseRedirect('/success?message=添加成功&goUrl=/report/?id='+str(ctd.id)+'&adrUrl=管理页面&goTime=1')

@csrf_exempt
def changedetail(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    title = request.POST.get("title")
    id = request.GET.get("id")
    did = request.POST.get("did")
    company = request.POST.get("company")
    paramter = request.POST.get("paramter")
    add_time = request.POST.get("add_time")

    klass = getattr(models, str(title).title())
    klass.objects.filter(id=id).update(
        did=did,
        company=company,
        paramter=paramter,
        add_time=add_time,
    )

    ctd = Course.objects.get(title=title)

    return HttpResponseRedirect('/success?message=修改成功&goUrl=/report/?id='+str(ctd.id)+'&adrUrl=管理页面&goTime=1')

'''
操作控制函数
'''
# 设备种类管理
def course(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    qs = request.GET.get("qs", "")

    klass = getattr(models, "Course")
    if qs == "":
        item = klass.objects.all()
    else:
        item = klass.objects.filter(title=qs).all()
    course = item

    context['course'] = course
    context['adr'] = "course"
    
    contexts = syscontent(context)
    
    return render(request, "course.html", contexts)

#添加数据
@csrf_exempt
def addcourse(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')
    
    title = request.POST.get("title")
    content = request.POST.get("content")

    exist = Course.objects.filter(title=title)

    if len(exist) == 0:
        Course.objects.create(
            title=title,
            content=content
        )
    cursor = connection.cursor()
    cursor.execute('''DROP TABLE IF EXISTS `'''+title+'''`''')
    sql = '''CREATE TABLE `'''+title+'''` (`id` int(11) NOT NULL AUTO_INCREMENT,`did` varchar(255) DEFAULT NULL,`company` varchar(255) DEFAULT NULL,`paramter` text,`add_time` timestamp NULL DEFAULT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8'''
    cursor.execute(sql)
    base.makeSql()

    return HttpResponseRedirect('/success?message=添加成功&goUrl=/course/&adrUrl=管理页面&goTime=1')

#修改数据
@csrf_exempt
def changecourse(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')

    id = request.GET.get("id")
    title = request.POST.get("title")
    content = request.POST.get("content")

    Course.objects.filter(id=id).update(
        title=title,
        content=content
    )

    return HttpResponseRedirect('/success?message=修改成功&goUrl=/course/&adrUrl=管理页面&goTime=1')

#删除数据
def coursedel(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')
    
    id = request.GET.get("id")
    
    Course.objects.filter(id=id).delete()

    return HttpResponseRedirect('/success?message=删除成功&goUrl=/course/&adrUrl=管理页面&goTime=1')

            
# 系统内部设置页面
def sys(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')
    
    context['adr'] = "sys"
    contexts = syscontent(context)
    
    return render(request, "sys.html", contexts)

#修改系统内部设置
def changesys(request):

    if (base.checkLogin(request) == False):
        return HttpResponseRedirect('/error?message=请先登录系统&goUrl=/&adrUrl=登录页&goTime=1')
    
    name = request.POST.get("name")
    code = request.POST.get("code")
    content = request.POST.get("content")
    cp = request.POST.get("cp")
    add = request.POST.get("add")
    
    Sys.objects.filter(id=1).update(
        code=code,
        name=name,
        content=content,
        add=add,
        cp=cp
    )
    
    return HttpResponseRedirect('/success?message=修改成功&goUrl=/sys/&adrUrl=系统设置&goTime=1')

# 基础数据库数据调用
def syscontent(retg):

    sys = Sys.objects.get(id=1)

    admin_left = []

    url = Urls.objects.filter(rank=2).all()
    for x in url:
        admin_left.append({
            "path":x.path,
            "name": x.name,
            "adr": x.adr,
            "rank": x.rank
        })
    top_left = []
    top = Course.objects.all()
    if len(top) > 0:
        for dx in top:
            top_left.append({
                "id":dx.id,
                "title":dx.title
            })

    retg['top_left'] = top_left
    retg['left_list'] = admin_left
    retg['webtitle'] = sys.name
    retg['content'] = sys.content
    retg['cp'] = sys.cp
    retg['code'] = sys.code
    retg['add'] = sys.add
    return retg