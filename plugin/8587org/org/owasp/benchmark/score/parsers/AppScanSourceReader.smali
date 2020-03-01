.class public Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "AppScanSourceReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static cweLookup(Ljava/lang/String;)I
    .registers 4
    .param p0, "vtype"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 139
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_b8

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_ea

    .line 161
    :goto_c
    return v0

    .line 139
    :sswitch_d
    const-string v2, "Vulnerability.Cryptography.InsecureAlgorithm"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "Vulnerability.Cryptography.PoorEntropy"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "Vulnerability.Cryptography.????WeakHash"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "Vulnerability.Injection.HttpResponseSplitting"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v2, "Vulnerability.Injection.LDAP"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v2, "Vulnerability.Injection.OS"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_49
    const-string v2, "Vulnerability.Injection.SQL"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x6

    goto :goto_9

    :sswitch_53
    const-string v2, "Vulnerability.Injection.XPath"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x7

    goto :goto_9

    :sswitch_5d
    const-string v2, "Vulnerability.PathTraversal"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x8

    goto :goto_9

    :sswitch_68
    const-string v2, "Vulnerability.SessionManagement.Cookies"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x9

    goto :goto_9

    :sswitch_73
    const-string v2, "Vulnerability.Validation.EncodingRequired"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xa

    goto :goto_9

    :sswitch_7e
    const-string v2, "Vulnerability.Validation.Required"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xb

    goto :goto_9

    .line 142
    :pswitch_89
    const/16 v0, 0x147

    goto :goto_c

    .line 143
    :pswitch_8c
    const/16 v0, 0x14a

    goto/16 :goto_c

    .line 144
    :pswitch_90
    const/16 v0, 0x148

    goto/16 :goto_c

    .line 147
    :pswitch_94
    const/16 v0, 0x71

    goto/16 :goto_c

    .line 148
    :pswitch_98
    const/16 v0, 0x5a

    goto/16 :goto_c

    .line 149
    :pswitch_9c
    const/16 v0, 0x4e

    goto/16 :goto_c

    .line 150
    :pswitch_a0
    const/16 v0, 0x59

    goto/16 :goto_c

    .line 151
    :pswitch_a4
    const/16 v0, 0x283

    goto/16 :goto_c

    .line 154
    :pswitch_a8
    const/16 v0, 0x16

    goto/16 :goto_c

    .line 157
    :pswitch_ac
    const/16 v0, 0x266

    goto/16 :goto_c

    .line 158
    :pswitch_b0
    const/16 v0, 0x4f

    goto/16 :goto_c

    .line 159
    :pswitch_b4
    const/16 v0, 0x1f5

    goto/16 :goto_c

    .line 139
    :sswitch_data_b8
    .sparse-switch
        -0x7ac488ec -> :sswitch_53
        -0x662f9533 -> :sswitch_3f
        -0x5fc3021b -> :sswitch_49
        -0x5959f6c1 -> :sswitch_17
        -0x47bb058a -> :sswitch_2b
        -0x461d4cea -> :sswitch_21
        -0x189571bd -> :sswitch_d
        -0x2c6e7ab -> :sswitch_73
        0x36a47ce2 -> :sswitch_7e
        0x4db30dc8 -> :sswitch_68
        0x5433dbe7 -> :sswitch_5d
        0x675f5e50 -> :sswitch_35
    .end sparse-switch

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_89
        :pswitch_8c
        :pswitch_90
        :pswitch_94
        :pswitch_98
        :pswitch_9c
        :pswitch_a0
        :pswitch_a4
        :pswitch_a8
        :pswitch_ac
        :pswitch_b0
        :pswitch_b4
    .end packed-switch
.end method

