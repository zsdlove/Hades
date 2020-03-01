.class public Lorg/owasp/benchmark/score/parsers/ParasoftReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "ParasoftReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private cweLookup(Ljava/lang/String;)I
    .registers 4
    .param p1, "cat"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 148
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_68

    :cond_8
    move v1, v0

    :goto_9
    packed-switch v1, :pswitch_data_86

    .line 174
    :goto_c
    return v0

    .line 148
    :sswitch_d
    const-string v1, "BD.SECURITY.TDCMD"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x0

    goto :goto_9

    :sswitch_17
    const-string v1, "BD.SECURITY.TDFNAMES"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v1, "BD.SECURITY.TDLDAP"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v1, "BD.SECURITY.TDSQL"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v1, "BD.SECURITY.TDXPATH"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v1, "BD.SECURITY.TDXSS"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_49
    const-string v1, "SECURITY.WSC.SRD"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x6

    goto :goto_9

    .line 151
    :pswitch_53
    const/16 v0, 0x4e

    goto :goto_c

    .line 152
    :pswitch_56
    const/16 v0, 0x16

    goto :goto_c

    .line 153
    :pswitch_59
    const/16 v0, 0x5a

    goto :goto_c

    .line 156
    :pswitch_5c
    const/16 v0, 0x59

    goto :goto_c

    .line 157
    :pswitch_5f
    const/16 v0, 0x283

    goto :goto_c

    .line 158
    :pswitch_62
    const/16 v0, 0x4f

    goto :goto_c

    .line 168
    :pswitch_65
    const/16 v0, 0x14a

    goto :goto_c

    .line 148
    :sswitch_data_68
    .sparse-switch
        -0x7cc73475 -> :sswitch_35
        -0x3af2deac -> :sswitch_17
        -0x2d566127 -> :sswitch_21
        0x27d3cba8 -> :sswitch_d
        0x27d4083c -> :sswitch_2b
        0x27d41b46 -> :sswitch_3f
        0x7f19e790 -> :sswitch_49
    .end sparse-switch

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_53
        :pswitch_56
        :pswitch_59
        :pswitch_5c
        :pswitch_5f
        :pswitch_62
        :pswitch_65
    .end packed-switch
.end method

.method private parseFlowViol(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 11
    .param p1, "flaw"    # Lorg/w3c/dom/Node;

    .prologue
    .line 122
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 123
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v7, "rule"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "cat":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->cweLookup(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 126
    const-string v7, "rule"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 127
    .local v2, "rule":Ljava/lang/String;
    invoke-virtual {v4, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 129
    const-string v7, "sev"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 130
    .local v3, "severity":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 132
    const-string v7, "msg"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {v4, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 135
    const-string v7, "locFile"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    .line 136
    .local v5, "testcase":Ljava/lang/String;
    const/16 v7, 0x2f

    invoke-virtual {v5, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 137
    const-string v7, "BenchmarkTest"

    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_63

    .line 138
    const-string v7, "BenchmarkTest"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x5

    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 139
    .local v6, "testno":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 142
    .end local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "testno":Ljava/lang/String;
    :goto_62
    return-object v4

    .restart local v4    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_63
    const/4 v4, 0x0

    goto :goto_62
.end method

.method private parseStdViol(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 10
    .param p1, "flaw"    # Lorg/w3c/dom/Node;

    .prologue
    .line 86
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 87
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v6, "cat"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "cat":Ljava/lang/String;
    if-nez v0, :cond_21

    .line 89
    const-string v6, "rule"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 90
    .local v2, "rule":Ljava/lang/String;
    const/16 v6, 0x2e

    invoke-virtual {v2, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 91
    .local v1, "idx":I
    const/4 v6, -0x1

    if-eq v1, v6, :cond_21

    .line 92
    const/4 v6, 0x0

    invoke-virtual {v2, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 96
    .end local v1    # "idx":I
    .end local v2    # "rule":Ljava/lang/String;
    :cond_21
    if-eqz v0, :cond_79

    .line 97
    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->cweLookup(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 98
    const-string v6, "rule"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 99
    const-string v6, "sev"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 100
    const-string v6, "msg"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 102
    const-string v6, "locFile"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    .line 103
    .local v4, "testcase":Ljava/lang/String;
    const/16 v6, 0x2f

    invoke-virtual {v4, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 104
    const-string v6, "BenchmarkTest"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_79

    .line 105
    const-string v6, "BenchmarkTest"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x5

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 106
    .local v5, "testno":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 110
    .end local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v4    # "testcase":Ljava/lang/String;
    .end local v5    # "testno":Ljava/lang/String;
    :goto_78
    return-object v3

    .restart local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_79
    const/4 v3, 0x0

    goto :goto_78
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 25
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 39
    .local v6, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v20, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v21, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 40
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    .line 41
    .local v5, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v9, Lorg/xml/sax/InputSource;

    new-instance v20, Ljava/io/FileInputStream;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v20

    invoke-direct {v9, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 42
    .local v9, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v5, v9}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 44
    .local v4, "doc":Lorg/w3c/dom/Document;
    new-instance v17, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v20, "Parasoft Jtest"

    const/16 v21, 0x1

    sget-object v22, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 46
    .local v17, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v4}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v10

    .line 49
    .local v10, "root":Lorg/w3c/dom/Node;
    const-string v20, "toolVer"

    move-object/from16 v0, v20

    invoke-static {v0, v10}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v18

    .line 50
    .local v18, "version":Ljava/lang/String;
    invoke-virtual/range {v17 .. v18}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 52
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v11

    .line 53
    .local v11, "rootList":Lorg/w3c/dom/NodeList;
    const-string v20, "CodingStandards"

    move-object/from16 v0, v20

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v14

    .line 54
    .local v14, "stds":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-interface {v14, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Node;

    .line 55
    .local v12, "std":Lorg/w3c/dom/Node;
    const-string v20, "time"

    move-object/from16 v0, v20

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v16

    .line 56
    .local v16, "time":Ljava/lang/String;
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 58
    const-string v20, "StdViols"

    move-object/from16 v0, v20

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v19

    .line 60
    .local v19, "viols":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v20, "StdViol"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v13

    .line 62
    .local v13, "stdList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v20, "FlowViol"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    .line 64
    .local v8, "flowList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_8e
    :goto_8e
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_a8

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Node;

    .line 65
    .local v7, "flaw":Lorg/w3c/dom/Node;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->parseStdViol(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v15

    .line 66
    .local v15, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v15, :cond_8e

    .line 67
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_8e

    .line 71
    .end local v7    # "flaw":Lorg/w3c/dom/Node;
    .end local v15    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_a8
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_ac
    :goto_ac
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_c6

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Node;

    .line 72
    .restart local v7    # "flaw":Lorg/w3c/dom/Node;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->parseFlowViol(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v15

    .line 73
    .restart local v15    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v15, :cond_ac

    .line 74
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_ac

    .line 77
    .end local v7    # "flaw":Lorg/w3c/dom/Node;
    .end local v15    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_c6
    return-object v17
.end method
