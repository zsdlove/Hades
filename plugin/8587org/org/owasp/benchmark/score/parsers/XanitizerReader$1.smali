.class Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "XanitizerReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/owasp/benchmark/score/parsers/XanitizerReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private m_CWE:I

.field private m_Class:Ljava/lang/String;

.field private m_Classification:Ljava/lang/String;

.field private final m_CollectedCharacters:Ljava/lang/StringBuilder;

.field private m_ProblemTypeId:Ljava/lang/String;

.field final synthetic this$0:Lorg/owasp/benchmark/score/parsers/XanitizerReader;

.field final synthetic val$tr:Lorg/owasp/benchmark/score/parsers/TestResults;


# direct methods
.method constructor <init>(Lorg/owasp/benchmark/score/parsers/XanitizerReader;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    .registers 4
    .param p1, "this$0"    # Lorg/owasp/benchmark/score/parsers/XanitizerReader;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->this$0:Lorg/owasp/benchmark/score/parsers/XanitizerReader;

    iput-object p2, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->val$tr:Lorg/owasp/benchmark/score/parsers/TestResults;

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 5
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 158
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v7, -0x1

    .line 79
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_ea

    :cond_b
    move v5, v7

    :goto_c
    packed-switch v5, :pswitch_data_100

    .line 151
    :goto_f
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 152
    return-void

    .line 79
    :sswitch_15
    const-string v5, "problemTypeId"

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    move v5, v6

    goto :goto_c

    :sswitch_1f
    const-string v5, "class"

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    const/4 v5, 0x1

    goto :goto_c

    :sswitch_29
    const-string v5, "classification"

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    const/4 v5, 0x2

    goto :goto_c

    :sswitch_33
    const-string v5, "cweNumber"

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    const/4 v5, 0x3

    goto :goto_c

    :sswitch_3d
    const-string v8, "finding"

    invoke-virtual {p3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    goto :goto_c

    .line 82
    :pswitch_46
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_ProblemTypeId:Ljava/lang/String;

    goto :goto_f

    .line 86
    :pswitch_4f
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Class:Ljava/lang/String;

    goto :goto_f

    .line 90
    :pswitch_58
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Classification:Ljava/lang/String;

    goto :goto_f

    .line 96
    :pswitch_61
    :try_start_61
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x4

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v8, "."

    const-string v9, ""

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    const-string v8, ","

    const-string v9, ""

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I
    :try_end_82
    .catch Ljava/lang/NumberFormatException; {:try_start_61 .. :try_end_82} :catch_83

    goto :goto_f

    .line 97
    :catch_83
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/NumberFormatException;
    iput v7, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I

    goto :goto_f

    .line 106
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :pswitch_87
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_ProblemTypeId:Ljava/lang/String;

    if-eqz v5, :cond_dc

    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Class:Ljava/lang/String;

    if-eqz v5, :cond_dc

    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Classification:Ljava/lang/String;

    if-eqz v5, :cond_dc

    .line 109
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Classification:Ljava/lang/String;

    const-string v8, "Information"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_dc

    .line 112
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Class:Ljava/lang/String;

    const-string v8, "BenchmarkTest"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_dc

    .line 114
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Class:Ljava/lang/String;

    const-string v8, "BenchmarkTest"

    .line 115
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, "testNumberAsString":Ljava/lang/String;
    :try_start_b3
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_b6
    .catch Ljava/lang/NumberFormatException; {:try_start_b3 .. :try_end_b6} :catch_e6

    move-result v3

    .line 127
    .local v3, "testCaseNumber":I
    :goto_b7
    iget v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I

    if-gez v5, :cond_c3

    .line 128
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_ProblemTypeId:Ljava/lang/String;

    # invokes: Lorg/owasp/benchmark/score/parsers/XanitizerReader;->figureCWE(Ljava/lang/String;)I
    invoke-static {v5}, Lorg/owasp/benchmark/score/parsers/XanitizerReader;->access$000(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I

    .line 131
    :cond_c3
    if-ltz v3, :cond_dc

    .line 132
    new-instance v2, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 134
    .local v2, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v2, v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 135
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_ProblemTypeId:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 136
    iget v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I

    invoke-virtual {v2, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 138
    iget-object v5, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->val$tr:Lorg/owasp/benchmark/score/parsers/TestResults;

    invoke-virtual {v5, v2}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 144
    .end local v2    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v3    # "testCaseNumber":I
    .end local v4    # "testNumberAsString":Ljava/lang/String;
    :cond_dc
    iput-object v9, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_ProblemTypeId:Ljava/lang/String;

    .line 145
    iput v7, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CWE:I

    .line 146
    iput-object v9, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Class:Ljava/lang/String;

    .line 147
    iput-object v9, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_Classification:Ljava/lang/String;

    goto/16 :goto_f

    .line 120
    .restart local v4    # "testNumberAsString":Ljava/lang/String;
    :catch_e6
    move-exception v1

    .line 122
    .local v1, "ex":Ljava/lang/NumberFormatException;
    const/4 v3, -0x1

    .restart local v3    # "testCaseNumber":I
    goto :goto_b7

    .line 79
    nop

    :sswitch_data_ea
    .sparse-switch
        -0x32da6477 -> :sswitch_3d
        0x5a5a978 -> :sswitch_1f
        0xab5f11a -> :sswitch_33
        0x16ca33e6 -> :sswitch_29
        0x7ea6ad74 -> :sswitch_15
    .end sparse-switch

    :pswitch_data_100
    .packed-switch 0x0
        :pswitch_46
        :pswitch_4f
        :pswitch_58
        :pswitch_61
        :pswitch_87
    .end packed-switch
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 9
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 58
    iget-object v2, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->m_CollectedCharacters:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 60
    const/4 v2, -0x1

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v3

    packed-switch v3, :pswitch_data_38

    :cond_e
    move v1, v2

    :goto_f
    packed-switch v1, :pswitch_data_3e

    .line 74
    :goto_12
    return-void

    .line 60
    :pswitch_13
    const-string v3, "XanitizerFindingsList"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    goto :goto_f

    .line 63
    :pswitch_1c
    const-string v1, "xanitizerVersionShort"

    invoke-interface {p4, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "version":Ljava/lang/String;
    if-nez v0, :cond_32

    .line 66
    const-string v1, "xanitizerVersion"

    invoke-interface {p4, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    const/16 v1, 0x2f

    const/16 v2, 0x2d

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 69
    :cond_32
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/XanitizerReader$1;->val$tr:Lorg/owasp/benchmark/score/parsers/TestResults;

    invoke-virtual {v1, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    goto :goto_12

    .line 60
    :pswitch_data_38
    .packed-switch 0x6a5844f6
        :pswitch_13
    .end packed-switch

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
