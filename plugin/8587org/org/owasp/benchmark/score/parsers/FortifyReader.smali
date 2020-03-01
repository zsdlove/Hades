.class public Lorg/owasp/benchmark/score/parsers/FortifyReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "FortifyReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/Node;)I
    .registers 12
    .param p0, "vtype"    # Ljava/lang/String;
    .param p1, "subtype"    # Ljava/lang/String;
    .param p2, "unifiedNode"    # Lorg/w3c/dom/Node;

    .prologue
    const/16 v3, 0x14a

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 127
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_160

    :cond_d
    move v8, v5

    :goto_e
    packed-switch v8, :pswitch_data_19a

    move v3, v4

    .line 211
    :cond_12
    :goto_12
    :pswitch_12
    return v3

    .line 127
    :sswitch_13
    const-string v8, "Command Injection"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    move v8, v4

    goto :goto_e

    :sswitch_1d
    const-string v8, "Cookie Security"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    move v8, v6

    goto :goto_e

    :sswitch_27
    const-string v8, "Cross-Site Scripting"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    move v8, v7

    goto :goto_e

    :sswitch_31
    const-string v8, "Header Manipulation"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/4 v8, 0x3

    goto :goto_e

    :sswitch_3b
    const-string v8, "Insecure Randomness"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/4 v8, 0x4

    goto :goto_e

    :sswitch_45
    const-string v8, "LDAP Injection"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/4 v8, 0x5

    goto :goto_e

    :sswitch_4f
    const-string v8, "Obsolete"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/4 v8, 0x6

    goto :goto_e

    :sswitch_59
    const-string v8, "Password Management"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/4 v8, 0x7

    goto :goto_e

    :sswitch_63
    const-string v8, "Path Manipulation"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/16 v8, 0x8

    goto :goto_e

    :sswitch_6e
    const-string v8, "SQL Injection"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/16 v8, 0x9

    goto :goto_e

    :sswitch_79
    const-string v8, "Trust Boundary Violation"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/16 v8, 0xa

    goto :goto_e

    :sswitch_84
    const-string v8, "Weak Cryptographic Hash"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/16 v8, 0xb

    goto :goto_e

    :sswitch_8f
    const-string v8, "Weak Encryption"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/16 v8, 0xc

    goto/16 :goto_e

    :sswitch_9b
    const-string v8, "XPath Injection"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    const/16 v8, 0xd

    goto/16 :goto_e

    .line 130
    :pswitch_a7
    const/16 v3, 0x4e

    goto/16 :goto_12

    .line 134
    :pswitch_ab
    const-string v3, "Cookie not Sent Over SSL"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b7

    const/16 v3, 0x266

    goto/16 :goto_12

    .line 138
    :cond_b7
    :pswitch_b7
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v3

    packed-switch v3, :pswitch_data_1ba

    :cond_be
    :goto_be
    packed-switch v5, :pswitch_data_1c0

    .line 142
    const/16 v3, 0x4f

    goto/16 :goto_12

    .line 138
    :pswitch_c5
    const-string v3, "Poor Validation"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_be

    move v5, v4

    goto :goto_be

    .line 140
    :pswitch_cf
    const/16 v3, 0x53

    goto/16 :goto_12

    .line 147
    :pswitch_d3
    const/16 v3, 0x71

    goto/16 :goto_12

    .line 151
    :pswitch_d7
    const/16 v3, 0x5a

    goto/16 :goto_12

    .line 160
    :pswitch_db
    const-string v5, "Deprecated by ESAPI"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_111

    .line 161
    const-string v5, "ReplacementDefinitions"

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 162
    .local v2, "rd":Lorg/w3c/dom/Node;
    const-string v5, "Def"

    const-string v6, "PrimaryCall.name"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 163
    .local v0, "def":Lorg/w3c/dom/Node;
    const-string v5, "value"

    invoke-static {v5, v0}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 166
    .local v1, "methodName":Ljava/lang/String;
    const-string v5, "random()"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_12

    if-eqz v1, :cond_111

    const-string v5, "next"

    .line 170
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_12

    .end local v0    # "def":Lorg/w3c/dom/Node;
    .end local v1    # "methodName":Ljava/lang/String;
    .end local v2    # "rd":Lorg/w3c/dom/Node;
    :cond_111
    :pswitch_111
    move v3, v4

    .line 178
    goto/16 :goto_12

    .line 179
    :pswitch_114
    const/16 v3, 0x16

    goto/16 :goto_12

    .line 186
    :pswitch_118
    const/16 v3, 0x59

    goto/16 :goto_12

    .line 188
    :pswitch_11c
    const/16 v3, 0x1f5

    goto/16 :goto_12

    .line 192
    :pswitch_120
    const/16 v3, 0x148

    goto/16 :goto_12

    .line 196
    :pswitch_124
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_1c6

    :cond_12b
    move v3, v5

    :goto_12c
    packed-switch v3, :pswitch_data_1d4

    .line 204
    const/16 v3, 0x147

    goto/16 :goto_12

    .line 196
    :sswitch_133
    const-string v3, "Missing Required Step"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12b

    move v3, v4

    goto :goto_12c

    :sswitch_13d
    const-string v3, "Inadequate RSA Padding"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12b

    move v3, v6

    goto :goto_12c

    :sswitch_147
    const-string v3, "Insecure Mode of Operation"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12b

    move v3, v7

    goto :goto_12c

    .line 198
    :pswitch_151
    const/16 v3, 0x145

    goto/16 :goto_12

    .line 199
    :pswitch_155
    const/16 v3, 0x30c

    goto/16 :goto_12

    :pswitch_159
    move v3, v4

    .line 202
    goto/16 :goto_12

    .line 207
    :pswitch_15c
    const/16 v3, 0x283

    goto/16 :goto_12

    .line 127
    :sswitch_data_160
    .sparse-switch
        -0x54e0c8a2 -> :sswitch_3b
        -0x342d0db0 -> :sswitch_31
        -0x2872c048 -> :sswitch_63
        -0x216cf70c -> :sswitch_9b
        -0x1aa06518 -> :sswitch_59
        -0x130bd469 -> :sswitch_79
        -0xefd1482 -> :sswitch_45
        -0x9c97ed5 -> :sswitch_8f
        0x45ffcc5 -> :sswitch_6e
        0x969244f -> :sswitch_84
        0x192ba9b9 -> :sswitch_4f
        0x25c892eb -> :sswitch_27
        0x3caa3a02 -> :sswitch_13
        0x4d68d97c -> :sswitch_1d
    .end sparse-switch

    :pswitch_data_19a
    .packed-switch 0x0
        :pswitch_a7
        :pswitch_ab
        :pswitch_b7
        :pswitch_d3
        :pswitch_12
        :pswitch_d7
        :pswitch_db
        :pswitch_111
        :pswitch_114
        :pswitch_118
        :pswitch_11c
        :pswitch_120
        :pswitch_124
        :pswitch_15c
    .end packed-switch

    .line 138
    :pswitch_data_1ba
    .packed-switch -0x13896cc9
        :pswitch_c5
    .end packed-switch

    :pswitch_data_1c0
    .packed-switch 0x0
        :pswitch_cf
    .end packed-switch

    .line 196
    :sswitch_data_1c6
    .sparse-switch
        -0x690d08a9 -> :sswitch_147
        0x4d1d7553 -> :sswitch_133
        0x4f382322 -> :sswitch_13d
    .end sparse-switch

    :pswitch_data_1d4
    .packed-switch 0x0
        :pswitch_151
        :pswitch_155
        :pswitch_159
    .end packed-switch
