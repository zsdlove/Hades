#-*-coding:utf-8-*-
'''
by pOny@moresec
用于存储全局栈帧，封装出栈入栈的一些操作，污点操作，栈的初始化工作。
stack.push 压栈
stack.pop 出栈
stack.Frame 初始化栈帧

frame
-----------
localvas=[]
pc=0
-----------
'''
class stack(object):

    def __init__(self,frameNum):
        self.frameNum=frameNum #设置stack大小
        self.ebp=""
        self.esp=0
        self.stack=[]
        self.methodCallType=None

    '''
    初始化栈帧
    '''
    def initFrame(self):
        pass

    '''
    出栈
    '''
    def pop(self):
        if self.stack:
            self.stack.pop()
        else:
            raise LookupError('stack is empty!')
    '''
    入栈
    '''
    def push(self,frame):
        self.stack.append(frame)


    def is_empty(self):
        return bool(self.stack)

    def top(self):
        #取出目前stack中最新的元素
        return self.stack[-1]
