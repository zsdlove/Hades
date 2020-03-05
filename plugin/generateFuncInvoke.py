#!/usr/bin/env python
# -*- coding: utf-8 -*-
#by pOny@moresec
# -----------------------------------------------------------------------------
import codecs
import os
import re

'''
用于生成函数引用,辅助规则生成,入口发现.
'''
class SmaliParser(object):

    def __init__(self, location, suffix):
        self.location = location
        self.suffix = suffix
        self.current_path = None
        self.classes = []

    def run(self):
        self.parse_location()

    #parse every file
    def parse_file(self, filename):
        with codecs.open(filename, 'r', encoding='utf8') as f:
            current_class = None
            current_method = None
            current_call_index = 0
            classcode=f.readlines()
            i=0
            # Read line by line
            for l in classcode:
                i=i+1
                if '.class' in l:
                    match_class = self.is_class(l)
                    if match_class:
                        current_class = self.extract_class(match_class)
                        self.classes.append(current_class)

                elif '.super' in l:
                    match_class_parent = self.is_class_parent(l)
                    if match_class_parent:
                        current_class['parent'] = match_class_parent

                elif '.field' in l:
                    match_class_property = self.is_class_property(l)
                    if match_class_property:
                        p = self.extract_class_property(match_class_property)
                        current_class['properties'].append(p)

                elif 'const-string' in l:
                    match_const_string = self.is_const_string(l)
                    if match_const_string:
                        c = self.extract_const_string(match_const_string)
                        current_class['const-strings'].append(c)

                elif '.method' in l:
                    match_class_method = self.is_class_method(l)
                    if match_class_method:
                        startline=i-1
                        endline=startline

                        while(True):
                            endline=endline+1
                            match_class_method_end = self.is_class_method_end(classcode[endline])
                            if match_class_method_end:
                                break

                        #print("endline:"+str(endline))
                        methodbody=classcode[startline+1:endline]
                        newmethodbody=[]
                        for line in methodbody:
                            if line!="\n":
                                line=line.replace("\n","")
                                newmethodbody.append(line)

                        m = self.extract_class_method(match_class_method,newmethodbody)
                        current_method = m
                        current_call_index = 0
                        current_class['methods'].append(m)

                elif 'invoke' in l:
                    match_method_call = self.is_method_call(l)
                    if match_method_call:
                        m = self.extract_method_call(match_method_call)

                        # Add calling method (whiteboxtest2)
                        m['whiteboxtest2'] = current_method['name']

                        # Add call index
                        m['index'] = current_call_index
                        current_call_index += 1

                        # Add call to current method
                        current_method['calls'].append(m)
        # Close fd
        f.close()

    def parse_location(self):
        """Parse files in specified location"""
        for root, dirs, files in os.walk(self.location):
            for f in files:
                if f.endswith(self.suffix):
                    file_path = root + "/" + f
                    self.current_path = file_path
                    self.parse_file(file_path)

    def is_class(self, line):

        match = re.search("\.class\s+(?P<class>.*);", line)
        if match:
            #log.debug("Found class: %s" % match.group('class'))
            return match.group('class')
        else:
            return None

    def is_class_parent(self, line):
        match = re.search("\.super\s+(?P<parent>.*);", line)
        if match:
            #log.debug("\t\tFound parent class: %s" % match.group('parent'))
            return match.group('parent')
        else:
            return None

    def is_class_property(self, line):
        match = re.search("\.field\s+(?P<property>.*);", line)
        if match:
            #log.debug("\t\tFound property: %s" % match.group('property'))
            return match.group('property')
        else:
            return None

    def is_const_string(self, line):
        match = re.search("const-string\s+(?P<const>.*)", line)
        if match:
            #log.debug("\t\tFound const-string: %s" % match.group('const'))
            return match.group('const')
        else:
            return None

    def is_class_method(self, line):
        match = re.search("\.method\s+(?P<method>.*)$", line)
        if match:
            return match.group('method')
        else:
            return None

    def is_class_method_end(self, line):

        match = re.search("\.end method", line)
        if match:
            #log.debug("\t\tFound method: %s" % match.group('method'))
            return True
        else:
            return None

    def is_method_call(self, line):
        match = re.search("invoke-\w+(?P<invoke>.*)", line)
        if match:
            #log.debug("\t\t Found invoke: %s" % match.group('invoke'))
            return match.group('invoke')
        else:
            return None

    def extract_class(self, data):

        class_info = data.split(" ")
        #log.debug("class_info: %s" % class_info[-1].split('/')[:-1])
        c = {
            # Last element is the class name
            'name': class_info[-1],

            # Package name
            'package': ".".join(class_info[-1].split('/')[:-1]),

            # Class deepth
            'depth': len(class_info[-1].split("/")),

            # All elements refer to the type of class
            'type': " ".join(class_info[:-1]),

            # Current file path
            'path': self.current_path,

            # Properties
            'properties': [],

            # Const strings
            'const-strings': [],

            # Methods
            'methods': []
        }

        return c

    def extract_class_property(self, data):

        prop_info = data.split(" ")

        # A field/property is usually saved in this form
        #  <name>:<type>
        prop_name_split = prop_info[-1].split(':')

        p = {
            # Property name
            'name': prop_name_split[0],

            # Property type
            'type': prop_name_split[1] if len(prop_name_split) > 1 else '',

            # Additional info (e.g. public static etc.)
            'info': " ".join(prop_info[:-1])
        }

        return p

    def extract_const_string(self, data):
        match = re.search('(?P<var>.*),\s+"(?P<value>.*)"', data)
        if match:
            # A const string is usually saved in this form
            #  <variable name>,<value>

            c = {
                # Variable
                'name': match.group('var'),

                # Value of string
                'value': match.group('value')
            }

            return c
        else:
            return None

    def extract_class_method(self, data,body):
        method_info = data.split(" ")

        # A method looks like:
        #  <name>(<arguments>)<return value>
        m_name = method_info[-1]
        m_args = None
        m_ret = None

        # Search for name, arguments and return value
        match = re.search(
            "(?P<name>.*)\((?P<args>.*)\)(?P<return>.*)", method_info[-1])

        if match:
            m_name = match.group('name')
            m_args = match.group('args')
            m_ret = match.group('return')

        m = {
            # Method name
            'name': m_name,

            # Arguments
            'args': m_args,

            # Return value
            'return': m_ret,

            # Additional info such as public static etc.
            'type': " ".join(method_info[:-1]),

            # Calls
            'calls': [],

            'body':body
        }

        return m

    def extract_method_call(self, data):
        # Default values
        c_dst_class = data
        c_dst_method = None
        c_local_args = None
        c_dst_args = None
        c_ret = None

        # The call looks like this
        #  <destination class>) -> <method>(args)<return value>
        match = re.search(
            '(?P<local_args>\{.*\}),\s+(?P<dst_class>.*);->' +
            '(?P<dst_method>.*)\((?P<dst_args>.*)\)(?P<return>.*)', data)

        if match:
            c_dst_class = match.group('dst_class')
            c_dst_method = match.group('dst_method')
            c_dst_args = match.group('dst_args')
            c_local_args = match.group('local_args')
            c_ret = match.group('return')

        c = {
            # Destination class
            'to_class': c_dst_class,

            # Destination method
            'to_method': c_dst_method,

            # Local arguments
            'local_args': c_local_args,

            # Destination arguments
            'dst_args': c_dst_args,

            # Return value
            'return': c_ret
        }

        return c

    def get_results(self):
        return self.classes
