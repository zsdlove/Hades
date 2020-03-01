.class public Lorg/owasp/benchmark/service/pojo/Person;
.super Ljava/lang/Object;
.source "Person.java"


# annotations
.annotation runtime Ljavax/xml/bind/annotation/XmlRootElement;
    name = "person"
.end annotation


# instance fields
.field private address:Ljava/lang/String;

.field private id:J

.field private lastName:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "id"    # J
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "lastName"    # Ljava/lang/String;
    .param p5, "address"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-wide p1, p0, Lorg/owasp/benchmark/service/pojo/Person;->id:J

    .line 19
    iput-object p3, p0, Lorg/owasp/benchmark/service/pojo/Person;->name:Ljava/lang/String;

    .line 20
    iput-object p5, p0, Lorg/owasp/benchmark/service/pojo/Person;->address:Ljava/lang/String;

    .line 21
    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lorg/owasp/benchmark/service/pojo/Person;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getId()J
    .registers 3

    .prologue
    .line 24
    iget-wide v0, p0, Lorg/owasp/benchmark/service/pojo/Person;->id:J

    return-wide v0
.end method

.method public getLastName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/owasp/benchmark/service/pojo/Person;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/owasp/benchmark/service/pojo/Person;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .registers 2
    .param p1, "address"    # Ljava/lang/String;
    .annotation runtime Ljavax/xml/bind/annotation/XmlElement;
    .end annotation

    .prologue
    .line 38
    iput-object p1, p0, Lorg/owasp/benchmark/service/pojo/Person;->address:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setId(J)V
    .registers 4
    .param p1, "id"    # J
    .annotation runtime Ljavax/xml/bind/annotation/XmlAttribute;
    .end annotation

    .prologue
    .line 33
    iput-wide p1, p0, Lorg/owasp/benchmark/service/pojo/Person;->id:J

    .line 34
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastName"    # Ljava/lang/String;
    .annotation runtime Ljavax/xml/bind/annotation/XmlElement;
    .end annotation

    .prologue
    .line 56
    iput-object p1, p0, Lorg/owasp/benchmark/service/pojo/Person;->lastName:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljavax/xml/bind/annotation/XmlElement;
    .end annotation

    .prologue
    .line 47
    iput-object p1, p0, Lorg/owasp/benchmark/service/pojo/Person;->name:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Person [id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/owasp/benchmark/service/pojo/Person;->id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/service/pojo/Person;->address:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/service/pojo/Person;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", lastName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/owasp/benchmark/service/pojo/Person;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
