.class public Lorg/owasp/benchmark/helpers/Startup;
.super Ljava/lang/Object;
.source "Startup.java"

# interfaces
.implements Ljavax/servlet/ServletContextListener;


# annotations
.annotation runtime Ljavax/servlet/annotation/WebListener;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contextDestroyed(Ljavax/servlet/ServletContextEvent;)V
    .registers 2
    .param p1, "sce"    # Ljavax/servlet/ServletContextEvent;

    .prologue
    .line 22
    return-void
.end method

.method public contextInitialized(Ljavax/servlet/ServletContextEvent;)V
    .registers 5
    .param p1, "sce"    # Ljavax/servlet/ServletContextEvent;

    .prologue
    .line 12
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Initializing benchmark"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    :try_start_7
    const-string v1, "org.owasp.benchmark.helpers.DatabaseHelper"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_c} :catch_d

    .line 18
    :goto_c
    return-void

    .line 15
    :catch_d
    move-exception v0

    .line 16
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_c
.end method