'''
先将jar包转dex，然后再将dex反编译为smali，再解析smali获取方法信息，包括方法名，包名，返回值类型和参数
'''
if __name__ == '__main__':
    dexpath='target.dex'
    jarpath='target.jar'
    smalipath='smali'
    '''
    将jar包转为dex
    '''
    #os.system("java -jar lib/dx.jar --dex --output=%s %s" % (dexpath, jarpath))
    #print("jar2dex successfully!")

    '''
    将dex文件转为smali文件
    '''
    #os.system("java -jar lib/baksmali.jar %s -o %s" % (dexpath,smalipath))
    #print("dex2smali successfully!")
    #parser=SmaliParser("res/smali","smali")
    parser=SmaliParser("8587org","smali")
    parser.run()
    #file=open("res/smali/result.json","w")
    funcNameList=open('../res/funcNameConfig.txt','r').readlines()
    funcInvokeConfig=open('../res/funcInvokeConfig.txt','a+')
    for tm in funcNameList:
        for cls in parser.classes:
            flag=False
            for method in cls['methods']:
                if method.get('name')==tm.replace("\n",""):
                    methodinvoke="%s;->%s(%s)%s"%(
                        cls['name'],
                        method['name'],
                        method['args'],
                        method['return']
                    )
                    print(methodinvoke)
                    funcInvokeConfig.write(methodinvoke+"\n")
                    flag=True
                    break
                if flag==True:
                    break
    #file.write(str(parser.classes))