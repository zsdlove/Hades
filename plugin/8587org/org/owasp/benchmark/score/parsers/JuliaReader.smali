.class public Lorg/owasp/benchmark/score/parsers/JuliaReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "JuliaReader.java"


# static fields
.field private static final prefixOfTest:Ljava/lang/String; = "org.owasp.benchmark.testcode.BenchmarkTest"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private parseJuliaBug(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 13
    .param p1, "n"    # Lorg/w3c/dom/Node;

    .prologue
    const/16 v10, 0x2e

    .line 69
    new-instance v4, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 71
    .local v4, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 72
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v2, v7, :cond_73

    .line 73
    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 74
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "childName":Ljava/lang/String;
    const-string v7, "source"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5f

    .line 76
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x2f

    invoke-virtual {v7, v8, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    .line 77
    .local v6, "where":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    const-string v9, ".java"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 78
    const-string v7, "org.owasp.benchmark.testcode.BenchmarkTest"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 79
    invoke-virtual {v6, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    const-string v8, "BenchmarkTest"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 80
    .local v5, "testNumber":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 72
    .end local v5    # "testNumber":Ljava/lang/String;
    .end local v6    # "where":Ljava/lang/String;
    :cond_5c
    :goto_5c
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 83
    :cond_5f
    const-string v7, "CWEid"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 84
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    goto :goto_5c

    .line 87
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v1    # "childName":Ljava/lang/String;
    :cond_73
    return-object v4
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

    .line 37
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v11, "http://apache.org/xml/features/disallow-doctype-decl"

    invoke-virtual {v2, v11, v13}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 38
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 39
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v4, Lorg/xml/sax/InputSource;

    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v11}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 40
    .local v4, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 42
    .local v0, "doc":Lorg/w3c/dom/Document;
    new-instance v10, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v11, "Julia"

    sget-object v12, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v10, v11, v13, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 44
    .local v10, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v8

    .line 47
    .local v8, "root":Lorg/w3c/dom/Node;
    const-string v11, "runDuration"

    invoke-static {v11, v8}, Lorg/owasp/benchmark/score/parsers/JuliaReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v9

    .line 48
    .local v9, "runDuration":Ljava/lang/String;
    invoke-static {v9}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    .line 51
    const-string v11, "engineVersion"

    invoke-static {v11, v8}, Lorg/owasp/benchmark/score/parsers/JuliaReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    .line 52
    .local v5, "juliaVersion":Ljava/lang/String;
    invoke-virtual {v10, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 55
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    .line 56
    .local v7, "nl":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_4c
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v11

    if-ge v3, v11, :cond_6c

    .line 57
    invoke-interface {v7, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 58
    .local v6, "n":Lorg/w3c/dom/Node;
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "warning"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_69

    .line 59
    invoke-direct {p0, v6}, Lorg/owasp/benchmark/score/parsers/JuliaReader;->parseJuliaBug(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 56
    :cond_69
    add-int/lit8 v3, v3, 0x1

    goto :goto_4c

    .line 62
    .end local v6    # "n":Lorg/w3c/dom/Node;
    :cond_6c
    return-object v10
.end method
