.class public Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "AppScanDynamicReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static calculateTime(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "elapsed"    # Ljava/lang/String;

    .prologue
    .line 121
    :try_start_0
    const-string v7, "[\\.:]"

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 122
    .local v6, "splits":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 123
    .local v1, "hours":I
    const/4 v7, 0x1

    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 124
    .local v4, "minutes":I
    const/4 v7, 0x2

    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 125
    .local v5, "seconds":I
    mul-int/lit8 v7, v1, 0x3c

    mul-int/lit8 v7, v7, 0x3c

    mul-int/lit8 v8, v4, 0x3c

    add-int/2addr v7, v8

    add-int/2addr v7, v5

    mul-int/lit16 v7, v7, 0x3e8

    int-to-long v2, v7

    .line 126
    .local v2, "millis":J
    invoke-static {v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_29} :catch_2b

    move-result-object v7

    .line 129
    .end local v1    # "hours":I
    .end local v2    # "millis":J
    .end local v4    # "minutes":I
    .end local v5    # "seconds":I
    .end local v6    # "splits":[Ljava/lang/String;
    :goto_2a
    return-object v7

    .line 127
    :catch_2b
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 129
    const-string v7, "Unknown"

    goto :goto_2a
.end method

.method private parseAppScanDynamicVulnerability(Lorg/w3c/dom/Node;Ljava/util/Map;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 13
    .param p1, "issue"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Node;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lorg/owasp/benchmark/score/parsers/TestCaseResult;"
        }
    .end annotation

    .prologue
    .local p2, "cweMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v7, 0x0

    .line 136
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 137
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v8, "IssueTypeID"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 138
    .local v2, "cwekey":Ljava/lang/String;
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 139
    .local v1, "cwe":Ljava/lang/Integer;
    if-nez v1, :cond_16

    move-object v4, v7

    .line 163
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :goto_15
    return-object v4

    .line 140
    .restart local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_16
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-direct {p0, v8}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->translate(I)I

    move-result v8

    invoke-virtual {v4, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 142
    invoke-virtual {v4, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 143
    invoke-virtual {v4, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 147
    const-string v8, "Severity"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "confidence":Ljava/lang/String;
    const-string v8, "Url"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    .line 151
    .local v5, "testcase":Ljava/lang/String;
    const/16 v8, 0x2f

    invoke-virtual {v5, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 152
    const-string v8, "\\."

    invoke-virtual {v5, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v5, v8, v9

    .line 153
    const-string v8, "BenchmarkTest"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6f

    .line 154
    const-string v7, "BenchmarkTest"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 156
    .local v6, "testno":Ljava/lang/String;
    :try_start_62
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_69
    .catch Ljava/lang/NumberFormatException; {:try_start_62 .. :try_end_69} :catch_6a

    goto :goto_15

    .line 157
    :catch_6a
    move-exception v3

    .line 158
    .local v3, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_15

    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v6    # "testno":Ljava/lang/String;
    :cond_6f
    move-object v4, v7

    .line 163
    goto :goto_15
.end method

.method private translate(I)I
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 167
    .line 195
    return p1
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 28
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v21, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v23, "IBM AppScan"

    const/16 v24, 0x1

    sget-object v25, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move/from16 v2, v24

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 40
    .local v21, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v23, "AppScanInfo"

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 41
    .local v9, "info":Lorg/w3c/dom/Node;
    const-string v23, "Version"

    move-object/from16 v0, v23

    invoke-static {v0, v9}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v22

    .line 42
    .local v22, "version":Lorg/w3c/dom/Node;
    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 47
    const-string v23, "Summary"

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v19

    .line 48
    .local v19, "summary":Lorg/w3c/dom/Node;
    const-string v23, "TotalScanDuration"

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 49
    .local v8, "elapsed":Lorg/w3c/dom/Node;
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->calculateTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 87
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 88
    .local v6, "cweMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v23, "Results"

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v18

    .line 89
    .local v18, "results":Lorg/w3c/dom/Node;
    const-string v23, "IssueTypes"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v14

    .line 90
    .local v14, "issueTypes":Lorg/w3c/dom/Node;
    const-string v23, "IssueType"

    move-object/from16 v0, v23

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v13

    .line 91
    .local v13, "issueTypeList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_78
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_b8

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Node;

    .line 93
    .local v12, "issueType":Lorg/w3c/dom/Node;
    :try_start_84
    const-string v24, "ID"

    move-object/from16 v0, v24

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v16

    .line 94
    .local v16, "key":Ljava/lang/String;
    const-string v24, "advisory"

    move-object/from16 v0, v24

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 95
    .local v4, "advisory":Lorg/w3c/dom/Node;
    const-string v24, "cwe"

    move-object/from16 v0, v24

    invoke-static {v0, v4}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 96
    .local v7, "cwenode":Lorg/w3c/dom/Node;
    const-string v24, "link"

    move-object/from16 v0, v24

    invoke-static {v0, v7}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    .line 97
    .local v17, "link":Lorg/w3c/dom/Node;
    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 98
    .local v5, "cwe":Ljava/lang/Integer;
    move-object/from16 v0, v16

    invoke-interface {v6, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b5
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_b5} :catch_b6

    goto :goto_78

    .line 99
    .end local v4    # "advisory":Lorg/w3c/dom/Node;
    .end local v5    # "cwe":Ljava/lang/Integer;
    .end local v7    # "cwenode":Lorg/w3c/dom/Node;
    .end local v16    # "key":Ljava/lang/String;
    .end local v17    # "link":Lorg/w3c/dom/Node;
    :catch_b6
    move-exception v24

    goto :goto_78

    .line 104
    .end local v12    # "issueType":Lorg/w3c/dom/Node;
    :cond_b8
    const-string v23, "Issues"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v15

    .line 105
    .local v15, "issues":Lorg/w3c/dom/Node;
    const-string v23, "Issue"

    move-object/from16 v0, v23

    invoke-static {v0, v15}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v11

    .line 106
    .local v11, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_ce
    :goto_ce
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_ea

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/w3c/dom/Node;

    .line 107
    .local v10, "issue":Lorg/w3c/dom/Node;
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v6}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->parseAppScanDynamicVulnerability(Lorg/w3c/dom/Node;Ljava/util/Map;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v20

    .line 108
    .local v20, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v20, :cond_ce

    .line 110
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_ce

    .line 113
    .end local v10    # "issue":Lorg/w3c/dom/Node;
    .end local v20    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_ea
    return-object v21
.end method
