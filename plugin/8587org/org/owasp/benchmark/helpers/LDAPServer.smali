.class public Lorg/owasp/benchmark/helpers/LDAPServer;
.super Ljava/lang/Object;
.source "LDAPServer.java"


# instance fields
.field private server:Lorg/apache/directory/server/ldap/LdapServer;

.field private service:Lorg/apache/directory/server/core/DirectoryService;


# direct methods
.method public constructor <init>()V
    .registers 10

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string v6, "benchmark.properties"

    const-class v7, Lorg/owasp/benchmark/helpers/LDAPManager;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "dir":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/../ldap"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 38
    .local v5, "workDir":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 42
    :try_start_2e
    invoke-direct {p0, v5}, Lorg/owasp/benchmark/helpers/LDAPServer;->initDirectoryService(Ljava/io/File;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_31} :catch_91

    .line 48
    :goto_31
    const/4 v4, 0x0

    .line 50
    .local v4, "result":Lorg/apache/directory/shared/ldap/entry/Entry;
    :try_start_32
    iget-object v6, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v6}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v6

    new-instance v7, Lorg/apache/directory/shared/ldap/name/DN;

    const-string v8, "dc=apache,dc=org"

    invoke-direct {v7, v8}, Lorg/apache/directory/shared/ldap/name/DN;-><init>(Ljava/lang/String;)V

    invoke-interface {v6, v7}, Lorg/apache/directory/server/core/CoreSession;->lookup(Lorg/apache/directory/shared/ldap/name/DN;)Lorg/apache/directory/server/core/entry/ClonedServerEntry;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_42} :catch_af

    move-result-object v4

    .line 60
    :goto_43
    :try_start_43
    invoke-virtual {p0}, Lorg/owasp/benchmark/helpers/LDAPServer;->startServer()V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_46} :catch_ce

    .line 65
    :goto_46
    new-instance v2, Lorg/owasp/benchmark/helpers/LDAPManager;

    invoke-direct {v2}, Lorg/owasp/benchmark/helpers/LDAPManager;-><init>()V

    .line 66
    .local v2, "emd":Lorg/owasp/benchmark/helpers/LDAPManager;
    new-instance v3, Lorg/owasp/benchmark/helpers/LDAPPerson;

    invoke-direct {v3}, Lorg/owasp/benchmark/helpers/LDAPPerson;-><init>()V

    .line 67
    .local v3, "ldapP":Lorg/owasp/benchmark/helpers/LDAPPerson;
    const-string v6, "foo"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setName(Ljava/lang/String;)V

    .line 68
    const-string v6, "MrFooPa$$word"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setPassword(Ljava/lang/String;)V

    .line 69
    const-string v6, "AddressForFoo #345"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setAddress(Ljava/lang/String;)V

    .line 71
    invoke-virtual {v2, v3}, Lorg/owasp/benchmark/helpers/LDAPManager;->insert(Lorg/owasp/benchmark/helpers/LDAPPerson;)Z

    .line 73
    new-instance v3, Lorg/owasp/benchmark/helpers/LDAPPerson;

    .end local v3    # "ldapP":Lorg/owasp/benchmark/helpers/LDAPPerson;
    invoke-direct {v3}, Lorg/owasp/benchmark/helpers/LDAPPerson;-><init>()V

    .line 74
    .restart local v3    # "ldapP":Lorg/owasp/benchmark/helpers/LDAPPerson;
    const-string v6, "Ms Bar"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setName(Ljava/lang/String;)V

    .line 75
    const-string v6, "barM$B4dPass"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setPassword(Ljava/lang/String;)V

    .line 76
    const-string v6, "The streetz 4 Ms bar"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setAddress(Ljava/lang/String;)V

    .line 78
    invoke-virtual {v2, v3}, Lorg/owasp/benchmark/helpers/LDAPManager;->insert(Lorg/owasp/benchmark/helpers/LDAPPerson;)Z

    .line 80
    new-instance v3, Lorg/owasp/benchmark/helpers/LDAPPerson;

    .end local v3    # "ldapP":Lorg/owasp/benchmark/helpers/LDAPPerson;
    invoke-direct {v3}, Lorg/owasp/benchmark/helpers/LDAPPerson;-><init>()V

    .line 81
    .restart local v3    # "ldapP":Lorg/owasp/benchmark/helpers/LDAPPerson;
    const-string v6, "Mr Unknown"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setName(Ljava/lang/String;)V

    .line 82
    const-string v6, "YouwontGue$$"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setPassword(Ljava/lang/String;)V

    .line 83
    const-string v6, "Whe home is #678"

    invoke-virtual {v3, v6}, Lorg/owasp/benchmark/helpers/LDAPPerson;->setAddress(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v2, v3}, Lorg/owasp/benchmark/helpers/LDAPManager;->insert(Lorg/owasp/benchmark/helpers/LDAPPerson;)Z

    .line 86
    return-void

    .line 43
    .end local v2    # "emd":Lorg/owasp/benchmark/helpers/LDAPManager;
    .end local v3    # "ldapP":Lorg/owasp/benchmark/helpers/LDAPPerson;
    .end local v4    # "result":Lorg/apache/directory/shared/ldap/entry/Entry;
    :catch_91
    move-exception v1

    .line 44
    .local v1, "e":Ljava/lang/Exception;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error creating LDAP Server: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_31

    .line 51
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v4    # "result":Lorg/apache/directory/shared/ldap/entry/Entry;
    :catch_af
    move-exception v1

    .line 52
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error creating LDAP Server: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_43

    .line 61
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_ce
    move-exception v1

    .line 62
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error creating LDAP Server: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_46
.end method

