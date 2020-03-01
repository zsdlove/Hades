.class public Lorg/owasp/benchmark/testcode/BenchmarkTest00033;
.super Ljavax/servlet/http/HttpServlet;
.source "BenchmarkTest00033.java"


# annotations
.annotation runtime Ljavax/servlet/annotation/WebServlet;
    value = {
        "/sqli-00/BenchmarkTest00033"
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
    invoke-virtual {p0, p1, p2}, Lorg/owasp/benchmark/testcode/BenchmarkTest00033;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

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
    const-string v6, "text/html;charset=UTF-8"

    invoke-interface {p2, v6}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 45
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getParameterMap()Ljava/util/Map;

    move-result-object v1

    .line 46
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[Ljava/lang/String;>;"
    const-string v2, ""

    .line 47
    .local v2, "param":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1e

    .line 48
    const-string v6, "BenchmarkTest00033"

    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    .line 49
    .local v5, "values":[Ljava/lang/String;
    if-eqz v5, :cond_1e

    const/4 v6, 0x0

    aget-object v2, v5, v6

    .line 54
    .end local v5    # "values":[Ljava/lang/String;
    :cond_1e
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SELECT  * from USERS where USERNAME=\'foo\' and PASSWORD=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 56
    .local v4, "sql":Ljava/lang/String;
    :try_start_37
    sget-object v6, Lorg/owasp/benchmark/helpers/DatabaseHelper;->JDBCtemplate:Lorg/springframework/jdbc/core/JdbcTemplate;

    .line 57
    invoke-virtual {v6, v4}, Lorg/springframework/jdbc/core/JdbcTemplate;->queryForRowSet(Ljava/lang/String;)Lorg/springframework/jdbc/support/rowset/SqlRowSet;

    move-result-object v3

    .line 58
    .local v3, "results":Lorg/springframework/jdbc/support/rowset/SqlRowSet;
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v6

    const-string v7, "Your results are: "

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 63
    :goto_46
    invoke-interface {v3}, Lorg/springframework/jdbc/support/rowset/SqlRowSet;->next()Z

    move-result v6

    if-eqz v6, :cond_98

    .line 64
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v8

    const-string v9, "USERNAME"

    invoke-interface {v3, v9}, Lorg/springframework/jdbc/support/rowset/SqlRowSet;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 64
    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_74
    .catch Lorg/springframework/dao/EmptyResultDataAccessException; {:try_start_37 .. :try_end_74} :catch_75
    .catch Lorg/springframework/dao/DataAccessException; {:try_start_37 .. :try_end_74} :catch_99

    goto :goto_46

    .line 69
    .end local v3    # "results":Lorg/springframework/jdbc/support/rowset/SqlRowSet;
    :catch_75
    move-exception v0

    .line 70
    .local v0, "e":Lorg/springframework/dao/EmptyResultDataAccessException;
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No results returned for query: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 71
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v8

    invoke-interface {v8, v4}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 70
    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 81
    .end local v0    # "e":Lorg/springframework/dao/EmptyResultDataAccessException;
    :cond_98
    return-void

    .line 73
    :catch_99
    move-exception v0

    .line 79
    .local v0, "e":Lorg/springframework/dao/DataAccessException;
    new-instance v6, Ljavax/servlet/ServletException;

    invoke-direct {v6, v0}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method
