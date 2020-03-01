.class public Lorg/owasp/benchmark/tools/NoisyCricket;
.super Ljava/lang/Object;
.source "NoisyCricket.java"


# static fields
.field private static report:Lorg/w3c/dom/Document;

.field private static vulns:Lorg/w3c/dom/Element;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 32
    sput-object v0, Lorg/owasp/benchmark/tools/NoisyCricket;->vulns:Lorg/w3c/dom/Element;

    .line 33
    sput-object v0, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static analyze(Ljava/nio/file/Path;)V
    .registers 7
    .param p0, "p"    # Ljava/nio/file/Path;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    sget-object v4, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    const-string v5, "vulnerability"

    invoke-interface {v4, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 87
    .local v3, "vuln":Lorg/w3c/dom/Element;
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-static {p0, v4}, Ljava/nio/file/Files;->readAllLines(Ljava/nio/file/Path;Ljava/nio/charset/Charset;)Ljava/util/List;

    move-result-object v2

    .line 88
    .local v2, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 90
    .local v0, "cwelist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_19
    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_cc

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 91
    .local v1, "line":Ljava/lang/String;
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkSQL(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_34

    const/16 v5, 0x59

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 92
    :cond_34
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkXSS(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_43

    const/16 v5, 0x4f

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_43
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkLDAP(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_52

    const/16 v5, 0x5a

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_52
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkCommandInjection(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_61

    const/16 v5, 0x4e

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_61
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkPathTraversal(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_70

    const/16 v5, 0x16

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 96
    :cond_70
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkCookie(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7f

    const/16 v5, 0x266

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_7f
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkXpath(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8e

    const/16 v5, 0x283

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_8e
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkRandom(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9d

    const/16 v5, 0x14a

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 99
    :cond_9d
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkCrypto(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_ac

    const/16 v5, 0x147

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_ac
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkHash(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_bb

    const/16 v5, 0x148

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_bb
    invoke-static {v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->checkTrustBoundary(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_19

    const/16 v5, 0x1f5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19

    .line 104
    .end local v1    # "line":Ljava/lang/String;
    :cond_cc
    const-string v4, "cwelist"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const-string v4, "file"

    invoke-interface {p0}, Ljava/nio/file/Path;->getFileName()Ljava/nio/file/Path;

    move-result-object v5

    invoke-interface {v5}, Ljava/nio/file/Path;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    sget-object v4, Lorg/owasp/benchmark/tools/NoisyCricket;->vulns:Lorg/w3c/dom/Element;

    invoke-interface {v4, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 107
    return-void
.end method

.method private static checkCommandInjection(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 115
    const-string v0, "exec"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 116
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkCookie(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 125
    const-string v0, "setsecure"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "false"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    .line 126
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static checkCrypto(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 140
    const-string v0, "cipher"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 141
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkHash(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 145
    const-string v0, "digest"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 146
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkLDAP(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 110
    const-string v0, "ldap"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 111
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkPathTraversal(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 120
    const-string v0, "file"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 121
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkRandom(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 135
    const-string v0, "random"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 136
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static checkSQL(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 156
    const-string v0, "sql"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 157
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkTrustBoundary(Ljava/lang/String;)Z
    .registers 3
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 150
    const-string v1, "putValue"

    invoke-static {p0, v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 152
    :cond_9
    :goto_9
    return v0

    .line 151
    :cond_a
    const-string v1, "setAttribute"

    invoke-static {p0, v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 152
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static checkXSS(Ljava/lang/String;)Z
    .registers 3
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 161
    const-string v1, "getWriter"

    invoke-static {p0, v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 163
    :cond_9
    :goto_9
    return v0

    .line 162
    :cond_a
    const-string v1, "getOutputStream"

    invoke-static {p0, v1}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 163
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static checkXpath(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 130
    const-string v0, "xpath"

    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/NoisyCricket;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 131
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static main([Ljava/lang/String;)V
    .registers 15
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 38
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 40
    .local v1, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v11, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v12, 0x1

    invoke-virtual {v1, v11, v12}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 41
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 42
    .local v0, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v11

    sput-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    .line 44
    sget-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    const-string v12, "noisycricket"

    invoke-interface {v11, v12}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 45
    .local v2, "docroot":Lorg/w3c/dom/Element;
    sget-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    invoke-interface {v11, v2}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 47
    sget-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    const-string v12, "meta"

    invoke-interface {v11, v12}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v9

    .line 48
    .local v9, "version":Lorg/w3c/dom/Element;
    const-string v11, "tool"

    const-string v12, "NoisyCricket"

    invoke-interface {v9, v11, v12}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    const-string v11, "version"

    const-string v12, "8.1"

    invoke-interface {v9, v11, v12}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    const-string v11, "url"

    const-string v12, "http://owasp.org/benchmark"

    invoke-interface {v9, v11, v12}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    invoke-interface {v2, v9}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 53
    sget-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    const-string v12, "vulnerabilities"

    invoke-interface {v11, v12}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v11

    sput-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->vulns:Lorg/w3c/dom/Element;

    .line 54
    sget-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->vulns:Lorg/w3c/dom/Element;

    invoke-interface {v2, v11}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 56
    new-instance v10, Lorg/owasp/benchmark/tools/NoisyCricket$1;

    invoke-direct {v10}, Lorg/owasp/benchmark/tools/NoisyCricket$1;-><init>()V

    .line 68
    .local v10, "visitor":Ljava/nio/file/FileVisitor;, "Ljava/nio/file/FileVisitor<Ljava/nio/file/Path;>;"
    invoke-static {}, Ljava/nio/file/FileSystems;->getDefault()Ljava/nio/file/FileSystem;

    move-result-object v11

    const-string v12, "user.home"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Ljava/nio/file/FileSystem;->getPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v4

    .line 69
    .local v4, "p":Ljava/nio/file/Path;
    invoke-static {v4, v10}, Ljava/nio/file/Files;->walkFileTree(Ljava/nio/file/Path;Ljava/nio/file/FileVisitor;)Ljava/nio/file/Path;

    .line 71
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v8

    .line 72
    .local v8, "transformerFactory":Ljavax/xml/transform/TransformerFactory;
    invoke-virtual {v8}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v7

    .line 73
    .local v7, "transformer":Ljavax/xml/transform/Transformer;
    const-string v11, "indent"

    const-string v12, "yes"

    invoke-virtual {v7, v11, v12}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    new-instance v6, Ljavax/xml/transform/dom/DOMSource;

    sget-object v11, Lorg/owasp/benchmark/tools/NoisyCricket;->report:Lorg/w3c/dom/Document;

    invoke-direct {v6, v11}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 75
    .local v6, "source":Ljavax/xml/transform/dom/DOMSource;
    new-instance v5, Ljavax/xml/transform/stream/StreamResult;

    new-instance v11, Ljava/io/FileWriter;

    new-instance v12, Ljava/io/File;

    const-string v13, "NoisyCricket.xml"

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v11, v12}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v11}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 76
    .local v5, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-virtual {v7, v6, v5}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 78
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v12, "\n\nNoisyCricket.xml saved!"

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9a} :catch_9b

    .line 83
    .end local v0    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v1    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v2    # "docroot":Lorg/w3c/dom/Element;
    .end local v4    # "p":Ljava/nio/file/Path;
    .end local v5    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v6    # "source":Ljavax/xml/transform/dom/DOMSource;
    .end local v7    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v8    # "transformerFactory":Ljavax/xml/transform/TransformerFactory;
    .end local v9    # "version":Lorg/w3c/dom/Element;
    .end local v10    # "visitor":Ljava/nio/file/FileVisitor;, "Ljava/nio/file/FileVisitor<Ljava/nio/file/Path;>;"
    :goto_9a
    return-void

    .line 80
    :catch_9b
    move-exception v3

    .line 81
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_9a
.end method

.method private static match(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "line"    # Ljava/lang/String;
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method
