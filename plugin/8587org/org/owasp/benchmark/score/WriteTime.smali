.class public Lorg/owasp/benchmark/score/WriteTime;
.super Ljava/lang/Object;
.source "WriteTime.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 9
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 45
    const-string v2, ""

    .line 46
    .local v2, "toolName":Ljava/lang/String;
    const-string v0, ""

    .line 47
    .local v0, "csvToolName":Ljava/lang/String;
    array-length v5, p0

    if-ge v5, v6, :cond_4a

    .line 48
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "Please provide the name of the tool.\nCurrently supported: PMD (pmd), FindBugs (findbugs), FindSecBugs (findbugs), SonarQube (sonar), and SpotBugs (spotbugs)."

    invoke-virtual {v5, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    :goto_10
    new-instance v1, Lorg/owasp/benchmark/helpers/PropertiesManager;

    invoke-direct {v1}, Lorg/owasp/benchmark/helpers/PropertiesManager;-><init>()V

    .line 56
    .local v1, "propM":Lorg/owasp/benchmark/helpers/PropertiesManager;
    new-instance v3, Lorg/owasp/benchmark/score/WriteFiles;

    invoke-direct {v3}, Lorg/owasp/benchmark/score/WriteFiles;-><init>()V

    .line 57
    .local v3, "wf":Lorg/owasp/benchmark/score/WriteFiles;
    const-string v5, "sonar"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 59
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/WriteFiles;->writeSonarResults()V

    .line 62
    :cond_25
    const/4 v5, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_c8

    :cond_2d
    move v4, v5

    :goto_2e
    packed-switch v4, :pswitch_data_e2

    .line 78
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not one of the supported tools for mvn validate -Ptime, provided by score/WriteTime.java"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 93
    :goto_49
    return-void

    .line 51
    .end local v1    # "propM":Lorg/owasp/benchmark/helpers/PropertiesManager;
    .end local v3    # "wf":Lorg/owasp/benchmark/score/WriteFiles;
    :cond_4a
    aget-object v2, p0, v4

    goto :goto_10

    .line 62
    .restart local v1    # "propM":Lorg/owasp/benchmark/helpers/PropertiesManager;
    .restart local v3    # "wf":Lorg/owasp/benchmark/score/WriteFiles;
    :sswitch_4d
    const-string v6, "crawler"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2d

    goto :goto_2e

    :sswitch_56
    const-string v4, "findbugs"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    move v4, v6

    goto :goto_2e

    :sswitch_60
    const-string v4, "findsecbugs"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    const/4 v4, 0x2

    goto :goto_2e

    :sswitch_6a
    const-string v4, "spotbugs"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    const/4 v4, 0x3

    goto :goto_2e

    :sswitch_74
    const-string v4, "pmd"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    const/4 v4, 0x4

    goto :goto_2e

    :sswitch_7e
    const-string v4, "sonar"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    const/4 v4, 0x5

    goto :goto_2e

    .line 64
    :pswitch_88
    const-string v0, "exec-maven-plugin:java"

    .line 83
    :goto_8a
    invoke-virtual {v3, v0}, Lorg/owasp/benchmark/score/WriteFiles;->getToolTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lorg/owasp/benchmark/helpers/PropertiesManager;->saveProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string v4, "benchmark-version"

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/WriteFiles;->getbenchmarkVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/owasp/benchmark/helpers/PropertiesManager;->saveProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    invoke-virtual {v3, v2}, Lorg/owasp/benchmark/score/WriteFiles;->getVersionNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "benchmark-version"

    const-string v6, ""

    .line 88
    invoke-virtual {v1, v5, v6}, Lorg/owasp/benchmark/helpers/PropertiesManager;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 87
    invoke-virtual {v3, v2, v4, v5}, Lorg/owasp/benchmark/score/WriteFiles;->deletePreviousResults(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    const-string v4, "benchmark-version"

    const-string v5, ""

    .line 91
    invoke-virtual {v1, v4, v5}, Lorg/owasp/benchmark/helpers/PropertiesManager;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    .line 92
    invoke-virtual {v1, v2, v5}, Lorg/owasp/benchmark/helpers/PropertiesManager;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2}, Lorg/owasp/benchmark/score/WriteFiles;->getVersionNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 90
    invoke-virtual {v3, v2, v4, v5, v6}, Lorg/owasp/benchmark/score/WriteFiles;->resultsFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_49

    .line 69
    :pswitch_bf
    const-string v0, "findbugs"

    .line 70
    goto :goto_8a

    .line 72
    :pswitch_c2
    const-string v0, "pmd"

    .line 73
    goto :goto_8a

    .line 75
    :pswitch_c5
    const-string v0, "sonar"

    .line 76
    goto :goto_8a

    .line 62
    :sswitch_data_c8
    .sparse-switch
        -0x6d24077f -> :sswitch_6a
        -0x28753e48 -> :sswitch_56
        0x1b207 -> :sswitch_74
        0x688ad43 -> :sswitch_7e
        0x3d200314 -> :sswitch_4d
        0x44035477 -> :sswitch_60
    .end sparse-switch

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_88
        :pswitch_bf
        :pswitch_bf
        :pswitch_bf
        :pswitch_c2
        :pswitch_c5
    .end packed-switch
.end method
