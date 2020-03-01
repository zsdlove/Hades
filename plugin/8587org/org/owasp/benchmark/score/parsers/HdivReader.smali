.class public Lorg/owasp/benchmark/score/parsers/HdivReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "HdivReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    }
.end annotation


# instance fields
.field invalid:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    .line 18
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/HdivReader;->invalid:Ljava/util/Set;

    return-void
.end method

.method private calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 21
    .param p1, "firstLine"    # Ljava/lang/String;
    .param p2, "lastLine"    # Ljava/lang/String;

    .prologue
    .line 68
    :try_start_0
    const-string v12, " "

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    aget-object v4, v12, v13

    .line 69
    .local v4, "start":Ljava/lang/String;
    const-string v12, " "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    aget-object v8, v12, v13

    .line 70
    .local v8, "stop":Ljava/lang/String;
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v12, "HH:mm:ss,SSS"

    invoke-direct {v3, v12}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 71
    .local v3, "sdf":Ljava/text/SimpleDateFormat;
    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    .line 72
    .local v5, "startTime":Ljava/util/Date;
    invoke-virtual {v3, v8}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v9

    .line 73
    .local v9, "stopTime":Ljava/util/Date;
    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    .line 74
    .local v6, "startMillis":J
    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    .line 75
    .local v10, "stopMillis":J
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    sub-long v14, v10, v6

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    invoke-virtual {v12, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " seconds"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_45} :catch_47

    move-result-object v12

    .line 80
    .end local v3    # "sdf":Ljava/text/SimpleDateFormat;
    .end local v4    # "start":Ljava/lang/String;
    .end local v5    # "startTime":Ljava/util/Date;
    .end local v6    # "startMillis":J
    .end local v8    # "stop":Ljava/lang/String;
    .end local v9    # "stopTime":Ljava/util/Date;
    .end local v10    # "stopMillis":J
    :goto_46
    return-object v12

    .line 77
    :catch_47
    move-exception v2

    .line 78
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 80
    const/4 v12, 0x0

    goto :goto_46
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    new-instance v1, Ljava/io/File;

    const-string v2, "hdivAgentLog.hlg"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 22
    .local v1, "f":Ljava/io/File;
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader;

    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/HdivReader;-><init>()V

    .line 23
    .local v0, "cr":Lorg/owasp/benchmark/score/parsers/HdivReader;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/HdivReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 24
    return-void
.end method

.method private process(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/lang/String;Ljava/util/List;)V
    .registers 15
    .param p1, "tr"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p2, "testNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/score/parsers/TestResults;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 84
    .local p3, "chunk":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 85
    .local v3, "line":Ljava/lang/String;
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 87
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v1, "/BenchmarkTest"

    .line 88
    .local v1, "fname":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 89
    .local v2, "idx":I
    const/4 v8, -0x1

    if-eq v2, v8, :cond_2e

    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v2

    add-int/lit8 v9, v9, 0x5

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 93
    :cond_2e
    const-string v8, "type="

    invoke-virtual {v3, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x5

    const/16 v9, 0x2c

    const-string v10, "type="

    invoke-virtual {v3, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v3, v9, v10}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 96
    .local v6, "type":Ljava/lang/String;
    :try_start_46
    invoke-static {v6}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->valueOf(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    move-result-object v4

    .line 97
    .local v4, "t":Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    # getter for: Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->number:I
    invoke-static {v4}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->access$000(Lorg/owasp/benchmark/score/parsers/HdivReader$Type;)I

    move-result v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 98
    # getter for: Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->id:Ljava/lang/String;
    invoke-static {v4}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->access$100(Lorg/owasp/benchmark/score/parsers/HdivReader$Type;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_58} :catch_69

    .line 101
    :try_start_58
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_5f
    .catch Ljava/lang/NumberFormatException; {:try_start_58 .. :try_end_5f} :catch_8c
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5f} :catch_69

    .line 107
    :goto_5f
    :try_start_5f
    invoke-virtual {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v8

    if-eqz v8, :cond_4

    .line 108
    invoke-virtual {p1, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_68} :catch_69

    goto :goto_4

    .line 111
    .end local v4    # "t":Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    :catch_69
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lorg/owasp/benchmark/score/parsers/HdivReader;->invalid:Ljava/util/Set;

    invoke-interface {v8, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 113
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalid type:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 103
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v4    # "t":Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    :catch_8c
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_8d
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "> Parse error: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_a5} :catch_69

    goto :goto_5f

    .line 118
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v1    # "fname":Ljava/lang/String;
    .end local v2    # "idx":I
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "t":Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "type":Ljava/lang/String;
    :cond_a6
    return-void
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 16
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x1

    .line 27
    new-instance v9, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v11, "Hdiv"

    sget-object v12, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->IAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v9, v11, v13, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 29
    .local v9, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/FileReader;

    invoke-direct {v11, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 30
    .local v7, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 31
    .local v2, "firstLine":Ljava/lang/String;
    const-string v5, ""

    .line 32
    .local v5, "lastLine":Ljava/lang/String;
    const-string v6, ""

    .line 33
    .local v6, "line":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v0, "chunk":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "00001"

    .line 35
    .local v8, "testNumber":Ljava/lang/String;
    :cond_23
    :goto_23
    if-eqz v6, :cond_82

    .line 37
    :try_start_25
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 38
    if-eqz v6, :cond_23

    .line 39
    const-string v11, "SourceCodeVulnerability ["

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_60

    .line 41
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v6, v11, v12

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-direct {p0, v9, v8, v11}, Lorg/owasp/benchmark/score/parsers/HdivReader;->process(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/lang/String;Ljava/util/List;)V

    .line 42
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 43
    const-string v8, "00000"

    .line 44
    const-string v3, "/BenchmarkTest"

    .line 45
    .local v3, "fname":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 46
    .local v4, "idx":I
    const/4 v11, -0x1

    if-eq v4, v11, :cond_5e

    .line 47
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v11, v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v12, v4

    add-int/lit8 v12, v12, 0x5

    invoke-virtual {v6, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 49
    :cond_5e
    move-object v5, v6

    .line 50
    goto :goto_23

    .line 51
    .end local v3    # "fname":Ljava/lang/String;
    .end local v4    # "idx":I
    :cond_60
    const-string v11, "Product version:"

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_23

    .line 52
    const-string v11, "version:"

    invoke-virtual {v6, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    const-string v12, "version:"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v11, v12

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 53
    .local v10, "version":Ljava/lang/String;
    invoke-virtual {v9, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_7c} :catch_7d

    goto :goto_23

    .line 57
    .end local v10    # "version":Ljava/lang/String;
    :catch_7d
    move-exception v1

    .line 58
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_23

    .line 61
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_82
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V

    .line 62
    invoke-direct {p0, v2, v5}, Lorg/owasp/benchmark/score/parsers/HdivReader;->calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 63
    return-object v9
.end method
