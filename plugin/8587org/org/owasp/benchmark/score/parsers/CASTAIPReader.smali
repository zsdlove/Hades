.class public Lorg/owasp/benchmark/score/parsers/CASTAIPReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "CASTAIPReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x283

    const/16 v1, 0x16

    const/4 v2, 0x0

    .line 117
    if-eqz p0, :cond_d

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_f

    :cond_d
    move v0, v2

    .line 143
    :goto_e
    :pswitch_e
    return v0

    .line 120
    :cond_f
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/4 v3, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_d4

    :cond_1b
    :goto_1b
    packed-switch v3, :pswitch_data_102

    .line 141
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No matching CWE # found in CAST AIP Reader for: \'CWE-"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v0, v2

    .line 143
    goto :goto_e

    .line 120
    :sswitch_3e
    const-string v5, "614"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    move v3, v2

    goto :goto_1b

    :sswitch_48
    const-string v5, "78"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x1

    goto :goto_1b

    :sswitch_52
    const-string v5, "79"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x2

    goto :goto_1b

    :sswitch_5c
    const-string v5, "89"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x3

    goto :goto_1b

    :sswitch_66
    const-string v5, "90"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x4

    goto :goto_1b

    :sswitch_70
    const-string v5, "91"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x5

    goto :goto_1b

    :sswitch_7a
    const-string v5, "73"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x6

    goto :goto_1b

    :sswitch_84
    const-string v5, "501"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/4 v3, 0x7

    goto :goto_1b

    :sswitch_8e
    const-string v5, "134"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/16 v3, 0x8

    goto :goto_1b

    :sswitch_99
    const-string v5, "22"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/16 v3, 0x9

    goto/16 :goto_1b

    :sswitch_a5
    const-string v5, "643"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const/16 v3, 0xa

    goto/16 :goto_1b

    .line 121
    :pswitch_b1
    const/16 v0, 0x266

    goto/16 :goto_e

    .line 122
    :pswitch_b5
    const/16 v0, 0x4e

    goto/16 :goto_e

    .line 123
    :pswitch_b9
    const/16 v0, 0x4f

    goto/16 :goto_e

    .line 124
    :pswitch_bd
    const/16 v0, 0x59

    goto/16 :goto_e

    .line 125
    :pswitch_c1
    const/16 v0, 0x5a

    goto/16 :goto_e

    :pswitch_c5
    move v0, v1

    .line 132
    goto/16 :goto_e

    .line 136
    :pswitch_c8
    const/16 v0, 0x1f5

    goto/16 :goto_e

    .line 138
    :pswitch_cc
    const/16 v0, 0x86

    goto/16 :goto_e

    :pswitch_d0
    move v0, v1

    .line 139
    goto/16 :goto_e

    .line 120
    nop

    :sswitch_data_d4
    .sparse-switch
        0x640 -> :sswitch_99
        0x6dc -> :sswitch_7a
        0x6e1 -> :sswitch_48
        0x6e2 -> :sswitch_52
        0x701 -> :sswitch_5c
        0x717 -> :sswitch_66
        0x718 -> :sswitch_70
        0xbe52 -> :sswitch_8e
        0xccf6 -> :sswitch_84
        0xd0d9 -> :sswitch_3e
        0xd135 -> :sswitch_a5
    .end sparse-switch

    :pswitch_data_102
    .packed-switch 0x0
        :pswitch_b1
        :pswitch_b5
        :pswitch_b9
        :pswitch_bd
        :pswitch_c1
        :pswitch_e
        :pswitch_c5
        :pswitch_c8
        :pswitch_cc
        :pswitch_d0
        :pswitch_e
    .end packed-switch
.end method

.method private parseCASTAIPIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 12
    .param p1, "flaw"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 86
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 90
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v7, "violation"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    .line 91
    .local v5, "violation":Ljava/lang/String;
    const-string v7, "CWE-"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1a

    move-object v3, v6

    .line 112
    .end local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :goto_19
    return-object v3

    .line 94
    .restart local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_1a
    const-string v7, "CWE-"

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    const-string v8, "CWE-"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 95
    const/4 v7, 0x0

    const/16 v8, 0x29

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 96
    invoke-static {v5}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->cweLookup(Ljava/lang/String;)I

    move-result v0

    .line 97
    .local v0, "cwe":I
    invoke-virtual {v3, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 100
    const-string v7, "name"

    invoke-static {v7, p1}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "filename":Ljava/lang/String;
    const-string v7, "\\\\"

    const-string v8, "/"

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 102
    const/16 v7, 0x2f

    invoke-virtual {v2, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 103
    const-string v7, "BenchmarkTest"

    invoke-virtual {v2, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_9a

    .line 104
    const-string v7, "BenchmarkTest"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x5

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 106
    .local v4, "testNumber":Ljava/lang/String;
    :try_start_6f
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v3, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_76
    .catch Ljava/lang/NumberFormatException; {:try_start_6f .. :try_end_76} :catch_77

    goto :goto_19

    .line 108
    :catch_77
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/NumberFormatException;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "> Parse error "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "testNumber":Ljava/lang/String;
    :cond_9a
    move-object v3, v6

    .line 112
    goto/16 :goto_19
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 16
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x1

    .line 36
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 38
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v11, "http://apache.org/xml/features/disallow-doctype-decl"

    invoke-virtual {v2, v11, v13}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 39
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 40
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v4, Lorg/xml/sax/InputSource;

    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v11}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 41
    .local v4, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 43
    .local v0, "doc":Lorg/w3c/dom/Document;
    new-instance v9, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v11, "CAST AIP"

    sget-object v12, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v9, v11, v13, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 44
    .local v9, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v7

    .line 58
    .local v7, "root":Lorg/w3c/dom/Node;
    const-string v11, "version"

    invoke-static {v11, v7}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v10

    .line 59
    .local v10, "version":Ljava/lang/String;
    if-eqz v10, :cond_34

    .line 60
    invoke-virtual {v9, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 63
    :cond_34
    const-string v11, "file"

    invoke-static {v11, v7}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v6

    .line 65
    .local v6, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_3e
    :goto_3e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_59

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Node;

    .line 67
    .local v5, "issue":Lorg/w3c/dom/Node;
    :try_start_4a
    invoke-direct {p0, v5}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->parseCASTAIPIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v8

    .line 68
    .local v8, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v8, :cond_3e

    .line 69
    invoke-virtual {v9, v8}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_53} :catch_54

    goto :goto_3e

    .line 72
    .end local v8    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_54
    move-exception v3

    .line 73
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3e

    .line 76
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v5    # "issue":Lorg/w3c/dom/Node;
    :cond_59
    return-object v9
.end method
