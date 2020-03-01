.class public Lorg/owasp/benchmark/score/parsers/Reader;
.super Ljava/lang/Object;
.source "Reader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x0

    .line 93
    if-nez p1, :cond_4

    .line 103
    :cond_3
    :goto_3
    return-object v2

    .line 95
    :cond_4
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 96
    .local v1, "nnm":Lorg/w3c/dom/NamedNodeMap;
    if-eqz v1, :cond_3

    .line 97
    invoke-interface {v1, p0}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 98
    .local v0, "attrnode":Lorg/w3c/dom/Node;
    if-eqz v0, :cond_3

    .line 99
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "value":Ljava/lang/String;
    goto :goto_3
.end method

.method public static getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "parent"    # Lorg/w3c/dom/Node;

    .prologue
    .line 56
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 57
    .local v0, "children":Lorg/w3c/dom/NodeList;
    invoke-static {p0, v0}, Lorg/owasp/benchmark/score/parsers/Reader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v1

    return-object v1
.end method

.method public static getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .registers 9
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
    .line 61
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v4, "results":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_34

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Node;

    .line 63
    .local v3, "n":Lorg/w3c/dom/Node;
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 64
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v2, v6, :cond_9

    .line 65
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 66
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_31

    .line 68
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    :cond_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 72
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v1    # "children":Lorg/w3c/dom/NodeList;
    .end local v2    # "i":I
    .end local v3    # "n":Lorg/w3c/dom/Node;
    :cond_34
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
    .line 76
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 77
    .local v0, "children":Lorg/w3c/dom/NodeList;
    invoke-static {p0, v0}, Lorg/owasp/benchmark/score/parsers/Reader;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static getNamedNode(Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;
    .registers 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "keyValue"    # Ljava/lang/String;
    .param p2, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    const/4 v2, 0x0

    .line 43
    if-eqz p0, :cond_7

    if-eqz p1, :cond_7

    if-nez p2, :cond_9

    :cond_7
    move-object v1, v2

    .line 52
    :cond_8
    :goto_8
    return-object v1

    .line 44
    :cond_9
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    invoke-interface {p2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_2d

    .line 45
    invoke-interface {p2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 46
    .local v1, "n":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 47
    const-string v3, "key"

    invoke-static {v3, v1}, Lorg/owasp/benchmark/score/parsers/Reader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 44
    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .end local v1    # "n":Lorg/w3c/dom/Node;
    :cond_2d
    move-object v1, v2

    .line 52
    goto :goto_8
.end method

.method public static getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 31
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_19

    .line 32
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 33
    .local v1, "n":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 37
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :goto_15
    return-object v1

    .line 31
    .restart local v1    # "n":Lorg/w3c/dom/Node;
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 37
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
    .line 81
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v2, "results":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 83
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 84
    .local v1, "n":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 86
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 89
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :cond_20
    return-object v2
.end method
