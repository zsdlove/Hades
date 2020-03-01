.class public Lorg/owasp/benchmark/score/parsers/XanitizerReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "XanitizerReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    .line 35
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)I
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-static {p0}, Lorg/owasp/benchmark/score/parsers/XanitizerReader;->figureCWE(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private static figureCWE(Ljava/lang/String;)I
    .registers 4
    .param p0, "problemTypeId"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 171
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_b4

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_e6

    .line 208
    :goto_c
    return v0

    .line 171
    :sswitch_d
    const-string v2, "ci:CommandInjection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "SpecialMethodCall:WeakEncryption"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "SpecialMethodCall:WeakHash"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "ci:LDAPInjection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v2, "pt:PathTraversal"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v2, "cook:UnsecuredCookie"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_49
    const-string v2, "ci:SQLInjection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x6

    goto :goto_9

    :sswitch_53
    const-string v2, "tbv:TrustBoundaryViolationSession"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x7

    goto :goto_9

    :sswitch_5d
    const-string v2, "SpecialMethodCall:java.util.Random"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x8

    goto :goto_9

    :sswitch_68
    const-string v2, "ci:XPathInjection"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x9

    goto :goto_9

    :sswitch_73
    const-string v2, "xss:XSSFromRequest"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xa

    goto :goto_9

    :sswitch_7e
    const-string v2, "xss:XSSFromDb"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xb

    goto :goto_9

    .line 173
    :pswitch_89
    const/16 v0, 0x4e

    goto :goto_c

    .line 176
    :pswitch_8c
    const/16 v0, 0x147

    goto/16 :goto_c

    .line 179
    :pswitch_90
    const/16 v0, 0x148

    goto/16 :goto_c

    .line 182
    :pswitch_94
    const/16 v0, 0x5a

    goto/16 :goto_c

    .line 185
    :pswitch_98
    const/16 v0, 0x16

    goto/16 :goto_c

    .line 188
    :pswitch_9c
    const/16 v0, 0x266

    goto/16 :goto_c

    .line 191
    :pswitch_a0
    const/16 v0, 0x59

    goto/16 :goto_c

    .line 194
    :pswitch_a4
    const/16 v0, 0x1f5

    goto/16 :goto_c

    .line 197
    :pswitch_a8
    const/16 v0, 0x14a

    goto/16 :goto_c

    .line 200
    :pswitch_ac
    const/16 v0, 0x283

    goto/16 :goto_c

    .line 204
    :pswitch_b0
    const/16 v0, 0x4f

    goto/16 :goto_c

    .line 171
    :sswitch_data_b4
    .sparse-switch
        -0x583f2a58 -> :sswitch_21
        -0x3aa1ff24 -> :sswitch_2b
        -0x384d0782 -> :sswitch_7e
        -0x64bca9b -> :sswitch_5d
        -0x3606580 -> :sswitch_d
        0x11e05d5d -> :sswitch_49
        0x3087c89d -> :sswitch_17
        0x308f868f -> :sswitch_73
        0x3dc28a46 -> :sswitch_3f
        0x4fbf4c21 -> :sswitch_53
        0x62cd3a4e -> :sswitch_68
        0x7f4d1303 -> :sswitch_35
    .end sparse-switch

    :pswitch_data_e6
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
        :pswitch_b0
    .end packed-switch
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 9
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 38
    new-instance v3, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v4, "Xanitizer"

    sget-object v5, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v3, v4, v6, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 39
    .local v3, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-virtual {v3, p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 45
    new-instance v1, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;

    invoke-direct {v1, p0, v3}, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;-><init>(Lorg/owasp/benchmark/score/parsers/XanitizerReader;Lorg/owasp/benchmark/score/parsers/TestResults;)V

    .line 161
    .local v1, "handler":Lorg/xml/sax/helpers/DefaultHandler;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    .line 162
    .local v0, "factory":Ljavax/xml/parsers/SAXParserFactory;
    const-string v4, "http://javax.xml.XMLConstants/feature/secure-processing"

    invoke-virtual {v0, v4, v6}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 163
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 165
    .local v2, "saxParser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v2, p1, v1}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/File;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 167
    return-object v3
.end method
