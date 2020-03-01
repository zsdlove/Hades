.class public Lorg/owasp/benchmark/testcode/BenchmarkTest00026;
.super Ljavax/servlet/http/HttpServlet;
.source "BenchmarkTest00026.java"


# annotations
.annotation runtime Ljavax/servlet/annotation/WebServlet;
    value = {
        "/sqli-00/BenchmarkTest00026"
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
    invoke-virtual {p0, p1, p2}, Lorg/owasp/benchmark/testcode/BenchmarkTest00026;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

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
    const-string v4, "text/html;charset=UTF-8"

    invoke-interface {p2, v4}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 45
    const-string v4, "BenchmarkTest00026"

    invoke-interface {p1, v4}, Ljavax/servlet/http/HttpServletRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "param":Ljava/lang/String;
    if-nez v1, :cond_f

    const-string v1, ""

    .line 49
    :cond_f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT  * from USERS where USERNAME=\'foo\' and PASSWORD=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "sql":Ljava/lang/String;
    :try_start_28
    sget-object v4, Lorg/owasp/benchmark/helpers/DatabaseHelper;->JDBCtemplate:Lorg/springframework/jdbc/core/JdbcTemplate;

    .line 52
    invoke-virtual {v4, v3}, Lorg/springframework/jdbc/core/JdbcTemplate;->queryForRowSet(Ljava/lang/String;)Lorg/springframework/jdbc/support/rowset/SqlRowSet;

    move-result-object v2

    .line 53
    .local v2, "results":Lorg/springframework/jdbc/support/rowset/SqlRowSet;
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v4

    const-string v5, "Your results are: "

    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 58
    :goto_37
    invoke-interface {v2}, Lorg/springframework/jdbc/support/rowset/SqlRowSet;->next()Z

    move-result v4

    if-eqz v4, :cond_89

    .line 59
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v6

    const-string v7, "USERNAME"

    invoke-interface {v2, v7}, Lorg/springframework/jdbc/support/rowset/SqlRowSet;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 59
    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_65
    .catch Lorg/springframework/dao/EmptyResultDataAccessException; {:try_start_28 .. :try_end_65} :catch_66
    .catch Lorg/springframework/dao/DataAccessException; {:try_start_28 .. :try_end_65} :catch_8a

    goto :goto_37

    .line 64
    .end local v2    # "results":Lorg/springframework/jdbc/support/rowset/SqlRowSet;
    :catch_66
    move-exception v0

    .line 65
    .local v0, "e":Lorg/springframework/dao/EmptyResultDataAccessException;
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No results returned for query: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 66
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v6

    invoke-interface {v6, v3}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 65
    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .end local v0    # "e":Lorg/springframework/dao/EmptyResultDataAccessException;
    :cond_89
    return-void

    .line 68
    :catch_8a
    move-exception v0

    .line 74
    .local v0, "e":Lorg/springframework/dao/DataAccessException;
    new-instance v4, Ljavax/servlet/ServletException;

    invoke-direct {v4, v0}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method
