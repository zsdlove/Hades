# Hades - 静态代码脆弱性检测系统
**基于虚拟执行及污点跟踪技术**
![markdown](https://image.3001.net/images/20200229/1582976797_5e5a4f1dc3478.png?raw=true "图片1")

## Hades开源项目交流群
![markdown](https://github.com/zsdlove/Hades/blob/master/wxq.jpg?raw=true "图片1")

## 使用说明
```shell
start engine:
>>python Hades-cli.py
start web server:
>>cd geekbackend
>>python manage.py runserver 8088
```
### 使用docker安装Hades
```shell
>>docker build -t geekbackend .
>>docker run -p 8088:8088 geekbackend
:)enjoy it.
```
## 一、引言
为什么要开这么一个白盒审计系统呢?其实，自己开发白盒审计系统的想法已经在我的脑海中存在很久了。之前毕业之后在白盒方面花了挺多时间，不过由于各方面原因，一直没有特别突出的进展。最近在做一个安卓相关的项目，自己实现了一套针对smali字节码的虚拟解释执行引擎，然后就突发一个想法，android也是使用java进行开发的，那么能不能直接复用这套虚拟解释执行引擎来对java源码进行分析呢？经过调研，发现java字节码可以通过安卓sdk中的dx.jar转为smali字节码。这样一来，实现java白盒的代价就小了很多。另一方面，虽然现在并不是在做白盒相关的工作，但是还是希望凭借自己对语言的理解，以及编码能力，自己构造出一个像样的白盒审计系统。而之所以开源这套系统，也是希望能够吸引更多对白盒引擎开发感兴趣的人才加入到这个项目当中，一起维护这个项目。
## 二、整体架构设计
### 1、前端方面
前端采用layUI编写，本来打算使用vue的，不过vue方面还不是特别的熟悉，考虑到解决bug来可能会比较耗时，所以采用比较简单的layUI来编写前端。
先展示下前端效果，以下是任务提交页面 
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%871.png?raw=true "图片1")
以下是报告展示页面
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%872.png?raw=true "图片2")
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%873.png?raw=true "图片3")
### 2、后端方面
##### 1、使用django实现文件接收接口，并对文件类型和合法性进行校验，通过redis消息队列将任务消息发布到消息队列中，传递给后端引擎。
##### 2、实现报告查看功能，根据上传页面上的提示地址在检测结束后，通过访问该地址来获取和查看检测报告。
### 3、底层引擎方面
通过redis消息队列接收到任务信息，新建一个任务线程对上传的文件进行分析。针对源码的处理是，如果是maven管理的项目则使用mvn compile进行编译。如果是普通的java项目的话则使用javac进行单文件编译(考虑到整体编译的话会造成编译失败，遗失字节码文件)。然后，将最终得到的java字节码文件转为smali字节码文件(为什么要转为smali字节码文件呢?后面会进行说明)，最后将最终的字节码文件作为输入传递给主引擎程序进行执行分析。
### 4、软件整体的执行流程示意图如下：
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%874.png?raw=true "图片3") 
## 三、smali字节码简介
因为本白盒程序主要基于smali文件进行分析的，所以这里我先简要介绍下smali字节码。而说到smali字节码，可能很多同学不太了解。那么，我先讲下程序的编译过程。程序的编译一般需要经过六个过程，即: 词法分析、语法分析、语义分析、中间代码生成、代码优化、目标代码生成。下面简要说明下这六个过程的各自的工作。词法分析，主要是对输入的源码文件中的字符从左到右逐个进行分析，输出与源代码等价的token流。语法分析，主要是基于输入的token流，根据语言的语法规则，做一些上下文无关的语法检查，语法分析结束之后，生成AST语法树。语义分析，主要是将AST语法树作为输入，并基于AST语法树做一些上下文相关的类型检查。语义分析结束后，生成中间代码，而此时的中间代码，是一种易于转为目标代码的一种中间表示形式。代码优化，则是针对中间代码进行进一步的优化处理，合并其中的一些冗余代码，生成等价的新的中间表示形式，最后生成目标代码。 
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%875.png?raw=true "图片5") 
那么，我为什么要选择smali作为分析java程序的目标代码呢？引言中已经提到了，一方面，最近在做一个android相关的项目，项目中已经实现了smali层面的污点跟踪引擎，如果能够直接复用之前写的这套污点分析代码，那岂不是很爽，不用继续造轮子了。另一方面，相较java字节码来说，smali字节码更加的简单，因为smali字节码是一种基于寄存器的指令系统，它的指令是二地址和三地址混合的，指令中指明了操作数的地址。而JVM是基于栈的虚拟机，JVM将本地变量放到一个本地变量列表中，在进行指令解释的时候，将变量push到操作数栈中，由操作码对应的解释函数来进行解释执行。所以，java字节码操作无疑会比smali字节码更复杂一些，复杂主要体现在后续的堆栈设计以及代码解释执行。
## 四、白盒引擎实现详细说明
下面我分六个部分，详细说明下我的白盒引擎实现思路。
### 0x1 指令控制流图构造
要实现指令控制流图的构造，首先我们需要对每一个类字节码进行切片，解析出一个个的指令代码块，然后将各个指令代码块进行依赖分析，并保存为图的形式。但是总不至于针对每一个函数都构造指令控制流图吧，这样太费时，而且有些函数，程序在执行过程中不一定会调用到的，那么我们构建它又有什么意义呢？。我们知道，每一个程序都会有一个入口函数，比如java程序中的main函数，或者一些涉及网络请求映射处理的函数，比如servlet中的doPost，doGet等。只要从这些入口点进行指令控制流图的构建，就可以尽可能的覆盖程序执行过程中可能走过的路线。
Hades构造的指令控制流图大致效果图:
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%876.png?raw=true "图片6") 
局部放大版：
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%877.png?raw=true "图片7") 
### 0x2 通路计算
构建好了指令控制流图之后，如果我们每一条路线，每个指令都解释执行一遍，那肯定是十分耗时的，所以考虑到执行效率方面，Hades会先找到sink点和source点各自所处的代码块节点，通过图的查询算法，查询两个节点(代码块节点)之间的通路(这个通路可能不止一条)，然后将这条通路中的所有代码块合并在一起，重新组成一段线性的代码块，然后对这段代码块进行解释执行。
### 0x3 解释执行
在讲解释执行之前，我先简要说明下虚拟解释器的原理。虚拟解释器并不是真正的解释器，但是它应该具备解释器的主要功能，即对字节码指令进行解释，对堆栈进行存取处理。而如果我们希望在解释执行的时候能够收集到污点的一些传递情况，那么单纯的进行解释执行肯定是不够的，我们还需要在指令解释执行的基础上，增加污点的传播分析。那么，如何实现污点的传播分析呢？这是我们需要着重考虑的点。我们知道，传统的解释器，在解释执行的程序的时候，需要根据用户传入的参数，进行一些值的处理的。而与传统解释器不同的是，我们的虚拟执行引擎并不是真正的执行起来，也不需要让程序真正的执行起来，我们解释执行的目的不是为了对传入的值进行处理，而是分析传入的值的走势，我们关注的是它怎么走的，这个点。所以，我们会把用户传入的参数设置为污点，而这个获取用户输入参数的函数的返回值所存储的寄存器便会被我们标记为污点，这个函数是整个污点分析的起点，而这个污点寄存器则是这个污点网络主干路线上的第一个污点。
我们在通过对函数引用进行解释之后，获得了污点网络中的第一个污点信息，那么现在我们来思考下接下来污点是如何分析的呢？其实我们知道，污点的传播无非是几个方式，一种是通过赋值的指令进行传递，第二种是通过数组操作指令将污点传递给了数组成员，第三种是通过函数调用，将污点传递给了函数执行结束的返回值(这里是寄存器)。所以我们只需要注重对这些赋值操作进行解释执行即可实现对污点的跟踪分析。
Hades解释执行的指令:
```json
"invoke-virtual":self.handle_invoke,            
"invoke-virtual/range": self.handle_invoke, 
"invoke-static": self.handle_invoke, 
"invoke-direct": self.handle_invoke, 
"invoke-super": self.handle_invoke_super, 
"invoke-static/range": self.handle_invoke, 
"invoke-interface": self.handle_invoke, 
"invoke-interface-range": self.handle_invoke, 
"invoke-super/range": self.handle_invoke_super, 
"invoke-direct/range": self.handle_invoke, 
"move-result-object": self.handle_move_result, 
"move-result": self.handle_move_result, 
"move-result-wide": self.handle_move_result, 
"move-exception": self.handle_move_result, 
"move-object": self.handle_move, 
"move-object/from16":self.handle_move, 
"move-object/16":self.handle_move, 
"move-wide": self.handle_move, 
"move-wide/from16": self.handle_move, 
"move-wide/16": self.handle_move, 
"move": self.handle_move, 
"move/from16": self.handle_move, 
"move/16": self.handle_move, 
"const-string": self.handle_const, 
"const-string-jumbo": self.handle_const, 
"const": self.handle_const, 
"const/4":self.handle_const, 
"const/8":self.handle_const, 
"const/16":self.handle_const, 
"const/high16":self.handle_const, 
"const-wide/16":self.handle_const, 
"const-wide/32":self.handle_const, 
"const-wide":self.handle_const, 
"const-wide/high16":self.handle_const, 
"const-class": self.handle_const, 
"goto":self.handle_goto, 
"goto/16":self.handle_goto, 
"goto/32":self.handle_goto, 
".registers":self.handle_registers, 
".line":self.handle_line, 
"check-cast":self.default, 
"if-eqz":self.default, 
"default":self.default, 
"return":self.handle_return, 
"return-object":self.handle_return, 
"return-void":self.handle_return, 
"return-wide":self.handle_return, 
"new-array": self.handle_array_create, 
"aput-object": self.handle_aput, 
"aget-object": self.handle_aget, 
"aget-wide": self.handle_aget, 
"aput-wide": self.handle_aput, 
"aget-boolean": self.handle_aget, 
"aput-boolean": self.handle_aput, 
"aget-byte": self.handle_aget, 
"aput-byte": self.handle_aput, 
"aget-char": self.handle_aget, 
"aput-char": self.handle_aput, 
"aget-short": self.handle_aget,
"aput-short": self.handle_aput, 
"iput-object": self.handle_aput, 
"iget-object": self.handle_aget, 
"iget-wide": self.handle_aget, 
"iput-wide": self.handle_aput, 
"iget-boolean": self.handle_aget, 
"iput-boolean": self.handle_aput, 
"iget-byte": self.handle_aget, 
"iput-byte": self.handle_aput, 
"iget-char": self.handle_aget, 
"iput-char": self.handle_aput, 
"iget-short": self.handle_aget, 
"iput-short": self.handle_aput, 
"sput-object": self.default, 
"sget-object": self.default, 
"sget-wide": self.default, 
"sput-wide": self.default, 
"sget-boolean": self.default, 
"sput-boolean": self.default, 
"sget-byte": self.default, 
"sput-byte": self.default, 
"sget-char": self.default, 
"sput-char": self.default,
"sget-short": self.default, 
"sput-short": self.default, 
"new-instance": self.default, 
"packed-switch": self.default, 
"sparse-switch": self.default,
```
其中，default表示该指令目前Hades暂不解释，但在之后的版本中，可能会考虑对其进行解释。

