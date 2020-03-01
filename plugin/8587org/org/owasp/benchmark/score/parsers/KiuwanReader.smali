.class public Lorg/owasp/benchmark/score/parsers/KiuwanReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "KiuwanReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private fixCWE(Ljava/lang/String;)I
    .registers 4
    .param p1, "cweNumber"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 126
    .local v0, "cwe":I
    const/16 v1, 0x234

    if-ne v0, v1, :cond_a

    const/16 v0, 0x59

    .line 127
    :cond_a
    const/16 v1, 0x4d

    if-ne v0, v1, :cond_10

    const/16 v0, 0x4e

    .line 128
    :cond_10
    return v0
.end method

.method private parseKiuwanFinding(Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 15
    .param p1, "finding"    # Lorg/json/JSONObject;

    .prologue
    .line 82
    :try_start_0
    new-instance v8, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 83
    .local v8, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v11, "staticDetails"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 84
    .local v7, "staticDetails":Lorg/json/JSONObject;
    const-string v11, "dataFlow"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 85
    .local v1, "dataFlow":Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v11

    add-int/lit8 v6, v11, -0x1

    .line 86
    .local v6, "propagationPathLength":I
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "file"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "filename":Ljava/lang/String;
    const/16 v11, 0x2f

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    invoke-virtual {v3, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 88
    const-string v11, "BenchmarkTest"

    invoke-virtual {v3, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_92

    .line 89
    const-string v11, "BenchmarkTest"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x5

    invoke-virtual {v3, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 90
    .local v9, "testNumber":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v8, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4c} :catch_9b

    .line 92
    const/4 v0, -0x1

    .line 94
    .local v0, "cwe":I
    :try_start_4d
    const-string v11, "mappings"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 95
    .local v5, "mappings":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_54
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v4, v11, :cond_7a

    .line 96
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "mappingType"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 97
    .local v10, "val":Ljava/lang/String;
    const-string v11, "CWE"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_93

    .line 99
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "value"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v11}, Lorg/owasp/benchmark/score/parsers/KiuwanReader;->fixCWE(Ljava/lang/String;)I
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_79} :catch_96

    move-result v0

    .line 108
    .end local v4    # "i":I
    .end local v5    # "mappings":Lorg/json/JSONArray;
    .end local v10    # "val":Ljava/lang/String;
    :cond_7a
    :goto_7a
    const/4 v11, -0x1

    if-eq v0, v11, :cond_92

    .line 110
    :try_start_7d
    invoke-virtual {v8, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 111
    const-string v11, "summary"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 112
    const-string v11, "scannerDetail"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 120
    .end local v0    # "cwe":I
    .end local v1    # "dataFlow":Lorg/json/JSONArray;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v6    # "propagationPathLength":I
    .end local v7    # "staticDetails":Lorg/json/JSONObject;
    .end local v8    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v9    # "testNumber":Ljava/lang/String;
    :cond_92
    :goto_92
    return-object v8

    .line 95
    .restart local v0    # "cwe":I
    .restart local v1    # "dataFlow":Lorg/json/JSONArray;
    .restart local v3    # "filename":Ljava/lang/String;
    .restart local v4    # "i":I
    .restart local v5    # "mappings":Lorg/json/JSONArray;
    .restart local v6    # "propagationPathLength":I
    .restart local v7    # "staticDetails":Lorg/json/JSONObject;
    .restart local v8    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v9    # "testNumber":Ljava/lang/String;
    .restart local v10    # "val":Ljava/lang/String;
    :cond_93
    add-int/lit8 v4, v4, 0x1

    goto :goto_54

    .line 104
    .end local v4    # "i":I
    .end local v5    # "mappings":Lorg/json/JSONArray;
    .end local v10    # "val":Ljava/lang/String;
    :catch_96
    move-exception v2

    .line 105
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_9a} :catch_9b

    goto :goto_7a

    .line 117
    .end local v0    # "cwe":I
    .end local v1    # "dataFlow":Lorg/json/JSONArray;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v6    # "propagationPathLength":I
    .end local v7    # "staticDetails":Lorg/json/JSONObject;
    .end local v8    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v9    # "testNumber":Ljava/lang/String;
    :catch_9b
    move-exception v2

    .line 118
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 120
    const/4 v8, 0x0

    goto :goto_92
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 15
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/String;

    invoke-static {v11, v12}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v11

    invoke-static {v11}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v11

    invoke-direct {v1, v11}, Ljava/lang/String;-><init>([B)V

    .line 40
    .local v1, "content":Ljava/lang/String;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 43
    .local v7, "obj":Lorg/json/JSONObject;
    const-string v11, "findings"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 44
    .local v4, "findings":Lorg/json/JSONArray;
    const-string v11, "metadata"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 46
    .local v6, "metadata":Lorg/json/JSONObject;
    const-string v11, "source"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 48
    .local v8, "source":Ljava/lang/String;
    new-instance v10, Lorg/owasp/benchmark/score/parsers/TestResults;

    const/4 v11, 0x1

    sget-object v12, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v10, v8, v11, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 51
    .local v10, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    if-eqz v6, :cond_40

    .line 52
    const-string v11, "Kiuwan-AnalysisDuration"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "analysisDuration":Ljava/lang/String;
    if-eqz v0, :cond_40

    .line 54
    invoke-virtual {v10, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 59
    .end local v0    # "analysisDuration":Ljava/lang/String;
    :cond_40
    if-eqz v6, :cond_4d

    .line 60
    const-string v11, "Kiuwan-EngineVersion"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "engineVersion":Ljava/lang/String;
    if-eqz v2, :cond_4d

    .line 62
    invoke-virtual {v10, v2}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 67
    .end local v2    # "engineVersion":Ljava/lang/String;
    :cond_4d
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4e
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v5, v11, :cond_64

    .line 69
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 71
    .local v3, "finding":Lorg/json/JSONObject;
    invoke-direct {p0, v3}, Lorg/owasp/benchmark/score/parsers/KiuwanReader;->parseKiuwanFinding(Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v9

    .line 72
    .local v9, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v9, :cond_61

    .line 73
    invoke-virtual {v10, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 67
    :cond_61
    add-int/lit8 v5, v5, 0x1

    goto :goto_4e

    .line 77
    .end local v3    # "finding":Lorg/json/JSONObject;
    .end local v9    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_64
    return-object v10
.end method
