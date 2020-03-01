.class public Lorg/owasp/benchmark/score/parsers/FaastReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "FaastReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private getCategory(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 66
    const-string v0, "benchmark/"

    .line 67
    .local v0, "flag":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int v2, v3, v4

    .line 68
    .local v2, "locator_start":I
    const-string v3, "/BenchmarkTest"

    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 69
    .local v1, "locator_end":I
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private getTestCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 73
    const-string v1, "BenchmarkTest"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const-string v2, "BenchmarkTest"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int v0, v1, v2

    .line 74
    .local v0, "locator":I
    add-int/lit8 v1, v0, 0x5

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private parseFaastFinding(Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 18
    .param p1, "finding"    # Lorg/json/JSONObject;

    .prologue
    .line 27
    new-instance v10, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 28
    .local v10, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v12, ""

    .line 29
    .local v12, "url":Ljava/lang/String;
    const/4 v2, 0x0

    .line 30
    .local v2, "cwe":I
    const-string v11, ""

    .line 31
    .local v11, "testNumber":Ljava/lang/String;
    const-string v1, ""

    .line 32
    .local v1, "category":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_14
    :goto_14
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_84

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .local v7, "o":Ljava/lang/Object;
    move-object v5, v7

    .line 34
    check-cast v5, Ljava/lang/String;

    .line 35
    .local v5, "key":Ljava/lang/String;
    const-string v13, "CWE"

    invoke-virtual {v5, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_36

    .line 36
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_14

    .line 37
    :cond_36
    const-string v13, "Resources"

    invoke-virtual {v5, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_14

    .line 38
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONArray;

    .line 39
    .local v9, "res_obj":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_47
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v3, v13, :cond_14

    .line 41
    invoke-virtual {v9, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 42
    .local v4, "jsonResObj":Lorg/json/JSONObject;
    invoke-virtual {v4}, Lorg/json/JSONObject;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_59
    :goto_59
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_81

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "res_json":Ljava/lang/Object;
    move-object v6, v8

    .line 43
    check-cast v6, Ljava/lang/String;

    .line 44
    .local v6, "keyres":Ljava/lang/String;
    const-string v15, "Value"

    invoke-virtual {v6, v15}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_59

    .line 45
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "url":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 46
    .restart local v12    # "url":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/owasp/benchmark/score/parsers/FaastReader;->getTestCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 47
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/owasp/benchmark/score/parsers/FaastReader;->getCategory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_59

    .line 39
    .end local v6    # "keyres":Ljava/lang/String;
    .end local v8    # "res_json":Ljava/lang/Object;
    :cond_81
    add-int/lit8 v3, v3, 0x1

    goto :goto_47

    .line 54
    .end local v3    # "i":I
    .end local v4    # "jsonResObj":Lorg/json/JSONObject;
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "o":Ljava/lang/Object;
    .end local v9    # "res_obj":Lorg/json/JSONArray;
    :cond_84
    const-string v13, "BenchmarkTest"

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_9a

    .line 55
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v10, v13}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 56
    invoke-virtual {v10, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 57
    invoke-virtual {v10, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 60
    .end local v10    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :goto_99
    return-object v10

    .restart local v10    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_9a
    const/4 v10, 0x0

    goto :goto_99
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 10
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 14
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/String;

    invoke-static {v5, v6}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v5

    invoke-static {v5}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/String;-><init>([B)V

    .line 15
    .local v0, "content":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 16
    .local v2, "obj":Lorg/json/JSONArray;
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v5, "Faast - Telefonica Cyber Security"

    const/4 v6, 0x1

    sget-object v7, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v4, v5, v6, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 17
    .local v4, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-virtual {v4, p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 18
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_27
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_3b

    .line 19
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/owasp/benchmark/score/parsers/FaastReader;->parseFaastFinding(Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v3

    .line 20
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v4, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 18
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 22
    .end local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_3b
    return-object v4
.end method
