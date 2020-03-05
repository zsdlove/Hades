#-*-coding:utf-8-*-
'''
redis操作类
by pOny@moreesec
2019.12.26
'''
import redis
import json
class dataBase():

	@staticmethod
	def connect():
		pool = redis.ConnectionPool(host='127.0.0.1', port=6379,db=7)
		r = redis.Redis(connection_pool=pool)
		return r

	@staticmethod
	def insert(r,apkname,data):
		r.hmset(apkname,data)

	@staticmethod
	def getdata(r,apkname):
		allData=r.hgetall(apkname)
		return allData
if __name__ == '__main__':
	r=dataBase.connect()
	apkname="appname1234"
	dataBase.getdata(r,apkname)