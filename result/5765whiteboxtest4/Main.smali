.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 5
    new-instance v0, Lcom/moresc/cn/base;

    invoke-direct {v0}, Lcom/moresc/cn/base;-><init>()V

    .line 6
    invoke-virtual {v0}, Lcom/moresc/cn/base;->getHttpRequests()Ljava/lang/String;

    move-result-object v1

    .line 7
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Lcom/moresc/cn/base;->responseToClient(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 8
    return-void
.end method
