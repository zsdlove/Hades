.class public Lorg/owasp/benchmark/score/parsers/TestCaseResult;
.super Ljava/lang/Object;
.source "TestCaseResult.java"


# instance fields
.field private CWE:I

.field private category:Ljava/lang/String;

.field private confidence:I

.field private dataflow:Ljava/lang/String;

.field private dataflowfile:Ljava/lang/String;

.field private evidence:Ljava/lang/String;

.field private number:I

.field private real:Z

.field private result:Z

.field private sink:Ljava/lang/String;

.field private source:Ljava/lang/String;

.field private testCaseName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->testCaseName:Ljava/lang/String;

    .line 28
    iput v2, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->number:I

    .line 29
    iput-boolean v2, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->real:Z

    .line 30
    iput-boolean v2, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->result:Z

    .line 31
    iput v2, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->CWE:I

    .line 32
    iput-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->category:Ljava/lang/String;

    .line 33
    iput-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->evidence:Ljava/lang/String;

    .line 34
    iput v2, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->confidence:I

    .line 37
    iput-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->source:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->dataflow:Ljava/lang/String;

    .line 39
    iput-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->dataflowfile:Ljava/lang/String;

    .line 40
    iput-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->sink:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCWE()I
    .registers 2

    .prologue
    .line 91
    iget v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->CWE:I

    return v0
.end method

.method public getCategory()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->category:Ljava/lang/String;

    return-object v0
.end method

.method public getConfidence()I
    .registers 2

    .prologue
    .line 59
    iget v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->confidence:I

    return v0
.end method

.method public getDataFlow()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->dataflow:Ljava/lang/String;

    return-object v0
.end method

.method public getDataFlowFile()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->dataflowfile:Ljava/lang/String;

    return-object v0
.end method

.method public getEvidence()Ljava/lang/String;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->evidence:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->testCaseName:Ljava/lang/String;

    return-object v0
.end method

.method public getNumber()I
    .registers 2

    .prologue
    .line 67
    iget v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->number:I

    return v0
.end method

.method public getSink()Ljava/lang/String;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->sink:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->source:Ljava/lang/String;

    return-object v0
.end method

.method public isPassed()Z
    .registers 2

    .prologue
    .line 83
    iget-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->result:Z

    return v0
.end method

.method public isReal()Z
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->real:Z

    return v0
.end method

.method public setCWE(I)V
    .registers 2
    .param p1, "cwe"    # I

    .prologue
    .line 95
    iput p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->CWE:I

    .line 96
    return-void
.end method

.method public setCategory(Ljava/lang/String;)V
    .registers 2
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->category:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setConfidence(I)V
    .registers 2
    .param p1, "confidence"    # I

    .prologue
    .line 63
    iput p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->confidence:I

    .line 64
    return-void
.end method

.method public setDataFlow(Ljava/lang/String;)V
    .registers 2
    .param p1, "dataflow"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->dataflow:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setDataFlowFile(Ljava/lang/String;)V
    .registers 2
    .param p1, "dataflowfile"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->dataflowfile:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setEvidence(Ljava/lang/String;)V
    .registers 2
    .param p1, "evidence"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->evidence:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setNumber(I)V
    .registers 2
    .param p1, "number"    # I

    .prologue
    .line 71
    iput p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->number:I

    .line 72
    return-void
.end method

.method public setPassed(Z)V
    .registers 2
    .param p1, "result"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->result:Z

    .line 88
    return-void
.end method

.method public setReal(Z)V
    .registers 2
    .param p1, "real"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->real:Z

    .line 80
    return-void
.end method

.method public setSink(Ljava/lang/String;)V
    .registers 2
    .param p1, "sink"    # Ljava/lang/String;

    .prologue
    .line 143
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->sink:Ljava/lang/String;

    .line 144
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .registers 2
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 119
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->source:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setTestCaseName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->testCaseName:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCategory()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isPassed()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getEvidence()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getConfidence()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
