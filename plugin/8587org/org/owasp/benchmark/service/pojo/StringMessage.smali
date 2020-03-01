.class public Lorg/owasp/benchmark/service/pojo/StringMessage;
.super Ljava/lang/Object;
.source "StringMessage.java"


# annotations
.annotation runtime Ljavax/xml/bind/annotation/XmlRootElement;
    name = "message"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private msg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/owasp/benchmark/service/pojo/StringMessage;->key:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lorg/owasp/benchmark/service/pojo/StringMessage;->msg:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 19
    iget-object v0, p0, Lorg/owasp/benchmark/service/pojo/StringMessage;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getMsg()Ljava/lang/String;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lorg/owasp/benchmark/service/pojo/StringMessage;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljavax/xml/bind/annotation/XmlElement;
    .end annotation

    .prologue
    .line 24
    iput-object p1, p0, Lorg/owasp/benchmark/service/pojo/StringMessage;->key:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public setMsg(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;
    .annotation runtime Ljavax/xml/bind/annotation/XmlElement;
    .end annotation

    .prologue
    .line 33
    iput-object p1, p0, Lorg/owasp/benchmark/service/pojo/StringMessage;->msg:Ljava/lang/String;

    .line 34
    return-void
.end method
