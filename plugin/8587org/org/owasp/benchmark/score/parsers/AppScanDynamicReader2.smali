.class public Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "AppScanDynamicReader2.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 5
    .param p0, "vtype"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x59

    const/4 v1, 0x0

    .line 127
    const/4 v2, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_106

    :cond_b
    :goto_b
    packed-switch v2, :pswitch_data_148

    .line 157
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

    .line 160
    :goto_27
    :pswitch_27
    return v0

    .line 127
    :sswitch_28
    const-string v3, "attBlindSqlInjectionStrings"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v2, v1

    goto :goto_b

    :sswitch_32
    const-string v3, "attCachedSSL"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x1

    goto :goto_b

    :sswitch_3c
    const-string v3, "attCodeInjectionInSystemCall"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x2

    goto :goto_b

    :sswitch_46
    const-string v3, "attCrossSiteScripting"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x3

    goto :goto_b

    :sswitch_50
    const-string v3, "attJSCookie"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x4

    goto :goto_b

    :sswitch_5a
    const-string v3, "attRespCookieNotSecureSSL"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x5

    goto :goto_b

    :sswitch_64
    const-string v3, "attSqlInjectionChecks"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x6

    goto :goto_b

    :sswitch_6e
    const-string v3, "attUndefinedState"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v2, 0x7

    goto :goto_b

    :sswitch_78
    const-string v3, "bodyParamsInQuery"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x8

    goto :goto_b

    :sswitch_83
    const-string v3, "ContentSecurityPolicy"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0x9

    goto/16 :goto_b

    :sswitch_8f
    const-string v3, "ContentTypeOptions"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xa

    goto/16 :goto_b

    :sswitch_9b
    const-string v3, "GETParamOverSSL"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xb

    goto/16 :goto_b

    :sswitch_a7
    const-string v3, "MHTMLXSS"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xc

    goto/16 :goto_b

    :sswitch_b3
    const-string v3, "SHA1CipherSuites"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xd

    goto/16 :goto_b

    :sswitch_bf
    const-string v3, "ShellShockCheck"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xe

    goto/16 :goto_b

    :sswitch_cb
    const-string v3, "SriSupport"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v2, 0xf

    goto/16 :goto_b

    :pswitch_d7
    move v0, v1

    .line 129
    goto/16 :goto_27

    .line 130
    :pswitch_da
    const/16 v0, 0x4e

    goto/16 :goto_27

    .line 131
    :pswitch_de
    const/16 v0, 0x4f

    goto/16 :goto_27

    :pswitch_e2
    move v0, v1

    .line 132
    goto/16 :goto_27

    .line 134
    :pswitch_e5
    const/16 v0, 0x266

    goto/16 :goto_27

    :pswitch_e9
    move v0, v1

    .line 136
    goto/16 :goto_27

    :pswitch_ec
    move v0, v1

    .line 137
    goto/16 :goto_27

    :pswitch_ef
    move v0, v1

    .line 138
    goto/16 :goto_27

    :pswitch_f2
    move v0, v1

    .line 139
    goto/16 :goto_27

    :pswitch_f5
    move v0, v1

    .line 142
    goto/16 :goto_27

    :pswitch_f8
    move v0, v1

    .line 147
    goto/16 :goto_27

    .line 151
    :pswitch_fb
    const/16 v0, 0x147

    goto/16 :goto_27

    :pswitch_ff
    move v0, v1

    .line 152
    goto/16 :goto_27

    :pswitch_102
    move v0, v1

    .line 153
    goto/16 :goto_27

    .line 127
    nop

    :sswitch_data_106
    .sparse-switch
        -0x4ccccfc0 -> :sswitch_a7
        -0x48e4424a -> :sswitch_bf
        -0x47bf03d5 -> :sswitch_b3
        -0x37f2402f -> :sswitch_46
        -0x35b0655b -> :sswitch_cb
        -0xead9152 -> :sswitch_50
        0xec95e22 -> :sswitch_6e
        0x357a61a1 -> :sswitch_9b
        0x381bb8f5 -> :sswitch_64
        0x38e8214b -> :sswitch_83
        0x4667271b -> :sswitch_3c
        0x56d549c5 -> :sswitch_28
        0x6982b3eb -> :sswitch_8f
        0x69b1dfe9 -> :sswitch_32
        0x6d18c5f7 -> :sswitch_5a
        0x7d0fb3bb -> :sswitch_78
    .end sparse-switch

    :pswitch_data_148
    .packed-switch 0x0
        :pswitch_27
        :pswitch_d7
        :pswitch_da
        :pswitch_de
        :pswitch_e2
        :pswitch_e5
        :pswitch_27
        :pswitch_e9
        :pswitch_ec
        :pswitch_ef
        :pswitch_f2
        :pswitch_f5
        :pswitch_f8
        :pswitch_fb
        :pswitch_ff
        :pswitch_102
    .end packed-switch
.end method

