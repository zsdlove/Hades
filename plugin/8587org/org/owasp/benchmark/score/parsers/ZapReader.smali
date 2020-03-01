.class public Lorg/owasp/benchmark/score/parsers/ZapReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "ZapReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private addIssue(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;ILjava/lang/String;I)V
    .registers 9
    .param p1, "alertData"    # Lorg/w3c/dom/Node;
    .param p2, "tr"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p3, "cwe"    # I
    .param p4, "category"    # Ljava/lang/String;
    .param p5, "confidence"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 135
    const-string v2, "uri"

    invoke-static {v2, p1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/owasp/benchmark/score/parsers/ZapReader;->extractTestNumber(Ljava/lang/String;)I

    move-result v1

    .line 136
    .local v1, "testNumber":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_18

    .line 137
    invoke-static {p3, p4, p5, v1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->createTestCaseResult(ILjava/lang/String;II)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v0

    .line 139
    .local v0, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {p2, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 141
    .end local v0    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_18
    return-void
.end method

.method private static createTestCaseResult(ILjava/lang/String;II)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 6
    .param p0, "cwe"    # I
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "confidence"    # I
    .param p3, "testNumber"    # I

    .prologue
    .line 179
    new-instance v0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 180
    .local v0, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const/4 v1, -0x1

    if-eq p0, v1, :cond_b

    .line 181
    invoke-virtual {v0, p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 183
    :cond_b
    invoke-virtual {v0, p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 184
    invoke-virtual {v0, p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 185
    invoke-virtual {v0, p2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 186
    invoke-virtual {v0, p3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 187
    return-object v0
.end method

.method private cweLookup(Ljava/lang/String;)I
    .registers 3
    .param p1, "orig"    # Ljava/lang/String;

    .prologue
    .line 192
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 195
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private static extractTestNumber(Ljava/lang/String;)I
    .registers 8
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 146
    new-instance v3, Ljava/net/URI;

    invoke-static {p0}, Lorg/owasp/benchmark/score/parsers/ZapReader;->removeQueryAndFragment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 148
    .local v3, "url":Ljava/net/URI;
    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "testfile":Ljava/lang/String;
    const/16 v4, 0x2f

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 151
    const-string v4, "BenchmarkTest"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_66

    .line 152
    const-string v4, "BenchmarkTest"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "testno":Ljava/lang/String;
    const-string v4, ".html"

    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 154
    const/4 v4, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 157
    :cond_3e
    :try_start_3e
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_41
    .catch Ljava/lang/NumberFormatException; {:try_start_3e .. :try_end_41} :catch_43

    move-result v4

    .line 162
    .end local v2    # "testno":Ljava/lang/String;
    :goto_42
    return v4

    .line 158
    .restart local v2    # "testno":Ljava/lang/String;
    :catch_43
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "> Parse error "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 162
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "testno":Ljava/lang/String;
    :cond_66
    const/4 v4, -0x1

    goto :goto_42
.end method

.method private parseAndAddZapIssues(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    .registers 13
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .param p2, "tr"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 112
    const/4 v3, -0x1

    .line 113
    .local v3, "cwe":I
    const-string v0, "cweid"

    invoke-static {v0, p1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 114
    .local v8, "rule":Lorg/w3c/dom/Node;
    if-eqz v8, :cond_11

    .line 115
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/ZapReader;->cweLookup(Ljava/lang/String;)I

    move-result v3

    .line 118
    :cond_11
    const-string v0, "alert"

    invoke-static {v0, p1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v4

    .line 120
    .local v4, "cat":Ljava/lang/String;
    const-string v0, "confidence"

    invoke-static {v0, p1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 122
    .local v5, "conf":I
    const-string v0, "instances"

    invoke-static {v0, p1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 123
    .local v7, "instances":Lorg/w3c/dom/Node;
    if-nez v7, :cond_38

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 124
    invoke-direct/range {v0 .. v5}, Lorg/owasp/benchmark/score/parsers/ZapReader;->addIssue(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;ILjava/lang/String;I)V

    .line 132
    :cond_37
    return-void

    .line 128
    :cond_38
    const-string v0, "instance"

    invoke-static {v0, v7}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v6

    .line 129
    .local v6, "instanceList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_42
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    .local v1, "instance":Lorg/w3c/dom/Node;
    move-object v0, p0

    move-object v2, p2

    .line 130
    invoke-direct/range {v0 .. v5}, Lorg/owasp/benchmark/score/parsers/ZapReader;->addIssue(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;ILjava/lang/String;I)V

    goto :goto_42
.end method

.method private static removeQueryAndFragment(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 166
    move-object v1, p0

    .line 167
    .local v1, "strippedUri":Ljava/lang/String;
    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 168
    .local v0, "idx":I
    if-eq v0, v3, :cond_f

    .line 169
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 171
    :cond_f
    const/16 v2, 0x23

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 172
    if-eq v0, v3, :cond_1b

    .line 173
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 175
    :cond_1b
    return-object v1
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 18
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    .line 40
    .local v4, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v13, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v14, 0x1

    invoke-virtual {v4, v13, v14}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 41
    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v3

    .line 42
    .local v3, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v7, Lorg/xml/sax/InputSource;

    new-instance v13, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v13, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v13}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 43
    .local v7, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v3, v7}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 45
    .local v2, "doc":Lorg/w3c/dom/Document;
    new-instance v10, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v13, "OWASP ZAP"

    const/4 v14, 0x0

    sget-object v15, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v10, v13, v14, v15}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 48
    .local v10, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 50
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v12

    .line 51
    .local v12, "zap":Lorg/w3c/dom/Node;
    const-string v13, "version"

    invoke-static {v13, v12}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v11

    .line 52
    .local v11, "version":Ljava/lang/String;
    invoke-virtual {v10, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 54
    const-string v13, "site"

    invoke-static {v13, v12}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v9

    .line 55
    .local v9, "siteList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v13, "alerts"

    invoke-static {v13, v9}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 56
    .local v1, "alertsList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v13, "alertitem"

    invoke-static {v13, v1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    .line 58
    .local v8, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_50
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_67

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Node;

    .line 60
    .local v6, "flaw":Lorg/w3c/dom/Node;
    :try_start_5c
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v10}, Lorg/owasp/benchmark/score/parsers/ZapReader;->parseAndAddZapIssues(Lorg/w3c/dom/Node;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_61} :catch_62

    goto :goto_50

    .line 61
    :catch_62
    move-exception v5

    .line 63
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_50

    .line 66
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v6    # "flaw":Lorg/w3c/dom/Node;
    :cond_67
    return-object v10
.end method