.method private varargs addIndex(Lorg/apache/directory/server/core/partition/Partition;[Ljava/lang/String;)V
    .registers 8
    .param p1, "partition"    # Lorg/apache/directory/server/core/partition/Partition;
    .param p2, "attrs"    # [Ljava/lang/String;

    .prologue
    .line 280
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 282
    .local v1, "indexedAttributes":Ljava/util/HashSet;, "Ljava/util/HashSet<Lorg/apache/directory/server/xdbm/Index<*Lorg/apache/directory/shared/ldap/entry/ServerEntry;Ljava/lang/Long;>;>;"
    array-length v3, p2

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v3, :cond_16

    aget-object v0, p2, v2

    .line 283
    .local v0, "attribute":Ljava/lang/String;
    new-instance v4, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmIndex;

    invoke-direct {v4, v0}, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmIndex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 282
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 286
    .end local v0    # "attribute":Ljava/lang/String;
    :cond_16
    check-cast p1, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;

    .end local p1    # "partition":Lorg/apache/directory/server/core/partition/Partition;
    invoke-virtual {p1, v1}, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;->setIndexedAttributes(Ljava/util/Set;)V

    .line 287
    return-void
.end method

.method private addPartition(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/directory/server/core/partition/Partition;
    .registers 6
    .param p1, "partitionId"    # Ljava/lang/String;
    .param p2, "partitionDn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 261
    new-instance v0, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;

    invoke-direct {v0}, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;-><init>()V

    .line 262
    .local v0, "partition":Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;
    invoke-virtual {v0, p1}, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;->setId(Ljava/lang/String;)V

    .line 263
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v2}, Lorg/apache/directory/server/core/DirectoryService;->getWorkingDirectory()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;->setPartitionDir(Ljava/io/File;)V

    .line 264
    invoke-virtual {v0, p2}, Lorg/apache/directory/server/core/partition/impl/btree/jdbm/JdbmPartition;->setSuffix(Ljava/lang/String;)V

    .line 265
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v1, v0}, Lorg/apache/directory/server/core/DirectoryService;->addPartition(Lorg/apache/directory/server/core/partition/Partition;)V

    .line 267
    return-object v0
.end method

