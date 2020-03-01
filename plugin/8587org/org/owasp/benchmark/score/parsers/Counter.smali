.class public Lorg/owasp/benchmark/score/parsers/Counter;
.super Ljava/lang/Object;
.source "Counter.java"


# instance fields
.field public fn:I

.field public fp:I

.field public tn:I

.field public tp:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput v0, p0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    .line 24
    iput v0, p0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    .line 25
    iput v0, p0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    .line 26
    iput v0, p0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    return-void
.end method
