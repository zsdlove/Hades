#-*-coding:utf-8-*-
from config import*

class TainedAnalyzer:

    def __init__(self):
        self.currentSource=None
        self.sourceBelongTo=None
        self.tainedFlag=False

    '''
    find source method
    '''
    def findsource(self,methodName,parentMethodName):
        for source in sourceContainer:
            if source == methodName:
                logging.info("[DVM] 找到source点 %s" % methodName)
                self.currentSource = source
                self.sourceBelongTo = parentMethodName
                self.tainedFlag = True
                break

    '''
    find sink method
    '''
    def findsink(self,ins,methodName):
        '''
        find sink
        '''
        for sink in sinkContainer:
            if sink == methodName:
                regs = self.parameterAnalysis(ins)
                tmpName, tmpTained, flag = None, None, False
                for reg in regs:  # 遍历参数列表
                    reg = reg.replace(" ", "")
                    for r in self.stack.stack[self.stack.esp].localvars:
                        tmpName, tmpTained = r.name, r.isTained
                        if tmpName == reg and tmpTained == True:
                            flag = True
                            break
                    if flag == True:
                        logging.info("[DVM] - 找到sink点 %s" % methodName)
                        self.currentSink = methodName
                        # 结果存储
                        self.resultContainer.append({
                            'sink': self.currentSink,
                            'source': self.currentSource,
                            'linearCode': self.linearCode,
                            'sinkBelongTo': self.methodName,
                            'sourceBelongTo': self.sourceBelongTo
                        })
                        flag = False
                        break

    '''
    find clean method
    '''
    def findclean(self,methodName,parentMethodName):
        pass
