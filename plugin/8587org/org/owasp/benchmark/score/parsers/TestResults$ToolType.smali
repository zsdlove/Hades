.class public final enum Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
.super Ljava/lang/Enum;
.source "TestResults.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/owasp/benchmark/score/parsers/TestResults;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ToolType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field public static final enum DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field public static final enum Hybrid:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field public static final enum IAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field public static final enum SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-instance v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    const-string v1, "SAST"

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 41
    new-instance v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    const-string v1, "DAST"

    invoke-direct {v0, v1, v3}, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 42
    new-instance v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    const-string v1, "IAST"

    invoke-direct {v0, v1, v4}, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->IAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 43
    new-instance v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    const-string v1, "Hybrid"

    invoke-direct {v0, v1, v5}, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->Hybrid:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 39
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    sget-object v1, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->DAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->IAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->Hybrid:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->$VALUES:[Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    const-class v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-object v0
.end method

.method public static values()[Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->$VALUES:[Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-virtual {v0}, [Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-object v0
.end method
