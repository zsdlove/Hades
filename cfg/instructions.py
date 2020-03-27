#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re, sys

class Block(object):

	def __init__(self, clase_padre=None, metodo_padre=None, etiqueta=None, instructiones=None):

		self.clase_padre = clase_padre
		self.metodo_padre = metodo_padre
		self.etiqueta = etiqueta#标签
		self.instructiones = instructiones
		self.bifurcaciones = []

	def add_inst(self, inst):
		self.instructiones.append(inst)

class InstructionsFinder(object):
	def __init__(self, what, how=False):
		self.method = what
		self.calls_inventory = {}
		self.ParsedResults = []
		self.full = how

	def define_inventory(self, where):
		for class_name in where:
			for mth_dict in where[class_name]['Methods']:
				caller = "%s->%s" % (class_name, mth_dict['Name'])
				block = '\n'.join( mth_dict['Instructions'] )
				self.calls_inventory[caller] = []
				for invoke in re.findall('invoke-(.*?)\n', block, re.DOTALL):
					called = invoke.split(' ')[-1]
					if caller in self.calls_inventory:
						self.calls_inventory[caller].append( called )

	def get_xrefs(self):
		calls_to_review = [self.method]
		analized_calls = []
		nMethods = 0
		while True:
			mname = calls_to_review[nMethods]
			#mname="L"+mname+";"
			if self.calls_inventory.get(mname)!=None:
				for called in self.calls_inventory.get(mname):
					if (mname, called) not in analized_calls:
						if called not in calls_to_review:
							if called in self.calls_inventory:
								calls_to_review.append( called )
							analized_calls.append((mname,called))
			else:
				pass
			nMethods += 1
			if nMethods >= len(calls_to_review): break
		return calls_to_review

	def get_method_instructions(self, method, where):
		class_name  = method.split('->')[0]
		if class_name not in where: return None
		method_name = method.split('->')[1]
		for mth_dict in where[class_name]['Methods']:
			if mth_dict['Name'] == method_name:
				insts = []
				for i in mth_dict['Instructions']:
					if len(i)>0:
						insts.append( i.lstrip() + "\l" )
				return (class_name, method_name, insts)
		return None

	'''
	分割代码块
	outcall 是否调用外部函数
	incrementaletiqueta 递增坐标 针对普通指令
	positionaletiqueta 坐标位置 针对函数引用
	'''
	def _splitBlock(self, blk, classn, methodn, pos, lenInc, iset, i):
		blockLen = len(blk.instructiones) + lenInc
		incrementaletiqueta = "%s %s %d" % (classn, methodn, pos+blockLen)
		outCall = False

		if re.search("^invoke-", i) == None:
			positionaletiqueta  = "%s %s %d" % (classn, methodn, iset.index(i.split(' ')[-1])+1 )
		else:
			lindex = int(blk.etiqueta.split(' ')[-1]) + len(blk.instructiones)
			positionaletiqueta = " ".join(blk.etiqueta.split(' ')[:-1]) + " " + str(lindex+1)
			if i.split(' ')[-1][:-2] in self.calls_inventory.keys():
				outCall = True
				nfil = i.split('->')[0].split(' ')[-1]
				ndef = i.split('->')[1][:-2]
				positionaletiqueta = "%s %s %d"  % (nfil, ndef, 1)

		return (outCall, incrementaletiqueta, positionaletiqueta)


	'''
	生成块列表
	methods列表元素
	class_name="", method_name="", insts=>[]
	etiqueta 标签
	作用：为每一条指令找到其归属的代码块
	block(坐标，指令，类名，方法名)
	(outCall, incetiqueta, posetiqueta)
	如果该指令为普通指令 则incetiqueta=posetiqueta
	如果该指令为方法引用指令 则则incetiqueta！=posetiqueta，posetiqueta坐标为1,表示新代码块的位置坐标

	'''
	def genBlockList(self, methods):
		for (cname, mname, minsts) in methods:
			# 默认的初始块
			b = Block(etiqueta=cname + " " + mname + " 1", instructiones=[], clase_padre = cname, metodo_padre = mname)
			#针对每一条指令，为它找到它应该归属的代码块
			for i2 in minsts:
				instrPos = minsts.index(i2) + 1
				#b.etiqueta=Lfridatest/test/com/myapplication/Talkabout; lovebaby(Ljava/lang/String;)Ljava/lang/String; 19
				blockPos = int(b.etiqueta.split(' ')[-1] )
				if re.search("^goto", i2) != None:#无条件跳转分支
					(outCall, incetiqueta, posetiqueta) = self._splitBlock(b, cname, mname, blockPos, 1, minsts, i2)
					b.bifurcaciones = [('jump',posetiqueta)]#分支
					b = self.add_before(etiqueta=incetiqueta, inst=i2, block=b, pclass=cname, pmethod=mname)
				elif re.search("^if-", i2) != None:#if分支
					(outCall, incetiqueta, posetiqueta) = self._splitBlock(b, cname, mname, blockPos, 1, minsts, i2)
					b.bifurcaciones = [('true',posetiqueta), ('false',incetiqueta)]#分支
					b = self.add_before(etiqueta=incetiqueta, inst=i2, block=b, pclass=cname, pmethod=mname)
				elif re.search("^\:" , i2) != None:#标签
					(outCall, incetiqueta, posetiqueta) = self._splitBlock(b, cname, mname, blockPos, 0, minsts, i2)
					b.bifurcaciones = [('cont',incetiqueta)]#continue
					b = self.add_after(etiqueta=incetiqueta, inst=i2, block=b, pclass=cname, pmethod=mname)
				elif re.search("^.catch ", i2) != None:#异常捕获
					(outCall, incetiqueta, posetiqueta) = self._splitBlock(b, cname, mname, blockPos, 1, minsts, i2)
					b.bifurcaciones = [('exception',posetiqueta), ('try',incetiqueta)]#异常捕获分支
					b = self.add_before(etiqueta=incetiqueta, inst=i2, block=b, pclass=cname, pmethod=mname)
				elif re.search("^invoke-", i2) != None:#函数引用
					(outCall, incetiqueta, posetiqueta) = self._splitBlock(b, cname, mname, blockPos, 1, minsts, i2)
					if outCall:
						b.bifurcaciones = [('call',posetiqueta), ('on return', incetiqueta)]
					else:
						b.bifurcaciones = [('on return',posetiqueta)]
					b = self.add_before(etiqueta=incetiqueta, inst=i2, block=b, pclass=cname, pmethod=mname)
				else:
					b.add_inst(i2)
			self.add(b)

	def add(self, blk):
		'''
		如果块不存在并且至少有一条指令，请将它添加到块列表中
		'''
		if (not (blk in self.ParsedResults)) and (len(blk.instructiones)>0):
			self.ParsedResults.append(blk)

	def add_before(self, etiqueta=None, inst=None, block=None, pclass=None, pmethod=None):
		'''
		将指令添加到当前块，然后将当前块添加到块列表中。
		'''
		block.add_inst(inst)
		self.add(block)
		return Block(etiqueta=etiqueta, instructiones=[], clase_padre=pclass, metodo_padre=pmethod)

	def add_after(self, etiqueta=None, inst=None, block=None, pclass=None, pmethod=None):
		'''
		将块添加到列表中，并使用指定的指令创建一个新块
		'''
		self.add(block)
		return Block(etiqueta=etiqueta, instructiones=[inst], clase_padre=pclass, metodo_padre=pmethod)

	def do_find(self, where):
		'''
		where 所有的类信息
		'''
		class_name = self.method.split('->')[0]
		print("classname:"+class_name)
		if class_name not in where: return []#判断当前类是否在类信息列表里
		self.define_inventory(where)
		nodes = self.get_xrefs()
		methods = []
		for method in nodes:
			methodinsts = self.get_method_instructions(method, where)#return (class_name, method_name, insts)
			if methodinsts is not None:
				if methodinsts not in methods:
					if self.full:
						methods.append(methodinsts)
					elif method.startswith(class_name):
						methods.append(methodinsts)
		#methods里放的是所有的代码块集合
		self.genBlockList(methods)
		#Lde/ecspride/reflectionprivacyleak1/ReflectionPrivacyLeak1
		return self.ParsedResults
