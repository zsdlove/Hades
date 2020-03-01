.class public Lorg/owasp/benchmark/score/parsers/OverallResult;
.super Ljava/lang/Object;
.source "OverallResult.java"


# instance fields
.field public final category:Ljava/lang/String;

.field public final falsePositiveRate:D

.field public final score:D

.field public final total:I

.field public final truePositiveRate:D


# direct methods
.method public constructor <init>(Ljava/lang/String;DDID)V
    .registers 9
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "tpr"    # D
    .param p4, "fpr"    # D
    .param p6, "total"    # I
    .param p7, "score"    # D

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/OverallResult;->category:Ljava/lang/String;

    .line 38
    iput-wide p2, p0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    .line 39
    iput-wide p4, p0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    .line 40
    iput p6, p0, Lorg/owasp/benchmark/score/parsers/OverallResult;->total:I

    .line 41
    iput-wide p7, p0, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    .line 42
    return-void
.end method
