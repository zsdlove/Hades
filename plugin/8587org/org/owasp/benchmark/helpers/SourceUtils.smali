.class public Lorg/owasp/benchmark/helpers/SourceUtils;
.super Ljava/lang/Object;
.source "SourceUtils.java"


# static fields
.field public static final USERDIR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "user.dir"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/owasp/benchmark/helpers/SourceUtils;->USERDIR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCookie(Ljavax/servlet/http/HttpServletRequest;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getCookies()[Ljavax/servlet/http/Cookie;

    move-result-object v2

    .line 36
    .local v2, "values":[Ljavax/servlet/http/Cookie;
    const-string v1, "none"

    .line 37
    .local v1, "param":Ljava/lang/String;
    if-eqz p1, :cond_1e

    .line 38
    const/4 v0, 0x0

    .line 39
    .local v0, "i":I
    :goto_9
    array-length v3, v2

    if-ge v0, v3, :cond_1e

    .line 41
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljavax/servlet/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 42
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljavax/servlet/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 48
    .end local v0    # "i":I
    :cond_1e
    return-object v1

    .line 45
    .restart local v0    # "i":I
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method public static getLinesFromFile(Ljava/lang/String;)Ljava/util/List;
    .registers 11
    .param p0, "f"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_25

    .line 61
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t find file to get lines from: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    const/4 v6, 0x0

    .line 89
    :cond_24
    :goto_24
    return-object v6

    .line 65
    :cond_25
    const/4 v3, 0x0

    .line 66
    .local v3, "fr":Ljava/io/FileReader;
    const/4 v0, 0x0

    .line 68
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v6, "sourceLines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_2c
    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_31} :catch_76
    .catchall {:try_start_2c .. :try_end_31} :catchall_61

    .line 72
    .end local v3    # "fr":Ljava/io/FileReader;
    .local v4, "fr":Ljava/io/FileReader;
    :try_start_31
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_36} :catch_78
    .catchall {:try_start_31 .. :try_end_36} :catchall_6f

    .line 74
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_36
    :try_start_36
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "line":Ljava/lang/String;
    if-eqz v5, :cond_50

    .line 75
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_3f} :catch_40
    .catchall {:try_start_36 .. :try_end_3f} :catchall_72

    goto :goto_36

    .line 77
    .end local v5    # "line":Ljava/lang/String;
    :catch_40
    move-exception v7

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v3, v4

    .line 81
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    :goto_43
    if-eqz v0, :cond_48

    .line 82
    :try_start_45
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 83
    :cond_48
    if-eqz v3, :cond_24

    .line 84
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_4d} :catch_4e

    goto :goto_24

    .line 85
    :catch_4e
    move-exception v7

    goto :goto_24

    .line 81
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    .restart local v5    # "line":Ljava/lang/String;
    :cond_50
    if-eqz v1, :cond_55

    .line 82
    :try_start_52
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 83
    :cond_55
    if-eqz v4, :cond_5a

    .line 84
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_5a} :catch_5d

    :cond_5a
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v3, v4

    .line 86
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    goto :goto_24

    .line 85
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    :catch_5d
    move-exception v7

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v3, v4

    .line 87
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    goto :goto_24

    .line 80
    .end local v5    # "line":Ljava/lang/String;
    :catchall_61
    move-exception v7

    .line 81
    :goto_62
    if-eqz v0, :cond_67

    .line 82
    :try_start_64
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 83
    :cond_67
    if-eqz v3, :cond_6c

    .line 84
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_6c} :catch_6d

    .line 87
    :cond_6c
    :goto_6c
    throw v7

    .line 85
    :catch_6d
    move-exception v8

    goto :goto_6c

    .line 80
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    :catchall_6f
    move-exception v7

    move-object v3, v4

    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    goto :goto_62

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    :catchall_72
    move-exception v7

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    goto :goto_62

    .line 77
    :catch_76
    move-exception v7

    goto :goto_43

    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    :catch_78
    move-exception v7

    move-object v3, v4

    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    goto :goto_43
.end method

.method public static getParam(Ljavax/servlet/http/HttpServletRequest;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "param":Ljava/lang/String;
    return-object v0
.end method
