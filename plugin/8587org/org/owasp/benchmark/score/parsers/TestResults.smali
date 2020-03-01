.class public Lorg/owasp/benchmark/score/parsers/TestResults;
.super Ljava/lang/Object;
.source "TestResults.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    }
.end annotation


# static fields
.field private static nextCommercialDAST_ToolNumber:I

.field private static nextCommercialIAST_ToolNumber:I

.field private static nextCommercialSAST_ToolNumber:I


# instance fields
.field private anonymous:Z

.field private benchmarkVersion:Ljava/lang/String;

.field public final isCommercial:Z

.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/score/parsers/TestCaseResult;",
            ">;>;"
        }
    .end annotation
.end field

.field private time:Ljava/lang/String;

.field private toolName:Ljava/lang/String;

.field public final toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field private toolVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x1

    .line 46
    sput v0, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialSAST_ToolNumber:I

    .line 47
    sput v0, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialDAST_ToolNumber:I

    .line 48
    sput v0, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialIAST_ToolNumber:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V
    .registers 5
    .param p1, "toolname"    # Ljava/lang/String;
    .param p2, "isCommercial"    # Z
    .param p3, "toolType"    # Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-string v0, "notSet"

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->benchmarkVersion:Ljava/lang/String;

    .line 53
    const-string v0, "Unknown Tool"

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolName:Ljava/lang/String;

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolVersion:Ljava/lang/String;

    .line 55
    const-string v0, "Unknown"

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->time:Ljava/lang/String;

    .line 58
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->map:Ljava/util/Map;

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->anonymous:Z

    .line 64
    invoke-virtual {p0, p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    .line 65
    iput-boolean p2, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->isCommercial:Z

    .line 66
    iput-object p3, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 67
    return-void
.end method

.method public static formatTime(J)Ljava/lang/String;
    .registers 14
    .param p0, "millis"    # J

    .prologue
    .line 216
    const-wide/16 v10, 0x0

    cmp-long v7, p0, v10

    if-gez v7, :cond_e

    .line 218
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v10, "Duration must be greater than zero!"

    invoke-direct {v7, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 221
    :cond_e
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, p0, p1}, Ljava/util/concurrent/TimeUnit;->toDays(J)J

    move-result-wide v0

    .line 222
    .local v0, "days":J
    sget-object v7, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v10

    sub-long/2addr p0, v10

    .line 223
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, p0, p1}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v2

    .line 224
    .local v2, "hours":J
    sget-object v7, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v10

    sub-long/2addr p0, v10

    .line 225
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v4

    .line 226
    .local v4, "minutes":J
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v10

    sub-long/2addr p0, v10

    .line 227
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, p0, p1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v8

    .line 229
    .local v8, "seconds":J
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x40

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 230
    .local v6, "sb":Ljava/lang/StringBuilder;
    const-wide/16 v10, 0x0

    cmp-long v7, v0, v10

    if-lez v7, :cond_56

    .line 231
    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 232
    const-wide/16 v10, 0x1

    cmp-long v7, v0, v10

    if-lez v7, :cond_7a

    .line 233
    const-string v7, " Days "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    :cond_56
    :goto_56
    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 237
    const-wide/16 v10, 0x9

    cmp-long v7, v4, v10

    if-lez v7, :cond_80

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    :goto_64
    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 239
    const-wide/16 v10, 0x9

    cmp-long v7, v8, v10

    if-lez v7, :cond_86

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    :goto_72
    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 242
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 234
    :cond_7a
    const-string v7, " Day "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_56

    .line 237
    :cond_80
    const-string v7, ":0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_64

    .line 239
    :cond_86
    const-string v7, ":0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_72
.end method

