"""students URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from . import views
from . import base
from . import settings
from django.conf.urls import url
from django.contrib import admin
from django.urls import path
from django.views.static import serve

urlpatterns = [
    #用户操作链接
    url(r'^$', views.login),
    url(r'^login/$', views.login),
    url(r'^reg/$', views.reg),
    url(r'^logout/$', views.logout),
    url(r'^actionl/$', views.loginaction),
    url(r'^actionr/$', views.regaction),
    #状态链接
    url(r'^error/$', base.error),
    url(r'^success/$', base.success),
    #页面链接
    url(r'^index/$', views.index),
    url(r'^addcourse/$', views.addcourse),
    url(r'^changecourse/$', views.changecourse),
    url(r'^coursedel/$', views.coursedel),
    # 设备
    url(r'^adddetail/$', views.adddetail),
    url(r'^changedetail/$', views.changedetail),
    url(r'^delth/$', views.delth),
    # 设备列表管理
    url(r'^course/$', views.course),
    # 设备信息管理
    url(r"^report/$", views.report),
    # 系统链接
    url(r'^sys/$', views.sys),
    url(r'^changesys/$', views.changesys),
]