.end method

.method public static parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 25
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v7

    .line 39
    .local v7, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v21, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v22, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v7, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 40
    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v6

    .line 41
    .local v6, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v10, Lorg/xml/sax/InputSource;

    new-instance v21, Ljava/io/FileInputStream;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v21

    invoke-direct {v10, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 42
    .local v10, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v6, v10}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 44
    .local v5, "doc":Lorg/w3c/dom/Document;
    new-instance v17, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v21, "Fortify"

    const/16 v22, 0x1

    sget-object v23, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 48
    .local v17, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setFortifyTime(Ljava/io/File;)V

    .line 52
    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v11

    .line 57
    .local v11, "root":Lorg/w3c/dom/Node;
    const-string v21, "Build"

    move-object/from16 v0, v21

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 58
    .local v4, "build":Lorg/w3c/dom/Node;
    const-string v21, "SourceBasePath"

    move-object/from16 v0, v21

    invoke-static {v0, v4}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v15

    .line 59
    .local v15, "source":Ljava/lang/String;
    const-string v21, "ronq"

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v21

    if-eqz v21, :cond_81

    .line 60
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v17 .. v17}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "-OnDemand"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    .line 64
    :cond_81
    const-string v21, "EngineData"

    move-object/from16 v0, v21

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 65
    .local v8, "eData":Lorg/w3c/dom/Node;
    const-string v21, "EngineVersion"

    move-object/from16 v0, v21

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v18

    .line 66
    .local v18, "version":Ljava/lang/String;
    const-string v21, "RulePacks"

    move-object/from16 v0, v21

    invoke-static {v0, v8}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v14

    .line 67
    .local v14, "rps":Lorg/w3c/dom/Node;
    const-string v21, "RulePack"

    move-object/from16 v0, v21

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v13

    .line 68
    .local v13, "rp":Lorg/w3c/dom/Node;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "-rp"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "Version"

    move-object/from16 v0, v22

    invoke-static {v0, v13}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 69
    invoke-virtual/range {v17 .. v18}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 71
    invoke-interface {v11}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v12

    .line 72
    .local v12, "rootList":Lorg/w3c/dom/NodeList;
    const-string v21, "Vulnerabilities"

    move-object/from16 v0, v21

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v19

    .line 74
    .local v19, "vulnList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v21, "Vulnerability"

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    .line 77
    .local v20, "vulns":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_e9
    :goto_e9
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_103

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/w3c/dom/Node;

    .line 78
    .local v9, "flaw":Lorg/w3c/dom/Node;
    invoke-static {v9}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->parseFortifyVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v16

    .line 79
    .local v16, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v16, :cond_e9

    .line 80
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_e9

    .line 85
    .end local v9    # "flaw":Lorg/w3c/dom/Node;
    .end local v16    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_103
    return-object v17
