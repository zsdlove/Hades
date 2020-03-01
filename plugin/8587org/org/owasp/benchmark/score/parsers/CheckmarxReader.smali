.class public Lorg/owasp/benchmark/score/parsers/CheckmarxReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "CheckmarxReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private parseCheckmarxVulnerability(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 23
    .param p1, "query"    # Lorg/w3c/dom/Node;
    .param p2, "result"    # Lorg/w3c/dom/Node;

    .prologue
    .line 77
    new-instance v12, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 88
    .local v12, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v17, "cweId"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 89
    .local v3, "cwe":Ljava/lang/String;
    if-eqz v3, :cond_12b

    .line 90
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->translate(I)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 95
    :goto_22
    const-string v17, "name"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v9

    .line 96
    .local v9, "name":Ljava/lang/String;
    invoke-virtual {v12, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 100
    const-string v17, "Dynamic_SQL_Queries"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Heuristic_2nd_Order_SQL_Injection"

    .line 101
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Heuristic_SQL_Injection"

    .line 102
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Second_Order_SQL_Injection"

    .line 103
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Blind_SQL_Injections"

    .line 104
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Improper_Build_Of_Sql_Mapping"

    .line 105
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "SQL_Injection_Evasion_Attack"

    .line 106
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_SQL_Injection"

    .line 107
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Client_Side_Injection"

    .line 108
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "GWT_DOM_XSS"

    .line 109
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "GWT_Reflected_XSS"

    .line 110
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Heuristic_CGI_Stored_XSS"

    .line 111
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Heuristic_Stored_XSS"

    .line 112
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Stored_XSS"

    .line 113
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Suspected_XSS"

    .line 114
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "UTF7_XSS"

    .line 115
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "CGI_Stored_XSS"

    .line 116
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_GWT_Reflected_XSS"

    .line 117
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_I_Reflected_XSS_All_Clients"

    .line 118
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_IO_Reflected_XSS_All_Clients"

    .line 119
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_O_Reflected_XSS_All_ClientsS"

    .line 120
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_Stored_XSS"

    .line 121
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Potential_UTF7_XSS"

    .line 122
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "Stored_Command_Injection"

    .line 123
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_129

    const-string v17, "CGI_Reflected_XSS_All_Clients"

    .line 124
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_149

    .line 125
    :cond_129
    const/4 v12, 0x0

    .line 195
    .end local v12    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :goto_12a
    return-object v12

    .line 92
    .end local v9    # "name":Ljava/lang/String;
    .restart local v12    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_12b
    sget-object v17, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "flaw: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_22

    .line 129
    .restart local v9    # "name":Ljava/lang/String;
    :cond_149
    const-string v17, "SeverityIndex"

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "SeverityIndex":Ljava/lang/String;
    if-eqz v2, :cond_20d

    const-string v17, ""

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_20d

    const/4 v7, 0x1

    .line 131
    .local v7, "isGeneratedByCxWebClient":Z
    :goto_160
    if-eqz v7, :cond_175

    .line 132
    const-string v17, "SeverityIndex"

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 135
    :cond_175
    const-string v17, "name"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 144
    const-string v17, "Path"

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v11

    .line 146
    .local v11, "paths":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v18, "PathNode"

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/w3c/dom/Node;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v10

    .line 148
    .local v10, "pathNodes":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Node;

    .line 150
    .local v8, "last":Lorg/w3c/dom/Node;
    const-string v17, "FileName"

    move-object/from16 v0, v17

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v6

    .line 151
    .local v6, "fileNames":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Node;

    .line 154
    .local v5, "fileNameNode":Lorg/w3c/dom/Node;
    const-string v17, "FileName"

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v13

    .line 156
    .local v13, "testcase":Ljava/lang/String;
    if-eqz v7, :cond_210

    .line 157
    const/16 v17, 0x2f

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 162
    :goto_1de
    const-string v17, "BenchmarkTest"

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_221

    .line 163
    const-string v17, "BenchmarkTest"

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v18

    add-int/lit8 v18, v18, -0x5

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    .line 165
    .local v15, "testno":Ljava/lang/String;
    :try_start_1fc
    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_205
    .catch Ljava/lang/NumberFormatException; {:try_start_1fc .. :try_end_205} :catch_207

    goto/16 :goto_12a

    .line 166
    :catch_207
    move-exception v4

    .line 167
    .local v4, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto/16 :goto_12a

    .line 130
    .end local v4    # "e":Ljava/lang/NumberFormatException;
    .end local v5    # "fileNameNode":Lorg/w3c/dom/Node;
    .end local v6    # "fileNames":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v7    # "isGeneratedByCxWebClient":Z
    .end local v8    # "last":Lorg/w3c/dom/Node;
    .end local v10    # "pathNodes":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v11    # "paths":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v13    # "testcase":Ljava/lang/String;
    .end local v15    # "testno":Ljava/lang/String;
    :cond_20d
    const/4 v7, 0x0

    goto/16 :goto_160

    .line 160
    .restart local v5    # "fileNameNode":Lorg/w3c/dom/Node;
    .restart local v6    # "fileNames":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .restart local v7    # "isGeneratedByCxWebClient":Z
    .restart local v8    # "last":Lorg/w3c/dom/Node;
    .restart local v10    # "pathNodes":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .restart local v11    # "paths":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .restart local v13    # "testcase":Ljava/lang/String;
    :cond_210
    const/16 v17, 0x5c

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    goto :goto_1de

    .line 174
    :cond_221
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v17

    if-nez v17, :cond_22a

    const/4 v12, 0x0

    goto/16 :goto_12a

    .line 176
    :cond_22a
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v14

    .line 178
    .local v14, "testcase2":Ljava/lang/String;
    if-eqz v7, :cond_273

    .line 179
    const/16 v17, 0x2f

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 184
    :goto_244
    const-string v17, "BenchmarkTest"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_284

    .line 185
    const-string v17, "BenchmarkTest"

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v18

    add-int/lit8 v18, v18, -0x5

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 187
    .local v16, "testno2":Ljava/lang/String;
    :try_start_262
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_26b
    .catch Ljava/lang/NumberFormatException; {:try_start_262 .. :try_end_26b} :catch_26d

    goto/16 :goto_12a

    .line 188
    :catch_26d
    move-exception v4

    .line 189
    .restart local v4    # "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto/16 :goto_12a

    .line 182
    .end local v4    # "e":Ljava/lang/NumberFormatException;
    .end local v16    # "testno2":Ljava/lang/String;
    :cond_273
    const/16 v17, 0x5c

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_244

    .line 195
    :cond_284
    const/4 v12, 0x0

    goto/16 :goto_12a
.end method

.method private translate(I)I
    .registers 3
    .param p1, "cwe"    # I

    .prologue
    const/16 v0, 0x16

    .line 199
    sparse-switch p1, :sswitch_data_10

    .line 205
    .end local p1    # "cwe":I
    :goto_5
    return p1

    .line 200
    .restart local p1    # "cwe":I
    :sswitch_6
    const/16 p1, 0x4e

    goto :goto_5

    :sswitch_9
    move p1, v0

    .line 201
    goto :goto_5

    :sswitch_b
    move p1, v0

    .line 202
    goto :goto_5

    .line 203
    :sswitch_d
    const/16 p1, 0x14a

    goto :goto_5

    .line 199
    :sswitch_data_10
    .sparse-switch
        0x17 -> :sswitch_b
        0x24 -> :sswitch_9
        0x4d -> :sswitch_6
        0x152 -> :sswitch_d
    .end sparse-switch
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 23
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v5

    .line 38
    .local v5, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v17, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 39
    invoke-virtual {v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v4

    .line 40
    .local v4, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v7, Lorg/xml/sax/InputSource;

    new-instance v17, Ljava/io/FileInputStream;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v17

    invoke-direct {v7, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 41
    .local v7, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v4, v7}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v3

    .line 43
    .local v3, "doc":Lorg/w3c/dom/Document;
    new-instance v15, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v17, "Checkmarx CxSAST"

    const/16 v18, 0x1

    sget-object v19, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v15, v0, v1, v2}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 50
    .local v15, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v3}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v12

    .line 51
    .local v12, "root":Lorg/w3c/dom/Node;
    const-string v17, "CheckmarxVersion"

    move-object/from16 v0, v17

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v16

    .line 52
    .local v16, "version":Ljava/lang/String;
    invoke-virtual/range {v15 .. v16}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 54
    const-string v17, "ScanTime"

    move-object/from16 v0, v17

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v14

    .line 55
    .local v14, "time":Ljava/lang/String;
    invoke-virtual {v15, v14}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 57
    const-string v17, "Query"

    move-object/from16 v0, v17

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v9

    .line 59
    .local v9, "queryList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_5e
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_9a

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Node;

    .line 60
    .local v8, "query":Lorg/w3c/dom/Node;
    const-string v18, "Result"

    move-object/from16 v0, v18

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v11

    .line 61
    .local v11, "resultList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_76
    :goto_76
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5e

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/w3c/dom/Node;

    .line 63
    .local v10, "result":Lorg/w3c/dom/Node;
    :try_start_82
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v10}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->parseCheckmarxVulnerability(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v13

    .line 64
    .local v13, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v13, :cond_76

    .line 65
    invoke-virtual {v15, v13}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_8d} :catch_8e

    goto :goto_76

    .line 67
    .end local v13    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_8e
    move-exception v6

    .line 68
    .local v6, "e":Ljava/lang/Exception;
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v20, ">> Error detected. Attempting to continue parsing"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_76

    .line 73
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v8    # "query":Lorg/w3c/dom/Node;
    .end local v10    # "result":Lorg/w3c/dom/Node;
    .end local v11    # "resultList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :cond_9a
    return-object v15
.end method
