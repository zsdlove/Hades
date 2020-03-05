#-*-coding:utf-8-*-
'''
by pOny@moreesec
2019.12.26
miniDVM interpreter for interpretering the smali instructions.
'''
import re
from register import register
from fakeHeap import fakeHeap
from stack import stack
from frame import frame
import random
import hashlib
from config import *
import sys
from cfg.graphManage import graphTools
from cfg.cfgManage import CFGBuilder
import os
sys.setrecursionlimit(1000000)

class miniDVM(object):
    def __init__(self):
        self.methodHash=""
        self.methodName=""
        self.currentMethodNode=None#当前的方法节点
        self.regTable=[]
        self.currentSource=None
        self.currentSink=None
        self.linearCode=None
        self.resultContainer={
            "author": "pOny@moresec",
            "version": "v1.0.0",
            "permission": [],
            "codeAnalysis": [],
            "warming": []
        }
        self.tainedHash=""
        self.sourceBelongTo=None
        self.codeSegment=[]
        '''
        create system stack
        '''
        self.stack=stack(1024)#系统栈

        '''
        create fake heap
        '''
        hp=fakeHeap()
        hp.arrayContainer={}
        self.hp=hp
        '''
        goto table,map ins->interpreter method
        '''
        self.goto_table={
            "invoke-virtual":self.handle_invoke,
            "invoke-virtual/range": self.handle_invoke,
            "invoke-static": self.handle_invoke,
            "invoke-direct": self.handle_invoke,
            "invoke-super": self.handle_invoke_super,
            "invoke-static/range": self.handle_invoke,
            "invoke-interface": self.handle_invoke,
            "invoke-interface-range": self.handle_invoke,
            "invoke-super/range": self.handle_invoke_super,
            "invoke-direct/range": self.handle_invoke,
            "move-result-object": self.handle_move_result,
            "move-result": self.handle_move_result,
            "move-result-wide": self.handle_move_result,
            "move-exception": self.handle_move_result,
            "move-object": self.handle_move,
            "move-object/from16":self.handle_move,
            "move-object/16":self.handle_move,
            "move-wide": self.handle_move,
            "move-wide/from16": self.handle_move,
            "move-wide/16": self.handle_move,
            "move": self.handle_move,
            "move/from16": self.handle_move,
            "move/16": self.handle_move,
            "const-string": self.handle_const,
            "const-string-jumbo": self.handle_const,
            "const": self.handle_const,
            "const/4":self.handle_const,
            "const/8":self.handle_const,
            "const/16":self.handle_const,
            "const/high16":self.handle_const,
            "const-wide/16":self.handle_const,
            "const-wide/32":self.handle_const,
            "const-wide":self.handle_const,
            "const-wide/high16":self.handle_const,
            "const-class": self.handle_const,
            "goto":self.handle_goto,
            "goto/16":self.handle_goto,
            "goto/32":self.handle_goto,
            ".registers":self.handle_registers,
            ".line":self.handle_line,
            "check-cast":self.default,
            "if-eqz":self.default,
            "default":self.default,
            "return":self.handle_return,
            "return-object":self.handle_return,
            "return-void":self.handle_return,
            "return-wide":self.handle_return,
            "new-array": self.handle_array_create,
            "aput-object": self.handle_aput,
            "aget-object": self.handle_aget,
            "aget-wide": self.handle_aget,
            "aput-wide": self.handle_aput,
            "aget-boolean": self.handle_aget,
            "aput-boolean": self.handle_aput,
            "aget-byte": self.handle_aget,
            "aput-byte": self.handle_aput,
            "aget-char": self.handle_aget,
            "aput-char": self.handle_aput,
            "aget-short": self.handle_aget,
            "aput-short": self.handle_aput,
            "iput-object": self.handle_aput,
            "iget-object": self.handle_aget,
            "iget-wide": self.handle_aget,
            "iput-wide": self.handle_aput,
            "iget-boolean": self.handle_aget,
            "iput-boolean": self.handle_aput,
            "iget-byte": self.handle_aget,
            "iput-byte": self.handle_aput,
            "iget-char": self.handle_aget,
            "iput-char": self.handle_aput,
            "iget-short": self.handle_aget,
            "iput-short": self.handle_aput,
            "sput-object": self.default,
            "sget-object": self.default,
            "sget-wide": self.default,
            "sput-wide": self.default,
            "sget-boolean": self.default,
            "sput-boolean": self.default,
            "sget-byte": self.default,
            "sput-byte": self.default,
            "sget-char": self.default,
            "sput-char": self.default,
            "sget-short": self.default,
            "sput-short": self.default,
            "new-instance": self.default,
            "packed-switch": self.default,
            "sparse-switch": self.default,
        }

    '''
    初始化dvm
    '''
    def initVM(self,activityEntryList, apkname):
        sinkblocks=[]
        sourceblocks=[]
        entry_count=1
        bytecodePath = 'workspace/result/%s/' % apkname
        cfgbuilder = CFGBuilder(bytecodePath)
        for activityEntry in activityEntryList:
                imgName=activityEntry.split(";")[0]
                activityEntry = activityEntry.replace(".", "/")
                logging.info("[DVM] - Start to build  cfg %d from the entry：%s"%(entry_count,activityEntry.encode('utf-8')))
                print("[DVM] - Start to build  cfg %d from the entry：%s"%(entry_count,activityEntry.encode('utf-8')))
                '''
                指令流构建
                '''
                entry_count+=1
                '''
                md5_handle=hashlib.md5()
                md5_handle.update(activityEntry)
                encode_name=md5_handle.hexdigest()
                '''
                isExists=os.path.exists(bytecodePath+"images")
                if not isExists:
                    os.makedirs(bytecodePath+"images")
                    cfgbuilder.imagepath=bytecodePath+"/images/"+imgName
                else:
                    cfgbuilder.imagepath = bytecodePath + "/images/" + imgName
                if 1==1:
                    cfgbuilder.do_instructionflow(activityEntry.encode("utf-8"))
                    '''
                    存储有向图Digraph
                    '''
                    logging.info("[Graph] - build the cfg successfully.")
                    print("[Graph] - build the cfg successfully.")

                    Diagraph=cfgbuilder.Diagraph
                    edges, graph, nodeset, hashgraph = [], {}, set(), {}
                    graphTools.fixblock(edges, Diagraph)  # 修复一下edges
                    graphTools.genSimpleGraph(nodeset, edges, graph)  # 生成简单的指令流图

                    firstblock = None
                    fbflag=False
                    for code in nodeset:
                        for fb in firstBlockList:
                            if fb in code:
                                firstblock=code
                                fbflag=True
                                break
                        if fbflag==True:
                            break
                    '''
                    从block中找到sink和source
                    '''
                    for codeblock in nodeset:
                        for sink in sinkContainer:
                            if sink in codeblock:
                                sinkblocks.append(codeblock)
                                logging.info("[Init] - 	sink点:%s" % sink)
                                cbk=codeblock.split("\l")
                                warming_sink={
                                    "sink":sink,
                                    "source":"",
                                    "sinkBelongTo":self.methodName,
                                    "sourceBelongTo":"",
                                    "linearCode":cbk
                                }
                                self.resultContainer["warming"].append(warming_sink)
                                logging.info("成功记录一条敏感点.")

                        for source in sourceContainer:
                            if source in codeblock:
                                logging.info("[Init] - 	source点:%s" % source)
                                cbk=codeblock.split("\l")
                                warming_source = {
                                    "sink": "",
                                    "source": source,
                                    "sinkBelongTo": "",
                                    "sourceBelongTo": self.methodName,
                                    "linearCode": cbk
                                }
                                self.resultContainer["warming"].append(warming_source)
                                sourceblocks.append(codeblock)

                    '''
                    路线确定
                    '''
                    start = 'Lfridatest/test/com/myapplication/MainActivity; onCreate(Landroid/os/Bundle;)V 39\l39: .line 40\l40: invoke-static {v3, v7}, Lfridatest/test/com/myapplication/MainActivity;->demofunc(Ljava/lang/String;I)Ljava/lang/String;\l'
                    end = 'Lfridatest/test/com/myapplication/MainActivity; onCreate(Landroid/os/Bundle;)V 41\l41: move-result-object v1\l42: .line 41\l43: .local v1, \:Ljava/lang/String;\l44: sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;\l45: invoke-virtual {v4, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V\l'

                    if firstblock != None and len(graph.keys())<1000:
                        logging.info("[engine] - 预计至少有%d条路线." % len(sinkblocks))
                        for sink in sinkblocks:
                            results = []
                            logging.info("[Graph] - Searching the access routes between the two blocks given.")
                            print("[Graph] - Searching the access routes of the two blocks given.")
                            r = graphTools.searchGraph(graph, firstblock, sink, results)
                            if results == None or results == "[]" or results == "":
                                logging.info("[Graph] - Complete analysis of the entry %s ,which has no access routes."%activityEntry)
                                print("[Graph] - Finished analysis the entry %s which has no access routes."%activityEntry)
                                break
                            logging.info("[Graph] - Find the access route.")
                            print("[Graph] - Find the access route.")
                            for block in results:
                                linearCode = []
                                for b in block:
                                    block = b.split("\\l")
                                    for blockcode in block:
                                        logging.info("[Graph] - %s" % blockcode)
                                        linearCode.append(blockcode)
                                self.codeSegment.append(linearCode)
                    logging.info("[Graph] Complete the analysis of cfg.")
                    print("[Graph] Complete the analysis of cfg.")
        logging.info("======代码======")
        for codes in self.codeSegment:
            logging.info("-------------")
            for code in codes:
                logging.info("%s"%code)
    '''
    初始化寄存器表，每一个函数一个表
    '''
    def initregTable(self,regTable):#针对每一个构建一个虚拟寄存器表
        self.regTable=regTable

    def run(self):
        for lc in self.codeSegment:
			self.exec1(lc)

    '''
    函数入参分析
    主要为了应对{v0 ... v5这种多参数情况}
    '''
    def parameterAnalysis(self,ins):
        p1 = re.compile(r'[{](.*?)[}]',re.S).findall(ins)
        reglist=[]
        if ".." in p1[0]:
            startIndex=int(p1[0].split(' .. ')[0][1])
            endIndex=int(p1[0].split(' .. ')[1][1])
            for i in range(startIndex,endIndex+1):
                reglist.append("v"+str(i))
            return reglist
        else:
            reglist=p1[0].split(",")
            return reglist

    def generateRegTable(self):
        registerTable = []
        #从上一个栈帧中的out_reg中取得参数列表，存储到当前frame的in_reg中，然后再将in_reg传入到registerTable中
        '''
        for i in range(20):
            registerTable.append(register("p%d" % i, ""))
        '''
        #这里固定分配200个虚拟寄存器给下一个函数用
        for i in range(200):
            registerTable.append(register("v%d" % i, ""))
        return registerTable
    '''
    将栈帧压入系统栈中
    并将esp指向当前栈帧
    '''
    def push(self):
        '''
        为新函数重新分配虚拟寄存器
        '''
        self.initregTable(self.generateRegTable())
        fm=frame(self.regTable)
        fm.funcionName=self.methodName
        self.stack.push(fm)
        self.stack.esp=len(self.stack.stack)-1#获取栈顶指针
        if self.stack.esp-1>-1:#判断栈的深度是否为0，如果为0则说明是主函数执行阶段。
            in_reg=len(self.stack.stack[self.stack.esp-1].out_reg)
            for rrr in self.stack.stack[self.stack.esp-1].out_reg:
                logging.info("[DVM] - out_reg==>%s  污点属性:%s"%(rrr.name,rrr.isTained))
            if self.stack.methodCallType=="invoke-virtual":
                if in_reg==1:
                    r0=register("p0","")#相当于this指针，用于获取上下文信息
                    r1 = register("p1", "")
                    r1.isTained = self.stack.stack[self.stack.esp - 1].out_reg[0].isTained
                    self.stack.stack[self.stack.esp].localvars.append(r0)
                    self.stack.stack[self.stack.esp].localvars.append(r1)
                elif in_reg>1:
                    for i in range(1, in_reg):
                        r = register("p%d" % i, "")
                        r.isTained = self.stack.stack[self.stack.esp - 1].out_reg[i].isTained
                        self.stack.stack[self.stack.esp].localvars.append(r)
                else:
                    pass
            else:#针对static和direct引用
                for i in range(in_reg):
                    r=register("p%d"%i,"")
                    r.isTained=self.stack.stack[self.stack.esp-1].out_reg[i].isTained
                    self.stack.stack[self.stack.esp].localvars.append(r)
            logging.info("[DVM] - esp==>%s"%self.stack.esp)
            logging.info("[DVM] - 函数==>%s"%self.methodName)
            for reg in self.stack.stack[self.stack.esp].localvars:
                logging.info("[DVM] - 寄存器名：%s,污点属性：%s"%(reg.name,reg.isTained))
        #self.stack.esp=self.stack.esp+1
    '''
    当分析到函数调用的时候，查下当前的callgraph中是否有
    '''
    def exec1(self,linearcode):
        '''
        block analysis&opcode exec
        使用递归遍历代码块链的方式解析每个函数中的指令
        这里需要匹配出指令
        '''
        self.linearCode=linearcode
        def linearCodeAnalysis(linearcode):
            if linearcode != "" and linearcode!=None:
                for ins in linearcode:
                    self.analysis(ins)
                    logging.info("[DVM] - analysis ins:%s"%ins)

        linearCodeAnalysis(linearcode)

    '''
    默认处理方法
    '''
    def default(self,ins):
        pass

    '''
    处理父函数调用
    '''
    def handle_invoke_super(self,ins):
        pass

    '''
    处理行标签，忽略
    '''
    def handle_line(self,ins):
        pass

    '''
    当前函数虚拟执行完毕，弹出当前栈帧，栈顶指针降低
    '''
    #return-object
    def handle_return(self,ins):
        #logging.info("[DVM] - 方法名 %s"%self.stack.stack[self.stack.esp].funcionName)
        self.stack.pop()
        self.stack.esp=len(self.stack.stack)-1

    '''
    处理数组创建
    在heap内存中为数组分配一个内存空间，并使用寄存器px指向该内存，并将该寄存器
    push到dvm栈中（栈中保留该内存区域的引用地址）
    '''
    def handle_array_create(self,ins):
        #new-array v15, v6, [Ljava/lang/Object;
        ins = ins.replace("new-array ", "")
        p1 = ins.split(",")[0]#v15
        p2=ins.split(",")[1].replace(" ","")#v6
        index=0
        for reg in self.stack.stack[self.stack.esp].localvars:
            if reg.name==p2:
                index=reg.value
                break
        newarr=[]
        #print("初始化数组")
        if index!="":
            index=int(str(index).replace("0x",""))
            for i in range(index):
                reg1=register(i,"")
                newarr.append(reg1)
            self.hp.arrayContainer[p1]=newarr
        '''
        push 数组引用信息到stack中
        '''
    '''
    处理函数返回（返回对象）
    '''
    def handle_move_result(self,ins):
        regname = ins.split(" ")[1]
        if self.stack.stack[self.stack.esp].tainedFlag == True:
            r = register(regname, "")
            r.isTained = True
            r.hashcode=self.tainedHash
            '''
            修改寄存器的污点属性
            '''
            for i in range(len(self.stack.stack[self.stack.esp].localvars)):
                if self.stack.stack[self.stack.esp].localvars[i].name==regname:
                    self.stack.stack[self.stack.esp].localvars[i].isTained=True
            logging.info("[DVM] - 发现了第一个污点寄存器 %s"%r.name)
            self.stack.stack[self.stack.esp].tainedFlag = False
            self.tainedHash=""


    '''
    处理函数调用（virtual）
    在处理函数调用的时候，判断如果该函数在调用图中的话，则初始化其堆栈信息，跳转到该函数进行分析。
    分析完毕后回来继续分析。这里需要有一个可以存储返回值信息的寄存器。
    '''

    def handle_invoke(self,ins):
        invokedMethodName = re.compile(r'L.*').findall(ins)
        logging.info("checking...%s"%invokedMethodName)
        '''
        污点分析
        '''

        '''
        找到source
        '''

        for source in sourceContainer:
                    if source == invokedMethodName[0]:
                        logging.info("[DVM] 找到source点 %s"%invokedMethodName)
                        self.currentSource=source
                        self.sourceBelongTo=self.methodName
                        hashcode=self.hashComputing(ins)
                        self.stack.stack[self.stack.esp].tainedFlag = True
                        self.tainedHash=hashcode
                        break

        '''
        找到sink,这里的污点分析可以用hook(装饰器)来做，不过之前的代码侵入性比较强，改造起来比较麻烦，后续再迭代更新吧。
        '''
        tmpName, tmpTained, flag = None, None, False
        for sink in sinkContainer:
                    if sink == invokedMethodName[0]:
                        regs = self.parameterAnalysis(ins)

                        for reg in regs:#遍历参数列表
                             reg=reg.replace(" ","")
                             for r in self.stack.stack[self.stack.esp].localvars:
                                tmpName,tmpTained=r.name,r.isTained
                                if tmpName==reg and tmpTained==True:
                                    flag=True
                                    break
                             if flag == True:
                                    logging.info("[DVM] - 找到sink点 %s"%invokedMethodName[0])
                                    self.currentSink=invokedMethodName[0]
                                    #结果存储
                                    self.resultContainer["codeAnalysis"].append({
                                        "sink":self.currentSink,
                                        "source":self.currentSource,
                                        "linearCode":self.linearCode,
                                        "sinkBelongTo":self.methodName,
                                        "sourceBelongTo":self.sourceBelongTo
                                    })
                                    #flag=False
                                    break
                        break
        if flag==False:
            regs = self.parameterAnalysis(ins)
            plag=False
            for reg in regs:  # 遍历参数列表
                reg = reg.replace(" ", "")
                for r in self.stack.stack[self.stack.esp].localvars:
                    tName, tTained = r.name, r.isTained
                    if tName == reg and tTained == True:
                        self.stack.stack[self.stack.esp].tainedFlag=True
                        plag=True
                        break
                if plag==True:
                    break
        '''
        这里为下一步的函数间分析做准备,即将函数调用的传参信息输出到当前frame的out_reg中
        '''
        def setMethodCallType(ins):
            methodCallType=ins.split(" ")[0]
            self.stack.methodCallType=methodCallType

        setMethodCallType(ins)
        out_reg_list=self.parameterAnalysis(ins)
        out_reg=[]
        for reg_name in out_reg_list:
            r=register(reg_name.replace(" ",""),"")
            for reg in self.stack.stack[self.stack.esp].localvars:
                if reg_name.replace(" ","")==reg.name:
                    logging.info("[DVM] - 函数间污点追踪找到寄存器%s(%s)"%(r.name,r.isTained))
                    if reg.isTained==True:
                        r.isTained=True
                        logging.info("[DVM] - 函数间污点传播%s(%s)"%(r.name,r.isTained))
                        out_reg.append(r)
                        break
                    else:
                        r.isTained=False
                        out_reg.append(r)
                        break
        self.stack.stack[self.stack.esp].out_reg=out_reg

    '''
    处理对象赋值
    '''
    def handle_move(self,ins):
        reg = re.compile(r' v.*').findall(ins)
        leftreg = reg[0].split(",")[0].replace(" ", "")
        rightreg = reg[0].split(",")[1].replace(" ", "")

        for regobj in self.stack.stack[self.stack.esp].localvars:
            if regobj.name == rightreg:
                if regobj.isTained == True:
                    r = register(leftreg, "")
                    r.isTained = True
                    r.hashcode=regobj.hashcode
                    for i in range(len(self.stack.stack[self.stack.esp].localvars)):
                        if r.name==self.stack.stack[self.stack.esp].localvars[i].name:
                            self.stack.stack[self.stack.esp].localvars[i].isTained=True
                            break
                    logging.info("[DVM] - [污点传播] 指令：%s"%ins)
                    logging.info("[DVM] - [污点传播] %s -> %s "%(rightreg,leftreg))
                    break
    '''
    处理常量指令(4位常量)
    '''
    def handle_const(self,ins):#这里有问题
        # const/4 v6, 0x2
        rex = re.compile(r'p.*|v.*').findall(ins)
        reg = rex[0].split(",")[0].replace(" ", "")
        value = rex[0].split(",")[1].replace(" ", "")
        for i in range(len(self.stack.stack[self.stack.esp].localvars)):
            if self.stack.stack[self.stack.esp].localvars[i].name==reg:
                self.stack.stack[self.stack.esp].localvars[i].value=value
                logging.info("[DVM] - 寄存器赋值：%s = %s"%(reg,value))
                break

    '''
    处理goto,cfg构建时已实现了此指令
    '''
    def handle_goto(self,ins):
        blocklabel = ins.split(":")[1]

    '''
    处理数组put操作
    '''
    def handle_aput(self,ins):
        # aput-object v12, v15, v6
        reg = re.compile(r'v.*').findall(ins)
        leftreg = reg[0].split(",")[0].replace(" ", "")
        midreg = reg[0].split(",")[1].replace(" ", "")
        rightreg = reg[0].split(",")[2].replace(" ", "")

        logging.info("[DVM] - [数组操作] %s"%ins)
        logging.info("[DVM] - [数组操作] leftreg %s"%leftreg)
        logging.info("[DVM] - [数组操作] midreg %s"%midreg)
        logging.info("[DVM] - [数组操作] rightreg %s"%rightreg)

        for regobj in self.stack.stack[self.stack.esp].localvars:
            if regobj.name == leftreg:
                if regobj.isTained == True:
                    for r in self.stack.stack[self.stack.esp].localvars:
                        if r.name == rightreg:
                            logging.info("寄存器名:%s 索引值:%s"%(r.name,r.value))
                            index=int(r.value.replace("0x",""))
                            self.hp.arrayContainer[midreg][index].hashcode=regobj.hashcode
                            self.hp.arrayContainer[midreg][index].isTained=True
                            '''
                            需要对fake heap中存储的数组元素（也是register对象）的hashcode属性进行修改
                            '''

                            logging.info("[DVM] - [数组操作] 污点寄存器 %s" % leftreg)
                            logging.info("[DVM] - [数组操作] 污点传给了数组 %s 下标为%s的成员"%(midreg,str(index)))
                            break

    '''
    处理数组get操作
    '''
    def handle_aget(self,ins):
        print("===>ins:%s"%ins)
        reg = re.compile(r'v.*').findall(ins)
        leftreg = reg[0].split(",")[0].replace(" ", "")
        midreg = reg[0].split(",")[1].replace(" ", "")
        rightreg = reg[0].split(",")[2].replace(" ", "")
        # 这里应该先看下v15这个数组是否是污点的，然后再看下污点下标,之后再修吧
        for i in range(len(self.stack.stack[self.stack.esp].localvars)):
            r=self.stack.stack[self.stack.esp].localvars[i]
            if r.name == rightreg:
                 logging.info("[DVM] - 寄存器名:%s"%r.name)
                 logging.info("[DVM] - 寄存器值:%s"%r.value)
                 logging.info("[DVM] - 指令：%s"%ins)
                 index=int(r.value.replace("0x",""))
                 bflag=False
                 try:
                     if self.hp.arrayContainer[midreg][index].isTained==True:
                        logging.info("[DVM] - [数组操作] 数组 %s 偏移为 %s 的成员是污点"%(midreg, r.value))
                        logging.info("[DVM] - [数组操作] 污点传播: %s[%s] -> %s"%(midreg, r.value,leftreg))
                        for j in range(len(self.stack.stack[self.stack.esp].localvars)):
                            if self.stack.stack[self.stack.esp].localvars[j].name==leftreg:
                                self.stack.stack[self.stack.esp].localvars[j].isTained=True
                                break
                        bflag=True
                        break
                 except:
                     pass
                 if bflag==True:
                     break

    '''
    处理寄存器数量标签
    '''
    def handle_registers(self,ins):
        pass

    '''
    指令解释入口
    如果是sdk中的类则不创建栈帧，类似println等
    '''
    def analysis(self,ins):
        '''
        默认支持goto表中的指令解析，其他的一律调用default函数处理
        '''
        #try:
        '''
        寻找函数引用
        '''
        def funcfind(ins):
            p1 = re.compile(r'^L(.*) \d+').findall(ins)#匹配块名
            if p1 != [] and p1 != "" and p1 != '[]':
                return True
            else:
                return False
            return False

        '''
        method Hash 校验
        '''
        def compareMethodHash(ins):

            p1 = re.compile(r'^L(.*) \d+').findall(ins)[0]
            this_md5=hashlib.md5()
            this_md5.update(p1)
            method_hash=this_md5.hexdigest()
            if method_hash==self.methodHash:
                return True,method_hash,p1
            else:
                return False,method_hash,p1
            return False
        '''
         初始化新栈帧&入栈,需要有一个当前分析函数这么一个变量，计算hash值匹配
         需要知道的是，这里块的第一条信息是块的名字
         类似：Lfridatest/test/com/myapplication/MainActivity; send(Ljava/lang/String;)V 1这般
         '''
        if funcfind(ins)==True:#匹配块名，如果是块名且方法名和当前的方法名不一样，那么进行栈帧分配操作
            isCurrentMethod,method_hash,mn=compareMethodHash(ins)#对比方法名hash
            logging.info("[DVM] - 方法HASH比对%s"%ins)
            logging.info("[DVM] - isCurrentMethod:%s"%isCurrentMethod)
            if isCurrentMethod==True:#如果是旧的函数
                pass
            else:
                self.methodHash=method_hash
                self.methodName=mn
                self.push()
        else:
            ins1=ins.split(" ")#0是编号
            #12: if-ge v0, v2, :cond_2e
            ins2=re.compile(r'^\d+: (.*)').findall(ins)
            if "invoke-virtual" in ins:
                logging.info("lalalal--->%s"%ins)
            if ins1!=None and ins1!=[''] and len(ins1)>1 and ins2!=[] and ins2!=None:
                self.goto_table.get(ins1[1],self.default)(ins2[0])
        #except:
         #   self.goto_table["default"](ins,self.regTable)
    '''
    hash computing for route.
    '''
    def hashComputing(self,ins):
        ranstr=str(random.randint(10000,99999))
        inshash=hashlib.md5()
        inshash.update(ins.encode('utf-8'))
        return inshash.hexdigest()+ranstr
'''
dvm test
'''
if __name__ == '__main__':
    instructionList=[
        "invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;",#函数调用，干脆将source点也放进虚拟机跑算了
        "move-result-object v20",
        "move-object/from16 v21, v20",
        "move-object/from16 v7, v21",
        "goto :goto_54",
        "move-object/from16 v22,v7",
        "move-object/from16 v12, v22",
        "const/4 v6, 0x2",
        "aput-object v12, v15, v6",
        "const/4 v6, 0x2",
        "aget-object v33, v15, v6",
        "move-object/from16 v35, v33",
        "move-object/from16 v34, v35",
        "move-object/from16 v3, v34",
        "invoke-virtual/range {v0 .. v5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V"
    ]
    DVM=miniDVM("")
    #instructionList=funcnode.body[sourcelocation:bodysize]
    #for ins in instructionList:
    #   DVM.initregTable()
    #   DVM.analysis(ins)
    for ins in instructionList:
        DVM.analysis(ins)