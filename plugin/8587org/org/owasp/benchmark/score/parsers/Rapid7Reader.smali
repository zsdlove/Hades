.class public Lorg/owasp/benchmark/score/parsers/Rapid7Reader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "Rapid7Reader.java"


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
    .line 189
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 190
    :cond_8
    const/4 v0, 0x0

    .line 212
    :goto_9
    return v0

    .line 192
    :cond_a
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 193
    .local v0, "cwe":I
    packed-switch v0, :pswitch_data_16

    goto :goto_9

    .line 194
    :pswitch_12
    const/16 v0, 0x266

    goto :goto_9

    .line 193
    nop

    :pswitch_data_16
    .packed-switch 0x50
        :pswitch_12
    .end packed-switch
.end method

.method private parseRapid7Item(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 16
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 147
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 149
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v11, "VulnType"

    invoke-static {v11, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v8

    .line 150
    .local v8, "type":Ljava/lang/String;
    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 152
    const-string v11, "AttackType"

    invoke-static {v11, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v3

    .line 153
    .local v3, "evidence":Ljava/lang/String;
    invoke-virtual {v5, v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 155
    const-string v11, "CweId"

    invoke-static {v11, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    .line 156
    .local v10, "vulnId":Lorg/w3c/dom/Node;
    if-eqz v10, :cond_33

    .line 157
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v1

    .line 158
    .local v1, "cweNum":Ljava/lang/String;
    invoke-static {v1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->cweLookup(Ljava/lang/String;)I

    move-result v0

    .line 159
    .local v0, "cwe":I
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 162
    .end local v0    # "cwe":I
    .end local v1    # "cweNum":Ljava/lang/String;
    :cond_33
    const-string v11, "Url"

    invoke-static {v11, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v9

    .line 163
    .local v9, "uri":Ljava/lang/String;
    const/16 v11, 0x20

    invoke-virtual {v9, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 164
    .local v4, "spaceIdx":I
    const/4 v11, -0x1

    if-eq v4, v11, :cond_4a

    .line 165
    invoke-virtual {v9, v12, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 167
    :cond_4a
    const/16 v11, 0x2f

    invoke-virtual {v9, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v9, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 168
    .local v6, "testfile":Ljava/lang/String;
    const-string v11, "?"

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_68

    .line 169
    const-string v11, "?"

    invoke-virtual {v6, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v6, v12, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 172
    :cond_68
    const-string v11, "BenchmarkTest"

    invoke-virtual {v6, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_b7

    .line 173
    const-string v11, "BenchmarkTest"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 174
    .local v7, "testno":Ljava/lang/String;
    const-string v11, ".html"

    invoke-virtual {v7, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_8c

    .line 175
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x5

    invoke-virtual {v7, v12, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 178
    :cond_8c
    :try_start_8c
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v5, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_93
    .catch Ljava/lang/NumberFormatException; {:try_start_8c .. :try_end_93} :catch_94

    .line 184
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "testno":Ljava/lang/String;
    :goto_93
    return-object v5

    .line 180
    .restart local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v7    # "testno":Ljava/lang/String;
    :catch_94
    move-exception v2

    .line 181
    .local v2, "e":Ljava/lang/NumberFormatException;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "> Parse error "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 184
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    .end local v7    # "testno":Ljava/lang/String;
    :cond_b7
    const/4 v5, 0x0

    goto :goto_93
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
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v8, "Rapid7 AppSpider"

    const/4 v9, 0x1

    sget-object v10, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v6, v8, v9, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 48
    .local v6, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v8, "ScanDuration"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "duration":Ljava/lang/String;
    invoke-virtual {v6, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 51
    const-string v8, "AppVersion"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    .line 52
    .local v7, "version":Ljava/lang/String;
    invoke-virtual {v6, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 54
    const-string v8, "VulnList"

    invoke-static {v8, p1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 55
    .local v4, "issues":Lorg/w3c/dom/Node;
    const-string v8, "Vuln"

    invoke-static {v8, v4}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v3

    .line 57
    .local v3, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_34
    :goto_34
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_81

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Node;

    .line 59
    .local v2, "issue":Lorg/w3c/dom/Node;
    :try_start_40
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->parseRapid7Item(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v5

    .line 60
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v5, :cond_34

    .line 61
    invoke-virtual {v6, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 62
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getNumber()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getEvidence()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_7b} :catch_7c

    goto :goto_34

    .line 64
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_7c
    move-exception v1

    .line 65
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_34

    .line 68
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "issue":Lorg/w3c/dom/Node;
    :cond_81
    return-object v6
.end method
