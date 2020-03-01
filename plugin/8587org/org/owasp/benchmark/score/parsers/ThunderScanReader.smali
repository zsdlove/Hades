.class public Lorg/owasp/benchmark/score/parsers/ThunderScanReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "ThunderScanReader.java"


# static fields
.field static fileListDuplicates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;->fileListDuplicates:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static parseThunderScanVulnerability(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 14
    .param p0, "vulnElement"    # Lorg/w3c/dom/Element;
    .param p1, "vulnType"    # Ljava/lang/String;

    .prologue
    const/16 v11, 0x7a6b

    const/4 v10, 0x0

    .line 64
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 66
    .local v5, "tcResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const/4 v0, 0x0

    .line 68
    .local v0, "cwe":I
    new-instance v8, Lorg/owasp/benchmark/score/parsers/ThunderScanReader$1;

    invoke-direct {v8}, Lorg/owasp/benchmark/score/parsers/ThunderScanReader$1;-><init>()V

    .line 85
    .local v8, "vulnTypesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v8, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 87
    const-string v9, "File"

    invoke-interface {p0, v9}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "file":Ljava/lang/String;
    const-string v9, "Function"

    invoke-interface {p0, v9}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "function":Ljava/lang/String;
    const-string v9, "FunctionCalls"

    invoke-interface {p0, v9}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 90
    .local v3, "functionCalls":Lorg/w3c/dom/Node;
    check-cast v3, Lorg/w3c/dom/Element;

    .end local v3    # "functionCalls":Lorg/w3c/dom/Node;
    const-string v9, "CallStackItem"

    invoke-interface {v3, v9}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    check-cast v9, Lorg/w3c/dom/Element;

    const-string v10, "Line"

    invoke-interface {v9, v10}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 92
    .local v4, "line":Ljava/lang/String;
    const/16 v9, 0x5c

    invoke-virtual {v1, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 93
    .local v7, "testcase":Ljava/lang/String;
    const-string v9, "BenchmarkTest"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x5

    invoke-virtual {v7, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 95
    .local v6, "testNumber":Ljava/lang/String;
    if-ne v0, v11, :cond_aa

    .line 96
    const-string v9, "Weak Enc"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_7a

    const/16 v0, 0x147

    .line 97
    :cond_7a
    const-string v9, "Weak Hash"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_84

    const/16 v0, 0x148

    .line 98
    :cond_84
    const-string v9, "Weak Random"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_8e

    const/16 v0, 0x14a

    .line 99
    :cond_8e
    const-string v9, "putValue"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_9e

    const-string v9, "setAttribute"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_a0

    :cond_9e
    const/16 v0, 0x1f5

    .line 100
    :cond_a0
    const-string v9, "setSecure"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_aa

    const/16 v0, 0x266

    .line 103
    :cond_aa
    if-eqz v0, :cond_b6

    if-eq v0, v11, :cond_b6

    sget-object v9, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;->fileListDuplicates:Ljava/util/List;

    invoke-interface {v9, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b8

    :cond_b6
    const/4 v5, 0x0

    .line 113
    .end local v5    # "tcResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :goto_b7
    return-object v5

    .line 105
    .restart local v5    # "tcResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_b8
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 106
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v5, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 107
    invoke-virtual {v5, p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 108
    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 109
    invoke-virtual {v5, v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 111
    sget-object v9, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;->fileListDuplicates:Ljava/util/List;

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b7
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
    .line 25
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    .line 26
    .local v4, "dbFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v3

    .line 27
    .local v3, "dBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v8, Lorg/xml/sax/InputSource;

    new-instance v20, Ljava/io/FileInputStream;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v20

    invoke-direct {v8, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 28
    .local v8, "fileInput":Lorg/xml/sax/InputSource;
    invoke-virtual {v3, v8}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 30
    .local v5, "doc":Lorg/w3c/dom/Document;
    new-instance v13, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v20, "ThunderScan"

    const/16 v21, 0x1

    sget-object v22, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v13, v0, v1, v2}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 32
    .local v13, "testResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v20, "VulnerabilityType"

    move-object/from16 v0, v20

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v16

    .line 34
    .local v16, "vulnTypeNodeList":Lorg/w3c/dom/NodeList;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_36
    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v20

    move/from16 v0, v20

    if-ge v10, v0, :cond_c0

    .line 35
    move-object/from16 v0, v16

    invoke-interface {v0, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v15

    .local v15, "vulnTypeNode":Lorg/w3c/dom/Node;
    move-object v6, v15

    .line 36
    check-cast v6, Lorg/w3c/dom/Element;

    .line 38
    .local v6, "eElement":Lorg/w3c/dom/Element;
    const-string v20, "Name"

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 39
    .local v19, "vulnerabilityType":Ljava/lang/String;
    const-string v20, "Vulnerability"

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v17

    .line 41
    .local v17, "vulnerabilities":Lorg/w3c/dom/NodeList;
    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_66

    .line 34
    :cond_63
    add-int/lit8 v10, v10, 0x1

    goto :goto_36

    .line 43
    :cond_66
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_67
    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_63

    .line 45
    move-object/from16 v0, v17

    invoke-interface {v0, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v18

    .local v18, "vulnerability":Lorg/w3c/dom/Node;
    move-object/from16 v14, v18

    .line 46
    check-cast v14, Lorg/w3c/dom/Element;

    .line 48
    .local v14, "vulnElement":Lorg/w3c/dom/Element;
    const-string v20, "File"

    move-object/from16 v0, v20

    invoke-interface {v14, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v20

    const/16 v21, 0x0

    invoke-interface/range {v20 .. v21}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    .line 49
    .local v7, "file":Ljava/lang/String;
    const-string v20, "Function"

    move-object/from16 v0, v20

    invoke-interface {v14, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v20

    const/16 v21, 0x0

    invoke-interface/range {v20 .. v21}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v9

    .line 51
    .local v9, "function":Ljava/lang/String;
    const-string v20, "BenchmarkTest"

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_aa

    .line 43
    :cond_a7
    :goto_a7
    add-int/lit8 v11, v11, 0x1

    goto :goto_67

    .line 52
    :cond_aa
    const-string v20, "/printStackTrace|Cookie$|getMessage$/"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v20

    if-nez v20, :cond_a7

    .line 54
    move-object/from16 v0, v19

    invoke-static {v14, v0}, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;->parseThunderScanVulnerability(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v12

    .line 55
    .local v12, "tcResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v12, :cond_a7

    invoke-virtual {v13, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_a7

    .line 59
    .end local v6    # "eElement":Lorg/w3c/dom/Element;
    .end local v7    # "file":Ljava/lang/String;
    .end local v9    # "function":Ljava/lang/String;
    .end local v11    # "j":I
    .end local v12    # "tcResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v14    # "vulnElement":Lorg/w3c/dom/Element;
    .end local v15    # "vulnTypeNode":Lorg/w3c/dom/Node;
    .end local v17    # "vulnerabilities":Lorg/w3c/dom/NodeList;
    .end local v18    # "vulnerability":Lorg/w3c/dom/Node;
    .end local v19    # "vulnerabilityType":Ljava/lang/String;
    :cond_c0
    return-object v13
.end method
