.class public Lorg/owasp/benchmark/helpers/Thing2;
.super Ljava/lang/Object;
.source "Thing2.java"

# interfaces
.implements Lorg/owasp/benchmark/helpers/ThingInterface;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doSomething(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "i"    # Ljava/lang/String;

    .prologue
    .line 25
    if-nez p1, :cond_5

    const-string v0, ""

    .line 27
    :goto_4
    return-object v0

    .line 26
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 27
    .local v0, "r":Ljava/lang/String;
    goto :goto_4
.end method