### 0x4 内存模拟
#### 1、寄存器
现在我们知道了污点追踪分析的方法，但是仅仅对指令进行解释执行是不够的，因为指令在解释执行的时候是需要操作寄存器和内存的，如果没有内存的介入，那么指令解释毫无意义，所以，我们还需要设计一个用于污点分析的内存结构。Hades的内存结构主要包括三个部分，分别是，污点寄存器，污点栈及污点堆部分。污点寄存器，包含属性如下:
Name，value，isTained，分别对应对应寄存器名，寄存器值，及污点属性。之前说了，Hades的虚拟执行系统不需要值的介入，这里为什么还要有一个value呢？这里，虽然Hades不care值的处理，但是，为了能够准确的定位到数组索引，处理数组操作相关的污点传播问题，还是需要对这部分的值进行保存的。
#### 2、污点栈
为什么程序没有真正执行起来，还需要有栈结构呢？这里，设计污点栈的目的是为了污点的保存。在函数间污点分析的过程中，我们在跟入分析一个被调用的函数的时候，也需要对当前函数的污点现场进行保存，以便在在分析完被调用函数回来之后，能够恢复到原来的污点现场继续向下进行污点分析，所以一个合理的栈结构的设计是十分必要的。下面是Hades污点栈结构示意图:
```
                      +- - - - - - - - - - -+

                      -         out0         -
                      +-------------------+  <-- stack pointer
                      +           ...          +
                      +-------------------+  <-- frame pointer:for func1
                      +  v0 == local0  +
+-----------------+   +-------------------+
+  out0           +   +  v1 == in0      +
+-----------------+   +-------------------+
+  out1           +   +  v2 == in1      +
+-----------------+   +-------------------+
+         ...     +
+-----------------+  <--- frame pointer:for oncreate
+  v0 == local0   +
+-----------------+
+  v1 == local1   +
+-----------------+
+  v2 == in0      +
+-----------------+
+  v3 == in1      +
+-----------------+
+  v4 == in2      +
+-----------------+
-                 -
-                 -
-                 -
+-----------------+  <-- 栈起始位置
```

