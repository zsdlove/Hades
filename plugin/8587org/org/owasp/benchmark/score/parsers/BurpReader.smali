.class public Lorg/owasp/benchmark/score/parsers/BurpReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "BurpReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private parseBurpVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 10
    .param p1, "issue"    # Lorg/w3c/dom/Node;

    .prologue
    .line 70
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 71
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v6, "type"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/BurpReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "cwe":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/BurpReader;->translate(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 74
    const-string v6, "name"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/BurpReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v3, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 76
    invoke-virtual {v3, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 81
    const-string v6, "path"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/BurpReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, "testcase":Ljava/lang/String;
    const/16 v6, 0x2f

    invoke-virtual {v4, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 83
    const-string v6, "\\."

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v4, v6, v7

    .line 84
    const-string v6, "BenchmarkTest"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_64

    .line 85
    const-string v6, "BenchmarkTest"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 87
    .local v5, "testno":Ljava/lang/String;
    :try_start_57
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_5e
    .catch Ljava/lang/NumberFormatException; {:try_start_57 .. :try_end_5e} :catch_5f

    .line 94
    .end local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v5    # "testno":Ljava/lang/String;
    :goto_5e
    return-object v3

    .line 88
    .restart local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v5    # "testno":Ljava/lang/String;
    :catch_5f
    move-exception v1

    .line 89
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_5e

    .line 94
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v5    # "testno":Ljava/lang/String;
    :cond_64
    const/4 v3, 0x0

    goto :goto_5e
.end method

.method private translate(Ljava/lang/String;)I
    .registers 9
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x4f

    const/16 v0, 0x16

    const/16 v4, 0x14

    const/16 v3, 0x10

    const/16 v2, 0x270f

    .line 100
    const/4 v5, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_1c8

    :cond_12
    :goto_12
    packed-switch v5, :pswitch_data_23a

    .line 151
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 152
    const/4 v0, -0x1

    :goto_2e
    :pswitch_2e
    return v0

    .line 100
    :sswitch_2f
    const-string v6, "1048832"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x0

    goto :goto_12

    :sswitch_39
    const-string v6, "1049088"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x1

    goto :goto_12

    :sswitch_43
    const-string v6, "1049344"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x2

    goto :goto_12

    :sswitch_4d
    const-string v6, "1049600"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x3

    goto :goto_12

    :sswitch_57
    const-string v6, "1049856"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x4

    goto :goto_12

    :sswitch_61
    const-string v6, "1050112"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x5

    goto :goto_12

    :sswitch_6b
    const-string v6, "1050368"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x6

    goto :goto_12

    :sswitch_75
    const-string v6, "1051392"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v5, 0x7

    goto :goto_12

    :sswitch_7f
    const-string v6, "2097408"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x8

    goto :goto_12

    :sswitch_8a
    const-string v6, "2097920"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x9

    goto/16 :goto_12

    :sswitch_96
    const-string v6, "2097936"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0xa

    goto/16 :goto_12

    :sswitch_a2
    const-string v6, "2098944"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0xb

    goto/16 :goto_12

    :sswitch_ae
    const-string v6, "4194560"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0xc

    goto/16 :goto_12

    :sswitch_ba
    const-string v6, "4194576"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0xd

    goto/16 :goto_12

    :sswitch_c6
    const-string v6, "5243392"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0xe

    goto/16 :goto_12

    :sswitch_d2
    const-string v6, "5244416"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0xf

    goto/16 :goto_12

    :sswitch_de
    const-string v6, "5245344"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    move v5, v3

    goto/16 :goto_12

    :sswitch_e9
    const-string v6, "5247488"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x11

    goto/16 :goto_12

    :sswitch_f5
    const-string v6, "6291968"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x12

    goto/16 :goto_12

    :sswitch_101
    const-string v6, "6292736"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x13

    goto/16 :goto_12

    :sswitch_10d
    const-string v6, "7340288"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    move v5, v4

    goto/16 :goto_12

    :sswitch_118
    const-string v6, "8389120"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x15

    goto/16 :goto_12

    :sswitch_124
    const-string v6, "8389632"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    move v5, v0

    goto/16 :goto_12

    :sswitch_12f
    const-string v6, "8389888"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x17

    goto/16 :goto_12

    :sswitch_13b
    const-string v6, "5245360"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x18

    goto/16 :goto_12

    :sswitch_147
    const-string v6, "4197632"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x19

    goto/16 :goto_12

    :sswitch_153
    const-string v6, "4197376"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x1a

    goto/16 :goto_12

    :sswitch_15f
    const-string v6, "3146240"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v5, 0x1b

    goto/16 :goto_12

    .line 101
    :pswitch_16b
    const/16 v0, 0x4e

    goto/16 :goto_2e

    .line 102
    :pswitch_16f
    const/16 v0, 0x59

    goto/16 :goto_2e

    .line 104
    :pswitch_173
    const/16 v0, 0x263

    goto/16 :goto_2e

    .line 105
    :pswitch_177
    const/16 v0, 0x5a

    goto/16 :goto_2e

    .line 106
    :pswitch_17b
    const/16 v0, 0x283

    goto/16 :goto_2e

    .line 107
    :pswitch_17f
    const/16 v0, 0x283

    goto/16 :goto_2e

    :pswitch_183
    move v0, v1

    .line 109
    goto/16 :goto_2e

    :pswitch_186
    move v0, v1

    .line 110
    goto/16 :goto_2e

    :pswitch_189
    move v0, v1

    .line 111
    goto/16 :goto_2e

    .line 112
    :pswitch_18c
    const/16 v0, 0x160

    goto/16 :goto_2e

    :pswitch_190
    move v0, v2

    .line 113
    goto/16 :goto_2e

    :pswitch_193
    move v0, v2

    .line 114
    goto/16 :goto_2e

    .line 115
    :pswitch_196
    const/16 v0, 0x266

    goto/16 :goto_2e

    .line 116
    :pswitch_19a
    const/16 v0, 0x270e

    goto/16 :goto_2e

    .line 117
    :pswitch_19e
    const/16 v0, 0x22b8

    goto/16 :goto_2e

    :pswitch_1a2
    move v0, v2

    .line 118
    goto/16 :goto_2e

    .line 119
    :pswitch_1a5
    const/16 v0, 0xc8

    goto/16 :goto_2e

    .line 120
    :pswitch_1a9
    const/16 v0, 0xc8

    goto/16 :goto_2e

    .line 121
    :pswitch_1ad
    const/16 v0, 0x20d

    goto/16 :goto_2e

    :pswitch_1b1
    move v0, v2

    .line 122
    goto/16 :goto_2e

    :pswitch_1b4
    move v0, v2

    .line 123
    goto/16 :goto_2e

    :pswitch_1b7
    move v0, v3

    .line 124
    goto/16 :goto_2e

    :pswitch_1ba
    move v0, v3

    .line 125
    goto/16 :goto_2e

    :pswitch_1bd
    move v0, v4

    .line 126
    goto/16 :goto_2e

    :pswitch_1c0
    move v0, v4

    .line 127
    goto/16 :goto_2e

    .line 128
    :pswitch_1c3
    const/16 v0, 0x396

    goto/16 :goto_2e

    .line 100
    nop

    :sswitch_data_1c8
    .sparse-switch
        -0x7ee2d299 -> :sswitch_f5
        -0x7ee2661b -> :sswitch_101
        -0x55e2ca20 -> :sswitch_7f
        -0x55e2b725 -> :sswitch_8a
        -0x55e2b700 -> :sswitch_96
        -0x55e24284 -> :sswitch_a2
        -0x488ec2a6 -> :sswitch_10d
        -0x1f8ea732 -> :sswitch_15f
        -0x136c168d -> :sswitch_118
        -0x136c03a7 -> :sswitch_124
        -0x136bfb84 -> :sswitch_12f
        0x159d2c57 -> :sswitch_ae
        0x159d2c7c -> :sswitch_ba
        0x159e8217 -> :sswitch_153
        0x159e8cda -> :sswitch_147
        0x4bf14f30 -> :sswitch_c6
        0x4bf1c65c -> :sswitch_d2
        0x4bf23755 -> :sswitch_de
        0x4bf2378f -> :sswitch_13b
        0x4bf32454 -> :sswitch_e9
        0x74f108d4 -> :sswitch_2f
        0x74f15fcc -> :sswitch_39
        0x74f16a8f -> :sswitch_43
        0x74f17552 -> :sswitch_4d
        0x74f17d75 -> :sswitch_57
        0x74fb62d8 -> :sswitch_61
        0x74fb6afb -> :sswitch_6b
        0x74fbdfb1 -> :sswitch_75
    .end sparse-switch

    :pswitch_data_23a
    .packed-switch 0x0
        :pswitch_16b
        :pswitch_16f
        :pswitch_2e
        :pswitch_173
        :pswitch_177
        :pswitch_17b
        :pswitch_17f
        :pswitch_2e
        :pswitch_183
        :pswitch_186
        :pswitch_189
        :pswitch_18c
        :pswitch_190
        :pswitch_193
        :pswitch_196
        :pswitch_19a
        :pswitch_19e
        :pswitch_1a2
        :pswitch_1a5
        :pswitch_1a9
        :pswitch_1ad
        :pswitch_1b1
        :pswitch_1b4
        :pswitch_1b7
        :pswitch_1ba
        :pswitch_1bd
        :pswitch_1c0
        :pswitch_1c3
    .end packed-switch
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 10
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v5, "Burp Suite Pro"

    const/4 v6, 0x1

    sget-object v7, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v3, v5, v6, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 35
    .local v3, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v5, "burpVersion"

    invoke-static {v5, p1}, Lorg/owasp/benchmark/score/parsers/BurpReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    .line 36
    .local v4, "version":Ljava/lang/String;
    invoke-virtual {v3, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 43
    const-string v5, "issue"

    invoke-static {v5, p1}, Lorg/owasp/benchmark/score/parsers/BurpReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v1

    .line 45
    .local v1, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1d
    :goto_1d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_33

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Node;

    .line 46
    .local v0, "issue":Lorg/w3c/dom/Node;
    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/BurpReader;->parseBurpVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v2

    .line 47
    .local v2, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v2, :cond_1d

    .line 49
    invoke-virtual {v3, v2}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_1d

    .line 52
    .end local v0    # "issue":Lorg/w3c/dom/Node;
    .end local v2    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_33
    return-object v3
.end method
