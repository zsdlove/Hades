.class public Lorg/owasp/benchmark/helpers/LDAPPerson;
.super Ljava/lang/Object;
.source "LDAPPerson.java"


# instance fields
.field private address:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private password:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "address"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->name:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->password:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->address:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->password:Ljava/lang/String;

    return-object v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .registers 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->address:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->name:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 2
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/LDAPPerson;->password:Ljava/lang/String;

    .line 51
    return-void
.end method
