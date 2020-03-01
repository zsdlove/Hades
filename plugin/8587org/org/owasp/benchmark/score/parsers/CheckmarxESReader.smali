.class public Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "CheckmarxESReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private isIrrelevant(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    const-string v0, "Dynamic_SQL_Queries"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Heuristic_2nd_Order_SQL_Injection"

    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Heuristic_SQL_Injection"

    .line 70
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Second_Order_SQL_Injection"

    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Blind_SQL_Injections"

    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Improper_Build_Of_Sql_Mapping"

    .line 73
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "SQL_Injection_Evasion_Attack"

    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_SQL_Injection"

    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Client_Side_Injection"

    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "GWT_DOM_XSS"

    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "GWT_Reflected_XSS"

    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Heuristic_CGI_Stored_XSS"

    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Heuristic_Stored_XSS"

    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Stored_XSS"

    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Suspected_XSS"

    .line 82
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "UTF7_XSS"

    .line 83
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "CGI_Stored_XSS"

    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_GWT_Reflected_XSS"

    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_I_Reflected_XSS_All_Clients"

    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_IO_Reflected_XSS_All_Clients"

    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_O_Reflected_XSS_All_ClientsS"

    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_Stored_XSS"

    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Potential_UTF7_XSS"

    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "Stored_Command_Injection"

    .line 91
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    const-string v0, "CGI_Reflected_XSS_All_Clients"

    .line 92
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ca

    :cond_c8
    const/4 v0, 0x1

    .line 68
    :goto_c9
    return v0

    .line 92
    :cond_ca
    const/4 v0, 0x0

    goto :goto_c9
.end method

