.class public Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "FusionLiteInsightReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
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
    .line 93
    new-instance v3, Ljava/net/URI;

    invoke-static {p0}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->removeQueryAndFragment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 95
    .local v3, "url":Ljava/net/URI;
    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 96
    .local v1, "testfile":Ljava/lang/String;
    const/16 v4, 0x2f

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 98
    const-string v4, "BenchmarkTest"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_66

    .line 99
    const-string v4, "BenchmarkTest"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "testno":Ljava/lang/String;
    const-string v4, ".html"

    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 101
    const/4 v4, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 104
    :cond_3e
    :try_start_3e
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_41
    .catch Ljava/lang/NumberFormatException; {:try_start_3e .. :try_end_41} :catch_43

    move-result v4

    .line 109
    .end local v2    # "testno":Ljava/lang/String;
    :goto_42
    return v4

    .line 105
    .restart local v2    # "testno":Ljava/lang/String;
    :catch_43
    move-exception v0

    .line 106
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

    .line 109
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "testno":Ljava/lang/String;
    :cond_66
    const/4 v4, -0x1

    goto :goto_42
.end method

.method private static removeQueryAndFragment(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 113
    move-object v1, p0

    .line 114
    .local v1, "strippedUri":Ljava/lang/String;
    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 115
    .local v0, "idx":I
    if-eq v0, v3, :cond_f

    .line 116
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 118
    :cond_f
    const/16 v2, 0x23

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 119
    if-eq v0, v3, :cond_1b

    .line 120
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 122
    :cond_1b
    return-object v1
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 30
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 41
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 43
    .local v6, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v25, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v26, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 44
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    .line 45
    .local v5, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v13, Lorg/xml/sax/InputSource;

    new-instance v25, Ljava/io/FileInputStream;

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v25

    invoke-direct {v13, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 46
    .local v13, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v5, v13}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 49
    .local v4, "doc":Lorg/w3c/dom/Document;
    new-instance v23, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v25, "Fusion Lite Insight"

    const/16 v26, 0x1

    sget-object v27, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->Hybrid:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move/from16 v2, v26

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 51
    .local v23, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v4}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v15

    .line 52
    .local v15, "root":Lorg/w3c/dom/Node;
    const-string v25, "version"

    move-object/from16 v0, v25

    invoke-static {v0, v15}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v24

    .line 53
    .local v24, "version":Ljava/lang/String;
    invoke-virtual/range {v23 .. v24}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 55
    const-string v25, "Project"

    move-object/from16 v0, v25

    invoke-static {v0, v15}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v14

    .line 56
    .local v14, "projectList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v25, "Targets"

    move-object/from16 v0, v25

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    .line 57
    .local v20, "targetsList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v25, "Target"

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v18

    .line 59
    .local v18, "targetList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v25

    :cond_67
    :goto_67
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_100

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/w3c/dom/Node;

    .line 61
    .local v16, "target":Lorg/w3c/dom/Node;
    :try_start_73
    const-string v26, "ID"

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v17

    .line 62
    .local v17, "targetID":Ljava/lang/String;
    const-string v26, "URL"

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v19

    .line 64
    .local v19, "targetURL":Ljava/lang/String;
    const-string v26, "Findings"

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v12

    .line 65
    .local v12, "findingsList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v26, "Finding"

    move-object/from16 v0, v26

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    .line 67
    .local v10, "findingList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :cond_a5
    :goto_a5
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_67

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Node;

    .line 68
    .local v8, "finding":Lorg/w3c/dom/Node;
    const-string v27, "Name"

    move-object/from16 v0, v27

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v11

    .line 69
    .local v11, "findingName":Ljava/lang/String;
    const-string v27, "CWE"

    move-object/from16 v0, v27

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 71
    .local v9, "findingCWE":I
    if-eqz v9, :cond_a5

    .line 72
    invoke-static/range {v19 .. v19}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->extractTestNumber(Ljava/lang/String;)I

    move-result v22

    .line 73
    .local v22, "testNumber":I
    const/16 v27, -0x1

    move/from16 v0, v22

    move/from16 v1, v27

    if-eq v0, v1, :cond_a5

    .line 74
    new-instance v21, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct/range {v21 .. v21}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 75
    .local v21, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 76
    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 77
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 78
    invoke-virtual/range {v21 .. v22}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 79
    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_f9
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_f9} :catch_fa

    goto :goto_a5

    .line 83
    .end local v8    # "finding":Lorg/w3c/dom/Node;
    .end local v9    # "findingCWE":I
    .end local v10    # "findingList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v11    # "findingName":Ljava/lang/String;
    .end local v12    # "findingsList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    .end local v17    # "targetID":Ljava/lang/String;
    .end local v19    # "targetURL":Ljava/lang/String;
    .end local v21    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v22    # "testNumber":I
    :catch_fa
    move-exception v7

    .line 84
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_67

    .line 87
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v16    # "target":Lorg/w3c/dom/Node;
    :cond_100
    return-object v23
.end method
