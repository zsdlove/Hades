#-*-coding:utf-8-*-
'''
栈帧对象
pOny@moresec
'''
class frame(object):

    def __init__(self,reglist):
        self.localvars=reglist
        self.pc=0
        self.funcionName=""
        self.in_reg=[]
        self.out_reg=[]
        self.tainedFlag=False