.method private initDirectoryService(Ljava/io/File;)V
    .registers 20
    .param p1, "workDir"    # Ljava/io/File;

    .prologue
    .line 100
    :try_start_0
    new-instance v14, Lorg/apache/directory/server/core/DefaultDirectoryService;

    invoke-direct {v14}, Lorg/apache/directory/server/core/DefaultDirectoryService;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_ed

    .line 104
    :goto_9
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    move-object/from16 v0, p1

    invoke-interface {v14, v0}, Lorg/apache/directory/server/core/DirectoryService;->setWorkingDirectory(Ljava/io/File;)V

    .line 107
    invoke-direct/range {p0 .. p0}, Lorg/owasp/benchmark/helpers/LDAPServer;->initSchemaPartition()V

    .line 111
    const/4 v13, 0x0

    .line 113
    .local v13, "systemPartition":Lorg/apache/directory/server/core/partition/Partition;
    :try_start_16
    const-string v14, "system"

    const-string v15, "ou=system"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/owasp/benchmark/helpers/LDAPServer;->addPartition(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/directory/server/core/partition/Partition;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_1f} :catch_10c

    move-result-object v13

    .line 117
    :goto_20
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14, v13}, Lorg/apache/directory/server/core/DirectoryService;->setSystemPartition(Lorg/apache/directory/server/core/partition/Partition;)V

    .line 120
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getChangeLog()Lorg/apache/directory/server/core/changelog/ChangeLog;

    move-result-object v14

    const/4 v15, 0x0

    invoke-interface {v14, v15}, Lorg/apache/directory/server/core/changelog/ChangeLog;->setEnabled(Z)V

    .line 121
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    const/4 v15, 0x1

    invoke-interface {v14, v15}, Lorg/apache/directory/server/core/DirectoryService;->setDenormalizeOpAttrsEnabled(Z)V

    .line 125
    const/4 v11, 0x0

    .line 127
    .local v11, "fooPartition":Lorg/apache/directory/server/core/partition/Partition;
    :try_start_3c
    const-string v14, "foo"

    const-string v15, "dc=foo,dc=com"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/owasp/benchmark/helpers/LDAPServer;->addPartition(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/directory/server/core/partition/Partition;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_45} :catch_12b

    move-result-object v11

    .line 131
    :goto_46
    const/4 v2, 0x0

    .line 133
    .local v2, "barPartition":Lorg/apache/directory/server/core/partition/Partition;
    :try_start_47
    const-string v14, "bar"

    const-string v15, "dc=bar,dc=com"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/owasp/benchmark/helpers/LDAPServer;->addPartition(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/directory/server/core/partition/Partition;
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_50} :catch_14a

    move-result-object v2

    .line 137
    :goto_51
    const/4 v1, 0x0

    .line 139
    .local v1, "apachePartition":Lorg/apache/directory/server/core/partition/Partition;
    :try_start_52
    const-string v14, "apache"

    const-string v15, "dc=apache,dc=org"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/owasp/benchmark/helpers/LDAPServer;->addPartition(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/directory/server/core/partition/Partition;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_5b} :catch_169

    move-result-object v1

    .line 145
    :goto_5c
    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    const-string v16, "objectClass"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const-string v16, "ou"

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string v16, "uid"

    aput-object v16, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v14}, Lorg/owasp/benchmark/helpers/LDAPServer;->addIndex(Lorg/apache/directory/server/core/partition/Partition;[Ljava/lang/String;)V

    .line 148
    :try_start_73
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->startup()V
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_7a} :catch_188

    .line 154
    :goto_7a
    :try_start_7a
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v14

    invoke-interface {v11}, Lorg/apache/directory/server/core/partition/Partition;->getSuffixDn()Lorg/apache/directory/shared/ldap/name/DN;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/apache/directory/server/core/CoreSession;->lookup(Lorg/apache/directory/shared/ldap/name/DN;)Lorg/apache/directory/server/core/entry/ClonedServerEntry;
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_7a .. :try_end_89} :catch_1a7

    .line 169
    :goto_89
    :try_start_89
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v14

    invoke-interface {v2}, Lorg/apache/directory/server/core/partition/Partition;->getSuffixDn()Lorg/apache/directory/shared/ldap/name/DN;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/apache/directory/server/core/CoreSession;->lookup(Lorg/apache/directory/shared/ldap/name/DN;)Lorg/apache/directory/server/core/entry/ClonedServerEntry;
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_98} :catch_1f6

    .line 184
    :goto_98
    :try_start_98
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v14

    invoke-interface {v1}, Lorg/apache/directory/server/core/partition/Partition;->getSuffixDn()Lorg/apache/directory/shared/ldap/name/DN;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/apache/directory/server/core/CoreSession;->exists(Lorg/apache/directory/shared/ldap/name/DN;)Z
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_a7} :catch_24f

    move-result v14

    if-nez v14, :cond_ec

    .line 186
    :try_start_aa
    new-instance v3, Lorg/apache/directory/shared/ldap/name/DN;

    const-string v14, "dc=Apache,dc=Org"

    invoke-direct {v3, v14}, Lorg/apache/directory/shared/ldap/name/DN;-><init>(Ljava/lang/String;)V

    .line 187
    .local v3, "dnApache":Lorg/apache/directory/shared/ldap/name/DN;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14, v3}, Lorg/apache/directory/server/core/DirectoryService;->newEntry(Lorg/apache/directory/shared/ldap/name/DN;)Lorg/apache/directory/shared/ldap/entry/ServerEntry;

    move-result-object v8

    .line 188
    .local v8, "entryApache":Lorg/apache/directory/shared/ldap/entry/ServerEntry;
    const-string v14, "objectClass"

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "top"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    const-string v17, "domain"

    aput-object v17, v15, v16

    const/16 v16, 0x2

    const-string v17, "extensibleObject"

    aput-object v17, v15, v16

    invoke-interface {v8, v14, v15}, Lorg/apache/directory/shared/ldap/entry/ServerEntry;->add(Ljava/lang/String;[Ljava/lang/String;)V

    .line 189
    const-string v14, "dc"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "Apache"

    aput-object v17, v15, v16

    invoke-interface {v8, v14, v15}, Lorg/apache/directory/shared/ldap/entry/ServerEntry;->add(Ljava/lang/String;[Ljava/lang/String;)V

    .line 190
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v14

    invoke-interface {v14, v8}, Lorg/apache/directory/server/core/CoreSession;->add(Lorg/apache/directory/shared/ldap/entry/ServerEntry;)V
    :try_end_ec
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_ec} :catch_245

    .line 199
    .end local v3    # "dnApache":Lorg/apache/directory/shared/ldap/name/DN;
    .end local v8    # "entryApache":Lorg/apache/directory/shared/ldap/entry/ServerEntry;
    :cond_ec
    :goto_ec
    return-void

    .line 101
    .end local v1    # "apachePartition":Lorg/apache/directory/server/core/partition/Partition;
    .end local v2    # "barPartition":Lorg/apache/directory/server/core/partition/Partition;
    .end local v11    # "fooPartition":Lorg/apache/directory/server/core/partition/Partition;
    .end local v13    # "systemPartition":Lorg/apache/directory/server/core/partition/Partition;
    :catch_ed
    move-exception v7

    .line 102
    .local v7, "e1":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error creating DefaultDirectoryService. "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 114
    .end local v7    # "e1":Ljava/lang/Exception;
    .restart local v13    # "systemPartition":Lorg/apache/directory/server/core/partition/Partition;
    :catch_10c
    move-exception v7

    .line 115
    .restart local v7    # "e1":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error addPartition system. "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_20

    .line 128
    .end local v7    # "e1":Ljava/lang/Exception;
    .restart local v11    # "fooPartition":Lorg/apache/directory/server/core/partition/Partition;
    :catch_12b
    move-exception v7

    .line 129
    .restart local v7    # "e1":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error addPartition foo. "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_46

    .line 134
    .end local v7    # "e1":Ljava/lang/Exception;
    .restart local v2    # "barPartition":Lorg/apache/directory/server/core/partition/Partition;
    :catch_14a
    move-exception v7

    .line 135
    .restart local v7    # "e1":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error addPartition bar. "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_51

    .line 140
    .end local v7    # "e1":Ljava/lang/Exception;
    .restart local v1    # "apachePartition":Lorg/apache/directory/server/core/partition/Partition;
    :catch_169
    move-exception v7

    .line 141
    .restart local v7    # "e1":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error addPartition apache. "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_5c

    .line 149
    .end local v7    # "e1":Ljava/lang/Exception;
    :catch_188
    move-exception v6

    .line 150
    .local v6, "e":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error at LDAP startup: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_7a

    .line 155
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_1a7
    move-exception v12

    .line 157
    .local v12, "lnnfe":Ljava/lang/Exception;
    :try_start_1a8
    new-instance v5, Lorg/apache/directory/shared/ldap/name/DN;

    const-string v14, "dc=foo,dc=com"

    invoke-direct {v5, v14}, Lorg/apache/directory/shared/ldap/name/DN;-><init>(Ljava/lang/String;)V

    .line 158
    .local v5, "dnFoo":Lorg/apache/directory/shared/ldap/name/DN;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14, v5}, Lorg/apache/directory/server/core/DirectoryService;->newEntry(Lorg/apache/directory/shared/ldap/name/DN;)Lorg/apache/directory/shared/ldap/entry/ServerEntry;

    move-result-object v10

    .line 159
    .local v10, "entryFoo":Lorg/apache/directory/shared/ldap/entry/ServerEntry;
    const-string v14, "objectClass"

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "top"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    const-string v17, "domain"

    aput-object v17, v15, v16

    const/16 v16, 0x2

    const-string v17, "extensibleObject"

    aput-object v17, v15, v16

    invoke-interface {v10, v14, v15}, Lorg/apache/directory/shared/ldap/entry/ServerEntry;->add(Ljava/lang/String;[Ljava/lang/String;)V

    .line 160
    const-string v14, "dc"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "foo"

    aput-object v17, v15, v16

    invoke-interface {v10, v14, v15}, Lorg/apache/directory/shared/ldap/entry/ServerEntry;->add(Ljava/lang/String;[Ljava/lang/String;)V

    .line 161
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v14

    invoke-interface {v14, v10}, Lorg/apache/directory/server/core/CoreSession;->add(Lorg/apache/directory/shared/ldap/entry/ServerEntry;)V
    :try_end_1ea
    .catch Ljava/lang/Exception; {:try_start_1a8 .. :try_end_1ea} :catch_1ec

    goto/16 :goto_89

    .line 162
    .end local v5    # "dnFoo":Lorg/apache/directory/shared/ldap/name/DN;
    .end local v10    # "entryFoo":Lorg/apache/directory/shared/ldap/entry/ServerEntry;
    :catch_1ec
    move-exception v6

    .line 163
    .restart local v6    # "e":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v15, "Error creating new DN."

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_89

    .line 170
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v12    # "lnnfe":Ljava/lang/Exception;
    :catch_1f6
    move-exception v12

    .line 172
    .restart local v12    # "lnnfe":Ljava/lang/Exception;
    :try_start_1f7
    new-instance v4, Lorg/apache/directory/shared/ldap/name/DN;

    const-string v14, "dc=bar,dc=com"

    invoke-direct {v4, v14}, Lorg/apache/directory/shared/ldap/name/DN;-><init>(Ljava/lang/String;)V

    .line 173
    .local v4, "dnBar":Lorg/apache/directory/shared/ldap/name/DN;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14, v4}, Lorg/apache/directory/server/core/DirectoryService;->newEntry(Lorg/apache/directory/shared/ldap/name/DN;)Lorg/apache/directory/shared/ldap/entry/ServerEntry;

    move-result-object v9

    .line 174
    .local v9, "entryBar":Lorg/apache/directory/shared/ldap/entry/ServerEntry;
    const-string v14, "objectClass"

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "top"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    const-string v17, "domain"

    aput-object v17, v15, v16

    const/16 v16, 0x2

    const-string v17, "extensibleObject"

    aput-object v17, v15, v16

    invoke-interface {v9, v14, v15}, Lorg/apache/directory/shared/ldap/entry/ServerEntry;->add(Ljava/lang/String;[Ljava/lang/String;)V

    .line 175
    const-string v14, "dc"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "bar"

    aput-object v17, v15, v16

    invoke-interface {v9, v14, v15}, Lorg/apache/directory/shared/ldap/entry/ServerEntry;->add(Ljava/lang/String;[Ljava/lang/String;)V

    .line 176
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v14}, Lorg/apache/directory/server/core/DirectoryService;->getAdminSession()Lorg/apache/directory/server/core/CoreSession;

    move-result-object v14

    invoke-interface {v14, v9}, Lorg/apache/directory/server/core/CoreSession;->add(Lorg/apache/directory/shared/ldap/entry/ServerEntry;)V
    :try_end_239
    .catch Ljava/lang/Exception; {:try_start_1f7 .. :try_end_239} :catch_23b

    goto/16 :goto_98

    .line 177
    .end local v4    # "dnBar":Lorg/apache/directory/shared/ldap/name/DN;
    .end local v9    # "entryBar":Lorg/apache/directory/shared/ldap/entry/ServerEntry;
    :catch_23b
    move-exception v6

    .line 178
    .restart local v6    # "e":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v15, "Error creating new DN."

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_98

    .line 191
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v12    # "lnnfe":Ljava/lang/Exception;
    :catch_245
    move-exception v6

    .line 192
    .restart local v6    # "e":Ljava/lang/Exception;
    :try_start_246
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v15, "Error creating new DN."

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_24d
    .catch Ljava/lang/Exception; {:try_start_246 .. :try_end_24d} :catch_24f

    goto/16 :goto_ec

    .line 195
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_24f
    move-exception v6

    .line 196
    .restart local v6    # "e":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v15, "Error when checking if partition exists."

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_ec
.end method

.method private initSchemaPartition()V
    .registers 13

    .prologue
    .line 209
    iget-object v9, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v9}, Lorg/apache/directory/server/core/DirectoryService;->getSchemaService()Lorg/apache/directory/server/core/schema/SchemaService;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/directory/server/core/schema/SchemaService;->getSchemaPartition()Lorg/apache/directory/server/core/schema/SchemaPartition;

    move-result-object v5

    .line 212
    .local v5, "schemaPartition":Lorg/apache/directory/server/core/schema/SchemaPartition;
    new-instance v2, Lorg/apache/directory/server/core/partition/ldif/LdifPartition;

    invoke-direct {v2}, Lorg/apache/directory/server/core/partition/ldif/LdifPartition;-><init>()V

    .line 213
    .local v2, "ldifPartition":Lorg/apache/directory/server/core/partition/ldif/LdifPartition;
    iget-object v9, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v9}, Lorg/apache/directory/server/core/DirectoryService;->getWorkingDirectory()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    .line 214
    .local v8, "workingDirectory":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/schema"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Lorg/apache/directory/server/core/partition/ldif/LdifPartition;->setWorkingDirectory(Ljava/lang/String;)V

    .line 217
    new-instance v6, Ljava/io/File;

    const-string v9, "schema"

    invoke-direct {v6, v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .local v6, "schemaRepository":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 219
    .local v7, "wd":Ljava/io/File;
    new-instance v1, Lorg/apache/directory/shared/ldap/schema/ldif/extractor/impl/DefaultSchemaLdifExtractor;

    invoke-direct {v1, v7}, Lorg/apache/directory/shared/ldap/schema/ldif/extractor/impl/DefaultSchemaLdifExtractor;-><init>(Ljava/io/File;)V

    .line 221
    .local v1, "extractor":Lorg/apache/directory/shared/ldap/schema/ldif/extractor/SchemaLdifExtractor;
    const/4 v9, 0x1

    :try_start_41
    invoke-interface {v1, v9}, Lorg/apache/directory/shared/ldap/schema/ldif/extractor/SchemaLdifExtractor;->extractOrCopy(Z)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_44} :catch_81

    .line 226
    :goto_44
    invoke-virtual {v5, v2}, Lorg/apache/directory/server/core/schema/SchemaPartition;->setWrappedPartition(Lorg/apache/directory/server/core/partition/Partition;)V

    .line 228
    :try_start_47
    new-instance v3, Lorg/apache/directory/shared/ldap/schema/loader/ldif/LdifSchemaLoader;

    invoke-direct {v3, v6}, Lorg/apache/directory/shared/ldap/schema/loader/ldif/LdifSchemaLoader;-><init>(Ljava/io/File;)V

    .line 229
    .local v3, "loader":Lorg/apache/directory/shared/ldap/schema/registries/SchemaLoader;
    new-instance v4, Lorg/apache/directory/shared/ldap/schema/manager/impl/DefaultSchemaManager;

    invoke-direct {v4, v3}, Lorg/apache/directory/shared/ldap/schema/manager/impl/DefaultSchemaManager;-><init>(Lorg/apache/directory/shared/ldap/schema/registries/SchemaLoader;)V

    .line 230
    .local v4, "schemaManager":Lorg/apache/directory/shared/ldap/schema/SchemaManager;
    iget-object v9, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-interface {v9, v4}, Lorg/apache/directory/server/core/DirectoryService;->setSchemaManager(Lorg/apache/directory/shared/ldap/schema/SchemaManager;)V

    .line 235
    invoke-interface {v4}, Lorg/apache/directory/shared/ldap/schema/SchemaManager;->loadAllEnabled()Z

    .line 237
    invoke-virtual {v5, v4}, Lorg/apache/directory/server/core/schema/SchemaPartition;->setSchemaManager(Lorg/apache/directory/shared/ldap/schema/SchemaManager;)V

    .line 239
    invoke-interface {v4}, Lorg/apache/directory/shared/ldap/schema/SchemaManager;->getErrors()Ljava/util/List;

    move-result-object v0

    .line 241
    .local v0, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    if-eqz v9, :cond_80

    .line 242
    new-instance v9, Ljava/lang/Exception;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Schema load failed : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_7f} :catch_7f

    .line 244
    .end local v0    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v3    # "loader":Lorg/apache/directory/shared/ldap/schema/registries/SchemaLoader;
    .end local v4    # "schemaManager":Lorg/apache/directory/shared/ldap/schema/SchemaManager;
    :catch_7f
    move-exception v9

    .line 246
    :cond_80
    return-void

    .line 223
    :catch_81
    move-exception v9

    goto :goto_44
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 320
    new-instance v0, Lorg/owasp/benchmark/helpers/LDAPServer;

    invoke-direct {v0}, Lorg/owasp/benchmark/helpers/LDAPServer;-><init>()V

    .line 322
    .local v0, "ldap":Lorg/owasp/benchmark/helpers/LDAPServer;
    return-void
