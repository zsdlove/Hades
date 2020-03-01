.class public Lorg/owasp/benchmark/tools/XMLCrawler;
.super Ljava/lang/Object;
.source "XMLCrawler.java"


# static fields
.field private static sr:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lorg/owasp/benchmark/tools/XMLCrawler;->sr:Ljava/security/SecureRandom;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;
    .registers 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x0

    .line 61
    if-nez p1, :cond_4

    .line 75
    :cond_3
    :goto_3
    return-object v2

    .line 64
    :cond_4
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 65
    .local v1, "nnm":Lorg/w3c/dom/NamedNodeMap;
    if-eqz v1, :cond_3

    .line 66
    invoke-interface {v1, p0}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 67
    .local v0, "attrnode":Lorg/w3c/dom/Node;
    if-eqz v0, :cond_3

    .line 68
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "value":Ljava/lang/String;
    const-string v3, "[random]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 70
    invoke-static {}, Lorg/owasp/benchmark/tools/XMLCrawler;->getToken()Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method public static getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "parent"    # Lorg/w3c/dom/Node;

    .prologue
    .line 23
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 24
    .local v0, "children":Lorg/w3c/dom/NodeList;
    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v1

    return-object v1
.end method

.method public static getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .registers 11
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .local v4, "results":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Node;

    .line 30
    .local v3, "n":Lorg/w3c/dom/Node;
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 31
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v2, v6, :cond_9

    .line 32
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 33
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5b

    .line 34
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "::"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 35
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    :cond_5b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 39
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v1    # "children":Lorg/w3c/dom/NodeList;
    .end local v2    # "i":I
    .end local v3    # "n":Lorg/w3c/dom/Node;
    :cond_5e
    return-object v4
.end method

.method public static getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "parent"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/Node;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 44
    .local v0, "children":Lorg/w3c/dom/NodeList;
    invoke-static {p0, v0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 13
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_19

    .line 14
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 15
    .local v1, "n":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 19
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :goto_15
    return-object v1

    .line 13
    .restart local v1    # "n":Lorg/w3c/dom/Node;
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 19
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :cond_19
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public static getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;
    .registers 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "list"    # Lorg/w3c/dom/NodeList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/NodeList;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v2, "results":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 50
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 51
    .local v1, "n":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 54
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 57
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :cond_20
    return-object v2
.end method

.method private static getToken()Ljava/lang/String;
    .registers 4

    .prologue
    .line 81
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    const/4 v2, 0x5

    if-ge v0, v2, :cond_1a

    .line 83
    sget-object v2, Lorg/owasp/benchmark/tools/XMLCrawler;->sr:Ljava/security/SecureRandom;

    const/16 v3, 0x1a

    invoke-virtual {v2, v3}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x61

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 85
    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    const/4 v2, 0x3

    if-ge v0, v2, :cond_2f

    .line 86
    sget-object v2, Lorg/owasp/benchmark/tools/XMLCrawler;->sr:Ljava/security/SecureRandom;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 88
    :cond_2f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
