.class public Lorg/owasp/benchmark/score/parsers/AcunetixReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "AcunetixReader.java"


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
    .line 119
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 120
    :cond_8
    const/4 v0, 0x0

    .line 141
    :goto_9
    return v0

    .line 122
    :cond_a
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 141
    .local v0, "cwe":I
    goto :goto_9
.end method

.method private parseAcunetixItem(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 15
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 76
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 78
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v10, "Name"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "cat":Ljava/lang/String;
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 82
    const-string v10, "CWE"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 83
    .local v9, "vulnId":Lorg/w3c/dom/Node;
    if-eqz v9, :cond_2b

    .line 84
    const-string v10, "id"

    invoke-static {v10, v9}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "cweNum":Ljava/lang/String;
    invoke-static {v2}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->cweLookup(Ljava/lang/String;)I

    move-result v1

    .line 86
    .local v1, "cwe":I
    invoke-virtual {v5, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 92
    .end local v1    # "cwe":I
    .end local v2    # "cweNum":Ljava/lang/String;
    :cond_2b
    const-string v10, "Affects"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v8

    .line 93
    .local v8, "uri":Ljava/lang/String;
    const/16 v10, 0x20

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 94
    .local v4, "spaceIdx":I
    const/4 v10, -0x1

    if-eq v4, v10, :cond_42

    .line 95
    invoke-virtual {v8, v11, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 97
    :cond_42
    const/16 v10, 0x2f

    invoke-virtual {v8, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v8, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 98
    .local v6, "testfile":Ljava/lang/String;
    const-string v10, "?"

    invoke-virtual {v6, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_60

    .line 99
    const-string v10, "?"

    invoke-virtual {v6, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v6, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 102
    :cond_60
    const-string v10, "BenchmarkTest"

    invoke-virtual {v6, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_af

    .line 103
    const-string v10, "BenchmarkTest"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v6, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 104
    .local v7, "testno":Ljava/lang/String;
    const-string v10, ".html"

    invoke-virtual {v7, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_84

    .line 105
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x5

    invoke-virtual {v7, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 108
    :cond_84
    :try_start_84
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v5, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_8b
    .catch Ljava/lang/NumberFormatException; {:try_start_84 .. :try_end_8b} :catch_8c

    .line 114
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "testno":Ljava/lang/String;
    :goto_8b
    return-object v5

    .line 110
    .restart local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v7    # "testno":Ljava/lang/String;
    :catch_8c
    move-exception v3

    .line 111
    .local v3, "e":Ljava/lang/NumberFormatException;
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "> Parse error "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 114
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v7    # "testno":Ljava/lang/String;
    :cond_af
    const/4 v5, 0x0

    goto :goto_8b
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 13
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v7, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v8, "Acunetix WVS"

    const/4 v9, 0x1

    sget-object v10, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v7, v8, v9, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 30
    .local v7, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v8, "Scan"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v5

    .line 47
    .local v5, "scan":Lorg/w3c/dom/Node;
    const-string v8, "ScanTime"

    invoke-static {v8, v5}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "duration":Ljava/lang/String;
    invoke-virtual {v7, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 50
    const-string v8, "ReportItems"

    invoke-static {v8, v5}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 51
    .local v4, "issues":Lorg/w3c/dom/Node;
    const-string v8, "ReportItem"

    invoke-static {v8, v4}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v3

    .line 53
    .local v3, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2d
    :goto_2d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_48

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Node;

    .line 55
    .local v2, "issue":Lorg/w3c/dom/Node;
    :try_start_39
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->parseAcunetixItem(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v6

    .line 56
    .local v6, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v6, :cond_2d

    .line 57
    invoke-virtual {v7, v6}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_42} :catch_43

    goto :goto_2d

    .line 60
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_43
    move-exception v1

    .line 61
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2d

    .line 64
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "issue":Lorg/w3c/dom/Node;
    :cond_48
    return-object v7
.end method
