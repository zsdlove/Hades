.class public Lorg/owasp/benchmark/score/parsers/NetsparkerReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "NetsparkerReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 3
    .param p0, "cweNum"    # Ljava/lang/String;

    .prologue
    .line 142
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 143
    :cond_8
    const/4 v0, 0x0

    .line 165
    :goto_9
    return v0

    .line 145
    :cond_a
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 146
    .local v0, "cwe":I
    packed-switch v0, :pswitch_data_16

    goto :goto_9

    .line 147
    :pswitch_12
    const/16 v0, 0x266

    goto :goto_9

    .line 146
    nop

    :pswitch_data_16
    .packed-switch 0x50
        :pswitch_12
    .end packed-switch
.end method

.method private parseNetsparkerIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 22
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 90
    new-instance v11, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 92
    .local v11, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v17, "type"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v14

    .line 93
    .local v14, "type":Ljava/lang/String;
    invoke-virtual {v11, v14}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 95
    const-string v17, "severity"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v10

    .line 97
    .local v10, "severity":Ljava/lang/String;
    const-string v17, "certainty"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v3

    .line 98
    .local v3, "confidence":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 100
    const-string v17, "extrainformation"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 101
    .local v8, "extra":Lorg/w3c/dom/Node;
    const-string v17, "info"

    move-object/from16 v0, v17

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 102
    .local v9, "info":Lorg/w3c/dom/Node;
    const-string v17, "name"

    move-object/from16 v0, v17

    invoke-static {v0, v9}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v7

    .line 103
    .local v7, "evidence":Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "::"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 108
    const-string v17, "classification"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 110
    .local v2, "classification":Lorg/w3c/dom/Node;
    if-eqz v2, :cond_96

    .line 111
    const-string v17, "CWE"

    move-object/from16 v0, v17

    invoke-static {v0, v2}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v16

    .line 112
    .local v16, "vulnId":Lorg/w3c/dom/Node;
    if-eqz v16, :cond_96

    .line 113
    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    .line 114
    .local v5, "cweNum":Ljava/lang/String;
    invoke-static {v5}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->cweLookup(Ljava/lang/String;)I

    move-result v4

    .line 115
    .local v4, "cwe":I
    invoke-virtual {v11, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 119
    .end local v4    # "cwe":I
    .end local v5    # "cweNum":Ljava/lang/String;
    .end local v16    # "vulnId":Lorg/w3c/dom/Node;
    :cond_96
    const-string v17, "url"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v15

    .line 120
    .local v15, "uri":Ljava/lang/String;
    const/16 v17, 0x2f

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    .line 121
    .local v12, "testfile":Ljava/lang/String;
    const-string v17, "?"

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_d0

    .line 122
    const/16 v17, 0x0

    const-string v18, "?"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 125
    :cond_d0
    const-string v17, "BenchmarkTest"

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_131

    .line 126
    const-string v17, "BenchmarkTest"

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 127
    .local v13, "testno":Ljava/lang/String;
    const-string v17, ".html"

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_100

    .line 128
    const/16 v17, 0x0

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v18

    add-int/lit8 v18, v18, -0x5

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 131
    :cond_100
    :try_start_100
    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_109
    .catch Ljava/lang/NumberFormatException; {:try_start_100 .. :try_end_109} :catch_10a

    .line 137
    .end local v11    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v13    # "testno":Ljava/lang/String;
    :goto_109
    return-object v11

    .line 133
    .restart local v11    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v13    # "testno":Ljava/lang/String;
    :catch_10a
    move-exception v6

    .line 134
    .local v6, "e":Ljava/lang/NumberFormatException;
    sget-object v17, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "> Parse error "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ":: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 137
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    .end local v13    # "testno":Ljava/lang/String;
    :cond_131
    const/4 v11, 0x0

    goto :goto_109
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 14
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v8, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v9, "Netsparker"

    const/4 v10, 0x1

    sget-object v11, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v8, v9, v10, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 31
    .local v8, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v9, "target"

    invoke-static {v9, p1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 38
    .local v6, "target":Lorg/w3c/dom/Node;
    const-string v9, "scantime"

    invoke-static {v9, v6}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "duration":Ljava/lang/String;
    :try_start_1a
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 41
    .local v4, "millis":J
    invoke-static {v4, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_25} :catch_4a

    .line 50
    .end local v4    # "millis":J
    :goto_25
    const-string v9, "vulnerability"

    invoke-static {v9, p1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v3

    .line 52
    .local v3, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2f
    :goto_2f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Node;

    .line 54
    .local v2, "issue":Lorg/w3c/dom/Node;
    :try_start_3b
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->parseNetsparkerIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v7

    .line 55
    .local v7, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v7, :cond_2f

    .line 56
    invoke-virtual {v8, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_44} :catch_45

    goto :goto_2f

    .line 59
    .end local v7    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_45
    move-exception v1

    .line 60
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2f

    .line 42
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "issue":Lorg/w3c/dom/Node;
    .end local v3    # "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :catch_4a
    move-exception v1

    .line 43
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v8, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    goto :goto_25

    .line 63
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :cond_4f
    return-object v8
.end method
