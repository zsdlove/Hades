#-*-coding:utf-8-*-
#寄存器对象
class register(object):
    def __init__(self,name,value):
        self.name=name
        self.value=value
        self.isTained = False
        self.hashcode=None