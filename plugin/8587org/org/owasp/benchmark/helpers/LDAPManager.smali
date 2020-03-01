.class public Lorg/owasp/benchmark/helpers/LDAPManager;
.super Ljava/lang/Object;
.source "LDAPManager.java"


# static fields
.field private static final ESAPI_Encoder:Lorg/owasp/esapi/Encoder;


# instance fields
.field private ctx:Ljavax/naming/directory/DirContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    invoke-static {}, Lorg/owasp/esapi/reference/DefaultEncoder;->getInstance()Lorg/owasp/esapi/Encoder;

    move-result-object v0

    sput-object v0, Lorg/owasp/benchmark/helpers/LDAPManager;->ESAPI_Encoder:Lorg/owasp/esapi/Encoder;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    :try_start_3
    invoke-virtual {p0}, Lorg/owasp/benchmark/helpers/LDAPManager;->getDirContext()Ljavax/naming/directory/DirContext;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;
    :try_end_9
    .catch Ljavax/naming/NamingException; {:try_start_3 .. :try_end_9} :catch_a

    .line 77
    :goto_9
    return-void

    .line 53
    :catch_a
    move-exception v0

    .line 54
    .local v0, "e":Ljavax/naming/NamingException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get Directory Context: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljavax/naming/NamingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_9
.end method

.method public static main([Ljava/lang/String;)V
    .registers 1
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 233
    return-void
.end method

.method private search(Lorg/owasp/benchmark/helpers/LDAPPerson;)Z
    .registers 14
    .param p1, "person"    # Lorg/owasp/benchmark/helpers/LDAPPerson;

    .prologue
    .line 134
    :try_start_0
    invoke-virtual {p0}, Lorg/owasp/benchmark/helpers/LDAPManager;->getDirContext()Ljavax/naming/directory/DirContext;

    move-result-object v3

    .line 135
    .local v3, "ctx":Ljavax/naming/directory/DirContext;
    const-string v2, "ou=users,ou=system"

    .line 137
    .local v2, "base":Ljava/lang/String;
    new-instance v7, Ljavax/naming/directory/SearchControls;

    invoke-direct {v7}, Ljavax/naming/directory/SearchControls;-><init>()V

    .line 138
    .local v7, "sc":Ljavax/naming/directory/SearchControls;
    const/4 v9, 0x2

    invoke-virtual {v7, v9}, Ljavax/naming/directory/SearchControls;->setSearchScope(I)V

    .line 140
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "(&(objectclass=person)(uid="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lorg/owasp/benchmark/helpers/LDAPManager;->ESAPI_Encoder:Lorg/owasp/esapi/Encoder;

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lorg/owasp/esapi/Encoder;->encodeForLDAP(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "))"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 142
    .local v5, "filter":Ljava/lang/String;
    invoke-interface {v3, v2, v5, v7}, Ljavax/naming/directory/DirContext;->search(Ljava/lang/String;Ljava/lang/String;Ljavax/naming/directory/SearchControls;)Ljavax/naming/NamingEnumeration;

    move-result-object v6

    .line 144
    .local v6, "results":Ljavax/naming/NamingEnumeration;, "Ljavax/naming/NamingEnumeration<Ljavax/naming/directory/SearchResult;>;"
    :cond_36
    :goto_36
    invoke-interface {v6}, Ljavax/naming/NamingEnumeration;->hasMore()Z

    move-result v9

    if-eqz v9, :cond_4f

    .line 145
    invoke-interface {v6}, Ljavax/naming/NamingEnumeration;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljavax/naming/directory/SearchResult;

    .line 146
    .local v8, "sr":Ljavax/naming/directory/SearchResult;
    invoke-virtual {v8}, Ljavax/naming/directory/SearchResult;->getAttributes()Ljavax/naming/directory/Attributes;

    move-result-object v1

    .line 148
    .local v1, "attrs":Ljavax/naming/directory/Attributes;
    const-string v9, "uid"

    invoke-interface {v1, v9}, Ljavax/naming/directory/Attributes;->get(Ljava/lang/String;)Ljavax/naming/directory/Attribute;

    move-result-object v0

    .line 149
    .local v0, "attr":Ljavax/naming/directory/Attribute;
    if-eqz v0, :cond_36

    goto :goto_36

    .line 154
    .end local v0    # "attr":Ljavax/naming/directory/Attribute;
    .end local v1    # "attrs":Ljavax/naming/directory/Attributes;
    .end local v8    # "sr":Ljavax/naming/directory/SearchResult;
    :cond_4f
    invoke-interface {v3}, Ljavax/naming/directory/DirContext;->close()V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_52} :catch_54

    .line 156
    const/4 v9, 0x1

    .line 161
    .end local v2    # "base":Ljava/lang/String;
    .end local v3    # "ctx":Ljavax/naming/directory/DirContext;
    .end local v5    # "filter":Ljava/lang/String;
    .end local v6    # "results":Ljavax/naming/NamingEnumeration;, "Ljavax/naming/NamingEnumeration<Ljavax/naming/directory/SearchResult;>;"
    .end local v7    # "sc":Ljavax/naming/directory/SearchControls;
    :goto_53
    return v9

    .line 157
    :catch_54
    move-exception v4

    .line 158
    .local v4, "e":Ljava/lang/Exception;
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "LDAP error search: "

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 160
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 161
    const/4 v9, 0x0

    goto :goto_53
.end method


# virtual methods
.method public closeDirContext()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/naming/NamingException;
        }
    .end annotation

    .prologue
    .line 173
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;

    if-eqz v0, :cond_9

    .line 174
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;

    invoke-interface {v0}, Ljavax/naming/directory/DirContext;->close()V

    .line 175
    :cond_9
    return-void
