#!/usr/bin/env python
# -*- coding: utf-8 -*-

class StringsFinder(object):

	def __init__(self, what):
		self.limitations = ['.field', '.local', '.param', 'const-string', 'sput', 'sget']
		self.patterns = what

	def do_find(self, where):
		co = {}
		for class_name in where:
			for mth_dict in where[class_name]['Methods']:
				for inst in mth_dict['Instructions']:
					for pattern in self.patterns:
						if pattern.lower() in inst.lower():
							for lim in self.limitations:
								if lim in inst.lower():
									method_definition = "%s->%s" % (class_name, mth_dict['Name'])
									if method_definition in co:
										if inst not in co[method_definition]:
											co[method_definition].append( inst )
									else:
										co[method_definition] = [inst]
		return co