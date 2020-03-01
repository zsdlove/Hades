.class public Lorg/owasp/benchmark/helpers/SeparateClassRequest;
.super Ljava/lang/Object;
.source "SeparateClassRequest.java"


# instance fields
.field private request:Ljavax/servlet/http/HttpServletRequest;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;)V
    .registers 2
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/SeparateClassRequest;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 30
    return-void
.end method


# virtual methods
.method public getTheCookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 37
    iget-object v3, p0, Lorg/owasp/benchmark/helpers/SeparateClassRequest;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v3}, Ljavax/servlet/http/HttpServletRequest;->getCookies()[Ljavax/servlet/http/Cookie;

    move-result-object v1

    .line 39
    .local v1, "cookies":[Ljavax/servlet/http/Cookie;
    const-string v2, ""

    .line 41
    .local v2, "value":Ljava/lang/String;
    if-eqz v1, :cond_1e

    .line 42
    array-length v4, v1

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v4, :cond_1e

    aget-object v0, v1, v3

    .line 43
    .local v0, "cookie":Ljavax/servlet/http/Cookie;
    invoke-virtual {v0}, Ljavax/servlet/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 44
    invoke-virtual {v0}, Ljavax/servlet/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 50
    .end local v0    # "cookie":Ljavax/servlet/http/Cookie;
    :cond_1e
    return-object v2

    .line 42
    .restart local v0    # "cookie":Ljavax/servlet/http/Cookie;
    :cond_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_c
.end method

.method public getTheParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/SeparateClassRequest;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTheValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 55
    const-string v0, "bar"

    return-object v0
.end method
