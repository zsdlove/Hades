.class final enum Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
.super Ljava/lang/Enum;
.source "HdivReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/owasp/benchmark/score/parsers/HdivReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/owasp/benchmark/score/parsers/HdivReader$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum CMD_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum HEADER_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum INSECURE_CIPHER:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum INSECURE_COOKIE:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum INSECURE_HASHING:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum LDAP_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum NO_HTTP_ONLY_COOKIE:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum PATH_TRAVERSAL:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum REFLECTION_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum SQL_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum STACKTRACE_LEAK:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum TRUST_BOUNDARY_VIOLATION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum WEAK_RANDOMNESS:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum XPATH_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

.field public static final enum XSS:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;


# instance fields
.field private final id:Ljava/lang/String;

.field private final number:I


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 122
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "CMD_INJECTION"

    const/16 v2, 0x4e

    invoke-direct {v0, v1, v5, v2}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->CMD_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 123
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "INSECURE_HASHING"

    const-string v2, "crypto-bad-mac"

    const/16 v3, 0x148

    invoke-direct {v0, v1, v6, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->INSECURE_HASHING:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 124
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "INSECURE_CIPHER"

    const-string v2, "crypto-bad-ciphers"

    const/16 v3, 0x147

    invoke-direct {v0, v1, v7, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->INSECURE_CIPHER:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 125
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "HEADER_INJECTION"

    const/16 v2, 0x71

    invoke-direct {v0, v1, v8, v2}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->HEADER_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 126
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "INSECURE_COOKIE"

    const-string v2, "cookie-flags-missing"

    const/16 v3, 0x266

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->INSECURE_COOKIE:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 127
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "LDAP_INJECTION"

    const/4 v2, 0x5

    const/16 v3, 0x5a

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->LDAP_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 128
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "NO_HTTP_ONLY_COOKIE"

    const/4 v2, 0x6

    const/16 v3, 0x3ec

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->NO_HTTP_ONLY_COOKIE:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 129
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "PATH_TRAVERSAL"

    const/4 v2, 0x7

    const/16 v3, 0x16

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->PATH_TRAVERSAL:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 130
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "REFLECTION_INJECTION"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2, v5}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->REFLECTION_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 131
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "SQL_INJECTION"

    const/16 v2, 0x9

    const/16 v3, 0x59

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->SQL_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 132
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "STACKTRACE_LEAK"

    const/16 v2, 0xa

    const/16 v3, 0xd1

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->STACKTRACE_LEAK:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 133
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "TRUST_BOUNDARY_VIOLATION"

    const/16 v2, 0xb

    const/16 v3, 0x1f5

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->TRUST_BOUNDARY_VIOLATION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 134
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "WEAK_RANDOMNESS"

    const/16 v2, 0xc

    const-string v3, "crypto-weak-randomness"

    const/16 v4, 0x14a

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->WEAK_RANDOMNESS:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 135
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "XPATH_INJECTION"

    const/16 v2, 0xd

    const/16 v3, 0x283

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->XPATH_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 136
    new-instance v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    const-string v1, "XSS"

    const/16 v2, 0xe

    const-string v3, "reflected-xss"

    const/16 v4, 0x4f

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->XSS:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .line 120
    const/16 v0, 0xf

    new-array v0, v0, [Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    sget-object v1, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->CMD_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v1, v0, v5

    sget-object v1, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->INSECURE_HASHING:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v1, v0, v6

    sget-object v1, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->INSECURE_CIPHER:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v1, v0, v7

    sget-object v1, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->HEADER_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v1, v0, v8

    sget-object v1, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->INSECURE_COOKIE:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->LDAP_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->NO_HTTP_ONLY_COOKIE:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->PATH_TRAVERSAL:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->REFLECTION_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->SQL_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->STACKTRACE_LEAK:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->TRUST_BOUNDARY_VIOLATION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->WEAK_RANDOMNESS:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->XPATH_INJECTION:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->XSS:Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    aput-object v2, v0, v1

    sput-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->$VALUES:[Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 7
    .param p3, "number"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 143
    iput p3, p0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->number:I

    .line 144
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "_"

    const-string v2, "-"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->id:Ljava/lang/String;

    .line 145
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 5
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "number"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 147
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 148
    iput p4, p0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->number:I

    .line 149
    iput-object p3, p0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->id:Ljava/lang/String;

    .line 150
    return-void
.end method

.method static synthetic access$000(Lorg/owasp/benchmark/score/parsers/HdivReader$Type;)I
    .registers 2
    .param p0, "x0"    # Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .prologue
    .line 120
    iget v0, p0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->number:I

    return v0
.end method

.method static synthetic access$100(Lorg/owasp/benchmark/score/parsers/HdivReader$Type;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    .prologue
    .line 120
    iget-object v0, p0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->id:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 120
    const-class v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    return-object v0
.end method

.method public static values()[Lorg/owasp/benchmark/score/parsers/HdivReader$Type;
    .registers 1

    .prologue
    .line 120
    sget-object v0, Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->$VALUES:[Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    invoke-virtual {v0}, [Lorg/owasp/benchmark/score/parsers/HdivReader$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/owasp/benchmark/score/parsers/HdivReader$Type;

    return-object v0
.end method