.end method

.method protected createEnv()Ljava/util/Hashtable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 80
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 81
    .local v0, "env":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/Object;Ljava/lang/Object;>;"
    const-string v1, "java.naming.provider.url"

    const-string v2, "ldap://localhost:10389"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    const-string v1, "java.naming.factory.initial"

    const-string v2, "com.sun.jndi.ldap.LdapCtxFactory"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    return-object v0
.end method

.method public getDirContext()Ljavax/naming/directory/DirContext;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/naming/NamingException;
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;

    if-nez v0, :cond_e

    .line 167
    new-instance v0, Ljavax/naming/directory/InitialDirContext;

    invoke-virtual {p0}, Lorg/owasp/benchmark/helpers/LDAPManager;->createEnv()Ljava/util/Hashtable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/naming/directory/InitialDirContext;-><init>(Ljava/util/Hashtable;)V

    .line 169
    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;

    goto :goto_d
.end method

.method public insert(Lorg/owasp/benchmark/helpers/LDAPPerson;)Z
    .registers 10
    .param p1, "person"    # Lorg/owasp/benchmark/helpers/LDAPPerson;

    .prologue
    const/4 v7, 0x1

    .line 87
    new-instance v2, Ljavax/naming/directory/BasicAttributes;

    invoke-direct {v2, v7}, Ljavax/naming/directory/BasicAttributes;-><init>(Z)V

    .line 88
    .local v2, "matchAttrs":Ljavax/naming/directory/Attributes;
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "uid"

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 89
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "cn"

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 90
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "street"

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 91
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "sn"

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 92
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "userpassword"

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 93
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "objectclass"

    const-string v6, "top"

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 94
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "objectclass"

    const-string v6, "person"

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 95
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "objectclass"

    const-string v6, "organizationalPerson"

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 96
    new-instance v4, Ljavax/naming/directory/BasicAttribute;

    const-string v5, "objectclass"

    const-string v6, "inetorgperson"

    invoke-direct {v4, v5, v6}, Ljavax/naming/directory/BasicAttribute;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljavax/naming/directory/Attributes;->put(Ljavax/naming/directory/Attribute;)Ljavax/naming/directory/Attribute;

    .line 97
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "uid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/owasp/benchmark/helpers/LDAPPerson;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",ou=users,ou=system"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 98
    .local v3, "name":Ljava/lang/String;
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;

    check-cast v1, Ljavax/naming/directory/InitialDirContext;

    .line 101
    .local v1, "iniDirContext":Ljavax/naming/directory/InitialDirContext;
    :try_start_9d
    iget-object v4, p0, Lorg/owasp/benchmark/helpers/LDAPManager;->ctx:Ljavax/naming/directory/DirContext;

    invoke-virtual {v1, v3, v4, v2}, Ljavax/naming/directory/InitialDirContext;->bind(Ljava/lang/String;Ljava/lang/Object;Ljavax/naming/directory/Attributes;)V
    :try_end_a2
    .catch Ljavax/naming/NamingException; {:try_start_9d .. :try_end_a2} :catch_a5
    .catchall {:try_start_9d .. :try_end_a2} :catchall_d1

    .line 107
    if-eqz v1, :cond_a4

    .line 119
    :cond_a4
    :goto_a4
    return v7

    .line 102
    :catch_a5
    move-exception v0

    .line 103
    .local v0, "e":Ljavax/naming/NamingException;
    :try_start_a6
    invoke-virtual {v0}, Ljavax/naming/NamingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ENTRY_ALREADY_EXISTS"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_ce

    .line 104
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Record already exist or an error ocurred: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljavax/naming/NamingException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_ce
    .catchall {:try_start_a6 .. :try_end_ce} :catchall_d1

    .line 107
    :cond_ce
    if-eqz v1, :cond_a4

    goto :goto_a4

    .end local v0    # "e":Ljavax/naming/NamingException;
    :catchall_d1
    move-exception v4

    if-eqz v1, :cond_d4

    .line 116
    :cond_d4
    throw v4
.end method
