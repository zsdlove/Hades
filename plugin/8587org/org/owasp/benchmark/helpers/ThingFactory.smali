.class public Lorg/owasp/benchmark/helpers/ThingFactory;
.super Ljava/lang/Object;
.source "ThingFactory.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createThing()Lorg/owasp/benchmark/helpers/ThingInterface;
    .registers 10

    .prologue
    .line 29
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 32
    .local v1, "props":Ljava/util/Properties;
    :try_start_5
    const-class v7, Lorg/owasp/benchmark/helpers/ThingFactory;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const-string v8, "thing.properties"

    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_10} :catch_2d

    move-result-object v5

    .local v5, "thingproperties":Ljava/io/InputStream;
    const/4 v9, 0x0

    .line 33
    if-nez v5, :cond_42

    .line 34
    :try_start_14
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "Can\'t find thing.properties"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 35
    new-instance v4, Lorg/owasp/benchmark/helpers/Thing2;

    invoke-direct {v4}, Lorg/owasp/benchmark/helpers/Thing2;-><init>()V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_20} :catch_83
    .catchall {:try_start_14 .. :try_end_20} :catchall_98

    .line 46
    if-eqz v5, :cond_27

    if-eqz v9, :cond_3e

    :try_start_24
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_27} :catch_28
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_27} :catch_2d

    .line 49
    .end local v5    # "thingproperties":Ljava/io/InputStream;
    :cond_27
    :goto_27
    return-object v4

    .line 46
    .restart local v5    # "thingproperties":Ljava/io/InputStream;
    :catch_28
    move-exception v7

    :try_start_29
    invoke-virtual {v9, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_2c} :catch_2d

    goto :goto_27

    .end local v5    # "thingproperties":Ljava/io/InputStream;
    :catch_2d
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Exception;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "Error constructing Thing."

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 48
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 49
    new-instance v4, Lorg/owasp/benchmark/helpers/Thing1;

    invoke-direct {v4}, Lorg/owasp/benchmark/helpers/Thing1;-><init>()V

    goto :goto_27

    .line 46
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v5    # "thingproperties":Ljava/io/InputStream;
    :cond_3e
    :try_start_3e
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_41} :catch_2d

    goto :goto_27

    .line 37
    :cond_42
    :try_start_42
    invoke-virtual {v1, v5}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 38
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "org.owasp.benchmark.helpers."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "thing"

    invoke-virtual {v1, v8}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 40
    .local v6, "which":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 41
    .local v2, "thing":Ljava/lang/Class;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v2, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 42
    .local v3, "thingConstructor":Ljava/lang/reflect/Constructor;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v3, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 44
    .local v4, "thingInstance":Ljava/lang/Object;
    check-cast v4, Lorg/owasp/benchmark/helpers/ThingInterface;
    :try_end_72
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_72} :catch_83
    .catchall {:try_start_42 .. :try_end_72} :catchall_98

    .line 46
    .end local v4    # "thingInstance":Ljava/lang/Object;
    if-eqz v5, :cond_27

    if-eqz v9, :cond_7f

    :try_start_76
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_79
    .catch Ljava/lang/Throwable; {:try_start_76 .. :try_end_79} :catch_7a
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_79} :catch_2d

    goto :goto_27

    :catch_7a
    move-exception v7

    :try_start_7b
    invoke-virtual {v9, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_27

    :cond_7f
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_82} :catch_2d

    goto :goto_27

    .line 32
    .end local v2    # "thing":Ljava/lang/Class;
    .end local v3    # "thingConstructor":Ljava/lang/reflect/Constructor;
    .end local v6    # "which":Ljava/lang/String;
    :catch_83
    move-exception v7

    :try_start_84
    throw v7
    :try_end_85
    .catchall {:try_start_84 .. :try_end_85} :catchall_85

    .line 46
    :catchall_85
    move-exception v8

    move-object v9, v7

    :goto_87
    if-eqz v5, :cond_8e

    if-eqz v9, :cond_94

    :try_start_8b
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_8e
    .catch Ljava/lang/Throwable; {:try_start_8b .. :try_end_8e} :catch_8f
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_8e} :catch_2d

    :cond_8e
    :goto_8e
    :try_start_8e
    throw v8

    :catch_8f
    move-exception v7

    invoke-virtual {v9, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_8e

    :cond_94
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_97
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_97} :catch_2d

    goto :goto_8e

    :catchall_98
    move-exception v7

    move-object v8, v7

    goto :goto_87
.end method
