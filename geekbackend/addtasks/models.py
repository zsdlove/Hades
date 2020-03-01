# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class task_que(models.Model):
        taskid=models.IntegerField(primary_key=True)
        taskname=models.CharField(max_length=100)
        website=models.CharField(max_length=100)
        profile=models.CharField(max_length=100)
        inqueuetime=models.DateTimeField()
        starttime=models.DateTimeField()
        finishtime=models.DateTimeField()
        progress=models.IntegerField()
        status=models.IntegerField()
        taskmsg=models.CharField(max_length=100)
        flag=models.IntegerField()
        class Meta:
            managed = False
            db_table = 'task_que'

class scan_result(models.Model):
        taskid=models.IntegerField(primary_key=True)
        entry=models.TextField()
        result=models.TextField()
        high=models.IntegerField()
        middle=models.IntegerField()
        low=models.IntegerField()
        notice=models.IntegerField()
        headers=models.CharField(max_length=500)
        whois=models.TextField()
        class Meta:
            managed = False
            db_table = 'scan_result'

class assert_info(models.Model):
        assert_id=models.IntegerField(primary_key=True)
        assert_name=models.CharField(max_length=100)
        assert_data=models.CharField(max_length=200)
        assert_desc=models.CharField(max_length=200)

        class Meta:
             managed=False
             db_table='assert_info'

class user(models.Model):
        uid=models.IntegerField(primary_key=True)
        username=models.CharField(max_length=50)
        password=models.CharField(max_length=50)
        email=models.CharField(max_length=50)
        phone=models.CharField(max_length=50)
        privilege=models.IntegerField()

        class Meta:
                managed=False
                db_table='user'

class JavaWhiteBoxResult(models.Model):
        ID=models.IntegerField(primary_key=True)
        Data=models.TextField()
        TaskTime=models.DateTimeField()
        class Meta:
                managed=False
                db_table='JavaWhiteBoxResult'