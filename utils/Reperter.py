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
					"packageName":self.resultContainer.get("packageName"),
					"permission":json.dumps(self.resultContainer.get("permission")),
					"activity":json.dumps(self.resultContainer.get("activity")),
					"service":json.dumps(self.resultContainer.get("service")),
					"provider":json.dumps(self.resultContainer.get("provider")),
					"receiver":json.dumps(self.resultContainer.get("receiver")),
					"nastySDKs":json.dumps(self.resultContainer.get("nastySDKs")),
					"otherSDKs":json.dumps(self.resultContainer.get("otherSDKs")),
					"Advertisement":json.dumps(self.resultContainer.get("Advertisement")),
					"thirdpartPayAPI":json.dumps(self.resultContainer.get("thirdpartPayAPI")),
					"codeAnalysis":json.dumps(self.resultContainer.get("codeAnalysis")),
					"warming":json.dumps(self.resultContainer.get("warming")),
				}
				dataBase.insert(redis_handle,self.taskname,singleOne)
if __name__ == '__main__':
	report=Reperter("test","test")
	report.run()