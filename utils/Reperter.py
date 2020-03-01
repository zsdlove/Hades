#-*-coding:utf-8-*-
'''
DO final report.
by pOny@moresec
2020/2/14
'''
import json
from database.database import dataBase
class Reperter:
	def __init__(self,resultContainer,taskname):
		self.resultContainer=resultContainer
		self.taskname=taskname

	def run(self):
		if len(self.resultContainer)>0:
				redis_handle=dataBase.connect()
				singleOne={
					"author":self.resultContainer.get("author"),
					"version":self.resultContainer.get("version"),
					"permission":json.dumps(self.resultContainer.get("permission")),
					"nastySDKs":self.resultContainer.get("nastySDKs"),
					"codeAnalysis":json.dumps(self.resultContainer.get("codeAnalysis")),
					"warming":json.dumps(self.resultContainer.get("warming")),
				}
				dataBase.insert(redis_handle,self.taskname,singleOne)
if __name__ == '__main__':
	report=Reperter("test","test")
	report.run()