Hades污点栈结构设计参考了DVM的的栈设计方案，有点类似'寄存器窗口',这也是dvm解释器栈的一个特色，当然这只是大概的示意图，具体的栈结构和栈帧结构在上图的结构的基础上做了一些更加适配污点跟踪分析的设计，在此就不给出了。下面解释下栈帧顶部的out区域和in区域的作用，这里out和int区域的设计主要是为了函数间参数的传递，虽然我们不需要真实参数值/对象的传递，但是我们需要获取上一个函数传入的参数的污点属性。为了获取上一个函数中的污点属性，需要在上一个函数执行到函数调用的时候，将参数push到当前栈帧的顶部out区域，然后参数由out区域传入到in区域，当执行到调用的函数的时候，程序从栈帧的底部in区域获取到参数信息（包含了污点属性的参数信息，以及一些必要的值信息）。依据此污点栈设计，我们就可以对函数间的污点传播进行跟踪分析。
#### 3、堆部分
Hades中的堆的设计并不是很多，也不是很完善，目前主要用来存放数组信息，用于处理数组成员的污点追踪操作。
### 0x5 污点追踪
最后我们来对最重要的环节，污点追踪，前面的设计也是为了该部分服务。Hades的污点传播方式分为栈帧型污点传播，和指令型污点传播。指令型污点传播，顾名思义，就是通过解释执行字节码指令来进行污点传播的，在上面我们也提过，那么什么是栈帧型污点传播呢？在进行一个新函数的污点分析之前，Hades会为新函数分配一个污点栈帧，在这个污点栈帧中会为新函数分配好指令解释执行过程中需要的所有虚拟寄存器，以满足指令解释执行的需要。(smali是一种基于寄存器操作的字节码，值的操作都是基于虚拟寄存器的，不像c及java等语言字节码，有大量值的存取操作)新栈帧中一部分寄存器来自函数的入参，入参来自上一个栈帧的输出区域。在上一个函数发生函数调用的时候，Hades会将函数的传入参数(包含寄存器中的污点信息,值信息)保存在上一个函数栈帧的输出区域中，在解释执行新函数的之前，旧栈帧会对新栈帧进行一个污点的传递，将污点信息传递到新函数的入参中，这样就完成了函数间的污点传递，即栈帧与栈帧之间的污点传播。
### 0x6 污点净化部分
Hades之初并不将净化函数加入到污点分析过程中，主要的考虑到没有一个第三方安全厂商能够百分百保证他们的安全sdk中的净化函数不存在被绕过的风险。但是实际攻击过程中，必要的防护代码确实能够防住绝大部分的攻击测试。后续，Hades方面将会逐步增加净化函数方面规则的支持。 
## 五、规则配置部分
Hades的规则配置部分以下几个部分：
1、sink点规则配置。
2、source点规则配置。
3、clean点配置。
4、程序入口点规则配置。
规则方面，由于都是字节码形式的规则，手动收集的话会比较麻烦，所以我额外开发了一个规则生成器，在utils包中，只要输入函数名及所属的jar包的路径，即可生成相应的函数调用形式。
## 六、用到的第三方工具
以下是Hades用到的第三方工具:
1、dx.jar
来自androidSDK，用于将java字节码转为smali字节码。
2、baksmali.jar
用于将dex文件反编译为smali。
## 七、Demo测试
这里我们以Benchmark的靶场作为测试的示例程序。
### 1、测试1 命令执行漏洞
本测试单元，对应benchmark中的第17个靶场。
代码:
```java
/**
* OWASP Benchmark v1.2
*
* This file is part of the Open Web Application Security Project (OWASP)
package org.owasp.benchmark.testcode;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(value="/cmdi-00/BenchmarkTest00017")
public class BenchmarkTest00017 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// some code
		response.setContentType("text/html;charset=UTF-8");
		String param = "";
		java.util.Enumeration<String> headers = request.getHeaders("BenchmarkTest00017");
		if (headers != null && headers.hasMoreElements()) {
			param = headers.nextElement(); // just grab first element
		}
		// URL Decode the header value since req.getHeaders() doesn't. Unlike req.getParameters().
		param = java.net.URLDecoder.decode(param, "UTF-8");
		String cmd = "";
        String osName = System.getProperty("os.name");
        if (osName.indexOf("Windows") != -1) {
        	cmd = org.owasp.benchmark.helpers.Utils.getOSCommandString("echo");
        }
		Runtime r = Runtime.getRuntime();
		try {
			Process p = r.exec(cmd + param);
			org.owasp.benchmark.helpers.Utils.printOSCommandResults(p, response);
		} catch (IOException e) {
			System.out.println("Problem executing cmdi - TestCase");
			response.getWriter().println(
			  org.owasp.esapi.ESAPI.encoder().encodeForHTML(e.getMessage())
			);
			return;
		}
	}
}
```
这里简要的分析一下程序：
后端程序通过request.getheader函数获取客户端网络请求的头部信息，并从中读取第一个element信息作为参数进入到命令执行函数中，这就构成了一个命令执行漏洞。
下面是污点传递的示意图
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%878.png?raw=true "图片3") 
好，下面我们使用Hades来对该程序进行检测。
以下是Hades 生成的smali字节码
```
.class public Lorg/owasp/benchmark/testcode/BenchmarkTest00017;
.super Ljavax/servlet/http/HttpServlet;
.source "BenchmarkTest00017.java"


# annotations
.annotation runtime Ljavax/servlet/annotation/WebServlet;
    value = {
        "/cmdi-00/BenchmarkTest00017"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    return-void
.end method


# virtual methods
.method public doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0, p1, p2}, Lorg/owasp/benchmark/testcode/BenchmarkTest00017;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 37
    return-void
.end method

.method public doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 13
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    const-string v7, "text/html;charset=UTF-8"

    invoke-interface {p2, v7}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 45
    const-string v5, ""

    .line 46
    .local v5, "param":Ljava/lang/String;
    const-string v7, "BenchmarkTest00017"

    invoke-interface {p1, v7}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v2

    .line 48
    .local v2, "headers":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    if-eqz v2, :cond_1b

    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_1b

    .line 49
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "param":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 53
    .restart local v5    # "param":Ljava/lang/String;
    :cond_1b
    const-string v7, "UTF-8"

    invoke-static {v5, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 56
    const-string v0, ""

    .line 57
    .local v0, "cmd":Ljava/lang/String;
    const-string v7, "os.name"

    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 58
    .local v3, "osName":Ljava/lang/String;
    const-string v7, "Windows"

    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_38

    .line 59
    const-string v7, "echo"

    invoke-static {v7}, Lorg/owasp/benchmark/helpers/Utils;->getOSCommandString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 62
    :cond_38
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    .line 65
    .local v6, "r":Ljava/lang/Runtime;
    :try_start_3c
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 66
    .local v4, "p":Ljava/lang/Process;
    invoke-static {v4, p2}, Lorg/owasp/benchmark/helpers/Utils;->printOSCommandResults(Ljava/lang/Process;Ljavax/servlet/http/HttpServletResponse;)V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_54} :catch_55

    .line 74
    .end local v4    # "p":Ljava/lang/Process;
    :goto_54
    return-void

    .line 67
    :catch_55
    move-exception v1

    .line 68
    .local v1, "e":Ljava/io/IOException;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "Problem executing cmdi - TestCase"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v7

    .line 70
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 69
    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_54
.end method
```
这里我们将doPost作为我们的入口点进行指令控制流的构造，那么如何生成一个入口点呢？这里可以使用我项目中的一个入口点生成工具funcInvokeGenerate.py即可生成期望得到的入口点信息，只需要输入入口点函数名称和相应的所属的jar包路径即可。
source点:
Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;
sink点:
Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
以下是hades构造的指令控制流图(由于生成的控制流图过大，故我只截取了部分的控制流图)
Source点
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%879.png?raw=true "图片3") 
Sink点
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%8710.png?raw=true "图片3") 
以下是Hades的分析报告：
```json
{
      "source": "Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;", 
      "linearCode": [
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 1", 
        "1: .registers 13", 
        "2: .param p1, \\request\\    # Ljavax/servlet/http/HttpServletRequest;", 
        "3: .param p2, \\response\\    # Ljavax/servlet/http/HttpServletResponse;", 
        "4: .annotation system Ldalvik/annotation/Throws;", 
        "5: value = {", 
        "6: Ljavax/servlet/ServletException;,", 
        "7: Ljava/io/IOException;", 
        "8: }", 
        "9: .end annotation", 
        "10: .prologue", 
        "11: .line 42", 
        "12: const-string v7, \\text/html;charset=UTF-8\\", 
        "13: invoke-interface {p2, v7}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 14", 
        "14: .line 45", 
        "15: const-string v5, \\\\", 
        "16: .line 46", 
        "17: .local v5, \\param\\:Ljava/lang/String;", 
        "18: const-string v7, \\BenchmarkTest00017\\", 
        "19: invoke-interface {p1, v7}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 20", 
        "20: move-result-object v2", 
        "21: .line 48", 
        "22: .local v2, \\headers\\:Ljava/util/Enumeration;, \\Ljava/util/Enumeration<Ljava/lang/String;>;\\", 
        "23: if-eqz v2, :cond_1b", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 24", 
        "24: invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 25", 
        "25: move-result v7", 
        "26: if-eqz v7, :cond_1b", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 34", 
        "34: :cond_1b", 
        "35: const-string v7, \\UTF-8\\", 
        "36: invoke-static {v5, v7}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 37", 
        "37: move-result-object v5", 
        "38: .line 56", 
        "39: const-string v0, \\\\", 
        "40: .line 57", 
        "41: .local v0, \\cmd\\:Ljava/lang/String;", 
        "42: const-string v7, \\os.name\\", 
        "43: invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 44", 
        "44: move-result-object v3", 
        "45: .line 58", 
        "46: .local v3, \\osName\\:Ljava/lang/String;", 
        "47: const-string v7, \\Windows\\", 
        "48: invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 49", 
        "49: move-result v7", 
        "50: const/4 v8, -0x1", 
        "51: if-eq v7, v8, :cond_38", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 52", 
        "52: .line 59", 
        "53: const-string v7, \\echo\\", 
        "54: invoke-static {v7}, Lorg/owasp/benchmark/helpers/Utils;->getOSCommandString(Ljava/lang/String;)Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 55", 
        "55: move-result-object v0", 
        "56: .line 62", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 57", 
        "57: :cond_38", 
        "58: invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 59", 
        "59: move-result-object v6", 
        "60: .line 65", 
        "61: .local v6, \\r\\:Ljava/lang/Runtime;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 62", 
        "62: :try_start_3c", 
        "63: new-instance v7, Ljava/lang/StringBuilder;", 
        "64: invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 65", 
        "65: invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 66", 
        "66: move-result-object v7", 
        "67: invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 68", 
        "68: move-result-object v7", 
        "69: invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 70", 
        "70: move-result-object v7", 
        "71: invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;", 
        ""
      ], 
      "sinkBelongTo": "org/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V", 
      "sink": "Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;", 
      "sourceBelongTo": "org/owasp/benchmark/testcode/BenchmarkTest00017; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V"
    }
```

