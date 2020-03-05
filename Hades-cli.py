# -- coding:utf-8 --
'''
Hades
一个基于虚拟执行及污点追踪技术的静态代码检测系统
Coded by pOny@moresec
2020.2.14
'''
import hashlib
import os
import sys
import xml.dom.minidom
import zipfile
import random
import redis
import codecs
import json
from miniDVM.miniDVM import miniDVM
from utils.tools import *
from config import *
import threading
from utils.entry import *
from utils.Reperter import *

from plugin.shellDetector import *
class apkvulcheck:
	def __init__(self):
		self.resultinfo = {}
		self.output = ''

	def VulScanEngine(self):
		pass

	def handlejar(self, taskpath):

		taskname=taskpath.split("/")[-1].split(".")[0]
		jarpath="workspace/java"
		os.system("cp %s %s/target.jar"%(taskpath,jarpath))
		'''
		将jar包转为dex
		'''
		try:
			os.system("java -jar lib/dx.jar --dex --output=%s %s" % (jarpath + "/target.dex", jarpath + "/target.jar"))
			print("jar2dex successfully!")
		except:
			os.system("java -jar lib/dx.jar --dex %s --output=%s %s" % (minsdkversion,jarpath + "/target.dex", jarpath + "/target.jar"))

		'''
		将dex文件转为smali文件
		'''
		try:
			smaliFilepath="workspace/result/%s"%taskname
			os.system("java -jar lib/baksmali.jar %s -o %s" % (jarpath + "/target.dex", smaliFilepath))
			logging.info("dex2smali successfully!")
		except:
			logging.info("dex2smali unsuccessfully!")

		activityEntryList= entry.getAnalysisEntry(smaliFilepath + "/")
		'''
		开始虚拟执行分析
		'''
		logging.info("[VulScanEngine] - %d entry point found."%len(activityEntryList))
		print("[VulScanEngine] - %d entry point found."%len(activityEntryList))
		dvm = miniDVM()
		logging.info("[VulScanEngine] - Create a DVM instance.")
		AEL=[]
		for tl in javaEntryTmplList:
			for ae in activityEntryList:
				AEL.append(tl%ae)
		dvm.initVM(AEL, taskname)
		logging.info("[VulScanEngine] - Ready to interpret the smali bytecode.")
		print("[VulScanEngine] - Ready to interpret the smali bytecode.")
		dvm.run()
		print("[VulScanEngine] - Complete analysis of the apk.")
		'''
		analysis the final result.
		'''
		logging.info("[VulScanEngine] - Process the final result and report it.")
		print("[VulScanEngine] - Process the final result and report it.")

		'''
		save the result.
		'''
		file=open("%s/result.json"%smaliFilepath,"a+")
		file.write(json.dumps(dvm.resultContainer, indent=2, encoding="utf-8", ensure_ascii=False))
		report=Reperter(dvm.resultContainer,taskname)
		report.run()
		print("[VulScanEngine] - finished report process.")

	'''
	处理源码，Hades-master支持将java代码转为smali这种中间代码表示形式，这样便于基于同一种模式对程序
	进行控制流构建，进行分析。
	使用baksmali.jar，dx.jar,javac
	'''
	def handleSource(self, apkpath):
		'''
		先对上传的zip文件进行解压
		'''
		apkname=apkpath.split("/")[-1].split(".")[0]
		outputpath="workspace/java/%s"%apkname
		unzip(apkpath,outputpath)

		'''
		找到所有的.java文件，使用javac [source].java -cp [apkpath]将其全部编译
		'''
		javafileList = []
		'''
		if exists pom.xml,mvn project verify.
		'''
		if os.path.exists(outputpath+"/pom.xml"):
			cmd="cd %s & mvn compile"%(outputpath)
			os.system(cmd)
		else:
			try:
				for root, dirs, files, in os.walk(outputpath):
					for file in files:
						if os.path.splitext(file)[1] == '.java':
							filepath = os.path.join(root, file)
							javafileList.append(filepath)
				for javafile in javafileList:
					cmd = "javac %s -cp %s" % (javafile, outputpath)
					os.system(cmd)
			except:
				logging.info("[VulScanEngine] - Compiled failed,please make sure if the project path is corrected.")
		'''
		将所有的class文件打包到jar包中
		'''

		try:
			z = zipfile.ZipFile(outputpath + "/target.jar", 'w')
			for root, dirs, files, in os.walk(outputpath):
				for file in files:
					filepath = os.path.join(root, file)
					sourcefile = filepath.replace(outputpath + "/", "")
					z.write(filepath, sourcefile)  # sourcefile是相对路径
			z.close()
			logging.info("package successfully！")
		except:
			logging.info("package unsuccessfully！")

		'''
		将jar包转为dex
		'''
		try:
			os.system("java -jar lib/dx.jar --dex --output=%s %s" % (outputpath + "/target.dex", outputpath + "/target.jar"))
			print("jar2dex successfully!")
		except:
			os.system("java -jar lib/dx.jar --dex %s --output=%s %s" % (minsdkversion,outputpath + "/target.dex", outputpath + "/target.jar"))


		'''
		将dex文件转为smali文件
		'''
		try:
			smaliFilepath="workspace/result/%s"%apkname
			os.system("java -jar lib/baksmali.jar %s -o %s" % (outputpath + "/target.dex", smaliFilepath))
			logging.info("dex2smali successfully!")
		except:
			logging.info("dex2smali unsuccessfully!")

		'''
		开始虚拟执行分析
		'''
		activityEntryList = entry.getAnalysisEntry(smaliFilepath+"/")
		AEL=[]
		for tp in javaEntryTmplList:
			for ae in activityEntryList:
				AEL.append(tp%ae)
		logging.info("[VulScanEngine] - %d entry point found."%len(activityEntryList))
		print("[VulScanEngine] - %d entry point found."%len(activityEntryList))
		dvm = miniDVM()
		logging.info("[VulScanEngine] - Create a DVM instance.")
		dvm.initVM(AEL, apkname)
		logging.info("[VulScanEngine] - Ready to interpret the smali bytecode.")
		print("[VulScanEngine] - Ready to interpret the smali bytecode.")
		dvm.run()
		print("[VulScanEngine] - Complete analysis of the apk.")
		'''
		analysis the final result.
		'''
		logging.info("[VulScanEngine] - Process the final result and report it.")
		print("[VulScanEngine] - Process the final result and report it.")
		'''
		save the result.
		'''
		file=open("%s/result.json"%smaliFilepath,"a+")
		file.write(json.dumps(dvm.resultContainer, indent=2, encoding="utf-8", ensure_ascii=False))
		report=Reperter(dvm.resultContainer,apkname)
		report.run()
	def run(self, apkpath, target):
		'''
		handle the target project,support source mode&bytecode mode&jar mode
		'''
		if target == "source":
			self.handleSource(apkpath)
		elif target == "jar":
			self.handlejar(apkpath)
		elif target == "bytecode":
			if apkpath != "":
				self.VulScanEngine(apkpath)
			else:
				for apkpath in self.apknamelist:
					self.VulScanEngine(apkpath)

