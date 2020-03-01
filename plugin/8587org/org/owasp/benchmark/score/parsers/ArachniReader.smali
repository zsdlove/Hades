.class public Lorg/owasp/benchmark/score/parsers/ArachniReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "ArachniReader.java"


# instance fields
.field private sdf:Ljava/text/SimpleDateFormat;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    .line 119
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/ArachniReader;->sdf:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "submitted"    # Ljava/lang/String;
    .param p2, "published"    # Ljava/lang/String;

    .prologue
    .line 122
    :try_start_0
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/ArachniReader;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 123
    .local v4, "start":J
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/ArachniReader;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 124
    .local v2, "finish":J
    sub-long v6, v2, v4

    invoke-static {v6, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_19} :catch_1b

    move-result-object v1

    .line 127
    .end local v2    # "finish":J
    .end local v4    # "start":J
    :goto_1a
    return-object v1

    .line 125
    :catch_1b
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 127
    const-string v1, "Unknown"

    goto :goto_1a
.end method

.method private cweLookup(Ljava/lang/String;)I
    .registers 3
    .param p1, "orig"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private parseArachniIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 15
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 134
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 135
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v10, "cwe"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 136
    .local v3, "rule":Lorg/w3c/dom/Node;
    if-eqz v3, :cond_18

    .line 137
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->cweLookup(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 140
    :cond_18
    const-string v10, "name"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "cat":Ljava/lang/String;
    invoke-virtual {v4, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 144
    const-string v10, "severity"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "conf":Ljava/lang/String;
    invoke-virtual {v4, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 151
    const-string v10, "vector"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 152
    .local v9, "vector":Lorg/w3c/dom/Node;
    const-string v10, "url"

    invoke-static {v10, v9}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    .line 153
    .local v7, "uri":Ljava/lang/String;
    new-instance v8, Ljava/net/URI;

    invoke-direct {v8, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 154
    .local v8, "url":Ljava/net/URI;
    invoke-virtual {v8}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 155
    .local v5, "testfile":Ljava/lang/String;
    const/16 v10, 0x2f

    invoke-virtual {v5, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 157
    const-string v10, "BenchmarkTest"

    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a7

    .line 158
    const-string v10, "BenchmarkTest"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 159
    .local v6, "testno":Ljava/lang/String;
    const-string v10, ".html"

    invoke-virtual {v6, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7c

    .line 160
    const/4 v10, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x5

    invoke-virtual {v6, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 163
    :cond_7c
    :try_start_7c
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_83
    .catch Ljava/lang/NumberFormatException; {:try_start_7c .. :try_end_83} :catch_84

    .line 169
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "testno":Ljava/lang/String;
    :goto_83
    return-object v4

    .line 165
    .restart local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v6    # "testno":Ljava/lang/String;
    :catch_84
    move-exception v2

    .line 166
    .local v2, "e":Ljava/lang/NumberFormatException;
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "> Parse error "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 169
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    .end local v6    # "testno":Ljava/lang/String;
    :cond_a7
    const/4 v4, 0x0

    goto :goto_83
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 22
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 48
    .local v6, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v17, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 49
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    .line 50
    .local v5, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v8, Lorg/xml/sax/InputSource;

    new-instance v17, Ljava/io/FileInputStream;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v17

    invoke-direct {v8, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 51
    .local v8, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v5, v8}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 53
    .local v4, "doc":Lorg/w3c/dom/Document;
    new-instance v15, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v17, "Arachni"

    const/16 v18, 0x0

    sget-object v19, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v15, v0, v1, v2}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 55
    .local v15, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v4}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    .line 56
    .local v3, "arachni":Lorg/w3c/dom/Node;
    const-string v17, "version"

    move-object/from16 v0, v17

    invoke-static {v0, v3}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v16

    .line 57
    .local v16, "version":Ljava/lang/String;
    invoke-virtual/range {v15 .. v16}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 59
    const-string v17, "start_datetime"

    move-object/from16 v0, v17

    invoke-static {v0, v3}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v12

    .line 60
    .local v12, "start":Ljava/lang/String;
    const-string v17, "finish_datetime"

    move-object/from16 v0, v17

    invoke-static {v0, v3}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v13

    .line 61
    .local v13, "stop":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 63
    const-string v17, "issues"

    move-object/from16 v0, v17

    invoke-static {v0, v3}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    .line 64
    .local v11, "issues":Lorg/w3c/dom/Node;
    const-string v17, "issue"

    move-object/from16 v0, v17

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v10

    .line 66
    .local v10, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_82
    :goto_82
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_9f

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/w3c/dom/Node;

    .line 68
    .local v9, "issue":Lorg/w3c/dom/Node;
    :try_start_8e
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->parseArachniIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v14

    .line 69
    .local v14, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v14, :cond_82

    .line 71
    invoke-virtual {v15, v14}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_99} :catch_9a

    goto :goto_82

    .line 73
    .end local v14    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_9a
    move-exception v7

    .line 75
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_82

    .line 78
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v9    # "issue":Lorg/w3c/dom/Node;
    :cond_9f
    return-object v15
.end method
