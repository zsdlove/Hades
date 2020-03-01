.class public Lorg/owasp/benchmark/testcode/BenchmarkTest00027;
.super Ljavax/servlet/http/HttpServlet;
.source "BenchmarkTest00027.java"


# annotations
.annotation runtime Ljavax/servlet/annotation/WebServlet;
    value = {
        "/sqli-00/BenchmarkTest00027"
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
    invoke-virtual {p0, p1, p2}, Lorg/owasp/benchmark/testcode/BenchmarkTest00027;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 37
    return-void
.end method

.method public doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 10
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
    const-string v5, "text/html;charset=UTF-8"

    invoke-interface {p2, v5}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 45
    const-string v5, "BenchmarkTest00027"

    invoke-interface {p1, v5}, Ljavax/servlet/http/HttpServletRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 46
    .local v2, "param":Ljava/lang/String;
    if-nez v2, :cond_f

    const-string v2, ""

    .line 49
    :cond_f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "INSERT INTO users (username, password) VALUES (\'foo\',\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\')"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, "sql":Ljava/lang/String;
    :try_start_28
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlStatement()Ljava/sql/Statement;

    move-result-object v4

    .line 53
    .local v4, "statement":Ljava/sql/Statement;
    invoke-interface {v4, v3}, Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I

    move-result v0

    .line 54
    .local v0, "count":I
    invoke-static {v3, p2}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->outputUpdateComplete(Ljava/lang/String;Ljavax/servlet/http/HttpServletResponse;)V
    :try_end_33
    .catch Ljava/sql/SQLException; {:try_start_28 .. :try_end_33} :catch_34

    .line 64
    return-void

    .line 55
    .end local v0    # "count":I
    .end local v4    # "statement":Ljava/sql/Statement;
    :catch_34
    move-exception v1

    .line 62
    .local v1, "e":Ljava/sql/SQLException;
    new-instance v5, Ljavax/servlet/ServletException;

    invoke-direct {v5, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method
