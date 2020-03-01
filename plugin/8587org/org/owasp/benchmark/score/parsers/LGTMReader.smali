.class public Lorg/owasp/benchmark/score/parsers/LGTMReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "LGTMReader.java"


# static fields
.field private static final LGTMCWEPREFIX:Ljava/lang/String; = "external/cwe/cwe-"

.field private static final LGTMCWEPREFIXLENGTH:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 87
    const-string v0, "external/cwe/cwe-"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lorg/owasp/benchmark/score/parsers/LGTMReader;->LGTMCWEPREFIXLENGTH:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private parseLGTMFinding(Lorg/json/JSONObject;Ljava/util/HashMap;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 15
    .param p1, "finding"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lorg/owasp/benchmark/score/parsers/TestCaseResult;"
        }
    .end annotation

    .prologue
    .local p2, "rulesUsed":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v8, 0x0

    .line 120
    :try_start_1
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 121
    .local v6, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const/4 v3, 0x0

    .line 122
    .local v3, "filename":Ljava/lang/String;
    const-string v9, "locations"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 123
    .local v4, "locations":Lorg/json/JSONArray;
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "physicalLocation"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "artifactLocation"

    .line 124
    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "uri"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 125
    const/16 v9, 0x2f

    invoke-virtual {v3, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 126
    const-string v9, "BenchmarkTest"

    invoke-virtual {v3, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5e

    .line 127
    const-string v9, "BenchmarkTest"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x5

    invoke-virtual {v3, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 128
    .local v7, "testNumber":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v6, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 129
    const-string v9, "ruleId"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 130
    .local v5, "ruleId":Ljava/lang/String;
    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 132
    .local v1, "cweForRule":Ljava/lang/Integer;
    if-nez v1, :cond_5f

    move-object v6, v8

    .line 147
    .end local v1    # "cweForRule":Ljava/lang/Integer;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v4    # "locations":Lorg/json/JSONArray;
    .end local v5    # "ruleId":Ljava/lang/String;
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "testNumber":Ljava/lang/String;
    :cond_5e
    :goto_5e
    return-object v6

    .line 135
    .restart local v1    # "cweForRule":Ljava/lang/Integer;
    .restart local v3    # "filename":Ljava/lang/String;
    .restart local v4    # "locations":Lorg/json/JSONArray;
    .restart local v5    # "ruleId":Ljava/lang/String;
    .restart local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v7    # "testNumber":Ljava/lang/String;
    :cond_5f
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_7e

    .line 136
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unexpectedly found more than one location for finding against rule: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 138
    :cond_7e
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 139
    .local v0, "cwe":I
    invoke-virtual {v6, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 141
    const-string v9, "message"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "text"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V
    :try_end_94
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_94} :catch_95

    goto :goto_5e

    .line 144
    .end local v0    # "cwe":I
    .end local v1    # "cweForRule":Ljava/lang/Integer;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v4    # "locations":Lorg/json/JSONArray;
    .end local v5    # "ruleId":Ljava/lang/String;
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "testNumber":Ljava/lang/String;
    :catch_95
    move-exception v2

    .line 145
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v6, v8

    .line 147
    goto :goto_5e
.end method

.method private parseLGTMRules(Lorg/json/JSONArray;)Ljava/util/HashMap;
    .registers 12
    .param p1, "rulesJSON"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 92
    .local v5, "rulesUsed":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_6
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_51

    .line 94
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 97
    .local v3, "ruleJSON":Lorg/json/JSONObject;
    :try_start_10
    const-string v8, "name"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 98
    .local v4, "ruleName":Ljava/lang/String;
    const-string v8, "properties"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "tags"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 99
    .local v6, "tags":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_23
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v1, v8, :cond_46

    .line 100
    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 101
    .local v7, "val":Ljava/lang/String;
    const-string v8, "external/cwe/cwe-"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_49

    .line 104
    sget v8, Lorg/owasp/benchmark/score/parsers/LGTMReader;->LGTMCWEPREFIXLENGTH:I

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v4, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_46} :catch_4c

    .line 92
    .end local v1    # "i":I
    .end local v4    # "ruleName":Ljava/lang/String;
    .end local v6    # "tags":Lorg/json/JSONArray;
    .end local v7    # "val":Ljava/lang/String;
    :cond_46
    :goto_46
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 99
    .restart local v1    # "i":I
    .restart local v4    # "ruleName":Ljava/lang/String;
    .restart local v6    # "tags":Lorg/json/JSONArray;
    .restart local v7    # "val":Ljava/lang/String;
    :cond_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 111
    .end local v1    # "i":I
    .end local v4    # "ruleName":Ljava/lang/String;
    .end local v6    # "tags":Lorg/json/JSONArray;
    .end local v7    # "val":Ljava/lang/String;
    :catch_4c
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_46

    .line 115
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v3    # "ruleJSON":Lorg/json/JSONObject;
    :cond_51
    return-object v5
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 20
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v1, Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v15

    invoke-static {v15}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v15

    invoke-direct {v1, v15}, Ljava/lang/String;-><init>([B)V

    .line 39
    .local v1, "content":Ljava/lang/String;
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 42
    .local v5, "obj":Lorg/json/JSONObject;
    const-string v15, "runs"

    invoke-virtual {v5, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 44
    .local v11, "runs":Lorg/json/JSONArray;
    new-instance v14, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v15, "LGTM"

    const/16 v16, 0x1

    sget-object v17, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct/range {v14 .. v17}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 46
    .local v14, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 49
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_35
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v3, v15, :cond_b9

    .line 52
    invoke-virtual {v11, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 53
    .local v10, "run":Lorg/json/JSONObject;
    const-string v15, "properties"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 54
    .local v6, "properties":Lorg/json/JSONObject;
    const-string v15, "semmle.sourceLanguage"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 57
    .local v12, "sourceLang":Ljava/lang/String;
    const-string v15, "java"

    invoke-virtual {v15, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_b5

    .line 60
    const-string v15, "tool"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    const-string v16, "driver"

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 61
    .local v2, "driver":Lorg/json/JSONObject;
    const-string v15, "version"

    invoke-virtual {v2, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 64
    const-string v15, "rules"

    invoke-virtual {v2, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 65
    .local v8, "rules":Lorg/json/JSONArray;
    sget-object v15, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Found: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " rules."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 66
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/owasp/benchmark/score/parsers/LGTMReader;->parseLGTMRules(Lorg/json/JSONArray;)Ljava/util/HashMap;

    move-result-object v9

    .line 70
    .local v9, "rulesUsed":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v15, "results"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 73
    .local v7, "results":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_9d
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v4, v15, :cond_b5

    .line 75
    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v9}, Lorg/owasp/benchmark/score/parsers/LGTMReader;->parseLGTMFinding(Lorg/json/JSONObject;Ljava/util/HashMap;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v13

    .line 76
    .local v13, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v13, :cond_b2

    .line 77
    invoke-virtual {v14, v13}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 73
    :cond_b2
    add-int/lit8 v4, v4, 0x1

    goto :goto_9d

    .line 49
    .end local v2    # "driver":Lorg/json/JSONObject;
    .end local v4    # "j":I
    .end local v7    # "results":Lorg/json/JSONArray;
    .end local v8    # "rules":Lorg/json/JSONArray;
    .end local v9    # "rulesUsed":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v13    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_b5
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_35

    .line 83
    .end local v6    # "properties":Lorg/json/JSONObject;
    .end local v10    # "run":Lorg/json/JSONObject;
    .end local v12    # "sourceLang":Ljava/lang/String;
    :cond_b9
    return-object v14
.end method