其中linearcode中记录的是从source点到sink点这条污点路线走过的所有指令。这里，我本来是想只解释执行source点到sink点之间的代码的，不过，后来发现如果只解释执行source点到sink点之间的指令代码的话，针对数组方面的污点分析能力就会变弱。为什么呢？因为数组成员的一些赋值操作是在source点之前进行的，如果没有对这些赋值操作进行解析，那么后续针对数组成员的污点分析无法实现，只能将数组整体标记为污点，认定从该数组取出来的元素都为污点，这样无疑会增加误报的几率。

这里，只显示字节码，和源码的关联性还没有做，不过要做的话也容易，因为字节码里都有对该部分的字节码对应的java源码的行号标记，即.line xx。我们根据字节码里的行号标记在源码里的对应行找到相应源码即可。

### 2、测试2 SQL注入漏洞
本测试单元对应的是benchmark的靶场18
```java
/**
* OWASP Benchmark v1.2
**/
package org.owasp.benchmark.testcode;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(value="/sqli-00/BenchmarkTest00018")
public class BenchmarkTest00018 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// some code
		response.setContentType("text/html;charset=UTF-8");
		

		String param = "";
		java.util.Enumeration<String> headers = request.getHeaders("BenchmarkTest00018");
		
		if (headers != null && headers.hasMoreElements()) {
			param = headers.nextElement(); // just grab first element
		}
		
		// URL Decode the header value since req.getHeaders() doesn't. Unlike req.getParameters().
		param = java.net.URLDecoder.decode(param, "UTF-8");

		
		String sql = "INSERT INTO users (username, password) VALUES ('foo','"+ param + "')";
				
		try {
			java.sql.Statement statement = org.owasp.benchmark.helpers.DatabaseHelper.getSqlStatement();
			int count = statement.executeUpdate( sql );
            org.owasp.benchmark.helpers.DatabaseHelper.outputUpdateComplete(sql, response);
		} catch (java.sql.SQLException e) {
			if (org.owasp.benchmark.helpers.DatabaseHelper.hideSQLErrors) {
        		response.getWriter().println(
"Error processing request."
);
        		return;
        	}
			else throw new ServletException(e);
		}
	}
	
}
```

