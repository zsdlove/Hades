#-*-coding:utf-8-*-
# manifest.xml resolve and check
import xml.dom.minidom
from config import *
from plugin.permissionAnalyzer import permissionAnalyzer
class componentcheck:
	def __init__(self, apkname):
		self.apkname=apkname
		self.manifest_path = "workspace/result/" + self.apkname + "/AndroidManifest_resolved.xml"
		self.activityPathList = []
		self.permissionList=[]
		self.servicePathList = []
		self.providerPathList = []
		self.broadcastPathList = []
		self.dangerous_permission={}
		self.packageName=None

	#
	# 获得apk包名
	#
	def getPackageName(self, root):
		packageName = root.getAttribute('package')
		return packageName

	#
	# 获得应用运行权限
	#
	def getUsesPermission(self, node):
		if node.nodeName == "uses-permission":
			self.permissionList.append(node.getAttribute('android:name'))
			logging.info("- [VulScanEngine] " + "申请的权限名为：" + node.getAttribute('android:name').encode("utf-8"))
	# return node.getAttribute('android:name')
	#
	# 获得应用自定义权限：权限名，保护级别
	#
	def getPermission(self, node):
		if node.nodeName == "permission":
			logging.info("- [VulScanEngine] " + "自定义权限名：" + node.getAttribute('android:name').encode("utf-8"))
			logging.info("- [VulScanEngine] " + "保护级别为：" + node.getAttribute('android:protectionLevel').encode("utf-8"))

	# return node.getAttribute('android:name')
	#
	# 判断应用是否可被调试
	#
	def isapkdebugable(self, node):
		if node.getAttribute('android:debuggable') == "true":
			logging.info("- [VulScanEngine]应用可被调试")
		else:
			logging.info("- [VulScanEngine]应用不可被调试->安全")

	#
	# 备份漏洞backup
	#
	def buckupflaw(self, node):
		if node.getAttribute('android:allowBackup') == "true":
			logging.info("- [VulScanEngine]存在任意数据备份漏洞")
		else:
			logging.info("- [VulScanEngine]不存在任意数据备份漏洞")

	#
	# 解析application标签,检查bakup备份
	#
	def applicationtab(self, node):
		if node.nodeName == "application":
			self.buckupflaw(node)
			self.isapkdebugable(node)
			for cn in node.childNodes:
				if cn.nodeName != "#text":
					self.getActivityEntry(cn)
					self.getProviderEntry(cn)
					self.getBroadcastEntry(cn)
					self.getServiceEntry(cn)
				else:
					pass
		else:
			pass

	# 获取所有的activity的入口文件路径,其他三个组件方法类似
	def getActivityEntry(self, node):
		if node.nodeName == "activity":
			self.activityPathList.append(node.getAttribute('android:name'))
			# de.ecspride.reflectionprivacyleak1.ReflectionPrivacyLeak1
			logging.info("- [VulScanEngine] " + "该activity入口文件为：" + node.getAttribute('android:name').encode("utf-8"))

	# 获取所有的service的入口文件路径,其他三个组件方法类似
	def getServiceEntry(self, node):
		if node.nodeName == "service":
			self.servicePathList.append(node.getAttribute('android:name'))

	# 获取所有的provider的入口文件路径,其他三个组件方法类似
	def getProviderEntry(self, node):
		if node.nodeName == "provider":
			self.providerPathList.append(node.getAttribute('android:name'))

	# 获取所有的broadcast的入口文件路径,其他三个组件方法类似
	def getBroadcastEntry(self, node):
		if node.nodeName == "receiver":
			self.broadcastPathList.append(node.getAttribute('android:name'))

	#
	# 解析xml文件并检测manifest中的不当设置
	#
	def android_manifest_check(self):
		# try:
		dom = xml.dom.minidom.parse(self.manifest_path)
		root = dom.documentElement
		self.packageName = self.getPackageName(root)
		nodelist = root.childNodes
		for node in nodelist:
			if node.nodeName != "#text":
				self.getUsesPermission(node)  # usespermission
				self.getPermission(node)  # permission
				self.applicationtab(node)  # 解析application标签

		def permission_store(store_path):
			try:
				file=open(store_path,'a+')
				for permission in self.permissionList:
					file.write(permission+"\n")
			except:
				logging.error("error:%s"%store_path)
		permission_store("workspace/result/" + self.apkname+"/permission.txt")

	# except:
	#	pass
	def run(self):
		self.android_manifest_check()


	#
	# 解析activity,cn是节点
	#
	def decompile_activity(self, cn):
		return cn.getAttribute("android:exported")

	#
	# 解析service
	#
	def decompile_service(self, cn):
		return cn.getAttribute("android:exported")

	#
	# 解析receiver
	#
	def decompile_receiver(self, cn):
		return cn.getAttribute("android:exported")

	#
	# 解析provider
	#
	def decompile_provider(self, cn):
		return cn.getAttribute("android:exported")
