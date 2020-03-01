# -- coding:utf-8 --
'''
by pOny@moresec
'''
import logging
LOG_FORMAT="%(asctime)s [%(levelname)s] - %(message)s"
logging.basicConfig(filename="logs/Hades_exec.log",level=logging.DEBUG,format=LOG_FORMAT)
minsdkversion="--min-sdk-version=26"

sourceContainer = [  # source点
	'Lcom/moresc/cn/base;->getHttpRequests()Ljava/lang/String;',
	'Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;',
	'Ljavax/servlet/http/HttpServletRequest;->getParameterMap()Ljava/util/Map;',
	'Lorg/owasp/benchmark/helpers/SeparateClassRequest;->getTheParameter(Ljava/lang/String;)Ljava/lang/String;'
]

sinkContainer = [
	'Lcom/moresc/cn/base;->responseToClient(Ljava/lang/String;)Ljava/lang/String;',
	'Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;',
	'Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I',
	'Lorg/springframework/jdbc/core/JdbcTemplate;->queryForRowSet(Ljava/lang/String;)Lorg/springframework/jdbc/support/rowset/SqlRowSet;',
	'Ljava/io/PrintWriter;->write(Ljava/lang/String;II)V'
]

firstBlockList=[
	"onCreate(Landroid/os/Bundle;)V 1\l",
	"main([Ljava/lang/String;)V 1\l",
	"doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 1\l"
]

javaEntryTmplList=[
	"L%s;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V",
	"L%s;->main([Ljava/lang/String;)V"
]

androidEntryTmplList=[
	"L%s;->onCreate(Landroid/os/Bundle;)V",
	"L%s;->onStart(Landroid/os/Bundle;)V",
	"L%s;->onRestart(Landroid/os/Bundle;)V",
	"L%s;->onResume(Landroid/os/Bundle;)V",
	"L%s;->onStartCommand(Landroid/os/Bundle;)V",
]

cleanContainer=[
	"test",
	"test"
]

banner='''
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |      __      | || |  ________    | || |  _________   | || |    _______   | |
| | |_   ||   _| | || |     /  \     | || | |_   ___ `.  | || | |_   ___  |  | || |   /  ___  |  | |
| |   | |__| |   | || |    / /\ \    | || |   | |   `. \ | || |   | |_  \_|  | || |  |  (__ \_|  | |
| |   |  __  |   | || |   / ____ \   | || |   | |    | | | || |   |  _|  _   | || |   '.___`-.   | |
| |  _| |  | |_  | || | _/ /    \ \_ | || |  _| |___.' / | || |  _| |___/ |  | || |  |`\____) |  | |
| | |____||____| | || ||____|  |____|| || | |________.'  | || | |_________|  | || |  |_______.'  | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
Authod:pOny@moresec
Date:2020.2.14
:)
'''

#漏洞描述
vul_desc={
	"Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I":{
		"level":"high",
		"vulname":"sqlInject",
		"desc":"",
		"type":""
	}

}