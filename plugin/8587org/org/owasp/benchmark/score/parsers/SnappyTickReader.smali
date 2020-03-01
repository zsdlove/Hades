.class public Lorg/owasp/benchmark/score/parsers/SnappyTickReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "SnappyTickReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 7
    .param p0, "checkerKey"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x266

    const/16 v2, 0x16

    const/4 v1, 0x0

    .line 114
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/4 v3, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_e2

    :cond_11
    :goto_11
    packed-switch v3, :pswitch_data_118

    .line 144
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Found unrecognized vulnerability type in Snappy Tick results: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v0, v1

    .line 146
    :goto_2d
    :pswitch_2d
    return v0

    .line 114
    :sswitch_2e
    const-string v5, "1004"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    move v3, v1

    goto :goto_11

    :sswitch_38
    const-string v5, "614"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x1

    goto :goto_11

    :sswitch_42
    const-string v5, "78"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x2

    goto :goto_11

    :sswitch_4c
    const-string v5, "89"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x3

    goto :goto_11

    :sswitch_56
    const-string v5, "755"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x4

    goto :goto_11

    :sswitch_60
    const-string v5, "258"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x5

    goto :goto_11

    :sswitch_6a
    const-string v5, "20"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x6

    goto :goto_11

    :sswitch_74
    const-string v5, "79"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/4 v3, 0x7

    goto :goto_11

    :sswitch_7e
    const-string v5, "73"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/16 v3, 0x8

    goto :goto_11

    :sswitch_89
    const-string v5, "538"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/16 v3, 0x9

    goto/16 :goto_11

    :sswitch_95
    const-string v5, "330"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/16 v3, 0xa

    goto/16 :goto_11

    :sswitch_a1
    const-string v5, "327"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/16 v3, 0xb

    goto/16 :goto_11

    :sswitch_ad
    const-string v5, "328"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    const/16 v3, 0xc

    goto/16 :goto_11

    .line 121
    :pswitch_b9
    const/16 v0, 0x4e

    goto/16 :goto_2d

    .line 123
    :pswitch_bd
    const/16 v0, 0x59

    goto/16 :goto_2d

    .line 125
    :pswitch_c1
    const/16 v0, 0x2f3

    goto/16 :goto_2d

    :pswitch_c5
    move v0, v1

    .line 127
    goto/16 :goto_2d

    .line 129
    :pswitch_c8
    const/16 v0, 0x14

    goto/16 :goto_2d

    .line 131
    :pswitch_cc
    const/16 v0, 0x4f

    goto/16 :goto_2d

    :pswitch_d0
    move v0, v2

    .line 133
    goto/16 :goto_2d

    :pswitch_d3
    move v0, v2

    .line 135
    goto/16 :goto_2d

    .line 137
    :pswitch_d6
    const/16 v0, 0x14a

    goto/16 :goto_2d

    .line 139
    :pswitch_da
    const/16 v0, 0x147

    goto/16 :goto_2d

    .line 142
    :pswitch_de
    const/16 v0, 0x148

    goto/16 :goto_2d

    .line 114
    :sswitch_data_e2
    .sparse-switch
        0x63e -> :sswitch_6a
        0x6dc -> :sswitch_7e
        0x6e1 -> :sswitch_42
        0x6e2 -> :sswitch_74
        0x701 -> :sswitch_4c
        0xc255 -> :sswitch_60
        0xc5b8 -> :sswitch_a1
        0xc5b9 -> :sswitch_ad
        0xc5d0 -> :sswitch_95
        0xcd5a -> :sswitch_89
        0xd0d9 -> :sswitch_38
        0xd517 -> :sswitch_56
        0x170063 -> :sswitch_2e
    .end sparse-switch

    :pswitch_data_118
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_2d
        :pswitch_b9
        :pswitch_bd
        :pswitch_c1
        :pswitch_c5
        :pswitch_c8
        :pswitch_cc
        :pswitch_d0
        :pswitch_d3
        :pswitch_d6
        :pswitch_da
        :pswitch_de
    .end packed-switch
.end method

