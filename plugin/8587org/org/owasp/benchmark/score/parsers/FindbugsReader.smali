.class public Lorg/owasp/benchmark/score/parsers/FindbugsReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "FindbugsReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private static figureCWE(Lorg/owasp/benchmark/score/parsers/TestCaseResult;Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)I
    .registers 12
    .param p0, "tcr"    # Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .param p1, "cwenode"    # Lorg/w3c/dom/Node;
    .param p2, "catnode"    # Lorg/w3c/dom/Node;

    .prologue
    const/16 v4, 0x147

    const/16 v6, 0x4f

    const/16 v5, 0x16

    const/16 v3, 0x59

    const/4 v2, 0x0

    .line 106
    const/4 v1, 0x0

    .line 107
    .local v1, "cwe":Ljava/lang/String;
    if-eqz p1, :cond_10

    .line 108
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    .line 111
    :cond_10
    const/4 v0, 0x0

    .line 112
    .local v0, "cat":Ljava/lang/String;
    if-eqz p2, :cond_17

    .line 113
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    .line 115
    :cond_17
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "FB:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "::"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 117
    if-eqz v1, :cond_5b

    .line 119
    const-string v2, "23"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_49

    const-string v2, "36"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 120
    :cond_49
    const-string v1, "22"

    .line 127
    :cond_4b
    :goto_4b
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 193
    :goto_4f
    :pswitch_4f
    return v2

    .line 124
    :cond_50
    const-string v2, "326"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 125
    const-string v1, "327"

    goto :goto_4b

    .line 132
    :cond_5b
    const/4 v7, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_232

    :cond_63
    :goto_63
    packed-switch v7, :pswitch_data_2b0

    .line 190
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown vuln category for FindBugs: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4f

    .line 132
    :sswitch_7f
    const-string v8, "SECIC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    move v7, v2

    goto :goto_63

    :sswitch_89
    const-string v8, "SECCU"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x1

    goto :goto_63

    :sswitch_93
    const-string v8, "SECHOC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x2

    goto :goto_63

    :sswitch_9d
    const-string v8, "SECSQLIHIB"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x3

    goto :goto_63

    :sswitch_a7
    const-string v8, "SECSQLIJDO"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x4

    goto :goto_63

    :sswitch_b1
    const-string v8, "SECSQLIJPA"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x5

    goto :goto_63

    :sswitch_bb
    const-string v8, "SECSQLISPRJDBC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x6

    goto :goto_63

    :sswitch_c5
    const-string v8, "SECSQLIJDBC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/4 v7, 0x7

    goto :goto_63

    :sswitch_cf
    const-string v8, "SECLDAPI"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x8

    goto :goto_63

    :sswitch_da
    const-string v8, "SECXPI"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x9

    goto/16 :goto_63

    :sswitch_e6
    const-string v8, "SECCI"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0xa

    goto/16 :goto_63

    :sswitch_f2
    const-string v8, "SECPR"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0xb

    goto/16 :goto_63

    :sswitch_fe
    const-string v8, "SECDU"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0xc

    goto/16 :goto_63

    :sswitch_10a
    const-string v8, "CIPINT"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0xd

    goto/16 :goto_63

    :sswitch_116
    const-string v8, "PADORA"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0xe

    goto/16 :goto_63

    :sswitch_122
    const-string v8, "STAIV"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0xf

    goto/16 :goto_63

    :sswitch_12e
    const-string v8, "SECWMD"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x10

    goto/16 :goto_63

    :sswitch_13a
    const-string v8, "SECPTO"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x11

    goto/16 :goto_63

    :sswitch_146
    const-string v8, "SECPTI"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x12

    goto/16 :goto_63

    :sswitch_152
    const-string v8, "SECXRW"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x13

    goto/16 :goto_63

    :sswitch_15e
    const-string v8, "SECXSS1"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x14

    goto/16 :goto_63

    :sswitch_16a
    const-string v8, "SECXSS2"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x15

    goto/16 :goto_63

    :sswitch_176
    const-string v8, "SECXXEDOC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    move v7, v5

    goto/16 :goto_63

    :sswitch_181
    const-string v8, "SECXXEREAD"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x17

    goto/16 :goto_63

    :sswitch_18d
    const-string v8, "SECXXESAX"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x18

    goto/16 :goto_63

    :sswitch_199
    const-string v8, "SECSP"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x19

    goto/16 :goto_63

    :sswitch_1a5
    const-string v8, "SECSH"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x1a

    goto/16 :goto_63

    :sswitch_1b1
    const-string v8, "SECSHR"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x1b

    goto/16 :goto_63

    :sswitch_1bd
    const-string v8, "SECSSQ"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x1c

    goto/16 :goto_63

    :sswitch_1c9
    const-string v8, "SECSC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x1d

    goto/16 :goto_63

    :sswitch_1d5
    const-string v8, "SECJRS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    const/16 v7, 0x1e

    goto/16 :goto_63

    .line 134
    :pswitch_1e1
    const/16 v2, 0x266

    goto/16 :goto_4f

    .line 139
    :pswitch_1e5
    const/16 v2, 0x234

    goto/16 :goto_4f

    :pswitch_1e9
    move v2, v3

    .line 140
    goto/16 :goto_4f

    :pswitch_1ec
    move v2, v3

    .line 141
    goto/16 :goto_4f

    :pswitch_1ef
    move v2, v3

    .line 142
    goto/16 :goto_4f

    :pswitch_1f2
    move v2, v3

    .line 143
    goto/16 :goto_4f

    .line 146
    :pswitch_1f5
    const/16 v2, 0x5a

    goto/16 :goto_4f

    .line 149
    :pswitch_1f9
    const/16 v2, 0x283

    goto/16 :goto_4f

    .line 152
    :pswitch_1fd
    const/16 v2, 0x4e

    goto/16 :goto_4f

    .line 155
    :pswitch_201
    const/16 v2, 0x14a

    goto/16 :goto_4f

    :pswitch_205
    move v2, v4

    .line 158
    goto/16 :goto_4f

    :pswitch_208
    move v2, v4

    .line 159
    goto/16 :goto_4f

    :pswitch_20b
    move v2, v4

    .line 160
    goto/16 :goto_4f

    .line 161
    :pswitch_20e
    const/16 v2, 0x149

    goto/16 :goto_4f

    .line 164
    :pswitch_212
    const/16 v2, 0x148

    goto/16 :goto_4f

    :pswitch_216
    move v2, v5

    .line 167
    goto/16 :goto_4f

    :pswitch_219
    move v2, v5

    .line 168
    goto/16 :goto_4f

    :pswitch_21c
    move v2, v6

    .line 171
    goto/16 :goto_4f

    :pswitch_21f
    move v2, v6

    .line 172
    goto/16 :goto_4f

    :pswitch_222
    move v2, v6

    .line 173
    goto/16 :goto_4f

    .line 176
    :pswitch_225
    const/16 v2, 0x263

    goto/16 :goto_4f

    .line 177
    :pswitch_229
    const/16 v2, 0x263

    goto/16 :goto_4f

    .line 178
    :pswitch_22d
    const/16 v2, 0x263

    goto/16 :goto_4f

    .line 132
    nop

    :sswitch_data_232
    .sparse-switch
        -0x7aba76dc -> :sswitch_176
        -0x7aba402a -> :sswitch_18d
        -0x73c83a95 -> :sswitch_116
        -0x6e71e1b5 -> :sswitch_93
        -0x6e71d9c6 -> :sswitch_1d5
        -0x6e71c30c -> :sswitch_146
        -0x6e71c306 -> :sswitch_13a
        -0x6e71b934 -> :sswitch_1b1
        -0x6e71b7e0 -> :sswitch_1bd
        -0x6e71a9a3 -> :sswitch_12e
        -0x6e71a580 -> :sswitch_da
        -0x6e71a534 -> :sswitch_152
        -0x5fc2fdd6 -> :sswitch_15e
        -0x5fc2fdd5 -> :sswitch_16a
        -0x237386f9 -> :sswitch_c5
        0x4b20057 -> :sswitch_e6
        0x4b20063 -> :sswitch_89
        0x4b20082 -> :sswitch_fe
        0x4b2010b -> :sswitch_7f
        0x4b201f3 -> :sswitch_f2
        0x4b20241 -> :sswitch_1c9
        0x4b20246 -> :sswitch_1a5
        0x4b2024e -> :sswitch_199
        0x4b8cb2d -> :sswitch_122
        0xf5f57d5 -> :sswitch_9d
        0xf5f5ec9 -> :sswitch_a7
        0xf5f602f -> :sswitch_b1
        0x2371d30a -> :sswitch_181
        0x66b317f1 -> :sswitch_cf
        0x70700084 -> :sswitch_bb
        0x767edee5 -> :sswitch_10a
    .end sparse-switch

    :pswitch_data_2b0
    .packed-switch 0x0
        :pswitch_1e1
        :pswitch_4f
        :pswitch_4f
        :pswitch_1e5
        :pswitch_1e9
        :pswitch_1ec
        :pswitch_1ef
        :pswitch_1f2
        :pswitch_1f5
        :pswitch_1f9
        :pswitch_1fd
        :pswitch_201
        :pswitch_205
        :pswitch_208
        :pswitch_20b
        :pswitch_20e
        :pswitch_212
        :pswitch_216
        :pswitch_219
        :pswitch_21c
        :pswitch_21f
        :pswitch_222
        :pswitch_225
        :pswitch_229
        :pswitch_22d
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
    .end packed-switch