def engine(data):
	avc = apkvulcheck()
	data=data.replace("u'","\"").replace("'","\"")
	apkpath = json.loads(data,"UTF-8")['apkpath']

	if apkpath.split(".")[-1]=="apk":
		avc.run(apkpath, "bytecode")
	elif apkpath.split(".")[-1]=="zip":
		avc.run(apkpath, "source")
	elif apkpath.split(".")[-1]=="jar":
		avc.run(apkpath,"jar")
	else:
		logging.info("unsupportted type of file.")

def engine_main():
	print(banner)
	import time
	print("[*]Try to start the Hades Engine...")
	time.sleep(0.5)
	print("[*]Start Hades Engine Successfully!")
	pool = redis.ConnectionPool(host='0.0.0.0',port=6379, db=6)
	r = redis.StrictRedis(connection_pool=pool)
	p = r.pubsub()
	p.subscribe("Hades")
	for item in p.listen():
		print("Listen on channel : %s " % item['channel'].decode())
		if item['type'] == 'message':
			data = item['data'].decode()
			t = threading.Thread(target=engine, args=[data])
			t.start()  # 线程启动
			if item['data'] == 'over':
				print(item['channel'].decode(), '停止发布')
				break
	p.unsubscribe('Hades')
	print("unsubscribe.")


def main(path):
	avc = apkvulcheck()
	avc.run(path, "bytecode")


def sourceEngine(path):
	avc = apkvulcheck()
	avc.run(path, "source")


if __name__ == '__main__':
	engine_main()
