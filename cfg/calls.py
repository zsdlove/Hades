#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re

class CallsFinder(object):
	def __init__(self, what):
		self.methods = what

	def do_find(self, where):
		co = []
		for class_name in where:
			for mth_dict in where[class_name]['Methods']:
				caller = "%s->%s" % (class_name, mth_dict['Name'])
				block = '\r\n'.join( mth_dict['Instructions'] )
				for invoke in re.findall('invoke-(.*?)\r\n', block, re.DOTALL):
					called = invoke.split(' ')[-1]
					if (caller in self.methods) or (called in self.methods):
						co.append( (caller, called) )
		return co