.end method

.method private static parseFortifyVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 16
    .param p0, "vuln"    # Lorg/w3c/dom/Node;

    .prologue
    .line 89
    new-instance v7, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 91
    .local v7, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v13, "ClassInfo"

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 92
    .local v1, "ci":Lorg/w3c/dom/Node;
    const-string v13, "Type"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 93
    .local v9, "type":Lorg/w3c/dom/Node;
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v12

    .line 94
    .local v12, "vulnType":Ljava/lang/String;
    invoke-virtual {v7, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 97
    const-string v13, "AnalysisInfo"

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 98
    .local v0, "ai":Lorg/w3c/dom/Node;
    const-string v13, "Unified"

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v10

    .line 100
    .local v10, "un":Lorg/w3c/dom/Node;
    const-string v13, "Subtype"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v5

    .line 101
    .local v5, "subtype":Lorg/w3c/dom/Node;
    const-string v11, ""

    .line 102
    .local v11, "vulnSubType":Ljava/lang/String;
    if-eqz v5, :cond_46

    .line 103
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v11

    .line 105
    :cond_46
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "::"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 107
    invoke-static {v12, v11, v10}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->cweLookup(Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/Node;)I

    move-result v13

    invoke-virtual {v7, v13}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 109
    const-string v13, "Context"

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 110
    .local v2, "co":Lorg/w3c/dom/Node;
    const-string v13, "Function"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 111
    .local v4, "fu":Lorg/w3c/dom/Node;
    const-string v13, "enclosingClass"

    invoke-static {v13, v4}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 112
    .local v6, "tc":Ljava/lang/String;
    if-eqz v6, :cond_ab

    const-string v13, "BenchmarkTest"

    invoke-virtual {v6, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_ab

    .line 113
    const-string v13, "BenchmarkTest"

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v6, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 114
    const/16 v13, 0x24

    invoke-virtual {v6, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 115
    .local v3, "dollar":I
    const/4 v13, -0x1

    if-eq v3, v13, :cond_a3

    .line 116
    const/4 v13, 0x0

    invoke-virtual {v6, v13, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 118
    :cond_a3
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 119
    .local v8, "tn":I
    invoke-virtual {v7, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 122
    .end local v3    # "dollar":I
    .end local v7    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v8    # "tn":I
    :goto_aa
    return-object v7

    .restart local v7    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_ab
    const/4 v7, 0x0

    goto :goto_aa
.end method
