#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re

class PackagesFinder(object):
	def __init__(self, what):
		self.target_package = what

	def do_find(self, where):
		co = []
		for class_name in where:
			for mth_dict in where[class_name]['Methods']:
				caller = "%s->%s" % (class_name, mth_dict['Name'])
				block = '\n'.join( mth_dict['Instructions'] )
				for pair in re.findall('%s/(.*?);\->(.*?)\n' % (self.target_package), block):
					co.append( ';->'.join(pair) )
		return sorted(list(set(co)))