.end method


# virtual methods
.method public startServer()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 295
    new-instance v1, Lorg/apache/directory/server/ldap/LdapServer;

    invoke-direct {v1}, Lorg/apache/directory/server/ldap/LdapServer;-><init>()V

    iput-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    .line 296
    const/16 v0, 0x2895

    .line 297
    .local v0, "serverPort":I
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    const/4 v2, 0x1

    new-array v2, v2, [Lorg/apache/directory/server/protocol/shared/transport/Transport;

    const/4 v3, 0x0

    new-instance v4, Lorg/apache/directory/server/protocol/shared/transport/TcpTransport;

    invoke-direct {v4, v0}, Lorg/apache/directory/server/protocol/shared/transport/TcpTransport;-><init>(I)V

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lorg/apache/directory/server/ldap/LdapServer;->setTransports([Lorg/apache/directory/server/protocol/shared/transport/Transport;)V

    .line 298
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    iget-object v2, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->service:Lorg/apache/directory/server/core/DirectoryService;

    invoke-virtual {v1, v2}, Lorg/apache/directory/server/ldap/LdapServer;->setDirectoryService(Lorg/apache/directory/server/core/DirectoryService;)V

    .line 300
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    invoke-virtual {v1}, Lorg/apache/directory/server/ldap/LdapServer;->start()V

    .line 301
    return-void
.end method

.method public stopServer()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 304
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    if-eqz v0, :cond_1a

    .line 305
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    invoke-virtual {v0}, Lorg/apache/directory/server/ldap/LdapServer;->stop()V

    .line 306
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    invoke-virtual {v0}, Lorg/apache/directory/server/ldap/LdapServer;->getDirectoryService()Lorg/apache/directory/server/core/DirectoryService;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 307
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/LDAPServer;->server:Lorg/apache/directory/server/ldap/LdapServer;

    invoke-virtual {v0}, Lorg/apache/directory/server/ldap/LdapServer;->getDirectoryService()Lorg/apache/directory/server/core/DirectoryService;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/directory/server/core/DirectoryService;->shutdown()V

    .line 310
    :cond_1a
    return-void
.end method
