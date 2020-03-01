.class public Lorg/owasp/benchmark/score/parsers/QualysWASReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "QualysWASReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private parseQualysVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 10
    .param p1, "issue"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v7, 0x0

    .line 97
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 98
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v6, "QID"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "cwe":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->translate_cwe(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 101
    const-string v6, "QID"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "name":Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->translate_name(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 103
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->translate_name(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 105
    const-string v6, "URL"

    invoke-static {v6, p1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v4

    .line 110
    .local v4, "testcase":Ljava/lang/String;
    const/16 v6, 0x2f

    invoke-virtual {v4, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 111
    const-string v6, "\\."

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    aget-object v4, v6, v7

    .line 112
    const-string v6, "\\?"

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    aget-object v4, v6, v7

    .line 114
    const-string v6, "BenchmarkTest"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_74

    .line 115
    const-string v6, "BenchmarkTest"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 117
    .local v5, "testno":Ljava/lang/String;
    :try_start_67
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V
    :try_end_6e
    .catch Ljava/lang/NumberFormatException; {:try_start_67 .. :try_end_6e} :catch_6f

    .line 123
    .end local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v5    # "testno":Ljava/lang/String;
    :goto_6e
    return-object v3

    .line 118
    .restart local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v5    # "testno":Ljava/lang/String;
    :catch_6f
    move-exception v1

    .line 119
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_6e

    .line 123
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v5    # "testno":Ljava/lang/String;
    :cond_74
    const/4 v3, 0x0

    goto :goto_6e
.end method

.method private translate_cwe(Ljava/lang/String;)I
    .registers 8
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x304

    const/16 v1, 0x59

    const/4 v4, -0x1

    const/16 v0, 0x4f

    const/16 v2, 0x270f

    .line 127
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_248

    :cond_10
    move v5, v4

    :goto_11
    packed-switch v5, :pswitch_data_2de

    .line 166
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v0, v4

    .line 167
    :goto_2d
    :pswitch_2d
    return v0

    .line 127
    :sswitch_2e
    const-string v5, "150001"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x0

    goto :goto_11

    :sswitch_38
    const-string v5, "150003"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x1

    goto :goto_11

    :sswitch_42
    const-string v5, "150009"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x2

    goto :goto_11

    :sswitch_4c
    const-string v5, "150010"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x3

    goto :goto_11

    :sswitch_56
    const-string v5, "150012"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x4

    goto :goto_11

    :sswitch_60
    const-string v5, "150018"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x5

    goto :goto_11

    :sswitch_6a
    const-string v5, "150021"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x6

    goto :goto_11

    :sswitch_74
    const-string v5, "150022"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/4 v5, 0x7

    goto :goto_11

    :sswitch_7e
    const-string v5, "150028"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x8

    goto :goto_11

    :sswitch_89
    const-string v5, "150033"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x9

    goto/16 :goto_11

    :sswitch_95
    const-string v5, "150042"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0xa

    goto/16 :goto_11

    :sswitch_a1
    const-string v5, "150046"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0xb

    goto/16 :goto_11

    :sswitch_ad
    const-string v5, "150054"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0xc

    goto/16 :goto_11

    :sswitch_b9
    const-string v5, "150055"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0xd

    goto/16 :goto_11

    :sswitch_c5
    const-string v5, "150079"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0xe

    goto/16 :goto_11

    :sswitch_d1
    const-string v5, "150081"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0xf

    goto/16 :goto_11

    :sswitch_dd
    const-string v5, "150084"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x10

    goto/16 :goto_11

    :sswitch_e9
    const-string v5, "150085"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x11

    goto/16 :goto_11

    :sswitch_f5
    const-string v5, "150086"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x12

    goto/16 :goto_11

    :sswitch_101
    const-string v5, "150104"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x13

    goto/16 :goto_11

    :sswitch_10d
    const-string v5, "150115"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x14

    goto/16 :goto_11

    :sswitch_119
    const-string v5, "150122"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x15

    goto/16 :goto_11

    :sswitch_125
    const-string v5, "150123"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x16

    goto/16 :goto_11

    :sswitch_131
    const-string v5, "150124"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x17

    goto/16 :goto_11

    :sswitch_13d
    const-string v5, "150126"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x18

    goto/16 :goto_11

    :sswitch_149
    const-string v5, "150135"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x19

    goto/16 :goto_11

    :sswitch_155
    const-string v5, "150148"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x1a

    goto/16 :goto_11

    :sswitch_161
    const-string v5, "150152"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x1b

    goto/16 :goto_11

    :sswitch_16d
    const-string v5, "150162"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x1c

    goto/16 :goto_11

    :sswitch_179
    const-string v5, "150172"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x1d

    goto/16 :goto_11

    :sswitch_185
    const-string v5, "150176"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x1e

    goto/16 :goto_11

    :sswitch_191
    const-string v5, "150202"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x1f

    goto/16 :goto_11

    :sswitch_19d
    const-string v5, "150204"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x20

    goto/16 :goto_11

    :sswitch_1a9
    const-string v5, "150205"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x21

    goto/16 :goto_11

    :sswitch_1b5
    const-string v5, "150206"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x22

    goto/16 :goto_11

    :sswitch_1c1
    const-string v5, "150251"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x23

    goto/16 :goto_11

    :sswitch_1cd
    const-string v5, "123456"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const/16 v5, 0x24

    goto/16 :goto_11

    :pswitch_1d9
    move v0, v1

    .line 129
    goto/16 :goto_2d

    :pswitch_1dc
    move v0, v2

    .line 130
    goto/16 :goto_2d

    :pswitch_1df
    move v0, v2

    .line 131
    goto/16 :goto_2d

    :pswitch_1e2
    move v0, v1

    .line 132
    goto/16 :goto_2d

    :pswitch_1e5
    move v0, v2

    .line 133
    goto/16 :goto_2d

    :pswitch_1e8
    move v0, v2

    .line 134
    goto/16 :goto_2d

    .line 135
    :pswitch_1eb
    const/16 v0, 0xd1

    goto/16 :goto_2d

    :pswitch_1ef
    move v0, v2

    .line 136
    goto/16 :goto_2d

    :pswitch_1f2
    move v0, v2

    .line 137
    goto/16 :goto_2d

    :pswitch_1f5
    move v0, v2

    .line 138
    goto/16 :goto_2d

    :pswitch_1f8
    move v0, v2

    .line 140
    goto/16 :goto_2d

    .line 141
    :pswitch_1fb
    const/16 v0, 0x4e

    goto/16 :goto_2d

    :pswitch_1ff
    move v0, v3

    .line 142
    goto/16 :goto_2d

    .line 143
    :pswitch_202
    const/16 v0, 0x2b5

    goto/16 :goto_2d

    :pswitch_206
    move v0, v3

    .line 145
    goto/16 :goto_2d

    :pswitch_209
    move v0, v2

    .line 146
    goto/16 :goto_2d

    :pswitch_20c
    move v0, v2

    .line 147
    goto/16 :goto_2d

    :pswitch_20f
    move v0, v2

    .line 148
    goto/16 :goto_2d

    .line 149
    :pswitch_212
    const/16 v0, 0x266

    goto/16 :goto_2d

    .line 150
    :pswitch_216
    const/16 v0, 0x3ec

    goto/16 :goto_2d

    .line 151
    :pswitch_21a
    const/16 v0, 0x1c3

    goto/16 :goto_2d

    :pswitch_21e
    move v0, v2

    .line 152
    goto/16 :goto_2d

    :pswitch_221
    move v0, v2

    .line 153
    goto/16 :goto_2d

    :pswitch_224
    move v0, v2

    .line 154
    goto/16 :goto_2d

    :pswitch_227
    move v0, v2

    .line 155
    goto/16 :goto_2d

    .line 156
    :pswitch_22a
    const/16 v0, 0x3a9

    goto/16 :goto_2d

    :pswitch_22e
    move v0, v2

    .line 157
    goto/16 :goto_2d

    :pswitch_231
    move v0, v2

    .line 158
    goto/16 :goto_2d

    :pswitch_234
    move v0, v2

    .line 159
    goto/16 :goto_2d

    :pswitch_237
    move v0, v2

    .line 160
    goto/16 :goto_2d

    :pswitch_23a
    move v0, v2

    .line 161
    goto/16 :goto_2d

    :pswitch_23d
    move v0, v2

    .line 162
    goto/16 :goto_2d

    .line 163
    :pswitch_240
    const/16 v0, 0x283

    goto/16 :goto_2d

    .line 164
    :pswitch_244
    const/16 v0, 0x1a0a

    goto/16 :goto_2d

    .line 127
    :sswitch_data_248
    .sparse-switch
        0x56760663 -> :sswitch_1cd
        0x569ee025 -> :sswitch_2e
        0x569ee027 -> :sswitch_38
        0x569ee02d -> :sswitch_42
        0x569ee043 -> :sswitch_4c
        0x569ee045 -> :sswitch_56
        0x569ee04b -> :sswitch_60
        0x569ee063 -> :sswitch_6a
        0x569ee064 -> :sswitch_74
        0x569ee06a -> :sswitch_7e
        0x569ee084 -> :sswitch_89
        0x569ee0a2 -> :sswitch_95
        0x569ee0a6 -> :sswitch_a1
        0x569ee0c3 -> :sswitch_ad
        0x569ee0c4 -> :sswitch_b9
        0x569ee106 -> :sswitch_c5
        0x569ee11d -> :sswitch_d1
        0x569ee120 -> :sswitch_dd
        0x569ee121 -> :sswitch_e9
        0x569ee122 -> :sswitch_f5
        0x569ee3e9 -> :sswitch_101
        0x569ee409 -> :sswitch_10d
        0x569ee425 -> :sswitch_119
        0x569ee426 -> :sswitch_125
        0x569ee427 -> :sswitch_131
        0x569ee429 -> :sswitch_13d
        0x569ee447 -> :sswitch_149
        0x569ee469 -> :sswitch_155
        0x569ee482 -> :sswitch_161
        0x569ee4a1 -> :sswitch_16d
        0x569ee4c0 -> :sswitch_179
        0x569ee4c4 -> :sswitch_185
        0x569ee7a8 -> :sswitch_191
        0x569ee7aa -> :sswitch_19d
        0x569ee7ab -> :sswitch_1a9
        0x569ee7ac -> :sswitch_1b5
        0x569ee842 -> :sswitch_1c1
    .end sparse-switch

    :pswitch_data_2de
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_1d9
        :pswitch_1dc
        :pswitch_1df
        :pswitch_1e2
        :pswitch_1e5
        :pswitch_1e8
        :pswitch_1eb
        :pswitch_1ef
        :pswitch_1f2
        :pswitch_1f5
        :pswitch_2d
        :pswitch_1f8
        :pswitch_1fb
        :pswitch_1ff
        :pswitch_202
        :pswitch_2d
        :pswitch_206
        :pswitch_209
        :pswitch_20c
        :pswitch_20f
        :pswitch_212
        :pswitch_216
        :pswitch_21a
        :pswitch_21e
        :pswitch_221
        :pswitch_224
        :pswitch_227
        :pswitch_22a
        :pswitch_22e
        :pswitch_231
        :pswitch_234
        :pswitch_237
        :pswitch_23a
        :pswitch_23d
        :pswitch_240
        :pswitch_244
    .end packed-switch
.end method

.method private translate_name(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 174
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_254

    :cond_8
    :goto_8
    packed-switch v0, :pswitch_data_2e6

    .line 212
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 213
    .end local p1    # "id":Ljava/lang/String;
    :goto_23
    return-object p1

    .line 174
    .restart local p1    # "id":Ljava/lang/String;
    :sswitch_24
    const-string v1, "150001"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x0

    goto :goto_8

    :sswitch_2e
    const-string v1, "150003"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x1

    goto :goto_8

    :sswitch_38
    const-string v1, "150009"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x2

    goto :goto_8

    :sswitch_42
    const-string v1, "150010"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x3

    goto :goto_8

    :sswitch_4c
    const-string v1, "150012"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x4

    goto :goto_8

    :sswitch_56
    const-string v1, "150018"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x5

    goto :goto_8

    :sswitch_60
    const-string v1, "150021"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x6

    goto :goto_8

    :sswitch_6a
    const-string v1, "150022"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x7

    goto :goto_8

    :sswitch_74
    const-string v1, "150028"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x8

    goto :goto_8

    :sswitch_7f
    const-string v1, "150033"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x9

    goto/16 :goto_8

    :sswitch_8b
    const-string v1, "150042"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xa

    goto/16 :goto_8

    :sswitch_97
    const-string v1, "150046"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xb

    goto/16 :goto_8

    :sswitch_a3
    const-string v1, "150054"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xc

    goto/16 :goto_8

    :sswitch_af
    const-string v1, "150055"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xd

    goto/16 :goto_8

    :sswitch_bb
    const-string v1, "150079"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xe

    goto/16 :goto_8

    :sswitch_c7
    const-string v1, "150081"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xf

    goto/16 :goto_8

    :sswitch_d3
    const-string v1, "150084"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x10

    goto/16 :goto_8

    :sswitch_df
    const-string v1, "150085"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x11

    goto/16 :goto_8

    :sswitch_eb
    const-string v1, "150086"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x12

    goto/16 :goto_8

    :sswitch_f7
    const-string v1, "150104"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x13

    goto/16 :goto_8

    :sswitch_103
    const-string v1, "150115"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x14

    goto/16 :goto_8

    :sswitch_10f
    const-string v1, "150122"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x15

    goto/16 :goto_8

    :sswitch_11b
    const-string v1, "150123"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x16

    goto/16 :goto_8

    :sswitch_127
    const-string v1, "150124"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x17

    goto/16 :goto_8

    :sswitch_133
    const-string v1, "150126"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x18

    goto/16 :goto_8

    :sswitch_13f
    const-string v1, "150135"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x19

    goto/16 :goto_8

    :sswitch_14b
    const-string v1, "150148"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x1a

    goto/16 :goto_8

    :sswitch_157
    const-string v1, "150152"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x1b

    goto/16 :goto_8

    :sswitch_163
    const-string v1, "150162"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x1c

    goto/16 :goto_8

    :sswitch_16f
    const-string v1, "150172"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x1d

    goto/16 :goto_8

    :sswitch_17b
    const-string v1, "150176"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x1e

    goto/16 :goto_8

    :sswitch_187
    const-string v1, "150202"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x1f

    goto/16 :goto_8

    :sswitch_193
    const-string v1, "150204"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x20

    goto/16 :goto_8

    :sswitch_19f
    const-string v1, "150205"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x21

    goto/16 :goto_8

    :sswitch_1ab
    const-string v1, "150206"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x22

    goto/16 :goto_8

    :sswitch_1b7
    const-string v1, "150251"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x23

    goto/16 :goto_8

    .line 175
    :pswitch_1c3
    const-string p1, "Reflected Cross-Site Scripting (XSS) Vulnerabilities"

    goto/16 :goto_23

    .line 176
    :pswitch_1c7
    const-string p1, "SQL Injection"

    goto/16 :goto_23

    .line 177
    :pswitch_1cb
    const-string p1, "Links Crawled"

    goto/16 :goto_23

    .line 178
    :pswitch_1cf
    const-string p1, "External Links Discovered"

    goto/16 :goto_23

    .line 179
    :pswitch_1d3
    const-string p1, "Blind SQL Injection"

    goto/16 :goto_23

    .line 180
    :pswitch_1d7
    const-string p1, "Connection Error Occurred During Web Application Scan"

    goto/16 :goto_23

    .line 181
    :pswitch_1db
    const-string p1, "Scan Diagnostics"

    goto/16 :goto_23

    .line 182
    :pswitch_1df
    const-string p1, "Verbose Error Message"

    goto/16 :goto_23

    .line 183
    :pswitch_1e3
    const-string p1, "Cookies Collected"

    goto/16 :goto_23

    .line 184
    :pswitch_1e7
    const-string p1, "Credit Card Number Pattern Identified In HTML"

    goto/16 :goto_23

    .line 185
    :pswitch_1eb
    const-string p1, "Server Returns HTTP 500 Message For Request"

    goto/16 :goto_23

    .line 186
    :pswitch_1ef
    const-string p1, "Reflected Cross-Site Scripting (XSS) in HTTP Header"

    goto/16 :goto_23

    .line 187
    :pswitch_1f3
    const-string p1, "Email Addresses Collected"

    goto/16 :goto_23

    .line 188
    :pswitch_1f7
    const-string p1, "PHP Command Injection"

    goto/16 :goto_23

    .line 189
    :pswitch_1fb
    const-string p1, "Slow HTTP headers vulnerability"

    goto/16 :goto_23

    .line 190
    :pswitch_1ff
    const-string p1, "X-Frame-Options header is not set"

    goto/16 :goto_23

    .line 191
    :pswitch_203
    const-string p1, "Unencoded characters "

    goto/16 :goto_23

    .line 192
    :pswitch_207
    const-string p1, "Slow HTTP POST vulnerability"

    goto/16 :goto_23

    .line 193
    :pswitch_20b
    const-string p1, "Server accepts unnecessarily large POST request body"

    goto/16 :goto_23

    .line 194
    :pswitch_20f
    const-string p1, "Form Contains Email Address Field"

    goto/16 :goto_23

    .line 195
    :pswitch_213
    const-string p1, "Authentication Form found"

    goto/16 :goto_23

    .line 196
    :pswitch_217
    const-string p1, "Cookie Does Not Contain The secure Attribute"

    goto/16 :goto_23

    .line 197
    :pswitch_21b
    const-string p1, "Cookie Does Not Contain The HTTPOnly Attribute"

    goto/16 :goto_23

    .line 198
    :pswitch_21f
    const-string p1, "Clickjacking - Framable Page"

    goto/16 :goto_23

    .line 199
    :pswitch_223
    const-string p1, "Links With High Resource Consumption"

    goto/16 :goto_23

    .line 200
    :pswitch_227
    const-string p1, "HTTP Strict Transport Security (HSTS) header missing/misconfigured."

    goto/16 :goto_23

    .line 201
    :pswitch_22b
    const-string p1, "AJAX Links Crawled"

    goto/16 :goto_23

    .line 202
    :pswitch_22f
    const-string p1, "Forms Crawled"

    goto/16 :goto_23

    .line 203
    :pswitch_233
    const-string p1, "Use of JavaScript Library with Known Vulnerability"

    goto/16 :goto_23

    .line 204
    :pswitch_237
    const-string p1, "Requests Crawled"

    goto/16 :goto_23

    .line 205
    :pswitch_23b
    const-string p1, "JavaScript Libraries Detected"

    goto/16 :goto_23

    .line 206
    :pswitch_23f
    const-string p1, "Missing header: X-Content-Type-Options"

    goto/16 :goto_23

    .line 207
    :pswitch_243
    const-string p1, "Missing header: X-XSS-Protection"

    goto/16 :goto_23

    .line 208
    :pswitch_247
    const-string p1, "Misconfigured header: X-XSS-Protection"

    goto/16 :goto_23

    .line 209
    :pswitch_24b
    const-string p1, "Content-Security-Policy Not Implemented"

    goto/16 :goto_23

    .line 210
    :pswitch_24f
    const-string p1, "Blind XPath Injection"

    goto/16 :goto_23

    .line 174
    nop

    :sswitch_data_254
    .sparse-switch
        0x569ee025 -> :sswitch_24
        0x569ee027 -> :sswitch_2e
        0x569ee02d -> :sswitch_38
        0x569ee043 -> :sswitch_42
        0x569ee045 -> :sswitch_4c
        0x569ee04b -> :sswitch_56
        0x569ee063 -> :sswitch_60
        0x569ee064 -> :sswitch_6a
        0x569ee06a -> :sswitch_74
        0x569ee084 -> :sswitch_7f
        0x569ee0a2 -> :sswitch_8b
        0x569ee0a6 -> :sswitch_97
        0x569ee0c3 -> :sswitch_a3
        0x569ee0c4 -> :sswitch_af
        0x569ee106 -> :sswitch_bb
        0x569ee11d -> :sswitch_c7
        0x569ee120 -> :sswitch_d3
        0x569ee121 -> :sswitch_df
        0x569ee122 -> :sswitch_eb
        0x569ee3e9 -> :sswitch_f7
        0x569ee409 -> :sswitch_103
        0x569ee425 -> :sswitch_10f
        0x569ee426 -> :sswitch_11b
        0x569ee427 -> :sswitch_127
        0x569ee429 -> :sswitch_133
        0x569ee447 -> :sswitch_13f
        0x569ee469 -> :sswitch_14b
        0x569ee482 -> :sswitch_157
        0x569ee4a1 -> :sswitch_163
        0x569ee4c0 -> :sswitch_16f
        0x569ee4c4 -> :sswitch_17b
        0x569ee7a8 -> :sswitch_187
        0x569ee7aa -> :sswitch_193
        0x569ee7ab -> :sswitch_19f
        0x569ee7ac -> :sswitch_1ab
        0x569ee842 -> :sswitch_1b7
    .end sparse-switch

    :pswitch_data_2e6
    .packed-switch 0x0
        :pswitch_1c3
        :pswitch_1c7
        :pswitch_1cb
        :pswitch_1cf
        :pswitch_1d3
        :pswitch_1d7
        :pswitch_1db
        :pswitch_1df
        :pswitch_1e3
        :pswitch_1e7
        :pswitch_1eb
        :pswitch_1ef
        :pswitch_1f3
        :pswitch_1f7
        :pswitch_1fb
        :pswitch_1ff
        :pswitch_203
        :pswitch_207
        :pswitch_20b
        :pswitch_20f
        :pswitch_213
        :pswitch_217
        :pswitch_21b
        :pswitch_21f
        :pswitch_223
        :pswitch_227
        :pswitch_22b
        :pswitch_22f
        :pswitch_233
        :pswitch_237
        :pswitch_23b
        :pswitch_23f
        :pswitch_243
        :pswitch_247
        :pswitch_24b
        :pswitch_24f
    .end packed-switch
.end method


# virtual methods
.method public parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 15
    .param p1, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v7, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v10, "Qualys WAS"

    const/4 v11, 0x1

    sget-object v12, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v7, v10, v11, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 51
    .local v7, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v10, "APPENDIX"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v0

    .line 52
    .local v0, "appendix":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v10, "SCAN_LIST"

    invoke-static {v10, v0}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    .line 53
    .local v5, "scanList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v10, "SCAN"

    invoke-static {v10, v5}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 55
    .local v4, "scan":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v11, "PROFILE"

    const/4 v10, 0x0

    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/w3c/dom/Node;

    invoke-static {v11, v10}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v8

    .line 56
    .local v8, "version":Ljava/lang/String;
    invoke-virtual {v7, v8}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 83
    const-string v10, "RESULTS"

    invoke-static {v10, p1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v3

    .line 84
    .local v3, "resultsList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v10, "VULNERABILITY_LIST"

    invoke-static {v10, v3}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v9

    .line 85
    .local v9, "vulnerabilityList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v10, "VULNERABILITY"

    invoke-static {v10, v9}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->getNamedChildren(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 87
    .local v2, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_46
    :goto_46
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5c

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Node;

    .line 88
    .local v1, "issue":Lorg/w3c/dom/Node;
    invoke-direct {p0, v1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->parseQualysVulnerability(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v6

    .line 89
    .local v6, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v6, :cond_46

    .line 90
    invoke-virtual {v7, v6}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_46

    .line 93
    .end local v1    # "issue":Lorg/w3c/dom/Node;
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_5c
    return-object v7
.end method
