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
