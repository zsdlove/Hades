.class public abstract Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
.super Ljava/lang/Object;
.source "AbstractTestCaseRequest.java"


# instance fields
.field private cookies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation
.end field

.field private formParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation
.end field

.field private fullURL:Ljava/lang/String;

.field private getParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private passed:Z

.field private payload:Ljava/lang/String;

.field private query:Ljava/lang/String;

.field private tcType:Ljava/lang/String;


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
    .line 22
    .local p4, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .local p5, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .local p6, "getParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .local p7, "formParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->name:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->fullURL:Ljava/lang/String;

    .line 25
    iput-object p3, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->tcType:Ljava/lang/String;

    .line 26
    iput-object p4, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->headers:Ljava/util/List;

    .line 27
    iput-object p5, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->cookies:Ljava/util/List;

    .line 28
    iput-object p6, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->getParams:Ljava/util/List;

    .line 29
    iput-object p7, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->formParams:Ljava/util/List;

    .line 30
    iput-object p8, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->payload:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method abstract buildBodyParameters(Lorg/apache/http/client/methods/HttpRequestBase;)V
.end method

.method abstract buildCookies(Lorg/apache/http/client/methods/HttpRequestBase;)V
.end method

.method abstract buildHeaders(Lorg/apache/http/client/methods/HttpRequestBase;)V
.end method

.method abstract buildQueryString()V
.end method

.method public buildRequest()Lorg/apache/http/client/methods/HttpRequestBase;
    .registers 4

    .prologue
    .line 34
    invoke-virtual {p0}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->buildQueryString()V

    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->fullURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->query:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->createRequestInstance(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v0

    .line 36
    .local v0, "request":Lorg/apache/http/client/methods/HttpRequestBase;
    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->buildHeaders(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 37
    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->buildCookies(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 38
    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->buildBodyParameters(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 39
    return-object v0
.end method

.method abstract createRequestInstance(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpRequestBase;
.end method

.method public getCookies()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->cookies:Ljava/util/List;

    return-object v0
.end method

.method public getFormParams()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->formParams:Ljava/util/List;

    return-object v0
.end method

.method public getFullURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->fullURL:Ljava/lang/String;

    return-object v0
.end method

.method public getGetParams()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->getParams:Ljava/util/List;

    return-object v0
.end method

.method public getHeaders()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->headers:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPayload()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->payload:Ljava/lang/String;

    return-object v0
.end method

.method public getQuery()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getTcType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->tcType:Ljava/lang/String;

    return-object v0
.end method

.method public isPassed()Z
    .registers 2

    .prologue
    .line 135
    iget-boolean v0, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->passed:Z

    return v0
.end method

.method public setCookies(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->cookies:Ljava/util/List;

    .line 100
    return-void
.end method

.method public setFormParams(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "formParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->formParams:Ljava/util/List;

    .line 116
    return-void
.end method

.method public setFullURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "fullURL"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->fullURL:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public setGetParams(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "getParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->getParams:Ljava/util/List;

    .line 108
    return-void
.end method

.method public setHeaders(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->headers:Ljava/util/List;

    .line 92
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->name:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public setPassed(Z)V
    .registers 2
    .param p1, "passed"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->passed:Z

    .line 140
    return-void
.end method

.method public setPayload(Ljava/lang/String;)V
    .registers 2
    .param p1, "payload"    # Ljava/lang/String;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->payload:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .registers 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 123
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->query:Ljava/lang/String;

    .line 124
    return-void
.end method

.method public setTcType(Ljava/lang/String;)V
    .registers 2
    .param p1, "tcType"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->tcType:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AbstractTestCaseRequest [fullURL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->fullURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", query="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->query:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tcType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->tcType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", payload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->payload:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", passed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->passed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", headers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->headers:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cookies="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->cookies:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getParams="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->getParams:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", formParams="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;->formParams:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
