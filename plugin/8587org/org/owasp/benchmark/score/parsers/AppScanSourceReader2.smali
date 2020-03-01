.class public Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "AppScanSourceReader2.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 6
    .param p0, "vtype"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x1f6

    const/16 v0, 0x4f

    const/4 v1, 0x0

    .line 132
    const/4 v3, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_ee

    :cond_d
    :goto_d
    packed-switch v3, :pswitch_data_128

    .line 160
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Identified unknown type of: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v0, v1

    .line 163
    :goto_29
    :pswitch_29
    return v0

    .line 132
    :sswitch_2a
    const-string v4, "CrossSiteScripting"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    move v3, v1

    goto :goto_d

    :sswitch_34
    const-string v4, "Cryptography.InsecureAlgorithm"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x1

    goto :goto_d

    :sswitch_3e
    const-string v4, "Cryptography.PoorEntropy"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x2

    goto :goto_d

    :sswitch_48
    const-string v4, "Injection.HttpResponseSplitting"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x3

    goto :goto_d

    :sswitch_52
    const-string v4, "Injection.LDAP"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x4

    goto :goto_d

    :sswitch_5c
    const-string v4, "Injection.OS"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x5

    goto :goto_d

    :sswitch_66
    const-string v4, "Injection.SQL"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x6

    goto :goto_d

    :sswitch_70
    const-string v4, "Injection.XPath"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/4 v3, 0x7

    goto :goto_d

    :sswitch_7a
    const-string v4, "OpenSource"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0x8

    goto :goto_d

    :sswitch_85
    const-string v4, "PathTraversal"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0x9

    goto/16 :goto_d

    :sswitch_91
    const-string v4, "SessionManagement.Cookies"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0xa

    goto/16 :goto_d

    :sswitch_9d
    const-string v4, "Validation.EncodingRequired"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0xb

    goto/16 :goto_d

    :sswitch_a9
    const-string v4, "Validation.Required"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0xc

    goto/16 :goto_d

    :sswitch_b5
    const-string v4, "Validation.Required.WriteToStream"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const/16 v3, 0xd

    goto/16 :goto_d

    .line 137
    :pswitch_c1
    const/16 v0, 0x147

    goto/16 :goto_29

    .line 138
    :pswitch_c5
    const/16 v0, 0x14a

    goto/16 :goto_29

    .line 143
    :pswitch_c9
    const/16 v0, 0x71

    goto/16 :goto_29

    .line 144
    :pswitch_cd
    const/16 v0, 0x5a

    goto/16 :goto_29

    .line 145
    :pswitch_d1
    const/16 v0, 0x4e

    goto/16 :goto_29

    .line 146
    :pswitch_d5
    const/16 v0, 0x59

    goto/16 :goto_29

    .line 147
    :pswitch_d9
    const/16 v0, 0x283

    goto/16 :goto_29

    :pswitch_dd
    move v0, v1

    .line 150
    goto/16 :goto_29

    .line 151
    :pswitch_e0
    const/16 v0, 0x16

    goto/16 :goto_29

    .line 154
    :pswitch_e4
    const/16 v0, 0x266

    goto/16 :goto_29

    :pswitch_e8
    move v0, v2

    .line 157
    goto/16 :goto_29

    :pswitch_eb
    move v0, v2

    .line 158
    goto/16 :goto_29

    .line 132
    :sswitch_data_ee
    .sparse-switch
        -0x78019d8f -> :sswitch_34
        -0x74ac08db -> :sswitch_7a
        -0x58f4735a -> :sswitch_70
        -0x52b49d19 -> :sswitch_9d
        -0x50c77185 -> :sswitch_5c
        -0x3cb2b182 -> :sswitch_52
        -0x2470b490 -> :sswitch_2a
        -0x1cae0840 -> :sswitch_b5
        -0x18ffe813 -> :sswitch_3e
        -0x142fd207 -> :sswitch_85
        0x189ad4da -> :sswitch_91
        0x206b7974 -> :sswitch_a9
        0x2a2bac08 -> :sswitch_48
        0x37d94ff7 -> :sswitch_66
    .end sparse-switch

    :pswitch_data_128
    .packed-switch 0x0
        :pswitch_29
        :pswitch_c1
        :pswitch_c5
        :pswitch_c9
        :pswitch_cd
        :pswitch_d1
        :pswitch_d5
        :pswitch_d9
        :pswitch_dd
        :pswitch_e0
        :pswitch_e4
        :pswitch_29
        :pswitch_e8
        :pswitch_eb
    .end packed-switch
.end method

