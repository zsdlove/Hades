.class public Lorg/owasp/benchmark/score/parsers/SeekerReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "SeekerReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 7
    .param p0, "checkerKey"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x1f5

    const/16 v2, 0x14a

    const/16 v1, 0x148

    const/4 v0, 0x0

    .line 31
    const-string v4, "-SECOND-ORDER"

    const-string v5, ""

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 33
    const/4 v4, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_12a

    :cond_17
    :goto_17
    packed-switch v4, :pswitch_data_178

    .line 74
    :goto_1a
    :pswitch_1a
    return v0

    .line 33
    :sswitch_1b
    const-string v5, "COOK-SEC"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    move v4, v0

    goto :goto_17

    :sswitch_25
    const-string v5, "SQLI"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x1

    goto :goto_17

    :sswitch_2f
    const-string v5, "CMD-INJECT"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x2

    goto :goto_17

    :sswitch_39
    const-string v5, "LDAP-INJECTION"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x3

    goto :goto_17

    :sswitch_43
    const-string v5, "header-injection"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x4

    goto :goto_17

    :sswitch_4d
    const-string v5, "hql-injection"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x5

    goto :goto_17

    :sswitch_57
    const-string v5, "unsafe-readline"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x6

    goto :goto_17

    :sswitch_61
    const-string v5, "reflection-injection"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v4, 0x7

    goto :goto_17

    :sswitch_6b
    const-string v5, "R-XSS"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0x8

    goto :goto_17

    :sswitch_76
    const-string v5, "XPATH-INJECT"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0x9

    goto :goto_17

    :sswitch_81
    const-string v5, "DIR-TRAVERSAL"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0xa

    goto :goto_17

    :sswitch_8c
    const-string v5, "crypto-bad-mac"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0xb

    goto :goto_17

    :sswitch_97
    const-string v5, "crypto-weak-randomness"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0xc

    goto/16 :goto_17

    :sswitch_a3
    const-string v5, "WEAK-ENC"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0xd

    goto/16 :goto_17

    :sswitch_af
    const-string v5, "trust-boundary-violation"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0xe

    goto/16 :goto_17

    :sswitch_bb
    const-string v5, "xxe"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0xf

    goto/16 :goto_17

    :sswitch_c7
    const-string v5, "WEAK-HASH"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0x10

    goto/16 :goto_17

    :sswitch_d3
    const-string v5, "WEAK-RANDOM-GENERATOR"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0x11

    goto/16 :goto_17

    :sswitch_df
    const-string v5, "TRUST-BOUNDARY-VIOLATION"

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const/16 v4, 0x12

    goto/16 :goto_17

    .line 36
    :pswitch_eb
    const/16 v0, 0x266

    goto/16 :goto_1a

    .line 38
    :pswitch_ef
    const/16 v0, 0x59

    goto/16 :goto_1a

    .line 40
    :pswitch_f3
    const/16 v0, 0x4e

    goto/16 :goto_1a

    .line 42
    :pswitch_f7
    const/16 v0, 0x5a

    goto/16 :goto_1a

    .line 44
    :pswitch_fb
    const/16 v0, 0x71

    goto/16 :goto_1a

    .line 46
    :pswitch_ff
    const/16 v0, 0x234

    goto/16 :goto_1a

    .line 52
    :pswitch_103
    const/16 v0, 0x4f

    goto/16 :goto_1a

    .line 54
    :pswitch_107
    const/16 v0, 0x283

    goto/16 :goto_1a

    .line 56
    :pswitch_10b
    const/16 v0, 0x16

    goto/16 :goto_1a

    :pswitch_10f
    move v0, v1

    .line 58
    goto/16 :goto_1a

    :pswitch_112
    move v0, v2

    .line 60
    goto/16 :goto_1a

    .line 62
    :pswitch_115
    const/16 v0, 0x147

    goto/16 :goto_1a

    :pswitch_119
    move v0, v3

    .line 64
    goto/16 :goto_1a

    .line 66
    :pswitch_11c
    const/16 v0, 0x263

    goto/16 :goto_1a

    :pswitch_120
    move v0, v1

    .line 68
    goto/16 :goto_1a

    :pswitch_123
    move v0, v2

    .line 70
    goto/16 :goto_1a

    :pswitch_126
    move v0, v3

    .line 72
    goto/16 :goto_1a

    .line 33
    nop

    :sswitch_data_12a
    .sparse-switch
        -0x789c65ef -> :sswitch_39
        -0x41ca8d2f -> :sswitch_57
        -0x3e022422 -> :sswitch_d3
        -0x23e9f24b -> :sswitch_61
        -0x21907f1f -> :sswitch_76
        -0x12ea0e5c -> :sswitch_2f
        0x1d165 -> :sswitch_bb
        0x26f45b -> :sswitch_25
        0x2b59ce5 -> :sswitch_a3
        0x49950bd -> :sswitch_6b
        0xe00782c -> :sswitch_1b
        0x1833280d -> :sswitch_4d
        0x205d7f3e -> :sswitch_81
        0x2b0bf197 -> :sswitch_43
        0x34ee0cd7 -> :sswitch_df
        0x53ff2e43 -> :sswitch_c7
        0x6151e0d7 -> :sswitch_af
        0x75cb9603 -> :sswitch_97
        0x7eeb8e7b -> :sswitch_8c
    .end sparse-switch

    :pswitch_data_178
    .packed-switch 0x0
        :pswitch_eb
        :pswitch_ef
        :pswitch_f3
        :pswitch_f7
        :pswitch_fb
        :pswitch_ff
        :pswitch_1a
        :pswitch_1a
        :pswitch_103
        :pswitch_107
        :pswitch_10b
        :pswitch_10f
        :pswitch_112
        :pswitch_115
        :pswitch_119
        :pswitch_11c
        :pswitch_120
        :pswitch_123
        :pswitch_126
    .end packed-switch
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 14
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v8, "Seeker"

    const/4 v9, 0x1

    sget-object v10, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->IAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v6, v8, v9, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 81
    .local v6, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 82
    .local v2, "inReader":Ljava/io/Reader;
    sget-object v8, Lorg/apache/commons/csv/CSVFormat;->RFC4180:Lorg/apache/commons/csv/CSVFormat;

    invoke-virtual {v8}, Lorg/apache/commons/csv/CSVFormat;->withFirstRecordAsHeader()Lorg/apache/commons/csv/CSVFormat;

    move-result-object v8

    invoke-virtual {v8, v2}, Lorg/apache/commons/csv/CSVFormat;->parse(Ljava/io/Reader;)Lorg/apache/commons/csv/CSVParser;

    move-result-object v4

    .line 83
    .local v4, "records":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/apache/commons/csv/CSVRecord;>;"
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_1d
    :goto_1d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_88

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/csv/CSVRecord;

    .line 85
    .local v3, "record":Lorg/apache/commons/csv/CSVRecord;
    const-string v9, "CheckerKey"

    invoke-virtual {v3, v9}, Lorg/apache/commons/csv/CSVRecord;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "checkerKey":Ljava/lang/String;
    const-string v9, "LastDetectionURL"

    invoke-virtual {v3, v9}, Lorg/apache/commons/csv/CSVRecord;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 88
    .local v7, "url":Ljava/lang/String;
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 89
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 90
    invoke-static {v0}, Lorg/owasp/benchmark/score/parsers/SeekerReader;->cweLookup(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v5, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 93
    :try_start_44
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x5

    if-lt v9, v10, :cond_60

    .line 95
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x5

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v7, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v5, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_60
    .catch Ljava/lang/NumberFormatException; {:try_start_44 .. :try_end_60} :catch_6a

    .line 103
    :cond_60
    :goto_60
    invoke-virtual {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v9

    if-eqz v9, :cond_1d

    .line 105
    invoke-virtual {v6, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_1d

    .line 98
    :catch_6a
    move-exception v1

    .line 100
    .local v1, "e":Ljava/lang/NumberFormatException;
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "> Parse error: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lorg/apache/commons/csv/CSVRecord;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_60

    .line 109
    .end local v0    # "checkerKey":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v3    # "record":Lorg/apache/commons/csv/CSVRecord;
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "url":Ljava/lang/String;
    :cond_88
    const-string v8, "100"

    invoke-virtual {v6, v8}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 111
    return-object v6
.end method
