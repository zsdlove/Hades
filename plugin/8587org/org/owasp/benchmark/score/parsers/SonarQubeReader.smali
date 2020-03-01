.class public Lorg/owasp/benchmark/score/parsers/SonarQubeReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "SonarQubeReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method public static cweLookup(Ljava/lang/String;)I
    .registers 5
    .param p0, "squidNumber"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x147

    const/4 v2, -0x1

    const/4 v0, 0x0

    .line 119
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_2a4

    :cond_b
    move v3, v2

    :goto_c
    packed-switch v3, :pswitch_data_35a

    move v0, v2

    .line 167
    :goto_10
    :pswitch_10
    return v0

    .line 119
    :sswitch_11
    const-string v3, "S00105"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v3, v0

    goto :goto_c

    :sswitch_1b
    const-string v3, "S106"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x1

    goto :goto_c

    :sswitch_25
    const-string v3, "S00112"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x2

    goto :goto_c

    :sswitch_2f
    const-string v3, "S00121"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x3

    goto :goto_c

    :sswitch_39
    const-string v3, "S1132"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x4

    goto :goto_c

    :sswitch_43
    const-string v3, "S1143"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x5

    goto :goto_c

    :sswitch_4d
    const-string v3, "S1145"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x6

    goto :goto_c

    :sswitch_57
    const-string v3, "S1147"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x7

    goto :goto_c

    :sswitch_61
    const-string v3, "S1174"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x8

    goto :goto_c

    :sswitch_6c
    const-string v3, "S1181"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x9

    goto :goto_c

    :sswitch_77
    const-string v3, "S1182"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0xa

    goto :goto_c

    :sswitch_82
    const-string v3, "S1206"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0xb

    goto :goto_c

    :sswitch_8d
    const-string v3, "S1217"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0xc

    goto/16 :goto_c

    :sswitch_99
    const-string v3, "S128"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0xd

    goto/16 :goto_c

    :sswitch_a5
    const-string v3, "S1481"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0xe

    goto/16 :goto_c

    :sswitch_b1
    const-string v3, "S1444"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0xf

    goto/16 :goto_c

    :sswitch_bd
    const-string v3, "S1696"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x10

    goto/16 :goto_c

    :sswitch_c9
    const-string v3, "S1698"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x11

    goto/16 :goto_c

    :sswitch_d5
    const-string v3, "S1724"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x12

    goto/16 :goto_c

    :sswitch_e1
    const-string v3, "S1850"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x13

    goto/16 :goto_c

    :sswitch_ed
    const-string v3, "S1872"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x14

    goto/16 :goto_c

    :sswitch_f9
    const-string v3, "S1873"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x15

    goto/16 :goto_c

    :sswitch_105
    const-string v3, "S1948"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x16

    goto/16 :goto_c

    :sswitch_111
    const-string v3, "S2068"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x17

    goto/16 :goto_c

    :sswitch_11d
    const-string v3, "S2070"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x18

    goto/16 :goto_c

    :sswitch_129
    const-string v3, "S2076"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x19

    goto/16 :goto_c

    :sswitch_135
    const-string v3, "S2077"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x1a

    goto/16 :goto_c

    :sswitch_141
    const-string v3, "S2078"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x1b

    goto/16 :goto_c

    :sswitch_14d
    const-string v3, "S2089"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x1c

    goto/16 :goto_c

    :sswitch_159
    const-string v3, "S2092"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x1d

    goto/16 :goto_c

    :sswitch_165
    const-string v3, "S2095"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x1e

    goto/16 :goto_c

    :sswitch_171
    const-string v3, "S2184"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x1f

    goto/16 :goto_c

    :sswitch_17d
    const-string v3, "S2222"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x20

    goto/16 :goto_c

    :sswitch_189
    const-string v3, "S2225"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x21

    goto/16 :goto_c

    :sswitch_195
    const-string v3, "S2245"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x22

    goto/16 :goto_c

    :sswitch_1a1
    const-string v3, "S2254"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x23

    goto/16 :goto_c

    :sswitch_1ad
    const-string v3, "S2257"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x24

    goto/16 :goto_c

    :sswitch_1b9
    const-string v3, "S2259"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x25

    goto/16 :goto_c

    :sswitch_1c5
    const-string v3, "S2277"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x26

    goto/16 :goto_c

    :sswitch_1d1
    const-string v3, "S2278"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x27

    goto/16 :goto_c

    :sswitch_1dd
    const-string v3, "S2384"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x28

    goto/16 :goto_c

    :sswitch_1e9
    const-string v3, "S2441"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x29

    goto/16 :goto_c

    :sswitch_1f5
    const-string v3, "S2583"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x2a

    goto/16 :goto_c

    :sswitch_201
    const-string v3, "S864"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x2b

    goto/16 :goto_c

    :sswitch_20d
    const-string v3, "S888"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/16 v3, 0x2c

    goto/16 :goto_c

    .line 122
    :pswitch_219
    const/16 v0, 0x18d

    goto/16 :goto_10

    .line 123
    :pswitch_21d
    const/16 v0, 0x1e3

    goto/16 :goto_10

    .line 125
    :pswitch_221
    const/16 v0, 0x248

    goto/16 :goto_10

    .line 127
    :pswitch_225
    const/16 v0, 0x17e

    goto/16 :goto_10

    .line 128
    :pswitch_229
    const/16 v0, 0x247

    goto/16 :goto_10

    .line 129
    :pswitch_22d
    const/16 v0, 0x18c

    goto/16 :goto_10

    .line 130
    :pswitch_231
    const/16 v0, 0x244

    goto/16 :goto_10

    .line 131
    :pswitch_235
    const/16 v0, 0x245

    goto/16 :goto_10

    .line 132
    :pswitch_239
    const/16 v0, 0x23c

    goto/16 :goto_10

    .line 133
    :pswitch_23d
    const/16 v0, 0x1e4

    goto/16 :goto_10

    .line 135
    :pswitch_241
    const/16 v0, 0x1f4

    goto/16 :goto_10

    .line 136
    :pswitch_245
    const/16 v0, 0x18b

    goto/16 :goto_10

    .line 137
    :pswitch_249
    const/16 v0, 0x253

    goto/16 :goto_10

    .line 140
    :pswitch_24d
    const/16 v0, 0x1e6

    goto/16 :goto_10

    .line 141
    :pswitch_251
    const/16 v0, 0x246

    goto/16 :goto_10

    .line 142
    :pswitch_255
    const/16 v0, 0x252

    goto/16 :goto_10

    .line 143
    :pswitch_259
    const/16 v0, 0x103

    goto/16 :goto_10

    .line 144
    :pswitch_25d
    const/16 v0, 0x148

    goto/16 :goto_10

    .line 145
    :pswitch_261
    const/16 v0, 0x4e

    goto/16 :goto_10

    .line 146
    :pswitch_265
    const/16 v0, 0x59

    goto/16 :goto_10

    .line 147
    :pswitch_269
    const/16 v0, 0x5a

    goto/16 :goto_10

    .line 148
    :pswitch_26d
    const/16 v0, 0x125

    goto/16 :goto_10

    .line 149
    :pswitch_271
    const/16 v0, 0x266

    goto/16 :goto_10

    .line 150
    :pswitch_275
    const/16 v0, 0x1cb

    goto/16 :goto_10

    .line 151
    :pswitch_279
    const/16 v0, 0xbe

    goto/16 :goto_10

    .line 154
    :pswitch_27d
    const/16 v0, 0x14a

    goto/16 :goto_10

    :pswitch_281
    move v0, v1

    .line 156
    goto/16 :goto_10

    .line 157
    :pswitch_284
    const/16 v0, 0x1dc

    goto/16 :goto_10

    .line 158
    :pswitch_288
    const/16 v0, 0x30c

    goto/16 :goto_10

    :pswitch_28c
    move v0, v1

    .line 159
    goto/16 :goto_10

    .line 160
    :pswitch_28f
    const/16 v0, 0x176

    goto/16 :goto_10

    .line 161
    :pswitch_293
    const/16 v0, 0x243

    goto/16 :goto_10

    .line 162
    :pswitch_297
    const/16 v0, 0x1e9

    goto/16 :goto_10

    .line 163
    :pswitch_29b
    const/16 v0, 0x30f

    goto/16 :goto_10

    .line 164
    :pswitch_29f
    const/16 v0, 0x343

    goto/16 :goto_10

    .line 119
    nop

    :sswitch_data_2a4
    .sparse-switch
        -0x6fa2cc7d -> :sswitch_11
        -0x6fa2cc61 -> :sswitch_25
        -0x6fa2cc43 -> :sswitch_2f
        0x2678c4 -> :sswitch_1b
        0x267904 -> :sswitch_99
        0x2693c3 -> :sswitch_201
        0x269405 -> :sswitch_20d
        0x4a8a352 -> :sswitch_39
        0x4a8a372 -> :sswitch_43
        0x4a8a374 -> :sswitch_4d
        0x4a8a376 -> :sswitch_57
        0x4a8a3d0 -> :sswitch_61
        0x4a8a3ec -> :sswitch_6c
        0x4a8a3ed -> :sswitch_77
        0x4a8a6ba -> :sswitch_82
        0x4a8a6da -> :sswitch_8d
        0x4a8aeb6 -> :sswitch_b1
        0x4a8af2f -> :sswitch_a5
        0x4a8b6d5 -> :sswitch_bd
        0x4a8b6d7 -> :sswitch_c9
        0x4a8b9bb -> :sswitch_d5
        0x4a8bdd5 -> :sswitch_e1
        0x4a8be15 -> :sswitch_ed
        0x4a8be16 -> :sswitch_f9
        0x4a8c17f -> :sswitch_105
        0x4a91453 -> :sswitch_111
        0x4a9146a -> :sswitch_11d
        0x4a91470 -> :sswitch_129
        0x4a91471 -> :sswitch_135
        0x4a91472 -> :sswitch_141
        0x4a91492 -> :sswitch_14d
        0x4a914aa -> :sswitch_159
        0x4a914ad -> :sswitch_165
        0x4a9184e -> :sswitch_171
        0x4a91b53 -> :sswitch_17d
        0x4a91b56 -> :sswitch_189
        0x4a91b94 -> :sswitch_195
        0x4a91bb2 -> :sswitch_1a1
        0x4a91bb5 -> :sswitch_1ad
        0x4a91bb7 -> :sswitch_1b9
        0x4a91bf3 -> :sswitch_1c5
        0x4a91bf4 -> :sswitch_1d1
        0x4a91fd0 -> :sswitch_1dd
        0x4a92312 -> :sswitch_1e9
        0x4a92751 -> :sswitch_1f5
    .end sparse-switch

    :pswitch_data_35a
    .packed-switch 0x0
        :pswitch_10
        :pswitch_10
        :pswitch_219
        :pswitch_21d
        :pswitch_10
        :pswitch_221
        :pswitch_10
        :pswitch_225
        :pswitch_229
        :pswitch_22d
        :pswitch_231
        :pswitch_235
        :pswitch_239
        :pswitch_23d
        :pswitch_10
        :pswitch_241
        :pswitch_245
        :pswitch_249
        :pswitch_10
        :pswitch_10
        :pswitch_24d
        :pswitch_251
        :pswitch_255
        :pswitch_259
        :pswitch_25d
        :pswitch_261
        :pswitch_265
        :pswitch_269
        :pswitch_26d
        :pswitch_271
        :pswitch_275
        :pswitch_279
        :pswitch_10
        :pswitch_10
        :pswitch_27d
        :pswitch_10
        :pswitch_281
        :pswitch_284
        :pswitch_288
        :pswitch_28c
        :pswitch_28f
        :pswitch_293
        :pswitch_297
        :pswitch_29b
        :pswitch_29f
    .end packed-switch