简要的说明下该程序代码：
后端程序通过request.getheader函数获取客户端网络请求的头部信息，并从中读取第一个element信息作为参数进入到拼接形式的sql语句中，并最终进入到sql操作函数中。 
下面是污点传递的示意图
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%8711.png?raw=true "图片3") 
好，下面我们使用Hades来对该程序进行检测。
以下是Hades 生成的smali字节码
```
.class public Lorg/owasp/benchmark/testcode/BenchmarkTest00018;
.super Ljavax/servlet/http/HttpServlet;
.source "BenchmarkTest00018.java"


# annotations
.annotation runtime Ljavax/servlet/annotation/WebServlet;
    value = {
        "/sqli-00/BenchmarkTest00018"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    return-void
.end method


# virtual methods
.method public doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0, p1, p2}, Lorg/owasp/benchmark/testcode/BenchmarkTest00018;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 37
    return-void
.end method

.method public doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 11
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    const-string v6, "text/html;charset=UTF-8"

    invoke-interface {p2, v6}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 45
    const-string v3, ""

    .line 46
    .local v3, "param":Ljava/lang/String;
    const-string v6, "BenchmarkTest00018"

    invoke-interface {p1, v6}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v2

    .line 48
    .local v2, "headers":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    if-eqz v2, :cond_1b

    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 49
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "param":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 53
    .restart local v3    # "param":Ljava/lang/String;
    :cond_1b
    const-string v6, "UTF-8"

    invoke-static {v3, v6}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 56
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "INSERT INTO users (username, password) VALUES (\'foo\',\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\')"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 59
    .local v4, "sql":Ljava/lang/String;
    :try_start_3a
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlStatement()Ljava/sql/Statement;

    move-result-object v5

    .line 60
    .local v5, "statement":Ljava/sql/Statement;
    invoke-interface {v5, v4}, Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I

    move-result v0

    .line 61
    .local v0, "count":I
    invoke-static {v4, p2}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->outputUpdateComplete(Ljava/lang/String;Ljavax/servlet/http/HttpServletResponse;)V
    :try_end_45
    .catch Ljava/sql/SQLException; {:try_start_3a .. :try_end_45} :catch_46

    .line 71
    return-void

    .line 62
    .end local v0    # "count":I
    .end local v5    # "statement":Ljava/sql/Statement;
    :catch_46
    move-exception v1

    .line 69
    .local v1, "e":Ljava/sql/SQLException;
    new-instance v6, Ljavax/servlet/ServletException;

    invoke-direct {v6, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method
```

