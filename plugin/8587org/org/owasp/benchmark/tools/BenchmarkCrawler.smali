.class public Lorg/owasp/benchmark/tools/BenchmarkCrawler;
.super Ljava/lang/Object;
.source "BenchmarkCrawler.java"


# static fields
.field public static benchmarkVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-string v0, ""

    sput-object v0, Lorg/owasp/benchmark/tools/BenchmarkCrawler;->benchmarkVersion:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 117
    new-instance v0, Lorg/owasp/benchmark/tools/BenchmarkCrawler;

    invoke-direct {v0}, Lorg/owasp/benchmark/tools/BenchmarkCrawler;-><init>()V

    .line 118
    .local v0, "crawler":Lorg/owasp/benchmark/tools/BenchmarkCrawler;
    invoke-virtual {v0}, Lorg/owasp/benchmark/tools/BenchmarkCrawler;->init()V

    .line 119
    return-void
.end method


# virtual methods
.method protected crawl(Ljava/io/InputStream;)V
    .registers 20
    .param p1, "http"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Lorg/apache/http/impl/client/HttpClients;->custom()Lorg/apache/http/impl/client/HttpClientBuilder;

    move-result-object v14

    invoke-static {}, Lorg/owasp/benchmark/helpers/Utils;->getSSLFactory()Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/http/impl/client/HttpClientBuilder;->setSSLSocketFactory(Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;)Lorg/apache/http/impl/client/HttpClientBuilder;

    move-result-object v14

    invoke-virtual {v14}, Lorg/apache/http/impl/client/HttpClientBuilder;->build()Lorg/apache/http/impl/client/CloseableHttpClient;

    move-result-object v5

    .line 38
    .local v5, "httpclient":Lorg/apache/http/impl/client/CloseableHttpClient;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 40
    .local v10, "start":J
    invoke-static/range {p1 .. p1}, Lorg/owasp/benchmark/helpers/Utils;->parseHttpFile(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v7

    .line 42
    .local v7, "requests":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1c
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4f

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;

    .line 44
    .local v6, "request":Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
    :try_start_28
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lorg/owasp/benchmark/tools/BenchmarkCrawler;->sendRequest(Lorg/apache/http/impl/client/CloseableHttpClient;Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;)Lorg/owasp/benchmark/tools/ResponseInfo;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2d} :catch_2e

    goto :goto_1c

    .line 45
    :catch_2e
    move-exception v4

    .line 46
    .local v4, "e":Ljava/lang/Exception;
    sget-object v15, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "\n  FAILED: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1c

    .line 50
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v6    # "request":Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
    :cond_4f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 51
    .local v12, "stop":J
    sub-long v14, v12, v10

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    long-to-double v8, v14

    .line 53
    .local v8, "seconds":D
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v14, "yyyy/MM/dd HH:mm:ss"

    invoke-direct {v3, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 54
    .local v3, "dateFormat":Ljava/text/DateFormat;
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 56
    .local v2, "date":Ljava/util/Date;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Crawl ran on "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v3, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " for Benchmark v"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget-object v16, Lorg/owasp/benchmark/tools/BenchmarkCrawler;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " took "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " seconds"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method protected init()V
    .registers 5

    .prologue
    .line 27
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "user.dir"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "benchmark-crawler-http.xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, "crawlerFile":Ljava/lang/String;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lorg/owasp/benchmark/helpers/Utils;->getCrawlerBenchmarkVersion(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/owasp/benchmark/tools/BenchmarkCrawler;->benchmarkVersion:Ljava/lang/String;

    .line 30
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/owasp/benchmark/tools/BenchmarkCrawler;->crawl(Ljava/io/InputStream;)V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3e} :catch_3f

    .line 34
    .end local v0    # "crawlerFile":Ljava/lang/String;
    :goto_3e
    return-void

    .line 31
    :catch_3f
    move-exception v1

    .line 32
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3e
.end method