.end method

.method private parseSonarIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 9
    .param p1, "flaw"    # Lorg/w3c/dom/Node;

    .prologue
    .line 67
    new-instance v2, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 68
    .local v2, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const-string v5, "rule"

    invoke-static {v5, p1}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "rule":Ljava/lang/String;
    const-string v5, "squid:"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->cweLookup(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 71
    const-string v5, "message"

    invoke-static {v5, p1}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "cat":Ljava/lang/String;
    invoke-virtual {v2, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 74
    const/4 v5, 0x5

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setConfidence(I)V

    .line 76
    invoke-virtual {v2, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V

    .line 78
    const-string v5, "component"

    invoke-static {v5, p1}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->getNamedChild(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 79
    .local v3, "testfile":Ljava/lang/String;
    const/16 v5, 0x2f

    invoke-virtual {v3, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 80
    const-string v5, "BenchmarkTest\\d+.java"

    invoke-virtual {v3, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 81
    const-string v5, "BenchmarkTest"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x5

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, "testno":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 85
    .end local v2    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v4    # "testno":Ljava/lang/String;
    :goto_6d
    return-object v2

    .restart local v2    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_6e
    const/4 v2, 0x0

    goto :goto_6d
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
    .line 38
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    .line 40
    .local v3, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v11, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v12, 0x1

    invoke-virtual {v3, v11, v12}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 41
    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v2

    .line 42
    .local v2, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {p1}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v11

    invoke-static {v11}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v0

    .line 43
    .local v0, "bytes":[B
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "<sonar>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    const-string v13, "UTF-8"

    invoke-direct {v12, v0, v13}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "</sonar>"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 44
    .local v4, "fixed":Ljava/lang/String;
    new-instance v6, Lorg/xml/sax/InputSource;

    new-instance v11, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v11}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 45
    .local v6, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v2, v6}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 47
    .local v1, "doc":Lorg/w3c/dom/Document;
    new-instance v10, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v11, "SonarQube Java Plugin"

    const/4 v12, 0x0

    sget-object v13, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v10, v11, v12, v13}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 51
    .local v10, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-virtual {v10, p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 53
    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    .line 55
    .local v8, "rootList":Lorg/w3c/dom/NodeList;
    const-string v11, "issues"

    invoke-static {v11, v8}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->getNamedNodes(Ljava/lang/String;Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v7

    .line 57
    .local v7, "issueList":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_67
    :goto_67
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7d

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Node;

    .line 58
    .local v5, "flaw":Lorg/w3c/dom/Node;
    invoke-direct {p0, v5}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->parseSonarIssue(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v9

    .line 59
    .local v9, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v9, :cond_67

    .line 60
    invoke-virtual {v10, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    goto :goto_67

    .line 63
    .end local v5    # "flaw":Lorg/w3c/dom/Node;
    .end local v9    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_7d
    return-object v10
.end method