.end method

.method private parseFindBugsBug(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 14
    .param p1, "n"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v9, 0x0

    .line 76
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 77
    .local v6, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .line 78
    .local v0, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const-string v10, "category"

    invoke-interface {v0, v10}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v10

    const-string v11, "SECURITY"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7d

    .line 79
    const-string v10, "Class"

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/owasp/benchmark/score/parsers/FindbugsReader;->getNamedNode(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 80
    .local v2, "cl":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v10

    const-string v11, "classname"

    invoke-interface {v10, v11}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, "classname":Ljava/lang/String;
    const/16 v10, 0x2e

    invoke-virtual {v3, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v3, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 82
    const-string v10, "BenchmarkTest"

    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_59

    .line 84
    :try_start_48
    const-string v10, "BenchmarkTest"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v3, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 85
    .local v7, "testNumber":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v6, v10}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_59} :catch_7a

    .line 92
    .end local v7    # "testNumber":Ljava/lang/String;
    :cond_59
    const-string v9, "cweid"

    invoke-interface {v0, v9}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 93
    .local v4, "cwenode":Lorg/w3c/dom/Node;
    const-string v9, "abbrev"

    invoke-interface {v0, v9}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 94
    .local v1, "catnode":Lorg/w3c/dom/Node;
    invoke-static {v6, v4, v1}, Lorg/owasp/benchmark/score/parsers/FindbugsReader;->figureCWE(Lorg/owasp/benchmark/score/parsers/TestCaseResult;Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)I

    move-result v9

    invoke-virtual {v6, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 96
    const-string v9, "type"

    invoke-interface {v0, v9}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    .line 97
    .local v8, "type":Ljava/lang/String;
    invoke-virtual {v6, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 101
    .end local v1    # "catnode":Lorg/w3c/dom/Node;
    .end local v2    # "cl":Lorg/w3c/dom/Node;
    .end local v3    # "classname":Ljava/lang/String;
    .end local v4    # "cwenode":Lorg/w3c/dom/Node;
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v8    # "type":Ljava/lang/String;
    :goto_79
    return-object v6

    .line 86
    .restart local v2    # "cl":Lorg/w3c/dom/Node;
    .restart local v3    # "classname":Ljava/lang/String;
    .restart local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catch_7a
    move-exception v5

    .local v5, "e":Ljava/lang/Exception;
    move-object v6, v9

    .line 88
    goto :goto_79

    .end local v2    # "cl":Lorg/w3c/dom/Node;
    .end local v3    # "classname":Ljava/lang/String;
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_7d
    move-object v6, v9

    .line 101
    goto :goto_79
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
    .line 39
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 41
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v11, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v12, 0x1

    invoke-virtual {v2, v11, v12}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 42
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 43
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v4, Lorg/xml/sax/InputSource;

    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v11}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 44
    .local v4, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 46
    .local v0, "doc":Lorg/w3c/dom/Document;
    new-instance v9, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v11, "FindBugs"

    const/4 v12, 0x0

    sget-object v13, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v9, v11, v12, v13}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 49
    .local v9, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-virtual {v9, p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 52
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v7

    .line 53
    .local v7, "root":Lorg/w3c/dom/Node;
    const-string v11, "version"

    invoke-static {v11, v7}, Lorg/owasp/benchmark/score/parsers/FindbugsReader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v10

    .line 54
    .local v10, "version":Ljava/lang/String;
    invoke-virtual {v9, v10}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 57
    const-string v11, "2"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    const-string v12, "3.0"

    invoke-virtual {v10, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    or-int/2addr v11, v12

    if-nez v11, :cond_4a

    .line 58
    const-string v11, "SpotBugs"

    invoke-virtual {v9, v11}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    .line 61
    :cond_4a
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    .line 62
    .local v6, "nl":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_4f
    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v11

    if-ge v3, v11, :cond_71

    .line 63
    invoke-interface {v6, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    .line 64
    .local v5, "n":Lorg/w3c/dom/Node;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "BugInstance"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6e

    .line 65
    invoke-direct {p0, v5}, Lorg/owasp/benchmark/score/parsers/FindbugsReader;->parseFindBugsBug(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v8

    .line 66
    .local v8, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v8, :cond_6e

    .line 67
    invoke-virtual {v9, v8}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 62
    .end local v8    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_4f

    .line 72
    .end local v5    # "n":Lorg/w3c/dom/Node;
    :cond_71
    return-object v9
.end method