.method private static extractTestNumber(Ljava/lang/String;)I
    .registers 6
    .param p0, "testfile"    # Ljava/lang/String;

    .prologue
    .line 100
    const-string v2, "BenchmarkTest"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 101
    const-string v2, "BenchmarkTest"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "testno":Ljava/lang/String;
    :try_start_12
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_15
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_15} :catch_17

    move-result v2

    .line 108
    .end local v1    # "testno":Ljava/lang/String;
    :goto_16
    return v2

    .line 104
    .restart local v1    # "testno":Ljava/lang/String;
    :catch_17
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "> Parse error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 108
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v1    # "testno":Ljava/lang/String;
    :cond_3a
    const/4 v2, -0x1

    goto :goto_16
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 34
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    const-string v27, "ToolInfo"

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v19

    .line 36
    .local v19, "toolInfo":Lorg/w3c/dom/Node;
    const-string v27, "Tool"

    move-object/from16 v0, v27

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v18

    .line 37
    .local v18, "tool":Lorg/w3c/dom/Node;
    const-string v27, "Name"

    move-object/from16 v0, v27

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v20

    .line 38
    .local v20, "toolName":Ljava/lang/String;
    new-instance v21, Lorg/owasp/benchmark/score/parsers/TestResults;

    const/16 v27, 0x1

    sget-object v28, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 40
    .local v21, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v27, "Version"

    move-object/from16 v0, v27

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v22

    .line 41
    .local v22, "version":Ljava/lang/String;
    invoke-virtual/range {v21 .. v22}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 43
    const-string v27, "ProjectInfo"

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v14

    .line 44
    .local v14, "projectInfo":Lorg/w3c/dom/Node;
    const-string v27, "Project"

    move-object/from16 v0, v27

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v13

    .line 45
    .local v13, "project":Lorg/w3c/dom/Node;
    const-string v27, "Duration"

    move-object/from16 v0, v27

    invoke-static {v0, v13}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    .line 46
    .local v5, "duration":Ljava/lang/String;
    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 60
    const-string v27, "VulnerabilityReport"

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v24

    .line 63
    .local v24, "vulnReport":Lorg/w3c/dom/Node;
    const-string v27, "Severity"

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v15

    .line 65
    .local v15, "sevLevels":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :cond_73
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_118

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Node;

    .line 67
    .local v12, "issue":Lorg/w3c/dom/Node;
    const-string v28, "VulnerabilityCollection"

    move-object/from16 v0, v28

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v23

    .line 70
    .local v23, "vulnCollect":Lorg/w3c/dom/Node;
    const-string v28, "Vulnerability"

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v25

    .line 71
    .local v25, "vulnerabilities":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v25 .. v25}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v28

    :cond_95
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_73

    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lorg/w3c/dom/Node;

    .line 72
    .local v26, "vulnerability":Lorg/w3c/dom/Node;
    const-string v29, "CWE"

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "cweNum":Ljava/lang/String;
    invoke-static {v4}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->cweLookup(Ljava/lang/String;)I

    move-result v8

    .line 75
    .local v8, "findingCWE":I
    const-string v29, "FindingsList"

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    .line 76
    .local v11, "findingsList":Lorg/w3c/dom/Node;
    const-string v29, "Finding"

    move-object/from16 v0, v29

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v10

    .line 77
    .local v10, "findings":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v29

    :cond_c5
    :goto_c5
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_95

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Node;

    .line 78
    .local v7, "finding":Lorg/w3c/dom/Node;
    const-string v30, "FileName"

    move-object/from16 v0, v30

    invoke-static {v0, v7}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 79
    .local v6, "filename":Ljava/lang/String;
    const/16 v30, 0x0

    const-string v31, "."

    move-object/from16 v0, v31

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v30

    move/from16 v1, v31

    invoke-virtual {v6, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 80
    .local v9, "findingName":Ljava/lang/String;
    if-eqz v8, :cond_c5

    .line 81
    invoke-static {v9}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->extractTestNumber(Ljava/lang/String;)I

    move-result v17

    .line 82
    .local v17, "testNumber":I
    const/16 v30, -0x1

    move/from16 v0, v17

    move/from16 v1, v30

    if-eq v0, v1, :cond_c5

    .line 83
    new-instance v16, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct/range {v16 .. v16}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 84
    .local v16, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 85
    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 86
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 87
    invoke-virtual/range {v16 .. v17}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 88
    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_c5

    .line 95
    .end local v4    # "cweNum":Ljava/lang/String;
    .end local v6    # "filename":Ljava/lang/String;
    .end local v7    # "finding":Lorg/w3c/dom/Node;
    .end local v8    # "findingCWE":I
    .end local v9    # "findingName":Ljava/lang/String;
    .end local v10    # "findings":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v11    # "findingsList":Lorg/w3c/dom/Node;
    .end local v12    # "issue":Lorg/w3c/dom/Node;
    .end local v16    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v17    # "testNumber":I
    .end local v23    # "vulnCollect":Lorg/w3c/dom/Node;
    .end local v25    # "vulnerabilities":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v26    # "vulnerability":Lorg/w3c/dom/Node;
    :cond_118
    return-object v21
.end method
