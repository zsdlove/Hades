.class public Lorg/owasp/benchmark/score/parsers/HCLReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "HCLReader.java"


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
    .line 131
    :try_start_0
    const-string v14, " "

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    aget-object v6, v14, v15

    .line 132
    .local v6, "start":Ljava/lang/String;
    const-string v14, " "

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    aget-object v10, v14, v15

    .line 133
    .local v10, "stop":Ljava/lang/String;
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v14, "HH:mm:ss.SSS"

    invoke-direct {v3, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 134
    .local v3, "sdf":Ljava/text/SimpleDateFormat;
    invoke-virtual {v3, v6}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    .line 135
    .local v7, "startTime":Ljava/util/Date;
    invoke-virtual {v3, v10}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    .line 136
    .local v11, "stopTime":Ljava/util/Date;
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 137
    .local v8, "startMillis":J
    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    .line 138
    .local v12, "stopMillis":J
    sub-long v14, v12, v8

    const-wide/16 v16, 0x3e8

    div-long v4, v14, v16

    .line 139
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

    .line 143
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

    .line 140
    :catch_47
    move-exception v2

    .line 141
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 143
    const/4 v14, 0x0

    goto :goto_46
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 4
    .param p0, "rule"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 102
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_a6

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_d4

    .line 126
    :goto_c
    return v0

    .line 102
    :sswitch_d
    const-string v2, "SessionManagement.Cookies"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "Injection.SQL"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "Injection.OS"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "Injection.LDAP"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v2, "CrossSiteScripting.Reflected"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v2, "Injection.XPath"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_49
    const-string v2, "PathTraversal"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x6

    goto :goto_9

    :sswitch_53
    const-string v2, "Cryptography.Mac"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x7

    goto :goto_9

    :sswitch_5d
    const-string v2, "Cryptography.PoorEntropy"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x8

    goto :goto_9

    :sswitch_68
    const-string v2, "Cryptography.Ciphers"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x9

    goto :goto_9

    :sswitch_73
    const-string v2, "Validation.Required"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xa

    goto :goto_9

    .line 104
    :pswitch_7e
    const/16 v0, 0x266

    goto :goto_c

    .line 106
    :pswitch_81
    const/16 v0, 0x59

    goto :goto_c

    .line 108
    :pswitch_84
    const/16 v0, 0x4e

    goto :goto_c

    .line 110
    :pswitch_87
    const/16 v0, 0x5a

    goto :goto_c

    .line 112
    :pswitch_8a
    const/16 v0, 0x4f

    goto :goto_c

    .line 114
    :pswitch_8d
    const/16 v0, 0x283

    goto/16 :goto_c

    .line 116
    :pswitch_91
    const/16 v0, 0x16

    goto/16 :goto_c

    .line 118
    :pswitch_95
    const/16 v0, 0x148

    goto/16 :goto_c

    .line 120
    :pswitch_99
    const/16 v0, 0x14a

    goto/16 :goto_c

    .line 122
    :pswitch_9d
    const/16 v0, 0x147

    goto/16 :goto_c

    .line 124
    :pswitch_a1
    const/16 v0, 0x1f5

    goto/16 :goto_c

    .line 102
    nop

    :sswitch_data_a6
    .sparse-switch
        -0x58f4735a -> :sswitch_3f
        -0x50c77185 -> :sswitch_21
        -0x4304f6b3 -> :sswitch_53
        -0x3cb2b182 -> :sswitch_2b
        -0x18ffe813 -> :sswitch_5d
        -0x142fd207 -> :sswitch_49
        0x189ad4da -> :sswitch_d
        0x206b7974 -> :sswitch_73
        0x37d94ff7 -> :sswitch_17
        0x481c10c6 -> :sswitch_68
        0x49f55afe -> :sswitch_35
    .end sparse-switch

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_7e
        :pswitch_81
        :pswitch_84
        :pswitch_87
        :pswitch_8a
        :pswitch_8d
        :pswitch_91
        :pswitch_95
        :pswitch_99
        :pswitch_9d
        :pswitch_a1
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

    const-string v2, "results/HCL-IAST.hcl"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .local v1, "f":Ljava/io/File;
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HCLReader;

    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/HCLReader;-><init>()V

    .line 34
    .local v0, "cr":Lorg/owasp/benchmark/score/parsers/HCLReader;
    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/HCLReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    .line 35
    return-void
.end method

.method private parseFindings(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/lang/String;)V
    .registers 13
    .param p1, "tr"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 75
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :try_start_5
    const-string v8, "{"

    invoke-virtual {p2, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p2, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "splitJson":Ljava/lang/String;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 77
    .local v0, "obj":Lorg/json/JSONObject;
    const-string v8, "issue-group"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 79
    .local v2, "result":Lorg/json/JSONObject;
    const-string v8, "issue-type"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "ref"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "ruleId":Ljava/lang/String;
    invoke-static {v3}, Lorg/owasp/benchmark/score/parsers/HCLReader;->cweLookup(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 81
    invoke-virtual {v5, v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 83
    const-string v8, "variant-group"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "request"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 84
    .local v1, "request":Lorg/json/JSONObject;
    const-string v8, "uri"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 86
    .local v7, "uri":Ljava/lang/String;
    const-string v8, "BenchmarkTest"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_77

    .line 87
    const/16 v8, 0x2f

    invoke-virtual {v7, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    const-string v9, "BenchmarkTest"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v8, v9

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 88
    .local v6, "testNumber":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 89
    invoke-virtual {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v8

    if-eqz v8, :cond_77

    .line 91
    invoke-virtual {p1, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_77} :catch_78

    .line 98
    .end local v0    # "obj":Lorg/json/JSONObject;
    .end local v1    # "request":Lorg/json/JSONObject;
    .end local v2    # "result":Lorg/json/JSONObject;
    .end local v3    # "ruleId":Ljava/lang/String;
    .end local v4    # "splitJson":Ljava/lang/String;
    .end local v6    # "testNumber":Ljava/lang/String;
    .end local v7    # "uri":Ljava/lang/String;
    :cond_77
    :goto_77
    return-void

    .line 94
    :catch_78
    move-exception v8

    goto :goto_77
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

    const-string v7, "HCL IAST"

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
    const-string v7, "1.0"

    invoke-virtual {v5, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 46
    :cond_1e
    :goto_1e
    if-eqz v3, :cond_6f

    .line 48
    :try_start_20
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 49
    if-eqz v3, :cond_1e

    .line 50
    const-string v7, "writeVulnerabilityToFile"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_37

    .line 51
    invoke-direct {p0, v5, v3}, Lorg/owasp/benchmark/score/parsers/HCLReader;->parseFindings(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/lang/String;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_31} :catch_32

    goto :goto_1e

    .line 61
    :catch_32
    move-exception v0

    .line 62
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1e

    .line 52
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_37
    :try_start_37
    const-string v7, "Agent Version:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_53

    .line 53
    const-string v7, "Version:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x8

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 54
    .local v6, "version":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    goto :goto_1e

    .line 55
    .end local v6    # "version":Ljava/lang/String;
    :cond_53
    const-string v7, "[checking URL:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_65

    const-string v7, "BenchmarkTest00001"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_65

    .line 56
    move-object v1, v3

    goto :goto_1e

    .line 57
    :cond_65
    const-string v7, "[checking URL:"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_6a} :catch_32

    move-result v7

    if-eqz v7, :cond_1e

    .line 58
    move-object v2, v3

    goto :goto_1e

    .line 65
    :cond_6f
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 66
    invoke-direct {p0, v1, v2}, Lorg/owasp/benchmark/score/parsers/HCLReader;->calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 67
    return-object v5
.end method
