#-*-coding:utf-8-*-
currentSource = None
sourceBelongTo = None
tainedFlag = False
from Hook.methodCallHook import *

'''
    find source method
'''
class TainedAnalyzer():
    def __init__(self):
        pass

    @methodCallHook
    def findsource(self,m1,m2):
        print("hello world")

        '''
        find sink method
        '''
    def findsink(methodName,parentMethodName):
        pass

        '''
        find clean method
        '''
    def findclean(methodName,parentMethodName):
        pass

if __name__ == '__main__':
    ta=TainedAnalyzer()
    ta.findsource(ta,"method1","method2")