.method private parseTime(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/16 v8, 0x20

    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 121
    const-string v4, "\\) "

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "parts":[Ljava/lang/String;
    aget-object v4, v2, v6

    aget-object v5, v2, v6

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "hours":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, v7, :cond_34

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 124
    :cond_34
    aget-object v4, v2, v9

    aget-object v5, v2, v9

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 125
    .local v1, "mins":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, v7, :cond_5d

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 126
    :cond_5d
    aget-object v4, v2, v7

    aget-object v5, v2, v7

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 127
    .local v3, "secs":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, v7, :cond_86

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 128
    :cond_86
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 31
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v7

    .line 41
    .local v7, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v25, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v26, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v7, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 42
    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v6

    .line 43
    .local v6, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v9, Lorg/xml/sax/InputSource;

    new-instance v25, Ljava/io/FileInputStream;

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v25

    invoke-direct {v9, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 44
    .local v9, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v6, v9}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 46
    .local v5, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v14

    .line 47
    .local v14, "root":Lorg/w3c/dom/Node;
    const-string v25, "scan-information"

    move-object/from16 v0, v25

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v16

    .line 48
    .local v16, "scanInfo":Lorg/w3c/dom/Node;
    new-instance v20, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v25, "IBM AppScan Cloud"

    const/16 v26, 0x1

    sget-object v27, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    move/from16 v2, v26

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 50
    .local v20, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v25, "product-version"

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v21

    .line 52
    .local v21, "version":Lorg/w3c/dom/Node;
    invoke-interface/range {v21 .. v21}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 54
    const-string v25, "issue-group"

    move-object/from16 v0, v25

    invoke-static {v0, v14}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 55
    .local v4, "allIssues":Lorg/w3c/dom/Node;
    const-string v25, "item"

    move-object/from16 v0, v25

    invoke-static {v0, v4}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v23

    .line 58
    .local v23, "vulnerabilities":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v25

    :goto_6f
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_194

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lorg/w3c/dom/Node;

    .line 61
    .local v24, "vulnerability":Lorg/w3c/dom/Node;
    const-string v26, "ref"

    const-string v27, "issue-type"

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v10

    .line 63
    .local v10, "issueType":Ljava/lang/String;
    invoke-static {v10}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->cweLookup(Ljava/lang/String;)I

    move-result v22

    .line 67
    .local v22, "vtype":I
    const-string v26, "item"

    const-string v27, "variant-group"

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    .line 68
    .local v11, "itemNode":Lorg/w3c/dom/Node;
    const-string v26, "method-signature2"

    const-string v27, "issue-information"

    move-object/from16 v0, v27

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v13

    .line 69
    .local v13, "methodSigNode":Lorg/w3c/dom/Node;
    const/16 v19, -0x1

    .line 70
    .local v19, "tn":I
    if-eqz v13, :cond_172

    .line 72
    const-string v26, "filename"

    move-object/from16 v0, v26

    invoke-static {v0, v13}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v8

    .line 75
    .local v8, "filename":Ljava/lang/String;
    if-eqz v8, :cond_111

    .line 77
    const-string v26, "BenchmarkTest"

    move-object/from16 v0, v26

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v26

    if-eqz v26, :cond_eb

    .line 78
    const/16 v26, 0x0

    const-string v27, ":"

    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v27

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 79
    const-string v26, "BenchmarkTest"

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 80
    .local v18, "testnum":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v19

    .line 101
    .end local v8    # "filename":Ljava/lang/String;
    .end local v18    # "testnum":Ljava/lang/String;
    :cond_eb
    :goto_eb
    new-instance v17, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct/range {v17 .. v17}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 102
    .local v17, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 103
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 104
    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 105
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 113
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto/16 :goto_6f

    .line 85
    .end local v17    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v8    # "filename":Ljava/lang/String;
    :cond_111
    invoke-interface {v13}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v12

    .line 86
    .local v12, "methodSig":Ljava/lang/String;
    if-eqz v12, :cond_14e

    const-string v26, "BenchmarkTest"

    move-object/from16 v0, v26

    invoke-virtual {v12, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v26

    if-eqz v26, :cond_14e

    .line 87
    const-string v26, "BenchmarkTest"

    move-object/from16 v0, v26

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v26

    const-string v27, "BenchmarkTest"

    .line 88
    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->length()I

    move-result v27

    add-int v26, v26, v27

    .line 87
    move/from16 v0, v26

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 89
    .local v15, "s":Ljava/lang/String;
    const/16 v26, 0x0

    const-string v27, "."

    move-object/from16 v0, v27

    invoke-virtual {v15, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v27

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v15, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    .line 90
    .restart local v18    # "testnum":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v19

    .line 92
    goto :goto_eb

    .line 94
    .end local v15    # "s":Ljava/lang/String;
    .end local v18    # "testnum":Ljava/lang/String;
    :cond_14e
    if-nez v12, :cond_eb

    sget-object v26, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "itemNode: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " has no method signature2"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_eb

    .line 96
    .end local v8    # "filename":Ljava/lang/String;
    .end local v12    # "methodSig":Ljava/lang/String;
    :cond_172
    sget-object v26, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "itemNode: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " has no method signature node"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_eb

    .line 116
    .end local v10    # "issueType":Ljava/lang/String;
    .end local v11    # "itemNode":Lorg/w3c/dom/Node;
    .end local v13    # "methodSigNode":Lorg/w3c/dom/Node;
    .end local v19    # "tn":I
    .end local v22    # "vtype":I
    .end local v24    # "vulnerability":Lorg/w3c/dom/Node;
    :cond_194
    return-object v20
.end method
