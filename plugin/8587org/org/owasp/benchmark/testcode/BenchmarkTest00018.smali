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
