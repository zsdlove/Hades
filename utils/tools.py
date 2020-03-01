#-*-coding:utf-8-*-
import zipfile

def unzip(zipfilepath,outputpath):
	zip_file = zipfile.ZipFile(zipfilepath)
	zip_list = zip_file.namelist()  # 得到压缩包里所有文件
	for f in zip_list:
		zip_file.extract(f, outputpath)  # 循环解压文件到指定目录
	zip_file.close()  # 关闭文件，必须有，释放内存