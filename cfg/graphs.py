#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re, pydot
from config import *
class GraphManager(object):
	""" pydot graph objects manager """
	def __init__(self, complex=False):
		if complex:
			self.graph = pydot.Dot(graph_type='digraph', simplify=True)
		else:
			self.graph = pydot.Dot(graph_type='digraph', simplify=True, rankdir="LR")

	def add_xref_edge(self, b1, b2, main_methods, coincidences=None):
			nodes = []
			strs = [ b1, b2 ]
			for strn in strs:
				if strn in main_methods:
					n = pydot.Node(strn, color="red", style="filled", shape="record", fontname="Sans", fontsize=8 )
				elif coincidences is not None:
					if strn in coincidences:
						n = pydot.Node(strn, style="filled", shape="record", color="cornflowerblue", fontname="Sans", fontsize=8 )
					else:
						n = pydot.Node(strn, style="filled", shape="record", color="#eeeeee", fontname="Sans", fontsize=8 )
				else:
					n = pydot.Node(strn, style="filled", shape="record", color="#eeeeee", fontname="Sans", fontsize=8 )
				self.graph.add_node(n)
				nodes.append(n)
			self.graph.add_edge(pydot.Edge(nodes[0], nodes[1], color="#666666", arrowhead="open", fontsize=2))

	def add_block_edge(self, b1, b2, label="CONT"):
		""" join two pydot nodes / create nodes edge """
		# Edge color based on label text
		if label=='false':
			ecolor = "red"
		elif label=='true':
			ecolor = 'green'
		elif label == 'exception':
			ecolor = 'orange'
		elif label == 'try':
			ecolor = 'blue'
		else:
			ecolor = 'gray'

		# node shape based on block type (First or Last instruction)
		nodes = [None, None]
		blocks = [b1,b2]
		for i in range(2):
			if re.search("^if-", blocks[i].instructiones[-1]) != None:
				ncolor = "cornflowerblue"
			elif re.search("^\:" , blocks[i].instructiones[0]) != None:
				ncolor = "tan"
			elif re.search("^goto", blocks[i].instructiones[-1]) != None:
				ncolor = "darkgreen"
			elif re.search("^invoke-", blocks[i].instructiones[-1]) != None:
				ncolor = "lightyellow4"
			else:
				ncolor = "mediumaquamarine"

			insTxt = "%s\r" % blocks[i].etiqueta
			lidx = int(blocks[i].etiqueta.split(' ')[-1])
			for ii in blocks[i].instructiones:
				insTxt += str(lidx) +  ": " + ii
				lidx+=1

			nodes[i] = pydot.Node(b1.etiqueta, color=ncolor, style="filled", shape="box", fontname="Courier", fontsize=8)
			nodes[i].set_name(insTxt)#函数引用+指令
			self.graph.add_node(nodes[i])
		ed = pydot.Edge(nodes[0], nodes[1], color=ecolor, label=label, fontname="Courier", fontsize=8, arrowhead="open")
		self.graph.add_edge(ed)

	def draw(self, name, png_mode):
		if png_mode:
			self.graph.write_png(name + ".png")
		else:
			self.graph.write(name + ".dot")