.method private parseCheckmarxFindings(ILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 14
    .param p1, "cwe"    # I
    .param p2, "category"    # Ljava/lang/String;
    .param p3, "evidence"    # Ljava/lang/String;
    .param p4, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 108
    :try_start_0
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 109
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v4, p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 110
    invoke-virtual {v4, p2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 111
    invoke-virtual {v4, p3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 115
    const-string v7, "Nodes"

    invoke-virtual {p4, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 116
    .local v2, "nodes":Lorg/json/JSONArray;
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "FileName"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 117
    .local v3, "resultFileName":Ljava/lang/String;
    const/16 v7, 0x5c

    invoke-virtual {v3, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 118
    .local v6, "testcaseName":Ljava/lang/String;
    const-string v7, "BenchmarkTest"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_56

    .line 119
    const-string v7, "BenchmarkTest"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x5

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_42} :catch_50

    move-result-object v5

    .line 121
    .local v5, "testNo":Ljava/lang/String;
    :try_start_43
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_4a
    .catch Ljava/lang/NumberFormatException; {:try_start_43 .. :try_end_4a} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_4a} :catch_50

    .line 147
    .end local v2    # "nodes":Lorg/json/JSONArray;
    .end local v3    # "resultFileName":Ljava/lang/String;
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v5    # "testNo":Ljava/lang/String;
    .end local v6    # "testcaseName":Ljava/lang/String;
    :goto_4a
    return-object v4

    .line 122
    .restart local v2    # "nodes":Lorg/json/JSONArray;
    .restart local v3    # "resultFileName":Ljava/lang/String;
    .restart local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v5    # "testNo":Ljava/lang/String;
    .restart local v6    # "testcaseName":Ljava/lang/String;
    :catch_4b
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_4c
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_50

    goto :goto_4a

    .line 143
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "nodes":Lorg/json/JSONArray;
    .end local v3    # "resultFileName":Ljava/lang/String;
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v5    # "testNo":Ljava/lang/String;
    .end local v6    # "testcaseName":Ljava/lang/String;
    :catch_50
    move-exception v1

    .line 144
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 147
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_54
    const/4 v4, 0x0

    goto :goto_4a

    .line 129
    .restart local v2    # "nodes":Lorg/json/JSONArray;
    .restart local v3    # "resultFileName":Ljava/lang/String;
    .restart local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v6    # "testcaseName":Ljava/lang/String;
    :cond_56
    :try_start_56
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "FileName"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 130
    const/16 v7, 0x5c

    invoke-virtual {v3, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 131
    const-string v7, "BenchmarkTest"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_54

    .line 132
    const-string v7, "BenchmarkTest"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x5

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_89} :catch_50

    move-result-object v5

    .line 134
    .restart local v5    # "testNo":Ljava/lang/String;
    :try_start_8a
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_91
    .catch Ljava/lang/NumberFormatException; {:try_start_8a .. :try_end_91} :catch_92
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_91} :catch_50

    goto :goto_4a

    .line 135
    :catch_92
    move-exception v0

    .line 136
    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    :try_start_93
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_96} :catch_50

    goto :goto_4a
.end method

.method private translate(I)I
    .registers 2
    .param p1, "cwe"    # I

    .prologue
    .line 96
    sparse-switch p1, :sswitch_data_e

    .line 103
    .end local p1    # "cwe":I
    :goto_3
    return p1

    .line 97
    .restart local p1    # "cwe":I
    :sswitch_4
    const/16 p1, 0x4e

    goto :goto_3

    .line 100
    :sswitch_7
    const/16 p1, 0x16

    goto :goto_3

    .line 101
    :sswitch_a
    const/16 p1, 0x14a

    goto :goto_3

    .line 96
    nop

    :sswitch_data_e
    .sparse-switch
        0x17 -> :sswitch_7
        0x24 -> :sswitch_7
        0x4d -> :sswitch_4
        0x152 -> :sswitch_a
    .end sparse-switch
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 25
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    new-instance v18, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v20, "Checkmarx SAST"

    const/16 v21, 0x1

    sget-object v22, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 15
    .local v18, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    new-instance v5, Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v20 .. v21}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    .line 17
    .local v5, "content":Ljava/lang/String;
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .local v12, "obj":Lorg/json/JSONObject;
    const-string v20, "EngineVersion"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 21
    .local v19, "version":Ljava/lang/String;
    const-string v20, "\\."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 22
    .local v13, "parts":[Ljava/lang/String;
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v21, 0x0

    aget-object v21, v13, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x1

    aget-object v21, v13, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x2

    aget-object v21, v13, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 23
    invoke-virtual/range {v18 .. v19}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 26
    const-string v20, "ScanDuration"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 28
    const-string v11, "Queries"

    .line 29
    .local v11, "key":Ljava/lang/String;
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    .line 31
    .local v14, "queries":Lorg/json/JSONArray;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_87
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v9, v0, :cond_108

    .line 33
    invoke-virtual {v14, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    .line 36
    .local v15, "query":Lorg/json/JSONObject;
    const-string v20, "Metadata"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "CweId"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 38
    .local v6, "cwe":I
    :try_start_a1
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;->translate(I)I
    :try_end_a6
    .catch Ljava/lang/NumberFormatException; {:try_start_a1 .. :try_end_a6} :catch_c0

    move-result v6

    .line 45
    :goto_a7
    const-string v20, "Metadata"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "QueryName"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 46
    .local v4, "category":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;->isIrrelevant(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_dc

    .line 31
    :cond_bd
    add-int/lit8 v9, v9, 0x1

    goto :goto_87

    .line 40
    .end local v4    # "category":Ljava/lang/String;
    :catch_c0
    move-exception v8

    .line 41
    .local v8, "ex":Ljava/lang/NumberFormatException;
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "flaw: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_a7

    .line 50
    .end local v8    # "ex":Ljava/lang/NumberFormatException;
    .restart local v4    # "category":Ljava/lang/String;
    :cond_dc
    move-object v7, v4

    .line 53
    .local v7, "evidence":Ljava/lang/String;
    const-string v20, "Results"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v16

    .line 54
    .local v16, "results":Lorg/json/JSONArray;
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_e6
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v10, v0, :cond_bd

    .line 55
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v6, v4, v7, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;->parseCheckmarxFindings(ILjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v17

    .line 56
    .local v17, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v17, :cond_105

    .line 57
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 54
    :cond_105
    add-int/lit8 v10, v10, 0x1

    goto :goto_e6

    .line 64
    .end local v4    # "category":Ljava/lang/String;
    .end local v6    # "cwe":I
    .end local v7    # "evidence":Ljava/lang/String;
    .end local v10    # "j":I
    .end local v15    # "query":Lorg/json/JSONObject;
    .end local v16    # "results":Lorg/json/JSONArray;
    .end local v17    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_108
    return-object v18
.end method
