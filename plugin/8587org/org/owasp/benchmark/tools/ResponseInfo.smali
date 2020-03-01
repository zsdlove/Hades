.class Lorg/owasp/benchmark/tools/ResponseInfo;
.super Ljava/lang/Object;
.source "BenchmarkCrawler.java"


# instance fields
.field private requestBase:Lorg/apache/http/client/methods/HttpRequestBase;

.field private responseString:Ljava/lang/String;

.field private statusCode:I

.field private time:D


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRequestBase()Lorg/apache/http/client/methods/HttpRequestBase;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->requestBase:Lorg/apache/http/client/methods/HttpRequestBase;

    return-object v0
.end method

.method public getResponseString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->responseString:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusCode()I
    .registers 2

    .prologue
    .line 145
    iget v0, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->statusCode:I

    return v0
.end method

.method public getTime()D
    .registers 3

    .prologue
    .line 137
    iget-wide v0, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->time:D

    return-wide v0
.end method

.method public setRequestBase(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .registers 2
    .param p1, "requestBase"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 157
    iput-object p1, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->requestBase:Lorg/apache/http/client/methods/HttpRequestBase;

    .line 158
    return-void
.end method

.method public setResponseString(Ljava/lang/String;)V
    .registers 2
    .param p1, "responseString"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->responseString:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setStatusCode(I)V
    .registers 2
    .param p1, "statusCode"    # I

    .prologue
    .line 149
    iput p1, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->statusCode:I

    .line 150
    return-void
.end method

.method public setTime(D)V
    .registers 4
    .param p1, "time"    # D

    .prologue
    .line 141
    iput-wide p1, p0, Lorg/owasp/benchmark/tools/ResponseInfo;->time:D

    .line 142
    return-void
.end method
