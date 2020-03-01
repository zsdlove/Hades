.class public Lorg/owasp/benchmark/score/parsers/VeracodeReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "VeracodeReader.java"


# instance fields
.field private sdf:Ljava/text/SimpleDateFormat;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    .line 79
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss zzz"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->sdf:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "submitted"    # Ljava/lang/String;
    .param p2, "published"    # Ljava/lang/String;

    .prologue
    .line 82
    :try_start_0
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 83
    .local v4, "start":J
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 84
    .local v2, "finish":J
    sub-long v6, v2, v4

    invoke-static {v6, v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_19} :catch_1b

    move-result-object v1

    .line 86
    .end local v2    # "finish":J
    .end local v4    # "start":J
    :goto_1a
    return-object v1

    .line 85
    :catch_1b
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unknown"

    goto :goto_1a
.end method

.method private parseVeracodeVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 9
    .param p1, "flaw"    # Lorg/w3c/dom/Node;

    .prologue
    .line 91
    new-instance v1, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 110
    .local v1, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v4, "cweid"

    invoke-static {v4, p1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "cwe":Ljava/lang/String;
    if-eqz v0, :cond_5d

    .line 112
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-direct {p0, v4}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->translate(I)I

    move-result v4

    invoke-virtual {v1, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 117
    :goto_18
    const-string v4, "categoryname"

    invoke-static {v4, p1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 119
    const-string v4, "exploitLevel"

    invoke-static {v4, p1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 121
    const-string v4, "categoryname"

    invoke-static {v4, p1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 123
    const-string v4, "sourcefile"

    invoke-static {v4, p1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "testcase":Ljava/lang/String;
    const-string v4, "BenchmarkTest"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_76

    .line 125
    const-string v4, "BenchmarkTest"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 126
    .local v3, "testno":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 130
    .end local v1    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v3    # "testno":Ljava/lang/String;
    :goto_5c
    return-object v1

    .line 114
    .end local v2    # "testcase":Ljava/lang/String;
    .restart local v1    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_5d
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "flaw: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_18

    .line 130
    .restart local v2    # "testcase":Ljava/lang/String;
    :cond_76
    const/4 v1, 0x0

    goto :goto_5c
.end method

.method private translate(I)I
    .registers 3
    .param p1, "cwe"    # I

    .prologue
    .line 134
    const/16 v0, 0x49

    if-ne p1, v0, :cond_7

    const/16 p1, 0x16

    .line 138
    .end local p1    # "cwe":I
    :cond_6
    :goto_6
    return p1

    .line 135
    .restart local p1    # "cwe":I
    :cond_7
    const/16 v0, 0x50

    if-ne p1, v0, :cond_e

    const/16 p1, 0x4f

    goto :goto_6

    .line 136
    :cond_e
    const/16 v0, 0x14b

    if-ne p1, v0, :cond_15

    const/16 p1, 0x14a

    goto :goto_6

    .line 137
    :cond_15
    const/16 v0, 0x5b

    if-ne p1, v0, :cond_6

    const/16 p1, 0x283

    goto :goto_6
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 28
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v8

    .line 40
    .local v8, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v23, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v24, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v8, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 41
    invoke-virtual {v8}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v7

    .line 42
    .local v7, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v11, Lorg/xml/sax/InputSource;

    new-instance v23, Ljava/io/FileInputStream;

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v23

    invoke-direct {v11, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 43
    .local v11, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v7, v11}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v6

    .line 45
    .local v6, "doc":Lorg/w3c/dom/Document;
    new-instance v21, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v23, "Veracode SAST"

    const/16 v24, 0x1

    sget-object v25, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move/from16 v2, v24

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 48
    .local v21, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v6}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v13

    .line 49
    .local v13, "root":Lorg/w3c/dom/Node;
    invoke-interface {v13}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    .line 50
    .local v14, "rootList":Lorg/w3c/dom/NodeList;
    const-string v23, "static-analysis"

    move-object/from16 v0, v23

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v15

    .line 51
    .local v15, "sa":Lorg/w3c/dom/Node;
    const-string v23, "engine_version"

    move-object/from16 v0, v23

    invoke-static {v0, v15}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v22

    .line 52
    .local v22, "version":Ljava/lang/String;
    invoke-virtual/range {v21 .. v22}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 53
    const-string v23, "submitted_date"

    move-object/from16 v0, v23

    invoke-static {v0, v15}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v18

    .line 54
    .local v18, "submitted":Ljava/lang/String;
    const-string v23, "published_date"

    move-object/from16 v0, v23

    invoke-static {v0, v15}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v12

    .line 55
    .local v12, "published":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v12}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->calculateTime(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 56
    .local v20, "time":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 58
    const-string v23, "severity"

    move-object/from16 v0, v23

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v16

    .line 60
    .local v16, "sevList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v23, "category"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 62
    .local v4, "catList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v23, "cwe"

    move-object/from16 v0, v23

    invoke-static {v0, v4}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    .line 64
    .local v5, "cweList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v23, "staticflaws"

    move-object/from16 v0, v23

    invoke-static {v0, v5}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v17

    .line 66
    .local v17, "statList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v23, "flaw"

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    .line 68
    .local v10, "flawList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_a4
    :goto_a4
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_c0

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/w3c/dom/Node;

    .line 69
    .local v9, "flaw":Lorg/w3c/dom/Node;
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->parseVeracodeVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v19

    .line 70
    .local v19, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v19, :cond_a4

    .line 71
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_a4

    .line 74
    .end local v9    # "flaw":Lorg/w3c/dom/Node;
    .end local v19    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_c0
    return-object v21
.end method
