.class public Lorg/owasp/benchmark/score/parsers/ShiftLeftReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "ShiftLeftReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private categoryToCWE(Ljava/lang/String;)I
    .registers 5
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 40
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_b8

    :cond_8
    :goto_8
    packed-switch v0, :pswitch_data_e6

    .line 64
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown category: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :sswitch_24
    const-string v1, "cmdi"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x0

    goto :goto_8

    :sswitch_2e
    const-string v1, "crypto"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x1

    goto :goto_8

    :sswitch_38
    const-string v1, "hash"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x2

    goto :goto_8

    :sswitch_42
    const-string v1, "ldapi"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x3

    goto :goto_8

    :sswitch_4c
    const-string v1, "pathtraver"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x4

    goto :goto_8

    :sswitch_56
    const-string v1, "securecookie"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x5

    goto :goto_8

    :sswitch_60
    const-string v1, "sqli"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x6

    goto :goto_8

    :sswitch_6a
    const-string v1, "trustbound"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x7

    goto :goto_8

    :sswitch_74
    const-string v1, "weakrand"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x8

    goto :goto_8

    :sswitch_7f
    const-string v1, "xpathi"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x9

    goto/16 :goto_8

    :sswitch_8b
    const-string v1, "xss"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xa

    goto/16 :goto_8

    .line 42
    :pswitch_97
    const/16 v0, 0x4e

    .line 62
    :goto_99
    return v0

    .line 44
    :pswitch_9a
    const/16 v0, 0x147

    goto :goto_99

    .line 46
    :pswitch_9d
    const/16 v0, 0x148

    goto :goto_99

    .line 48
    :pswitch_a0
    const/16 v0, 0x5a

    goto :goto_99

    .line 50
    :pswitch_a3
    const/16 v0, 0x16

    goto :goto_99

    .line 52
    :pswitch_a6
    const/16 v0, 0x266

    goto :goto_99

    .line 54
    :pswitch_a9
    const/16 v0, 0x59

    goto :goto_99

    .line 56
    :pswitch_ac
    const/16 v0, 0x1f5

    goto :goto_99

    .line 58
    :pswitch_af
    const/16 v0, 0x14a

    goto :goto_99

    .line 60
    :pswitch_b2
    const/16 v0, 0x283

    goto :goto_99

    .line 62
    :pswitch_b5
    const/16 v0, 0x4f

    goto :goto_99

    .line 40
    :sswitch_data_b8
    .sparse-switch
        -0x50910f3f -> :sswitch_2e
        -0x3f5dcdda -> :sswitch_6a
        -0x2ce25494 -> :sswitch_7f
        -0x2bdf9063 -> :sswitch_74
        0x1d0d8 -> :sswitch_8b
        0x2ea66f -> :sswitch_24
        0x30c10e -> :sswitch_38
        0x35fc5b -> :sswitch_60
        0x620d9a2 -> :sswitch_42
        0x3f10b09b -> :sswitch_56
        0x6a067385 -> :sswitch_4c
    .end sparse-switch

    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_97
        :pswitch_9a
        :pswitch_9d
        :pswitch_a0
        :pswitch_a3
        :pswitch_a6
        :pswitch_a9
        :pswitch_ac
        :pswitch_af
        :pswitch_b2
        :pswitch_b5
    .end packed-switch
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 12
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 12
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v7, "ShiftLeft"

    sget-object v8, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v6, v7, v9, v8}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 13
    .local v6, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    invoke-direct {v7, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 16
    .local v3, "reader":Ljava/io/BufferedReader;
    :goto_14
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_4e

    .line 18
    const-string v7, ","

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 19
    .local v4, "split":[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x2

    if-eq v7, v8, :cond_2c

    .line 20
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Invalid line in SL result file."

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 23
    :cond_2c
    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 24
    .local v2, "number":I
    aget-object v0, v4, v9

    .line 26
    .local v0, "category":Ljava/lang/String;
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 27
    .local v5, "testCaseResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 28
    invoke-virtual {v5, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 29
    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/ShiftLeftReader;->categoryToCWE(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v5, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 30
    invoke-virtual {v5, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v6, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_14

    .line 35
    .end local v0    # "category":Ljava/lang/String;
    .end local v2    # "number":I
    .end local v4    # "split":[Ljava/lang/String;
    .end local v5    # "testCaseResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_4e
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 36
    return-object v6
.end method
