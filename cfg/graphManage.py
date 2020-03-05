# -- coding:utf-8 --
'''
生成路径
'''
from config import*
import hashlib
'''
指令流图工具类
'''
class graphTools():
    @staticmethod
    def searchGraph(graph, start, end,results):
        graphTools.generatePath(graph, [start], end, results)  # 生成路径
        results.sort(key=lambda x: len(x))  # 按路径长短排序

    @staticmethod
    def generatePath(graph, path, end, results):
        state = path[-1]
        if state == end:
            results.append(path)
        else:
            if graph.get(state) != None:
                for arc in graph.get(state):
                    if arc not in path:
                        graphTools.generatePath(graph, path + [arc], end, results)

    '''
    对block进行一些处理，便于进行分析,其中\r会造成字符串截断，所以需要进行替换
    '''
    @staticmethod
    def fixblock(edges,Diagraph):
        # \f \r会影响字符串比对判断，需要进行替换
        for k, v in Diagraph.obj_dict['edges'].items():
            k0 = k[0].replace('\\r', "\\l")
            k0 = k0.replace('\"', "").replace("\\f", "")
            k1 = k[1].replace("\\r", "\\l")
            k1 = k1.replace('\"', "").replace("\\f", "")
            logging.info("[init] - edegs %s  %s" % (k0, k1))
            edges.append((k0, k1))

    '''
    生成简单指令流图
    '''
    @staticmethod
    def genSimpleGraph(nodeset,edges, graph):
        for a in edges:
            nodeset.add(a[0])  # blocknode set
            nodeset.add(a[1])
        for node in nodeset:
            graph.setdefault(node, [])
        for node in nodeset:
            logging.info("代码块=>%s"%node)
            for a in edges:
                if node == a[0]:
                    graph[node].append(a[1])
class hashGraph():
    def __init__(self):
        self.hashgraph={}
        pass
    '''
    生成指令流的hash图
    '''
    def generate(self,graph):
        for key, values in graph.items():
            md5_key = hashlib.md5()
            md5_key.update(key)
            md5_key.hexdigest()

            for v in values:
                md5_v = hashlib.md5()
                md5_v.update(v)
                self.hashgraph[md5_key.hexdigest()] = md5_v.hexdigest()
    '''
    图搜索
    '''
    def graphSearch(self,graph,start,end):
            '''
            这里做测试用，故使用整个块进行查询，后续将使用函数引用来查询。即，如果在块中匹配到了敏感的函数调用，后将该敏感函数打上标签sink or source标签
            然后查询他们所在块的通路，然后在这条通路上进行污点分析。
            不过考虑到效率问题，将块的hash值来作为搜索查询会相对块一点。
            '''
            start_md5 = hashlib.md5()
            start_md5.update(start)
            end_md5 = hashlib.md5()
            end_md5.update(end)

            '''
            查询两个块之间的通路，这种算法适用与前期已经对sink点和source点进行了收集的情况
            这样只要通过图的节点查询，就可以知道两个块节点是否有通路，且中间经过了哪些节点都可以
            知道，这样我们就可以基于此进行进一步的污点分析了。
            '''