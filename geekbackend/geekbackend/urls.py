"""geekbackend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include,url
from django.contrib import admin
from addtasks import views
from django.conf import settings
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'geekscanner',views.index),
    url(r'addtasks2.html',views.showaddtaskspage),
	url(r'addnewtasks',views.handlenewtasks),
	url(r'tasks-*',views.show_task_info),
	url(r'unrealized.html',views.unrealized),
	url(r'aboutme.html',views.aboutme),
	url(r'sysconfig.html',views.set_sysconfig),
	url(r'test.html',views.test),
	url(r'assert_entry.html',views.assert_entry),
	url(r'handle_newassert_entry',views.handle_newassert_entry),
	url(r'emergencyresp.html',views.showemergencyresp),
	url(r'login.html',views.login),
	url(r'login',views.login),
	url(r'logout',views.logout_action),
	url(r'android_staticscan', views.render_android),
	url(r'Host_Security_Scan.html', views.render_HostSec),
	url(r'malware-analysis.html', views.render_malware_analysis),
	url(r'geekpage.html', views.render_showgeekpage),
	url(r'StepOnTheSpot.html', views.StepOnTheSpot),
	url(r'upload', views.handle_file_upload),
	url(r'apk_security_check', views.apk_security_check),
	url(r'malware-*', views.malware_analysis),
	url(r'getdata', views.getdata),
	]
