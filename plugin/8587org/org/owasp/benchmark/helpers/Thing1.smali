.class public Lorg/owasp/benchmark/helpers/Thing1;
.super Ljava/lang/Object;
.source "Thing1.java"

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
    .registers 3
    .param p1, "i"    # Ljava/lang/String;

    .prologue
    .line 26
    move-object v0, p1

    .line 27
    .local v0, "r":Ljava/lang/String;
    return-object v0
.end method
