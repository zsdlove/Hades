#-*-coding:utf-8-*-

import zipfile
'''
first,get namelist from apk
second,matching the features
thrid,julging for the shellType
so easy~~
by zsdlove
2018/8/24 Morning
'''
class shellDetector():
	def __init__(self):
		self.shellfeatures={
			"libchaosvmp.so":u"娜迦",
			"libddog.so":u"娜迦",
			"libfdog.so":u"娜迦",
			"libedog.so":u"娜迦企业版",
			"libexec.so":u"爱加密",
			"libexecmain.so":u"爱加密",
			"ijiami.dat":u"爱加密",
			"ijiami.ajm":u"爱加密企业版",
			"libsecexe.so":u"梆梆免费版",
			"libsecmain.so":u"梆梆免费版",
			"libSecShell.so":u"梆梆免费版",
			"libDexHelper.so":u"梆梆企业版",
			"libDexHelper-x86.so":u"梆梆企业版",
			"libprotectClass.so":u"360",
			"libjiagu.so":u"360",
			"libjiagu_art.so":u"360",
			"libjiagu_x86.so":u"360",
			"libegis.so":u"通付盾",
			"libNSaferOnly.so":u"通付盾",
			"libnqshield.so":u"网秦",
			"libbaiduprotect.so":u"百度",
			"aliprotect.dat":u"阿里聚安全",
			"libsgmain.so":u"阿里聚安全",
			"libsgsecuritybody.so":u"阿里聚安全",
			"libmobisec.so":u"阿里聚安全",
			"libtup.so":u"腾讯",
			"libexec.so":u"腾讯",
			"libshell.so":u"腾讯",
			"mix.dex":u"腾讯",
			"lib/armeabi/mix.dex":u"腾讯",
			"lib/armeabi/mixz.dex":u"腾讯",
			"libtosprotection.armeabi.so":u"腾讯御安全",
			"libtosprotection.armeabi-v7a.so":u"腾讯御安全",
			"libtosprotection.x86.so":u"腾讯御安全",
			"libnesec.so":u"网易易盾",
			"libAPKProtect.so":u"APKProtect",
			"libkwscmm.so":u"几维安全",
			"libkwscr.so":u"几维安全",
			"libkwslinker.so":u"几维安全",
			"libx3g.so":u"顶像科技",
			"libapssec.so":u"盛大",
			"librsprotect.so":u"瑞星"
		}

	def shellDetector(self,apkpath):
		zipfiles=zipfile.ZipFile(apkpath)
		nameList=zipfiles.namelist()

		for fileName in nameList:
			try:
				for shell in self.shellfeatures.keys():
					if shell in fileName:
						shellType=self.shellfeatures[shell]
						print(u"经检测，该apk使用了" + shellType + u"进行加固")
						return True,shellType
			except:
				return False,u"unknown"
		return False,u"未加壳"
if __name__ == '__main__':
	print("hhello")
	sd=shellDetector()
	print sd.shellDetector("../workspace/apk/com.csii.tiannongshang.mobilebank.2001162015.apk")[1]