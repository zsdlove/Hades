.class public Lorg/owasp/benchmark/score/parsers/ContrastReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "ContrastReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 21
    .param p1, "firstLine"    # Ljava/lang/String;
    .param p2, "lastLine"    # Ljava/lang/String;

    .prologue
    .line 137
    :try_start_0
    const-string v14, " "

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    aget-object v6, v14, v15

    .line 138
    .local v6, "start":Ljava/lang/String;
    const-string v14, " "

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    aget-object v10, v14, v15

    .line 139
    .local v10, "stop":Ljava/lang/String;
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v14, "HH:mm:ss,SSS"

    invoke-direct {v3, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 140
    .local v3, "sdf":Ljava/text/SimpleDateFormat;
    invoke-virtual {v3, v6}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    .line 141
    .local v7, "startTime":Ljava/util/Date;
    invoke-virtual {v3, v10}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    .line 142
    .local v11, "stopTime":Ljava/util/Date;
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 143
    .local v8, "startMillis":J
    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    .line 144
    .local v12, "stopMillis":J
    sub-long v14, v12, v8

    const-wide/16 v16, 0x3e8

    div-long v4, v14, v16

    .line 145
    .local v4, "seconds":J
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " seconds"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_45} :catch_47

    move-result-object v14

    .line 149
    .end local v3    # "sdf":Ljava/text/SimpleDateFormat;
    .end local v4    # "seconds":J
    .end local v6    # "start":Ljava/lang/String;
    .end local v7    # "startTime":Ljava/util/Date;
    .end local v8    # "startMillis":J
    .end local v10    # "stop":Ljava/lang/String;
    .end local v11    # "stopTime":Ljava/util/Date;
    .end local v12    # "stopMillis":J
    :goto_46
    return-object v14

    .line 146
    :catch_47
    move-exception v2

    .line 147
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 149
    const/4 v14, 0x0

    goto :goto_46
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 4
    .param p0, "rule"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 98
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_f2

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_134

    .line 132
    :goto_c
    :pswitch_c
    return v0

    .line 98
    :sswitch_d
    const-string v2, "cookie-flags-missing"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "sql-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "cmd-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "ldap-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v2, "header-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v2, "hql-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_49
    const-string v2, "unsafe-readline"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x6

    goto :goto_9

    :sswitch_53
    const-string v2, "reflection-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x7

    goto :goto_9

    :sswitch_5d
    const-string v2, "reflected-xss"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x8

    goto :goto_9

    :sswitch_68
    const-string v2, "xpath-injection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x9

    goto :goto_9

    :sswitch_73
    const-string v2, "path-traversal"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xa

    goto :goto_9

    :sswitch_7e
    const-string v2, "crypto-bad-mac"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xb

    goto :goto_9

    :sswitch_89
    const-string v2, "crypto-weak-randomness"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xc

    goto/16 :goto_9

    :sswitch_95
    const-string v2, "crypto-bad-ciphers"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xd

    goto/16 :goto_9

    :sswitch_a1
    const-string v2, "trust-boundary-violation"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xe

    goto/16 :goto_9

    :sswitch_ad
    const-string v2, "xxe"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xf

    goto/16 :goto_9

    .line 100
    :pswitch_b9
    const/16 v0, 0x266

    goto/16 :goto_c

    .line 102
    :pswitch_bd
    const/16 v0, 0x59

    goto/16 :goto_c

    .line 104
    :pswitch_c1
    const/16 v0, 0x4e

    goto/16 :goto_c

    .line 106
    :pswitch_c5
    const/16 v0, 0x5a

    goto/16 :goto_c

    .line 108
    :pswitch_c9
    const/16 v0, 0x71

    goto/16 :goto_c

    .line 110
    :pswitch_cd
    const/16 v0, 0x234

    goto/16 :goto_c

    .line 116
    :pswitch_d1
    const/16 v0, 0x4f

    goto/16 :goto_c

    .line 118
    :pswitch_d5
    const/16 v0, 0x283

    goto/16 :goto_c

    .line 120
    :pswitch_d9
    const/16 v0, 0x16

    goto/16 :goto_c

    .line 122
    :pswitch_dd
    const/16 v0, 0x148

    goto/16 :goto_c

    .line 124
    :pswitch_e1
    const/16 v0, 0x14a

    goto/16 :goto_c

    .line 126
    :pswitch_e5
    const/16 v0, 0x147

    goto/16 :goto_c

    .line 128
    :pswitch_e9
    const/16 v0, 0x1f5

    goto/16 :goto_c

    .line 130
    :pswitch_ed
    const/16 v0, 0x263

    goto/16 :goto_c

    .line 98
    nop

    :sswitch_data_f2
    .sparse-switch
        -0x7fcf6dcf -> :sswitch_2b
        -0x564823fc -> :sswitch_21
        -0x41ca8d2f -> :sswitch_49
        -0x23e9f24b -> :sswitch_53
        -0x1935b10c -> :sswitch_95
        -0x91e0059 -> :sswitch_5d
        0x1d165 -> :sswitch_ad
        0x1833280d -> :sswitch_3f
        0x2b0bf197 -> :sswitch_35
        0x460223a7 -> :sswitch_68
        0x57d46f98 -> :sswitch_17
        0x6151e0d7 -> :sswitch_a1
        0x66a38516 -> :sswitch_73
        0x75cb9603 -> :sswitch_89
        0x77845877 -> :sswitch_d
        0x7eeb8e7b -> :sswitch_7e
    .end sparse-switch

    :pswitch_data_134
    .packed-switch 0x0
        :pswitch_b9
        :pswitch_bd
        :pswitch_c1
        :pswitch_c5
        :pswitch_c9
        :pswitch_cd
        :pswitch_c
        :pswitch_c
        :pswitch_d1
        :pswitch_d5
        :pswitch_d9
        :pswitch_dd
        :pswitch_e1
        :pswitch_e5
        :pswitch_e9
        :pswitch_ed
    .end packed-switch
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    new-instance v1, Ljava/io/File;

    const-string v2, "results/Benchmark_1.2-Contrast.log"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .local v1, "f":Ljava/io/File;
    new-instance v0, Lorg/owasp/benchmark/score/parsers/ContrastReader;

    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/ContrastReader;-><init>()V

    .line 34
    .local v0, "cr":Lorg/owasp/benchmark/score/parsers/ContrastReader;
    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ContrastReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    .line 35
    return-void