.method protected sendRequest(Lorg/apache/http/impl/client/CloseableHttpClient;Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;)Lorg/owasp/benchmark/tools/ResponseInfo;
    .registers 21
    .param p1, "httpclient"    # Lorg/apache/http/impl/client/CloseableHttpClient;
    .param p2, "requestTC"    # Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;

    .prologue
    .line 73
    new-instance v8, Lorg/owasp/benchmark/tools/ResponseInfo;

    invoke-direct {v8}, Lorg/owasp/benchmark/tools/ResponseInfo;-><init>()V

    .line 74
    .local v8, "responseInfo":Lorg/owasp/benchmark/tools/ResponseInfo;
    invoke-virtual/range {p2 .. p2}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->buildRequest()Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v6

    .line 75
    .local v6, "request":Lorg/apache/http/client/methods/HttpRequestBase;
    invoke-virtual {v8, v6}, Lorg/owasp/benchmark/tools/ResponseInfo;->setRequestBase(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 76
    const/4 v7, 0x0

    .line 78
    .local v7, "response":Lorg/apache/http/client/methods/CloseableHttpResponse;
    instance-of v4, v6, Lorg/apache/http/client/methods/HttpPost;

    .line 79
    .local v4, "isPost":Z
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v4, :cond_95

    const-string v13, "POST "

    :goto_1a
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v6}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v14, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 80
    new-instance v12, Lorg/apache/commons/lang/time/StopWatch;

    invoke-direct {v12}, Lorg/apache/commons/lang/time/StopWatch;-><init>()V

    .line 82
    .local v12, "watch":Lorg/apache/commons/lang/time/StopWatch;
    invoke-virtual {v12}, Lorg/apache/commons/lang/time/StopWatch;->start()V

    .line 84
    :try_start_35
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/apache/http/impl/client/CloseableHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_3a} :catch_98

    move-result-object v7

    .line 88
    :goto_3b
    invoke-virtual {v12}, Lorg/apache/commons/lang/time/StopWatch;->stop()V

    .line 91
    :try_start_3e
    invoke-interface {v7}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    .line 92
    .local v3, "entity":Lorg/apache/http/HttpEntity;
    invoke-interface {v7}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    .line 93
    .local v9, "statusCode":I
    invoke-virtual {v8, v9}, Lorg/owasp/benchmark/tools/ResponseInfo;->setStatusCode(I)V

    .line 94
    invoke-virtual {v12}, Lorg/apache/commons/lang/time/StopWatch;->getTime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    long-to-double v10, v14

    .line 95
    .local v10, "time":D
    invoke-virtual {v8, v10, v11}, Lorg/owasp/benchmark/tools/ResponseInfo;->setTime(D)V

    .line 96
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "--> ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " : "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " sec) "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 97
    .local v5, "outputString":Ljava/lang/String;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v13, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_85
    .catchall {:try_start_3e .. :try_end_85} :catchall_a2

    .line 100
    :try_start_85
    invoke-static {v3}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Lorg/owasp/benchmark/tools/ResponseInfo;->setResponseString(Ljava/lang/String;)V

    .line 101
    invoke-static {v3}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_8f
    .catch Ljava/io/IOException; {:try_start_85 .. :try_end_8f} :catch_9d
    .catchall {:try_start_85 .. :try_end_8f} :catchall_a2

    .line 106
    :goto_8f
    if-eqz v7, :cond_94

    .line 108
    :try_start_91
    invoke-interface {v7}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V
    :try_end_94
    .catch Ljava/io/IOException; {:try_start_91 .. :try_end_94} :catch_a9

    .line 113
    :cond_94
    :goto_94
    return-object v8

    .line 79
    .end local v3    # "entity":Lorg/apache/http/HttpEntity;
    .end local v5    # "outputString":Ljava/lang/String;
    .end local v9    # "statusCode":I
    .end local v10    # "time":D
    .end local v12    # "watch":Lorg/apache/commons/lang/time/StopWatch;
    :cond_95
    const-string v13, "GET "

    goto :goto_1a

    .line 85
    .restart local v12    # "watch":Lorg/apache/commons/lang/time/StopWatch;
    :catch_98
    move-exception v2

    .line 86
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3b

    .line 102
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v5    # "outputString":Ljava/lang/String;
    .restart local v9    # "statusCode":I
    .restart local v10    # "time":D
    :catch_9d
    move-exception v2

    .line 103
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_9e
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a1
    .catchall {:try_start_9e .. :try_end_a1} :catchall_a2

    goto :goto_8f

    .line 106
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "entity":Lorg/apache/http/HttpEntity;
    .end local v5    # "outputString":Ljava/lang/String;
    .end local v9    # "statusCode":I
    .end local v10    # "time":D
    :catchall_a2
    move-exception v13

    if-eqz v7, :cond_a8

    .line 108
    :try_start_a5
    invoke-interface {v7}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_a8} :catch_ae

    .line 112
    :cond_a8
    :goto_a8
    throw v13

    .line 109
    .restart local v3    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v5    # "outputString":Ljava/lang/String;
    .restart local v9    # "statusCode":I
    .restart local v10    # "time":D
    :catch_a9
    move-exception v2

    .line 110
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_94

    .line 109
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "entity":Lorg/apache/http/HttpEntity;
    .end local v5    # "outputString":Ljava/lang/String;
    .end local v9    # "statusCode":I
    .end local v10    # "time":D
    :catch_ae
    move-exception v2

    .line 110
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a8
.end method
