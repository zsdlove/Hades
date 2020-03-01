.class public Lorg/owasp/benchmark/helpers/DataBaseServer;
.super Ljava/lang/Object;
.source "DataBaseServer.java"


# annotations
.annotation runtime Lorg/springframework/web/bind/annotation/RestController;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 1
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;,
            Ljavax/naming/NamingException;,
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 64
    return-void
.end method


# virtual methods
.method public createOrder2(Lorg/owasp/benchmark/service/pojo/Person;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Lorg/springframework/http/ResponseEntity;
    .registers 8
    .param p1, "model"    # Lorg/owasp/benchmark/service/pojo/Person;
        .annotation runtime Lorg/springframework/web/bind/annotation/RequestBody;
        .end annotation
    .end param
    .param p2, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p3, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/service/pojo/Person;",
            "Ljavax/servlet/http/HttpServletRequest;",
            "Ljavax/servlet/http/HttpServletResponse;",
            ")",
            "Lorg/springframework/http/ResponseEntity",
            "<",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/springframework/web/bind/annotation/RequestMapping;
        method = {
            .enum Lorg/springframework/web/bind/annotation/RequestMethod;->POST:Lorg/springframework/web/bind/annotation/RequestMethod;
        }
        value = {
            "/testdb"
        }
    .end annotation

    .prologue
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .local v0, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    new-instance v1, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v2, "Message"

    const-string v3, "Not Implemented."

    invoke-direct {v1, v2, v3}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    new-instance v1, Lorg/springframework/http/ResponseEntity;

    sget-object v2, Lorg/springframework/http/HttpStatus;->OK:Lorg/springframework/http/HttpStatus;

    invoke-direct {v1, v0, v2}, Lorg/springframework/http/ResponseEntity;-><init>(Ljava/lang/Object;Lorg/springframework/http/HttpStatus;)V

    return-object v1
.end method

.method public getAll(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Lorg/springframework/http/ResponseEntity;
    .registers 10
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/servlet/http/HttpServletRequest;",
            "Ljavax/servlet/http/HttpServletResponse;",
            ")",
            "Lorg/springframework/http/ResponseEntity",
            "<",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/springframework/web/bind/annotation/RequestMapping;
        method = {
            .enum Lorg/springframework/web/bind/annotation/RequestMethod;->GET:Lorg/springframework/web/bind/annotation/RequestMethod;
        }
        value = {
            "/getall"
        }
    .end annotation

    .prologue
    .line 44
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v2, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    const-string v3, "SELECT * from USERS"

    .line 47
    .local v3, "sql":Ljava/lang/String;
    :try_start_7
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlConnection()Ljava/sql/Connection;

    move-result-object v0

    .line 48
    .local v0, "connection":Ljava/sql/Connection;
    invoke-interface {v0, v3}, Ljava/sql/Connection;->prepareStatement(Ljava/lang/String;)Ljava/sql/PreparedStatement;

    move-result-object v4

    .line 49
    .local v4, "statement":Ljava/sql/PreparedStatement;
    invoke-interface {v4}, Ljava/sql/PreparedStatement;->execute()Z

    .line 50
    invoke-static {v4, v3, v2}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->printResults(Ljava/sql/Statement;Ljava/lang/String;Ljava/util/List;)V
    :try_end_15
    .catch Ljava/sql/SQLException; {:try_start_7 .. :try_end_15} :catch_1d

    .line 59
    new-instance v5, Lorg/springframework/http/ResponseEntity;

    sget-object v6, Lorg/springframework/http/HttpStatus;->OK:Lorg/springframework/http/HttpStatus;

    invoke-direct {v5, v2, v6}, Lorg/springframework/http/ResponseEntity;-><init>(Ljava/lang/Object;Lorg/springframework/http/HttpStatus;)V

    return-object v5

    .line 51
    .end local v0    # "connection":Ljava/sql/Connection;
    .end local v4    # "statement":Ljava/sql/PreparedStatement;
    :catch_1d
    move-exception v1

    .line 57
    .local v1, "e":Ljava/sql/SQLException;
    new-instance v5, Ljavax/servlet/ServletException;

    invoke-direct {v5, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public getOtherOrder(Lorg/owasp/benchmark/service/pojo/Person;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Lorg/springframework/http/ResponseEntity;
    .registers 8
    .param p1, "model"    # Lorg/owasp/benchmark/service/pojo/Person;
        .annotation runtime Lorg/springframework/web/bind/annotation/RequestBody;
        .end annotation
    .end param
    .param p2, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p3, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/service/pojo/Person;",
            "Ljavax/servlet/http/HttpServletRequest;",
            "Ljavax/servlet/http/HttpServletResponse;",
            ")",
            "Lorg/springframework/http/ResponseEntity",
            "<",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/springframework/web/bind/annotation/RequestMapping;
        method = {
            .enum Lorg/springframework/web/bind/annotation/RequestMethod;->GET:Lorg/springframework/web/bind/annotation/RequestMethod;
        }
        value = {
            "/resetdb"
        }
    .end annotation

    .prologue
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .local v0, "resp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    new-instance v1, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v2, "Message"

    const-string v3, "Not Implemented."

    invoke-direct {v1, v2, v3}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    new-instance v1, Lorg/springframework/http/ResponseEntity;

    sget-object v2, Lorg/springframework/http/HttpStatus;->OK:Lorg/springframework/http/HttpStatus;

    invoke-direct {v1, v0, v2}, Lorg/springframework/http/ResponseEntity;-><init>(Ljava/lang/Object;Lorg/springframework/http/HttpStatus;)V

    return-object v1
.end method
