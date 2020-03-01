.class public Lorg/owasp/benchmark/tools/ServletTestCaseRequest;
.super Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
.source "ServletTestCaseRequest.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "fullURL"    # Ljava/lang/String;
    .param p3, "tcType"    # Ljava/lang/String;
    .param p8, "payload"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 20
    .local p4, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .local p5, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .local p6, "getParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .local p7, "formParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-direct/range {p0 .. p8}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 21
    return-void
.end method


# virtual methods
.method buildBodyParameters(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .registers 11
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 70
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->getFormParams()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    .line 72
    .local v1, "field":Lorg/w3c/dom/Node;
    const-string v7, "name"

    invoke-static {v7, v1}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 73
    .local v3, "name":Ljava/lang/String;
    const-string v7, "value"

    invoke-static {v7, v1}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    .line 75
    .local v5, "value":Ljava/lang/String;
    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v4, v3, v5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .local v4, "nvp":Lorg/apache/http/NameValuePair;
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 79
    .end local v1    # "field":Lorg/w3c/dom/Node;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "nvp":Lorg/apache/http/NameValuePair;
    .end local v5    # "value":Ljava/lang/String;
    :cond_2e
    :try_start_2e
    check-cast p1, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;

    .end local p1    # "request":Lorg/apache/http/client/methods/HttpRequestBase;
    new-instance v6, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v6, v2}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    invoke-virtual {p1, v6}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_38
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2e .. :try_end_38} :catch_39

    .line 84
    :goto_38
    return-void

    .line 80
    :catch_39
    move-exception v0

    .line 81
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error encoding URL."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_38
.end method

.method buildCookies(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .registers 9
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->getCookies()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Node;

    .line 62
    .local v0, "cookie":Lorg/w3c/dom/Node;
    const-string v4, "name"

    invoke-static {v4, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, "name":Ljava/lang/String;
    const-string v4, "value"

    invoke-static {v4, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 64
    .local v2, "value":Ljava/lang/String;
    const-string v4, "Cookie"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 66
    .end local v0    # "cookie":Lorg/w3c/dom/Node;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_41
    return-void
.end method

.method buildHeaders(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .registers 7
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->getHeaders()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Node;

    .line 51
    .local v0, "header":Lorg/w3c/dom/Node;
    const-string v4, "name"

    invoke-static {v4, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "name":Ljava/lang/String;
    const-string v4, "value"

    invoke-static {v4, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p1, v1, v2}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 56
    .end local v0    # "header":Lorg/w3c/dom/Node;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_24
    return-void
.end method

.method buildQueryString()V
    .registers 8

    .prologue
    .line 26
    const-string v4, ""

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->setQuery(Ljava/lang/String;)V

    .line 27
    const/4 v1, 0x1

    .line 28
    .local v1, "first":Z
    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->getGetParams()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_70

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Node;

    .line 29
    .local v0, "field":Lorg/w3c/dom/Node;
    if-eqz v1, :cond_55

    .line 30
    const-string v5, "?"

    invoke-virtual {p0, v5}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->setQuery(Ljava/lang/String;)V

    .line 31
    const/4 v1, 0x0

    .line 35
    :goto_22
    const-string v5, "name"

    invoke-static {v5, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 36
    .local v2, "name":Ljava/lang/String;
    const-string v5, "value"

    invoke-static {v5, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 38
    .local v3, "value":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->getQuery()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->setQuery(Ljava/lang/String;)V

    goto :goto_e

    .line 33
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_55
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->getQuery()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;->setQuery(Ljava/lang/String;)V

    goto :goto_22

    .line 40
    .end local v0    # "field":Lorg/w3c/dom/Node;
    :cond_70
    return-void
.end method

.method createRequestInstance(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpRequestBase;
    .registers 3
    .param p1, "URL"    # Ljava/lang/String;

    .prologue
    .line 44
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 45
    .local v0, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    return-object v0
.end method
