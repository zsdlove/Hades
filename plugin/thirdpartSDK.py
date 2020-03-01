#-*-coding:utf-8-*-
'''
Used to identify the third-party SDK
by pOny@moresec
2020.2.26
'''
import os

'''
找到分析入口
'''
def findEntry(targetpath):
    entryList = []
    for root, dirs, files, in os.walk(targetpath):
            for file in files:
                file = os.path.join(root, file).replace(targetpath, "").replace("/", ".").replace(".smali","")
                print(file)
                entryList.append(file)
    return entryList
class sdkAnalysis():
    def __init__(self):
        self.blackSDKList=[
            'cn.com.chinatelecom',
            'cn.jcore.client',
        ]
    def find(self,targetpath):
        packageList=[]
        for root,dirs,files,in os.walk(targetpath):
            if len(dirs)>0:
                for dir in dirs:
                    package=os.path.join(root, dir).replace(targetpath,"").replace("/",".")
                    print(package)
                    packageList.append(package)
        return packageList

    def identify(self,targetpath):
        packageList=self.find(targetpath)
        nastyPackageList=[]
        for package in packageList:
            for bls in self.blackSDKList:
                if bls ==package:
                    print("找到一个恶意sdk.")
                    nastyPackageList.append(package)
        print("total nasty sdk list.")
        print(nastyPackageList)
        return nastyPackageList
if __name__ == '__main__':
    #sA=sdkAnalysis()
    #sA.identify("../workspace/result/9531org2/")
    findEntry("../workspace/result/8928org3/")