以下是我们需要配置的source点：
```
Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;
```
以下是我们需要配置的sink点：
`Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I`

以下是Hades生成的指令控制流图
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%8712.png?raw=true "图片3") 
由于指令控制流图太大，无法清晰的展示中间的指令信息，所以下面重点展示下source点和sink点相关的片段。
Source点:
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%8713.png?raw=true "图片3") 
sink点
![markdown](https://github.com/zsdlove/Hades/blob/master/img/%E5%9B%BE%E7%89%8714.png?raw=true "图片3")  

下面是Hades的检测报告：
```json
    {
      "source": "Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;", 
      "linearCode": [
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 1", 
        "1: .registers 11", 
        "2: .param p1, \\request\\    # Ljavax/servlet/http/HttpServletRequest;", 
        "3: .param p2, \\response\\    # Ljavax/servlet/http/HttpServletResponse;", 
        "4: .annotation system Ldalvik/annotation/Throws;", 
        "5: value = {", 
        "6: Ljavax/servlet/ServletException;,", 
        "7: Ljava/io/IOException;", 
        "8: }", 
        "9: .end annotation", 
        "10: .prologue", 
        "11: .line 42", 
        "12: const-string v6, \\text/html;charset=UTF-8\\", 
        "13: invoke-interface {p2, v6}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 14", 
        "14: .line 45", 
        "15: const-string v3, \\\\", 
        "16: .line 46", 
        "17: .local v3, \\param\\:Ljava/lang/String;", 
        "18: const-string v6, \\BenchmarkTest00018\\", 
        "19: invoke-interface {p1, v6}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 20", 
        "20: move-result-object v2", 
        "21: .line 48", 
        "22: .local v2, \\headers\\:Ljava/util/Enumeration;, \\Ljava/util/Enumeration<Ljava/lang/String;>;\\", 
        "23: if-eqz v2, :cond_1b", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 24", 
        "24: invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 25", 
        "25: move-result v6", 
        "26: if-eqz v6, :cond_1b", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 27", 
        "27: .line 49", 
        "28: invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 29", 
        "29: move-result-object v3", 
        "30: .end local v3    # \\param\\:Ljava/lang/String;", 
        "31: check-cast v3, Ljava/lang/String;", 
        "32: .line 53", 
        "33: .restart local v3    # \\param\\:Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 34", 
        "34: :cond_1b", 
        "35: const-string v6, \\UTF-8\\", 
        "36: invoke-static {v3, v6}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 37", 
        "37: move-result-object v3", 
        "38: .line 56", 
        "39: new-instance v6, Ljava/lang/StringBuilder;", 
        "40: invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 41", 
        "41: const-string v7, \\INSERT INTO users (username, password) VALUES (\\'foo\\',\\'\\", 
        "42: invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 43", 
        "43: move-result-object v6", 
        "44: invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 45", 
        "45: move-result-object v6", 
        "46: const-string v7, \\\\')\\", 
        "47: invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 48", 
        "48: move-result-object v6", 
        "49: invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 50", 
        "50: move-result-object v4", 
        "51: .line 59", 
        "52: .local v4, \\sql\\:Ljava/lang/String;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 53", 
        "53: :try_start_3a", 
        "54: invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlStatement()Ljava/sql/Statement;", 
        "", 
        "Lorg/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 55", 
        "55: move-result-object v5", 
        "56: .line 60", 
        "57: .local v5, \\statement\\:Ljava/sql/Statement;", 
        "58: invoke-interface {v5, v4}, Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I", 
        ""
      ], 
      "sinkBelongTo": "org/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V", 
      "sink": "Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I", 
      "sourceBelongTo": "org/owasp/benchmark/testcode/BenchmarkTest00018; doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V"
    }
```

## 八、招募项目长期维护
目前该项目中只支持java源码的审计，后续计划支持php，c/c++，js等语言。如果你对白盒感兴趣，并具有一定的编程能力(最好全栈)，可先加我为好友，我将把你拉近Hades白盒审计系统开源项目的交流群中。
## 九、联系方式:
#### 1、QQ:747289639（微信同）
#### 2、zhengsidie@gmail.com
