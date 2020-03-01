.class public Lorg/owasp/benchmark/helpers/ExpressionEvaluator;
.super Ljavax/servlet/jsp/el/ExpressionEvaluator;
.source "ExpressionEvaluator.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljavax/servlet/jsp/el/ExpressionEvaluator;-><init>()V

    return-void
.end method

.method public static evaluateEL(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 3
    .param p0, "expression"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public evaluate(Ljava/lang/String;Ljava/lang/Class;Ljavax/servlet/jsp/el/VariableResolver;Ljavax/servlet/jsp/el/FunctionMapper;)Ljava/lang/Object;
    .registers 6
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Class;
    .param p3, "arg2"    # Ljavax/servlet/jsp/el/VariableResolver;
    .param p4, "arg3"    # Ljavax/servlet/jsp/el/FunctionMapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/el/ELException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return-object v0
.end method

.method public parseExpression(Ljava/lang/String;Ljava/lang/Class;Ljavax/servlet/jsp/el/FunctionMapper;)Ljavax/servlet/jsp/el/Expression;
    .registers 5
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Class;
    .param p3, "arg2"    # Ljavax/servlet/jsp/el/FunctionMapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/el/ELException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x0

    return-object v0
.end method
