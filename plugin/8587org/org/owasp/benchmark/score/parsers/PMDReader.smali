.class public Lorg/owasp/benchmark/score/parsers/PMDReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "PMDReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static figureCWE(Lorg/owasp/benchmark/score/parsers/TestCaseResult;Ljava/lang/String;)I
    .registers 7
    .param p0, "tcr"    # Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .param p1, "rule"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x16

    const/4 v2, 0x0

    const/16 v1, 0x147

    .line 94
    const/4 v3, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_ce

    :cond_d
    :goto_d
    packed-switch v3, :pswitch_data_100

    .line 108
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown category: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v0, v2

    .line 111
    :goto_29
    :pswitch_29
    return v0

    .line 94
    :sswitch_2a
    const-string v4, "??1"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    move v3, v2

    goto :goto_d

    :sswitch_34
    const-string v4, "??2"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x1

    goto :goto_d

    :sswitch_3e
    const-string v4, "??3"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x2

    goto :goto_d

    :sswitch_48
    const-string v4, "??4"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x3

    goto :goto_d

    :sswitch_52
    const-string v4, "??5"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x4

    goto :goto_d

    :sswitch_5c
    const-string v4, "??6"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x5

    goto :goto_d

    :sswitch_66
    const-string v4, "??7"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x6

    goto :goto_d

    :sswitch_70
    const-string v4, "??8"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x7

    goto :goto_d

    :sswitch_7a
    const-string v4, "??9"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0x8

    goto :goto_d

    :sswitch_85
    const-string v4, "??10"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0x9

    goto/16 :goto_d

    :sswitch_91
    const-string v4, "??11"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0xa

    goto/16 :goto_d

    :sswitch_9d
    const-string v4, "??12"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0xb

    goto/16 :goto_d

    .line 95
    :pswitch_a9
    const/16 v0, 0x266

    goto/16 :goto_29

    .line 96
    :pswitch_ad
    const/16 v0, 0x14a

    goto/16 :goto_29

    .line 97
    :pswitch_b1
    const/16 v0, 0x5a

    goto/16 :goto_29

    :pswitch_b5
    move v0, v1

    .line 100
    goto/16 :goto_29

    :pswitch_b8
    move v0, v1

    .line 101
    goto/16 :goto_29

    .line 102
    :pswitch_bb
    const/16 v0, 0x283

    goto/16 :goto_29

    .line 103
    :pswitch_bf
    const/16 v0, 0x148

    goto/16 :goto_29

    .line 104
    :pswitch_c3
    const/16 v0, 0x4e

    goto/16 :goto_29

    :pswitch_c7
    move v0, v1

    .line 105
    goto/16 :goto_29

    .line 106
    :pswitch_ca
    const/16 v0, 0x4f

    goto/16 :goto_29

    .line 94
    :sswitch_data_ce
    .sparse-switch
        0xf451 -> :sswitch_2a
        0xf452 -> :sswitch_34
        0xf453 -> :sswitch_3e
        0xf454 -> :sswitch_48
        0xf455 -> :sswitch_52
        0xf456 -> :sswitch_5c
        0xf457 -> :sswitch_66
        0xf458 -> :sswitch_70
        0xf459 -> :sswitch_7a
        0x1d95ff -> :sswitch_85
        0x1d9600 -> :sswitch_91
        0x1d9601 -> :sswitch_9d
    .end sparse-switch

    :pswitch_data_100
    .packed-switch 0x0
        :pswitch_a9
        :pswitch_ad
        :pswitch_b1
        :pswitch_29
        :pswitch_29
        :pswitch_b5
        :pswitch_b8
        :pswitch_bb
        :pswitch_bf
        :pswitch_c3
        :pswitch_c7
        :pswitch_ca
    .end packed-switch
.end method

.method private parsePMDItem(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 8
    .param p1, "n"    # Lorg/w3c/dom/Node;

    .prologue
    .line 73
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .line 74
    .local v0, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const-string v5, "class"

    invoke-interface {v0, v5}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, "test":Ljava/lang/String;
    const-string v5, "rule"

    invoke-interface {v0, v5}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "rule":Ljava/lang/String;
    const-string v5, "BenchmarkTest"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_44

    .line 78
    new-instance v2, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 80
    .local v2, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v5, "BenchmarkTest"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "testNumber":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 82
    invoke-static {v2, v1}, Lorg/owasp/benchmark/score/parsers/PMDReader;->figureCWE(Lorg/owasp/benchmark/score/parsers/TestCaseResult;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 84
    invoke-virtual {v2, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v2, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 89
    .end local v2    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v4    # "testNumber":Ljava/lang/String;
    :goto_43
    return-object v2

    :cond_44
    const/4 v2, 0x0

    goto :goto_43
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 19
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    .line 39
    .local v3, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v14, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v15, 0x1

    invoke-virtual {v3, v14, v15}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 40
    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v2

    .line 41
    .local v2, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v5, Lorg/xml/sax/InputSource;

    new-instance v14, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v14}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 42
    .local v5, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v2, v5}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 44
    .local v1, "doc":Lorg/w3c/dom/Document;
    new-instance v11, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v14, "PMD"

    const/4 v15, 0x0

    sget-object v16, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v16

    invoke-direct {v11, v14, v15, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 47
    .local v11, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 49
    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v9

    .line 50
    .local v9, "root":Lorg/w3c/dom/Node;
    const-string v14, "version"

    invoke-static {v14, v9}, Lorg/owasp/benchmark/score/parsers/PMDReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v12

    .line 51
    .local v12, "version":Ljava/lang/String;
    invoke-virtual {v11, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 53
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    .line 54
    .local v8, "nl":Lorg/w3c/dom/NodeList;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_41
    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v14

    if-ge v4, v14, :cond_7f

    .line 55
    invoke-interface {v8, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 56
    .local v7, "n":Lorg/w3c/dom/Node;
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "file"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7c

    .line 57
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v13

    .line 58
    .local v13, "vs":Lorg/w3c/dom/NodeList;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_5c
    invoke-interface {v13}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v14

    if-ge v6, v14, :cond_7c

    .line 59
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "violation"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_79

    .line 60
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/owasp/benchmark/score/parsers/PMDReader;->parsePMDItem(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v10

    .line 61
    .local v10, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v10, :cond_79

    .line 62
    invoke-virtual {v11, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 58
    .end local v10    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_79
    add-int/lit8 v6, v6, 0x1

    goto :goto_5c

    .line 54
    .end local v6    # "j":I
    .end local v13    # "vs":Lorg/w3c/dom/NodeList;
    :cond_7c
    add-int/lit8 v4, v4, 0x1

    goto :goto_41

    .line 69
    .end local v7    # "n":Lorg/w3c/dom/Node;
    :cond_7f
    return-object v11
.end method
