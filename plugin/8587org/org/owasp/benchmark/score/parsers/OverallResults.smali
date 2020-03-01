.class public Lorg/owasp/benchmark/score/parsers/OverallResults;
.super Ljava/lang/Object;
.source "OverallResults.java"


# instance fields
.field private FPRate:D

.field private TPRate:D

.field private findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/OverallResult;",
            ">;"
        }
    .end annotation
.end field

.field private score:D

.field private time:Ljava/lang/String;

.field private total:I


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const-wide/16 v2, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->map:Ljava/util/Map;

    .line 34
    iput-wide v2, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->score:D

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->total:I

    .line 38
    iput-wide v2, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->TPRate:D

    .line 39
    iput-wide v2, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->FPRate:D

    .line 43
    const-string v0, "Unknown"

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->time:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;DDID)V
    .registers 19
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "tpr"    # D
    .param p4, "fpr"    # D
    .param p6, "total"    # I
    .param p7, "score"    # D

    .prologue
    .line 46
    new-instance v0, Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move/from16 v6, p6

    move-wide/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResult;-><init>(Ljava/lang/String;DDID)V

    .line 47
    .local v0, "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->map:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    return-void
.end method

.method public getCategories()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getFalsePositiveRate()D
    .registers 3

    .prologue
    .line 106
    iget-wide v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->FPRate:D

    return-wide v0
.end method

.method public getFindingCounts()Lorg/owasp/benchmark/score/parsers/Counter;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

    return-object v0
.end method

.method public getResults()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/owasp/benchmark/score/parsers/OverallResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;
    .registers 3
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 56
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/owasp/benchmark/score/parsers/OverallResult;

    return-object v0
.end method

.method public getScore()D
    .registers 3

    .prologue
    .line 76
    iget-wide v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->score:D

    return-wide v0
.end method

.method public getTime()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->time:Ljava/lang/String;

    return-object v0
.end method

.method public getTotal()I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->total:I

    return v0
.end method

.method public getTruePositiveRate()D
    .registers 3

    .prologue
    .line 91
    iget-wide v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->TPRate:D

    return-wide v0
.end method

.method public setFalsePositiveRate(D)V
    .registers 4
    .param p1, "rate"    # D

    .prologue
    .line 113
    iput-wide p1, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->FPRate:D

    .line 114
    return-void
.end method

.method public setFindingCounts(IIII)V
    .registers 6
    .param p1, "tp"    # I
    .param p2, "fp"    # I
    .param p3, "fn"    # I
    .param p4, "tn"    # I

    .prologue
    .line 149
    new-instance v0, Lorg/owasp/benchmark/score/parsers/Counter;

    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/Counter;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

    .line 150
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

    iput p1, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    .line 151
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

    iput p2, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    .line 152
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

    iput p3, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    .line 153
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->findingCounts:Lorg/owasp/benchmark/score/parsers/Counter;

    iput p4, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    .line 154
    return-void
.end method

.method public setScore(D)V
    .registers 4
    .param p1, "score"    # D

    .prologue
    .line 83
    iput-wide p1, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->score:D

    .line 84
    return-void
.end method

.method public setTime(Ljava/lang/String;)V
    .registers 2
    .param p1, "elapsed"    # Ljava/lang/String;

    .prologue
    .line 145
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->time:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setTotal(I)V
    .registers 2
    .param p1, "total"    # I

    .prologue
    .line 129
    iput p1, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->total:I

    .line 130
    return-void
.end method

.method public setTruePositiveRate(D)V
    .registers 4
    .param p1, "rate"    # D

    .prologue
    .line 98
    iput-wide p1, p0, Lorg/owasp/benchmark/score/parsers/OverallResults;->TPRate:D

    .line 99
    return-void
.end method
