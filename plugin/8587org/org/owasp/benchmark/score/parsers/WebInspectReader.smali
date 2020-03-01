.class public Lorg/owasp/benchmark/score/parsers/WebInspectReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "WebInspectReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 5
    .param p0, "rule"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x4f

    const/4 v0, 0x0

    .line 106
    const/4 v2, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_144

    :cond_b
    :goto_b
    packed-switch v2, :pswitch_data_1ae

    .line 151
    :goto_e
    :pswitch_e
    return v0

    .line 106
    :sswitch_f
    const-string v3, "810"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v2, v0

    goto :goto_b

    :sswitch_19
    const-string v3, "1436"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x1

    goto :goto_b

    :sswitch_23
    const-string v3, "1498"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x2

    goto :goto_b

    :sswitch_2d
    const-string v3, "4720"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x3

    goto :goto_b

    :sswitch_37
    const-string v3, "4724"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x4

    goto :goto_b

    :sswitch_41
    const-string v3, "4725"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x5

    goto :goto_b

    :sswitch_4b
    const-string v3, "4729"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x6

    goto :goto_b

    :sswitch_55
    const-string v3, "5546"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x7

    goto :goto_b

    :sswitch_5f
    const-string v3, "5597"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x8

    goto :goto_b

    :sswitch_6a
    const-string v3, "5649"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x9

    goto :goto_b

    :sswitch_75
    const-string v3, "10167"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xa

    goto :goto_b

    :sswitch_80
    const-string v3, "10210"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xb

    goto :goto_b

    :sswitch_8b
    const-string v3, "10237"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xc

    goto/16 :goto_b

    :sswitch_97
    const-string v3, "10543"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xd

    goto/16 :goto_b

    :sswitch_a3
    const-string v3, "10655"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xe

    goto/16 :goto_b

    :sswitch_af
    const-string v3, "10825"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xf

    goto/16 :goto_b

    :sswitch_bb
    const-string v3, "10932"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x10

    goto/16 :goto_b

    :sswitch_c7
    const-string v3, "10965"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x11

    goto/16 :goto_b

    :sswitch_d3
    const-string v3, "11293"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x12

    goto/16 :goto_b

    :sswitch_df
    const-string v3, "11294"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x13

    goto/16 :goto_b

    :sswitch_eb
    const-string v3, "11299"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x14

    goto/16 :goto_b

    :sswitch_f7
    const-string v3, "11306"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x15

    goto/16 :goto_b

    :sswitch_103
    const-string v3, "11359"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x16

    goto/16 :goto_b

    :sswitch_10f
    const-string v3, "11365"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x17

    goto/16 :goto_b

    :sswitch_11b
    const-string v3, "11380"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x18

    goto/16 :goto_b

    :sswitch_127
    const-string v3, "11395"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x19

    goto/16 :goto_b

    .line 110
    :pswitch_133
    const/16 v0, 0x266

    goto/16 :goto_e

    :pswitch_137
    move v0, v1

    .line 116
    goto/16 :goto_e

    :pswitch_13a
    move v0, v1

    .line 125
    goto/16 :goto_e

    :pswitch_13d
    move v0, v1

    .line 126
    goto/16 :goto_e

    .line 127
    :pswitch_140
    const/16 v0, 0x59

    goto/16 :goto_e

    .line 106
    :sswitch_data_144
    .sparse-switch
        0xd857 -> :sswitch_f
        0x170fc6 -> :sswitch_19
        0x171082 -> :sswitch_23
        0x187801 -> :sswitch_2d
        0x187805 -> :sswitch_37
        0x187806 -> :sswitch_41
        0x18780a -> :sswitch_4b
        0x18e522 -> :sswitch_55
        0x18e5be -> :sswitch_5f
        0x18e8e6 -> :sswitch_6a
        0x2c91033 -> :sswitch_75
        0x2c91352 -> :sswitch_80
        0x2c91397 -> :sswitch_8b
        0x2c91ef5 -> :sswitch_97
        0x2c922d7 -> :sswitch_a3
        0x2c929fc -> :sswitch_af
        0x2c92dd9 -> :sswitch_bb
        0x2c92e39 -> :sswitch_c7
        0x2c988ac -> :sswitch_d3
        0x2c988ad -> :sswitch_df
        0x2c988b2 -> :sswitch_eb
        0x2c98b59 -> :sswitch_f7
        0x2c98bf7 -> :sswitch_103
        0x2c98c12 -> :sswitch_10f
        0x2c98c4b -> :sswitch_11b
        0x2c98c6f -> :sswitch_127
    .end sparse-switch

    :pswitch_data_1ae
    .packed-switch 0x0
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_133
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_137
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_13a
        :pswitch_13d
        :pswitch_140
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
    .end packed-switch
