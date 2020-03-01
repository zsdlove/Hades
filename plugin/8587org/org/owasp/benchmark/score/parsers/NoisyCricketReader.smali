.class public Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "NoisyCricketReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private parseNoisyCricketIssue(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    .registers 14
    .param p1, "item"    # Lorg/w3c/dom/Node;
    .param p2, "tr"    # Lorg/owasp/benchmark/score/parsers/TestResults;

    .prologue
    .line 48
    const/4 v5, -0x1

    .line 49
    .local v5, "testNumber":I
    const-string v8, "file"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 50
    .local v6, "testcase":Ljava/lang/String;
    const-string v8, "BenchmarkTest"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_23

    .line 51
    const-string v8, "BenchmarkTest"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x2e

    invoke-virtual {v6, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 53
    .local v7, "testno":Ljava/lang/String;
    :try_start_1f
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_22
    .catch Ljava/lang/NumberFormatException; {:try_start_1f .. :try_end_22} :catch_5b

    move-result v5

    .line 59
    .end local v7    # "testno":Ljava/lang/String;
    :cond_23
    const-string v8, "cwelist"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "cwelist":Ljava/lang/String;
    const/4 v8, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_5c

    .line 62
    const-string v8, ", "

    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "cwes":[Ljava/lang/String;
    array-length v9, v2

    const/4 v8, 0x0

    :goto_42
    if-ge v8, v9, :cond_5c

    aget-object v0, v2, v8

    .line 64
    .local v0, "cwe":Ljava/lang/String;
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 65
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v4, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 66
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 67
    invoke-virtual {p2, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 63
    add-int/lit8 v8, v8, 0x1

    goto :goto_42

    .line 54
    .end local v0    # "cwe":Ljava/lang/String;
    .end local v1    # "cwelist":Ljava/lang/String;
    .end local v2    # "cwes":[Ljava/lang/String;
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v7    # "testno":Ljava/lang/String;
    :catch_5b
    move-exception v3

    .line 70
    .end local v7    # "testno":Ljava/lang/String;
    :cond_5c
    return-void
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 11
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v6, "NoisyCricket"

    const/4 v7, 0x0

    sget-object v8, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v4, v6, v7, v8}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 30
    .local v4, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v6, "1 minute"

    invoke-virtual {v4, v6}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 31
    const-string v6, "meta"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 32
    .local v3, "meta":Lorg/w3c/dom/Node;
    const-string v6, "version"

    invoke-static {v6, v3}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 34
    const-string v6, "vulnerabilities"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v5

    .line 35
    .local v5, "vulns":Lorg/w3c/dom/Node;
    const-string v6, "vulnerability"

    invoke-static {v6, v5}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v2

    .line 36
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_43

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    .line 38
    .local v1, "item":Lorg/w3c/dom/Node;
    :try_start_3a
    invoke-direct {p0, v1, v4}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->parseNoisyCricketIssue(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3d} :catch_3e

    goto :goto_2e

    .line 39
    :catch_3e
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2e

    .line 44
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "item":Lorg/w3c/dom/Node;
    :cond_43
    return-object v4
.end method
