#-*-coding:utf-8-*-
import os
class entry:
    '''
    获取entry信息
    '''
    @staticmethod
    def getAnalysisEntry(targetpath):
        entryList = []
        for root, dirs, files, in os.walk(targetpath):
            for file in files:
                file = os.path.join(root, file).replace(targetpath, "").replace("/", ".").replace(".smali", "")
                print(file)
                entryList.append(file)
        return entryList