.method public static formatTime(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "millis"    # Ljava/lang/String;

    .prologue
    .line 254
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 255
    .local v2, "time":J
    invoke-static {v2, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    .line 260
    .local v1, "result":Ljava/lang/String;
    return-object v1

    .line 256
    .end local v1    # "result":Ljava/lang/String;
    .end local v2    # "time":J
    :catch_d
    move-exception v0

    .line 257
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Provided value must be in integer in milliseconds. Value was: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public get(I)Ljava/util/List;
    .registers 4
    .param p1, "tn"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/score/parsers/TestCaseResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->map:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getBenchmarkVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->benchmarkVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getShortName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolName:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()Ljava/lang/String;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->time:Ljava/lang/String;

    return-object v0
.end method

.method public getTool()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolName:Ljava/lang/String;

    return-object v0
.end method

.method public getToolNameAndVersion()Ljava/lang/String;
    .registers 3

    .prologue
    .line 117
    iget-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->anonymous:Z

    if-nez v0, :cond_36

    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolVersion:Ljava/lang/String;

    if-eqz v0, :cond_36

    const-string v0, ""

    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    sget-boolean v0, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    if-eqz v0, :cond_1a

    iget-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->isCommercial:Z

    if-nez v0, :cond_36

    .line 119
    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " v"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 121
    :goto_35
    return-object v0

    :cond_36
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolName:Ljava/lang/String;

    goto :goto_35
.end method

.method public getToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-object v0
.end method

.method public getToolVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolVersion:Ljava/lang/String;

    return-object v0
.end method

.method public isCommercial()Z
    .registers 2

    .prologue
    .line 83
    iget-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->isCommercial:Z

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    .registers 5
    .param p1, "tcr"    # Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .prologue
    .line 87
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->map:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 88
    .local v0, "results":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    if-nez v0, :cond_24

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "results":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .restart local v0    # "results":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    iget-object v1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->map:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_24
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    return-void
.end method

.method public setAnonymous()V
    .registers 4

    .prologue
    const/16 v2, 0xa

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->anonymous:Z

    .line 144
    sget-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$1;->$SwitchMap$org$owasp$benchmark$score$parsers$TestResults$ToolType:[I

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-result-object v1

    invoke-virtual {v1}, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_d2

    .line 163
    :goto_14
    return-void

    .line 146
    :pswitch_15
    sget v0, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialSAST_ToolNumber:I

    if-ge v0, v2, :cond_36

    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SAST-0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialSAST_ToolNumber:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialSAST_ToolNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto :goto_14

    .line 148
    :cond_36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SAST-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialSAST_ToolNumber:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialSAST_ToolNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto :goto_14

    .line 152
    :pswitch_53
    sget v0, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialDAST_ToolNumber:I

    if-ge v0, v2, :cond_74

    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DAST-0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialDAST_ToolNumber:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialDAST_ToolNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto :goto_14

    .line 154
    :cond_74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DAST-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialDAST_ToolNumber:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialDAST_ToolNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto :goto_14

    .line 158
    :pswitch_91
    sget v0, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialIAST_ToolNumber:I

    if-ge v0, v2, :cond_b3

    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IAST-0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialIAST_ToolNumber:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialIAST_ToolNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto/16 :goto_14

    .line 160
    :cond_b3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IAST-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialIAST_ToolNumber:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/owasp/benchmark/score/parsers/TestResults;->nextCommercialIAST_ToolNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto/16 :goto_14

    .line 144
    nop

    :pswitch_data_d2
    .packed-switch 0x1
        :pswitch_15
        :pswitch_53
        :pswitch_91
    .end packed-switch
.end method

.method public setBenchmarkVersion(Ljava/lang/String;)V
    .registers 2
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->benchmarkVersion:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setFortifyTime(Ljava/io/File;)V
    .registers 9
    .param p1, "f"    # Ljava/io/File;

    .prologue
    const/16 v6, 0x2e

    .line 193
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 195
    .local v1, "filename":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 196
    const/16 v4, 0x2d

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 198
    .local v3, "time":Ljava/lang/String;
    :try_start_21
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 199
    .local v2, "seconds":I
    mul-int/lit16 v4, v2, 0x3e8

    int-to-long v4, v4

    invoke-static {v4, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_2f} :catch_30

    .line 203
    .end local v2    # "seconds":I
    :goto_2f
    return-void

    .line 200
    :catch_30
    move-exception v0

    .line 201
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Time not specified"

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    goto :goto_2f
.end method

.method public setTime(Ljava/io/File;)V
    .registers 8
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 178
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "filename":Ljava/lang/String;
    const/16 v4, 0x2d

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    const/16 v5, 0x2e

    invoke-virtual {v1, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 181
    .local v3, "time":Ljava/lang/String;
    :try_start_16
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 182
    .local v2, "seconds":I
    mul-int/lit16 v4, v2, 0x3e8

    int-to-long v4, v4

    invoke-static {v4, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->formatTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_24} :catch_25

    .line 186
    .end local v2    # "seconds":I
    :goto_24
    return-void

    .line 183
    :catch_25
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Time not specified"

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/lang/String;)V

    goto :goto_24
.end method

.method public setTime(Ljava/lang/String;)V
    .registers 2
    .param p1, "elapsed"    # Ljava/lang/String;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->time:Ljava/lang/String;

    .line 175
    return-void
.end method

.method public setTool(Ljava/lang/String;)V
    .registers 2
    .param p1, "toolName"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolName:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setToolVersion(Ljava/lang/String;)V
    .registers 2
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 166
    iput-object p1, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->toolVersion:Ljava/lang/String;

    .line 167
    return-void
.end method

.method public totalResults()I
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/TestResults;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
