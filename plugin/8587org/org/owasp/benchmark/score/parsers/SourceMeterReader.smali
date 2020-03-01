.class public Lorg/owasp/benchmark/score/parsers/SourceMeterReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "SourceMeterReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 4
    .param p0, "vuln"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 94
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_5c

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_76

    .line 128
    :goto_c
    return v0

    .line 94
    :sswitch_d
    const-string v2, "SQL Injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "Command Injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "LDAP Injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "HTTP Response Splitting"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v2, "Cross-site Scripting"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v2, "Path Traversal"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x5

    goto :goto_9

    .line 98
    :pswitch_49
    const/16 v0, 0x59

    goto :goto_c

    .line 100
    :pswitch_4c
    const/16 v0, 0x4e

    goto :goto_c

    .line 102
    :pswitch_4f
    const/16 v0, 0x5a

    goto :goto_c

    .line 104
    :pswitch_52
    const/16 v0, 0x71

    goto :goto_c

    .line 112
    :pswitch_55
    const/16 v0, 0x4f

    goto :goto_c

    .line 116
    :pswitch_58
    const/16 v0, 0x16

    goto :goto_c

    .line 94
    nop

    :sswitch_data_5c
    .sparse-switch
        -0xefd1482 -> :sswitch_21
        0x45ffcc5 -> :sswitch_d
        0x3aa1b283 -> :sswitch_3f
        0x3caa3a02 -> :sswitch_17
        0x616fe281 -> :sswitch_2b
        0x6181c6cb -> :sswitch_35
    .end sparse-switch

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_49
        :pswitch_4c
        :pswitch_4f
        :pswitch_52
        :pswitch_55
        :pswitch_58
    .end packed-switch
.end method

.method private parseSourceMeterItem(Ljava/lang/String;Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 9
    .param p1, "vuln"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v1, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 78
    .local v1, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v1, p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v1, p2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 80
    invoke-static {p1}, Lorg/owasp/benchmark/score/parsers/SourceMeterReader;->cweLookup(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 82
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x5

    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "testno":Ljava/lang/String;
    :try_start_1c
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_23
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_23} :catch_24

    .line 90
    .end local v1    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :goto_23
    return-object v1

    .line 86
    .restart local v1    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_24
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "> Parse error "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 90
    const/4 v1, 0x0

    goto :goto_23
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 15
    .param p1, "fileToParse"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v7, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v9, "SourceMeter VulnerabilityHunter"

    const/4 v10, 0x1

    sget-object v11, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v7, v9, v10, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 42
    .local v7, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v9}, Lorg/apache/commons/io/IOUtils;->readLines(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v5

    .line 44
    .local v5, "sourceLines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v8, 0x0

    .line 45
    .local v8, "vuln":Ljava/lang/String;
    const/4 v1, 0x0

    .line 46
    .local v1, "file":Ljava/lang/String;
    const/4 v4, 0x0

    .line 47
    .local v4, "nextLine":Z
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1a
    :goto_1a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_8f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 49
    .local v3, "line":Ljava/lang/String;
    :try_start_26
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_2f

    .line 50
    const/4 v8, 0x0

    .line 51
    const/4 v1, 0x0

    .line 52
    const/4 v4, 0x0

    .line 54
    :cond_2f
    const-string v10, "Possible "

    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6a

    .line 55
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\t"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 56
    const-string v10, "Possible "

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v3, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 57
    const/4 v10, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    const-string v12, " Vulnerability:"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    sub-int/2addr v11, v12

    invoke-virtual {v8, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    goto :goto_1a

    .line 58
    :cond_6a
    const-string v10, "Trace:"

    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_74

    .line 59
    const/4 v4, 0x1

    goto :goto_1a

    .line 60
    :cond_74
    if-eqz v4, :cond_1a

    .line 61
    const-string v10, ".java"

    invoke-virtual {v3, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 62
    .local v2, "idx":I
    const/4 v10, 0x0

    invoke-virtual {v3, v10, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 63
    invoke-direct {p0, v8, v1}, Lorg/owasp/benchmark/score/parsers/SourceMeterReader;->parseSourceMeterItem(Ljava/lang/String;Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v6

    .line 64
    .local v6, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v7, v6}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_88} :catch_8a

    .line 66
    const/4 v4, 0x0

    goto :goto_1a

    .line 68
    .end local v2    # "idx":I
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_8a
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1a

    .line 72
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v3    # "line":Ljava/lang/String;
    :cond_8f
    return-object v7
.end method
