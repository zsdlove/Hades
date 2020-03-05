#!/usr/bin/env python
# -*- coding: utf-8 -*-

from cfg.base import Walker
from cfg.instructions import InstructionsFinder
from cfg.graphs import GraphManager
from config import *
'''
这里AppInentory数据结构：
[
"类名":{
	"Properties":[],
	"Methods":{
		"0":{
			"Name":"",
			"Instructions":[...,...]
		}						
	}
}

]
'''

class CFGBuilder(object):
	walker = None
	def __init__(self,where):
		self.walker = Walker(where)
		self.imagepath=""
		self.resultados=""
		self.Diagraph=""

	def do_instructionflow(self, method_def):
			method_definition=method_def
			print("[*]函数 %s 的控制流图保存在 MethodInstructionsFlow.png." % (method_definition))
			fnd = InstructionsFinder(method_definition, True)#指令寻找
			self.walker.assign_finder(fnd)

			'''
			寻找并返回块信息(block)
			self.clase_padre = clase_padre
			self.metodo_padre = metodo_padre
			self.etiqueta = etiqueta#标签
			self.instructiones = instructiones
			self.bifurcaciones = []
			'''
			resultados = self.walker.do_find()
			self.resultados=resultados
			for cls in resultados:
				logging.info("[Finder] - 类信息 %s"%cls.clase_padre)
				logging.info("[Finder] - 方法信息 %s"%cls.metodo_padre)
				logging.info("[Finder] - 坐标信息 %s"%cls.etiqueta)
				logging.info("[Finder] - 指令信息 %s"%cls.instructiones)
				logging.info("[Finder] - 分支信息 %s"%cls.bifurcaciones)
			'''
			进行各个块的连接，并绘制cfg图
			这里如何在函数调用结束的时候回到调用的时候的位置呢
			通过类方法+地址偏移形式(这里回车换行\r\n不记录偏移计算)来匹配上一个节点信息。
			即每个块中都存储这本节点(lbl)的标签信息和上一个节点的标签信息(target)
			这样在污点分析的时候就可以按照这个流程进行分析。
			这里会形成一个死循环问题，这是由于程序中存在递归调用及循环造成，这里只要不要让jmp实现跳转即可。
			'''
			graph_mgr = GraphManager(True)
			for b1 in resultados:
				for lbl,target in b1.bifurcaciones:
					for b2 in resultados:
						if b2.etiqueta == target:
							graph_mgr.add_block_edge(b1,b2, lbl)
							break
			self.Diagraph=graph_mgr.graph
			try:
				'''
				节点大于500的不输出控制流图(png)
				'''
				node_count=len(graph_mgr.graph.get_nodes())
				edges_count=len(graph_mgr.graph.get_edges())
				print("node_count:%d"%node_count)
				print("edges_count:%d"%edges_count)
				if node_count>0 and node_count<500:
					graph_mgr.draw(self.imagepath, True)
					#graph_mgr.draw(self.imagepath, False)
				else:
					pass
			except:
				print("Complex Graph can't be rendered with graphviz libraries, using .dot format instead!\n")
				#graph_mgr.draw("res/MethodInstructionsFlow", False)
				if len(graph_mgr.graph.get_nodes()) > 0 and len(graph_mgr.graph.get_nodes())<200:
					graph_mgr.draw(self.imagepath, False)
if __name__ == '__main__':
	app = CFGBuilder("res/testapp")
	app.do_instructionflow("Lfridatest/test/com/myapplication/MainActivity;->onCreate(Landroid/os/Bundle;)V")