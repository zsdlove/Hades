# -*- coding: utf-8 -*-
from django import forms
from captcha.fields import CaptchaField
class loginform(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True)
    #captcha = CaptchaField(label='验证码', error_messages={'invalid': u"验证码错误"})
    #遗留一个bug，captcha无法校验。