.end method

.method private parseContrastFinding(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/lang/String;)V
    .registers 11
    .param p1, "tr"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 74
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :try_start_5
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, "obj":Lorg/json/JSONObject;
    const-string v6, "ruleId"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 76
    .local v2, "ruleId":Ljava/lang/String;
    invoke-static {v2}, Lorg/owasp/benchmark/score/parsers/ContrastReader;->cweLookup(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 77
    invoke-virtual {v3, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 79
    const-string v6, "request"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 80
    .local v1, "request":Lorg/json/JSONObject;
    const-string v6, "uri"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 82
    .local v5, "uri":Ljava/lang/String;
    const-string v6, "BenchmarkTest"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_51

    .line 83
    const/16 v6, 0x2f

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    const-string v7, "BenchmarkTest"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 84
    .local v4, "testNumber":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 85
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v6

    if-eqz v6, :cond_51

    .line 87
    invoke-virtual {p1, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_51} :catch_52

    .line 94
    .end local v0    # "obj":Lorg/json/JSONObject;
    .end local v1    # "request":Lorg/json/JSONObject;
    .end local v2    # "ruleId":Ljava/lang/String;
    .end local v4    # "testNumber":Ljava/lang/String;
    .end local v5    # "uri":Ljava/lang/String;
    :cond_51
    :goto_51
    return-void

    .line 90
    :catch_52
    move-exception v6

    goto :goto_51
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 12
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v7, "Contrast"

    const/4 v8, 0x1

    sget-object v9, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->IAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v5, v7, v8, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 41
    .local v5, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    invoke-direct {v7, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 42
    .local v4, "reader":Ljava/io/BufferedReader;
    const/4 v1, 0x0

    .line 43
    .local v1, "firstLine":Ljava/lang/String;
    const-string v2, ""

    .line 44
    .local v2, "lastLine":Ljava/lang/String;
    const-string v3, ""

    .line 45
    .local v3, "line":Ljava/lang/String;
    :cond_19
    :goto_19
    if-eqz v3, :cond_6a

    .line 47
    :try_start_1b
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 48
    if-eqz v3, :cond_19

    .line 49
    const-string v7, "{\"hash\":"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_32

    .line 50
    invoke-direct {p0, v5, v3}, Lorg/owasp/benchmark/score/parsers/ContrastReader;->parseContrastFinding(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2c} :catch_2d

    goto :goto_19

    .line 60
    :catch_2d
    move-exception v0

    .line 61
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_19

    .line 51
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_32
    :try_start_32
    const-string v7, "Agent Version:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4e

    .line 52
    const-string v7, "Version:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x8

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 53
    .local v6, "version":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    goto :goto_19

    .line 54
    .end local v6    # "version":Ljava/lang/String;
    :cond_4e
    const-string v7, "DEBUG - >>> [URL"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_60

    const-string v7, "BenchmarkTest00001"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_60

    .line 55
    move-object v1, v3

    goto :goto_19

    .line 56
    :cond_60
    const-string v7, "DEBUG - >>> [URL"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_65} :catch_2d

    move-result v7

    if-eqz v7, :cond_19

    .line 57
    move-object v2, v3

    goto :goto_19

    .line 64
    :cond_6a
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 65
    invoke-direct {p0, v1, v2}, Lorg/owasp/benchmark/score/parsers/ContrastReader;->calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 66
    return-object v5
.end method