.method private static cweLookup(Ljava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p0, "vtype"    # Ljava/lang/String;
    .param p1, "testArea"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x59

    .line 119
    invoke-static {p0}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->cweLookup(Ljava/lang/String;)I

    move-result v0

    .line 120
    .local v0, "cwe":I
    const-string v1, "xpathi"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    if-ne v0, v2, :cond_12

    const/16 v0, 0x283

    .line 121
    :cond_12
    const-string v1, "ldapi"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    if-ne v0, v2, :cond_1e

    const/16 v0, 0x5a

    .line 123
    :cond_1e
    return v0
.end method

.method private parseTime(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/16 v8, 0x20

    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 108
    const-string v4, "\\) "

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "parts":[Ljava/lang/String;
    aget-object v4, v2, v6

    aget-object v5, v2, v6

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 110
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

    .line 111
    :cond_34
    aget-object v4, v2, v9

    aget-object v5, v2, v9

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 112
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

    .line 113
    :cond_5d
    aget-object v4, v2, v7

    aget-object v5, v2, v7

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 114
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

    .line 115
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
    const-string v26, "http://apache.org/xml/features/disallow-doctype-decl"

    const/16 v27, 0x1

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 42
    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v6

    .line 43
    .local v6, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v9, Lorg/xml/sax/InputSource;

    new-instance v26, Ljava/io/FileInputStream;

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v26

    invoke-direct {v9, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 44
    .local v9, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v6, v9}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 46
    .local v5, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v11

    .line 47
    .local v11, "root":Lorg/w3c/dom/Node;
    const-string v26, "scan-information"

    move-object/from16 v0, v26

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v12

    .line 48
    .local v12, "scanInfo":Lorg/w3c/dom/Node;
    new-instance v19, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v26, "IBM AppScan Dynamic"

    const/16 v27, 0x1

    sget-object v28, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 51
    .local v19, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v26, "product-version"

    move-object/from16 v0, v26

    invoke-static {v0, v12}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v22

    .line 53
    .local v22, "version":Lorg/w3c/dom/Node;
    if-eqz v22, :cond_65

    .line 54
    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v26

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v26

    const/16 v27, 0x0

    aget-object v26, v26, v27

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 57
    :cond_65
    const-string v26, "url-group"

    move-object/from16 v0, v26

    invoke-static {v0, v11}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 58
    .local v4, "allIssues":Lorg/w3c/dom/Node;
    const-string v26, "item"

    move-object/from16 v0, v26

    invoke-static {v0, v4}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v24

    .line 61
    .local v24, "vulnerabilities":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :cond_79
    :goto_79
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_129

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Node;

    .line 64
    .local v25, "vulnerability":Lorg/w3c/dom/Node;
    const-string v27, "issue-type"

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v10

    .line 66
    .local v10, "issueType":Ljava/lang/String;
    const-string v27, "name"

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v20

    .line 69
    .local v20, "url":Ljava/lang/String;
    const-string v27, "/"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v21

    .line 70
    .local v21, "urlElements":[Ljava/lang/String;
    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v27, v0

    add-int/lit8 v27, v27, -0x2

    aget-object v27, v21, v27

    const-string v28, "-"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v15, v27, v28

    .line 73
    .local v15, "testArea":Ljava/lang/String;
    invoke-static {v10, v15}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->cweLookup(Ljava/lang/String;Ljava/lang/String;)I

    move-result v23

    .line 78
    .local v23, "vtype":I
    const-string v27, "/"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v27

    add-int/lit8 v13, v27, 0x1

    .line 79
    .local v13, "startOfTestCase":I
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v27

    move-object/from16 v0, v20

    move/from16 v1, v27

    invoke-virtual {v0, v13, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 80
    .local v16, "testcase":Ljava/lang/String;
    const-string v27, "\\."

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v16, v27, v28

    .line 82
    const-string v27, "BenchmarkTest"

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_79

    .line 83
    const/16 v18, -0x1

    .line 84
    .local v18, "tn":I
    const-string v27, "BenchmarkTest"

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->length()I

    move-result v27

    move-object/from16 v0, v16

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v17

    .line 86
    .local v17, "testno":Ljava/lang/String;
    :try_start_104
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_107
    .catch Ljava/lang/NumberFormatException; {:try_start_104 .. :try_end_107} :catch_124

    move-result v18

    .line 94
    :goto_108
    new-instance v14, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v14}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 95
    .local v14, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    move/from16 v0, v18

    invoke-virtual {v14, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 96
    invoke-virtual {v14, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 97
    move/from16 v0, v23

    invoke-virtual {v14, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 98
    invoke-virtual {v14, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 100
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto/16 :goto_79

    .line 87
    .end local v14    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_124
    move-exception v8

    .line 88
    .local v8, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v8}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_108

    .line 103
    .end local v8    # "e":Ljava/lang/NumberFormatException;
    .end local v10    # "issueType":Ljava/lang/String;
    .end local v13    # "startOfTestCase":I
    .end local v15    # "testArea":Ljava/lang/String;
    .end local v16    # "testcase":Ljava/lang/String;
    .end local v17    # "testno":Ljava/lang/String;
    .end local v18    # "tn":I
    .end local v20    # "url":Ljava/lang/String;
    .end local v21    # "urlElements":[Ljava/lang/String;
    .end local v23    # "vtype":I
    .end local v25    # "vulnerability":Lorg/w3c/dom/Node;
    :cond_129
    return-object v19
.end method