.end method

.method private parseWebInspectIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 15
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 67
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 69
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v10, "Name"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "cat":Ljava/lang/String;
    invoke-virtual {v4, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 71
    invoke-virtual {v4, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 73
    const-string v10, "VulnerabilityID"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 74
    .local v9, "vulnId":Lorg/w3c/dom/Node;
    if-eqz v9, :cond_29

    .line 75
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v8

    .line 76
    .local v8, "vuln":Ljava/lang/String;
    invoke-static {v8}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->cweLookup(Ljava/lang/String;)I

    move-result v2

    .line 77
    .local v2, "cwe":I
    invoke-virtual {v4, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 80
    .end local v2    # "cwe":I
    .end local v8    # "vuln":Ljava/lang/String;
    :cond_29
    const-string v10, "Severity"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "conf":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 83
    const-string v10, "URL"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    .line 84
    .local v7, "uri":Ljava/lang/String;
    const/16 v10, 0x2f

    invoke-virtual {v7, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v7, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 85
    .local v5, "testfile":Ljava/lang/String;
    const-string v10, "?"

    invoke-virtual {v5, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_62

    .line 86
    const-string v10, "?"

    invoke-virtual {v5, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v5, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 89
    :cond_62
    const-string v10, "BenchmarkTest"

    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b1

    .line 90
    const-string v10, "BenchmarkTest"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 91
    .local v6, "testno":Ljava/lang/String;
    const-string v10, ".html"

    invoke-virtual {v6, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_86

    .line 92
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x5

    invoke-virtual {v6, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 95
    :cond_86
    :try_start_86
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_8d
    .catch Ljava/lang/NumberFormatException; {:try_start_86 .. :try_end_8d} :catch_8e

    .line 101
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "testno":Ljava/lang/String;
    :goto_8d
    return-object v4

    .line 97
    .restart local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v6    # "testno":Ljava/lang/String;
    :catch_8e
    move-exception v3

    .line 98
    .local v3, "e":Ljava/lang/NumberFormatException;
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "> Parse error "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 101
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v6    # "testno":Ljava/lang/String;
    :cond_b1
    const/4 v4, 0x0

    goto :goto_8d
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 12
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v7, "HP WebInspect"

    const/4 v8, 0x1

    sget-object v9, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v6, v7, v8, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 34
    .local v6, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v7, "Duration"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "duration":Ljava/lang/String;
    const/4 v7, 0x0

    const/16 v8, 0x2e

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 36
    invoke-virtual {v6, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 38
    const-string v7, "Issues"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 39
    .local v4, "issues":Lorg/w3c/dom/Node;
    const-string v7, "Issue"

    invoke-static {v7, v4}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v3

    .line 41
    .local v3, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_32
    :goto_32
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Node;

    .line 43
    .local v2, "issue":Lorg/w3c/dom/Node;
    :try_start_3e
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->parseWebInspectIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v5

    .line 44
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v5, :cond_32

    .line 45
    invoke-virtual {v6, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_47} :catch_48

    goto :goto_32

    .line 47
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_48
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_32

    .line 51
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "issue":Lorg/w3c/dom/Node;
    :cond_4d
    return-object v6
.end method
