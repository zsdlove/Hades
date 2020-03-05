.class public Lcom/moresc/cn/base;
.super Ljava/lang/Object;
.source "base.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getHttpRequests()Ljava/lang/String;
    .registers 2

    .prologue
    .line 5
    const-string v0, "requests"

    return-object v0
.end method

.method public responseToClient(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 8
    const-string v0, "response"

    return-object v0
.end method
