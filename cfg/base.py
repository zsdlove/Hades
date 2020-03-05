#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os, re
from config import *
class Walker:
	def __init__(self, location):
		self.location     	= location
		self.AppInventory 	= {}
		self.ParsedResults	= None
		self.Finder         = None
		self.do_walk()

	def assign_finder(self, finder):
		self.Finder = finder

	def do_find(self):
		return self.Finder.do_find(self.AppInventory)

	def do_walk(self):
		self.AppInventory = {}
		for root, subFolders, files in os.walk( self.location ):
			for file in files:
				try:
					if file.endswith(".smali"):
						with open(root+"/"+file, "rb") as file_handle:
							content = file_handle.read()
							content=content.replace("\n","\r\n")
							#class_name = re.search('^\.class\s+(.*?)\r\n\.super\s+(.*?)\r\n\.source\s+(.*?)\r\n', content).groups()[0].split(' ')[-1]
							class_name = re.search('^\.class\s+(.*?)\r\n\.super\s+(.*?)\r\n\.source\s+(.*?)\r\n', content).groups()[0].split(' ')[-1]
							self.AppInventory[class_name] = {}
							self.AppInventory[class_name]['Properties'] = re.findall('[.]field\s+(.*?)\r\n', content, re.DOTALL)
							self.AppInventory[class_name]['Methods'] = []
							for m in re.findall('[.]method\s(.*?)\r\n(.*?)[.]end\s+method', content, re.DOTALL):
								try:
									ind_meth = {}
									ind_meth['Name'] = m[0].split(' ')[-1]
									ind_meth['Instructions'] = []
									for i in m[1].split('\r\n'):
										if len(i)>0:
											ind_meth['Instructions'].append( i.lstrip().rstrip() )
									self.AppInventory[class_name]['Methods'].append( ind_meth )
								except:
									pass
				except:
					pass