.method private parseAssessments(Lorg/w3c/dom/Node;)Ljava/util/Map;
    .registers 17
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Node;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 171
    new-instance v12, Ljava/util/TreeMap;

    invoke-direct {v12}, Ljava/util/TreeMap;-><init>()V

    .line 172
    .local v12, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    const-string v13, "Assessment"

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 173
    .local v2, "assess1":Lorg/w3c/dom/Node;
    const-string v13, "Assessment"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 174
    .local v3, "assess2":Lorg/w3c/dom/Node;
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 175
    .local v1, "afiles":Lorg/w3c/dom/NodeList;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1e
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v13

    if-ge v10, v13, :cond_7e

    .line 176
    invoke-interface {v1, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 177
    .local v0, "afile":Lorg/w3c/dom/Node;
    const-string v13, "file_id"

    invoke-static {v13, v0}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "fileid":Ljava/lang/String;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    .line 179
    .local v9, "findings":Lorg/w3c/dom/NodeList;
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_33
    invoke-interface {v9}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v13

    if-ge v11, v13, :cond_7b

    .line 180
    invoke-interface {v9, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 181
    .local v6, "finding":Lorg/w3c/dom/Node;
    if-eqz v6, :cond_78

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v13

    const-string v14, "Finding"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_78

    .line 182
    const-string v13, "data_id"

    invoke-static {v13, v6}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 183
    .local v8, "findingid":I
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 184
    .local v5, "fileidint":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Set;

    .line 185
    .local v7, "findingSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-nez v7, :cond_71

    .line 186
    new-instance v7, Ljava/util/HashSet;

    .end local v7    # "findingSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 187
    .restart local v7    # "findingSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    :cond_71
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v7, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 179
    .end local v5    # "fileidint":I
    .end local v7    # "findingSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v8    # "findingid":I
    :cond_78
    add-int/lit8 v11, v11, 0x1

    goto :goto_33

    .line 175
    .end local v6    # "finding":Lorg/w3c/dom/Node;
    :cond_7b
    add-int/lit8 v10, v10, 0x1

    goto :goto_1e

    .line 193
    .end local v0    # "afile":Lorg/w3c/dom/Node;
    .end local v4    # "fileid":Ljava/lang/String;
    .end local v9    # "findings":Lorg/w3c/dom/NodeList;
    .end local v11    # "j":I
    :cond_7e
    return-object v12
.end method

.method private parsePool(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .registers 14
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .param p2, "poolname"    # Ljava/lang/String;
    .param p3, "keyname"    # Ljava/lang/String;
    .param p4, "valuename"    # Ljava/lang/String;
    .param p5, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Node;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 198
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 199
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-static {p2, v7}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 200
    .local v4, "parent":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 201
    .local v5, "pool":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v0, v7, :cond_3c

    .line 202
    invoke-interface {v5, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 203
    .local v3, "n":Lorg/w3c/dom/Node;
    invoke-static {p3, v3}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "key":Ljava/lang/String;
    invoke-static {p4, v3}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 205
    .local v6, "value":Ljava/lang/String;
    if-eqz v1, :cond_39

    if-eqz v6, :cond_39

    invoke-virtual {v6, p5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 206
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v2, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    :cond_39
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 209
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "n":Lorg/w3c/dom/Node;
    .end local v6    # "value":Ljava/lang/String;
    :cond_3c
    return-object v2
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

.method private static printPool(Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "vulns":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 133
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " :: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_8

    .line 136
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_41
    return-void
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 37
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v14

    .line 45
    .local v14, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v2, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v4, 0x1

    invoke-virtual {v14, v2, v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 46
    invoke-virtual {v14}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v13

    .line 47
    .local v13, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v21, Lorg/xml/sax/InputSource;

    new-instance v2, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v21

    invoke-direct {v0, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 48
    .local v21, "is":Lorg/xml/sax/InputSource;
    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v12

    .line 50
    .local v12, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v12}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    .line 51
    .local v3, "root":Lorg/w3c/dom/Node;
    const-string v4, "StringPool"

    const-string v5, "id"

    const-string v6, "value"

    const-string v7, "Vulnerability."

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parsePool(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v34

    .line 53
    .local v34, "vulns":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    const-string v4, "FilePool"

    const-string v5, "id"

    const-string v6, "value"

    const-string v7, ""

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parsePool(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v15

    .line 54
    .local v15, "file":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    const-string v4, "FindingDataPool"

    const-string v5, "id"

    const-string v6, "vtype"

    const-string v7, ""

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parsePool(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v18

    .line 56
    .local v18, "finding":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    const-string v4, "FindingDataPool"

    const-string v5, "id"

    const-string v6, "conf"

    const-string v7, ""

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parsePool(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v9

    .line 60
    .local v9, "conf":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parseAssessments(Lorg/w3c/dom/Node;)Ljava/util/Map;

    move-result-object v8

    .line 62
    .local v8, "assess":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    new-instance v30, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v2, "IBM AppScan Source"

    const/4 v4, 0x1

    sget-object v5, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-object/from16 v0, v30

    invoke-direct {v0, v2, v4, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 65
    .local v30, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v2, "version"

    invoke-static {v2, v3}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v31

    .line 66
    .local v31, "version":Ljava/lang/String;
    invoke-virtual/range {v30 .. v31}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 68
    const-string v2, "Messages"

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-static {v2, v4}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v23

    .line 69
    .local v23, "msgList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v2, "Message"

    move-object/from16 v0, v23

    invoke-static {v2, v0}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v24

    .line 70
    .local v24, "msgs":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8f
    :goto_8f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Node;

    .line 71
    .local v25, "node":Lorg/w3c/dom/Node;
    invoke-interface/range {v25 .. v25}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v22

    .line 72
    .local v22, "message":Ljava/lang/String;
    const-string v26, "Elapsed Time - "

    .line 73
    .local v26, "prefix":Ljava/lang/String;
    if-eqz v22, :cond_8f

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 74
    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v4

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v22

    .line 75
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parseTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    goto :goto_8f

    .line 79
    .end local v22    # "message":Ljava/lang/String;
    .end local v25    # "node":Lorg/w3c/dom/Node;
    .end local v26    # "prefix":Ljava/lang/String;
    :cond_c5
    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_cd
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v16

    .line 80
    .local v16, "fileid":I
    const/16 v29, 0x0

    .line 81
    .local v29, "tn":I
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v15, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 82
    .local v17, "filename":Ljava/lang/String;
    const-string v2, "\\\\"

    const-string v5, "/"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 83
    const-string v2, "/"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_10d

    .line 84
    const/16 v2, 0x2f

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v17

    .line 86
    :cond_10d
    const-string v2, ".java"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13e

    const-string v2, "BenchmarkTest"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13e

    .line 87
    const/4 v2, 0x0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x5

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    .line 88
    const-string v2, "BenchmarkTest"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v28

    .line 89
    .local v28, "testnum":Ljava/lang/String;
    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v29

    .line 92
    .end local v28    # "testnum":Ljava/lang/String;
    :cond_13e
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/Set;

    .line 93
    .local v20, "findings":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_14c
    :goto_14c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cd

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v19

    .line 94
    .local v19, "findingid":I
    new-instance v27, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct/range {v27 .. v27}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 95
    .local v27, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    move-object/from16 v0, v27

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 96
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v32

    .line 97
    .local v32, "vid":I
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 98
    .local v10, "confString":Ljava/lang/String;
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 100
    .local v11, "confidence":I
    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v34

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/lang/String;

    .line 101
    .local v33, "vtype":Ljava/lang/String;
    move-object/from16 v0, v27

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 103
    invoke-static/range {v33 .. v33}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->cweLookup(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-virtual {v0, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 104
    move-object/from16 v0, v27

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 105
    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 111
    const/4 v2, 0x3

    if-ge v11, v2, :cond_14c

    .line 112
    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_14c

    .line 116
    .end local v10    # "confString":Ljava/lang/String;
    .end local v11    # "confidence":I
    .end local v16    # "fileid":I
    .end local v17    # "filename":Ljava/lang/String;
    .end local v19    # "findingid":I
    .end local v20    # "findings":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v27    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v29    # "tn":I
    .end local v32    # "vid":I
    .end local v33    # "vtype":Ljava/lang/String;
    :cond_1b9
    return-object v30
.end method
