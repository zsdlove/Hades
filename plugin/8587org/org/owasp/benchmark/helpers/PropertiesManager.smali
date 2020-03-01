.class public Lorg/owasp/benchmark/helpers/PropertiesManager;
.super Ljava/lang/Object;
.source "PropertiesManager.java"


# instance fields
.field private file:Ljava/io/File;

.field private isExternalFile:Z

.field private propertiesFileName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    .line 12
    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    .line 16
    const-string v0, "benchmark.properties"

    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    .line 17
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    .line 12
    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    .line 21
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    .line 22
    iget-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    .line 12
    iput-object v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    .line 13
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    .line 26
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    .line 27
    iput-object p2, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    .line 28
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    .line 29
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_3b

    .line 31
    :try_start_36
    iget-object v1, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_3b} :catch_3c

    .line 36
    :cond_3b
    :goto_3b
    return-void

    .line 32
    :catch_3c
    move-exception v0

    .line 33
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Problem creating new properties file."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_3b
.end method


# virtual methods
.method public displayProperties()V
    .registers 5

    .prologue
    .line 39
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 40
    .local v1, "props":Ljava/util/Properties;
    const/4 v0, 0x0

    .line 42
    .local v0, "is":Ljava/io/InputStream;
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    iget-object v3, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_17} :catch_2a

    .line 47
    :goto_17
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 48
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/util/Properties;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 49
    return-void

    .line 44
    :catch_2a
    move-exception v2

    goto :goto_17
.end method

.method public getProperty(Ljava/lang/String;I)I
    .registers 8
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 68
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 69
    .local v2, "props":Ljava/util/Properties;
    const/4 v0, 0x0

    .line 71
    .local v0, "is":Ljava/io/InputStream;
    :try_start_6
    iget-boolean v3, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    if-eqz v3, :cond_22

    .line 72
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v0    # "is":Ljava/io/InputStream;
    .local v1, "is":Ljava/io/InputStream;
    move-object v0, v1

    .line 76
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v0    # "is":Ljava/io/InputStream;
    :goto_12
    invoke-virtual {v2, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_15} :catch_31

    .line 80
    :goto_15
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    return v3

    .line 74
    :cond_22
    :try_start_22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iget-object v4, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2f} :catch_31

    move-result-object v0

    goto :goto_12

    .line 77
    :catch_31
    move-exception v3

    goto :goto_15
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 52
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 53
    .local v2, "props":Ljava/util/Properties;
    const/4 v0, 0x0

    .line 55
    .local v0, "is":Ljava/io/InputStream;
    :try_start_6
    iget-boolean v3, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    if-eqz v3, :cond_1a

    .line 56
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v0    # "is":Ljava/io/InputStream;
    .local v1, "is":Ljava/io/InputStream;
    move-object v0, v1

    .line 60
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v0    # "is":Ljava/io/InputStream;
    :goto_12
    invoke-virtual {v2, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_15} :catch_29

    .line 64
    :goto_15
    invoke-virtual {v2, p1, p2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 58
    :cond_1a
    :try_start_1a
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iget-object v4, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_27} :catch_29

    move-result-object v0

    goto :goto_12

    .line 61
    :catch_29
    move-exception v3

    goto :goto_15
.end method

.method public removeProperty(Ljava/lang/String;)V
    .registers 8
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 105
    const/4 v1, 0x0

    .line 107
    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    iget-object v5, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 109
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 110
    .local v3, "props":Ljava/util/Properties;
    invoke-virtual {v3, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 111
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 113
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 114
    .local v2, "out":Ljava/io/FileOutputStream;
    invoke-virtual {v3, p1}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 116
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2b} :catch_2c

    .line 121
    .end local v2    # "out":Ljava/io/FileOutputStream;
    .end local v3    # "props":Ljava/util/Properties;
    :goto_2b
    return-void

    .line 117
    :catch_2c
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "There was a problem removing a property from the properties file"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2b
.end method

.method public saveProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 86
    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    iget-boolean v5, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->isExternalFile:Z

    if-eqz v5, :cond_2a

    .line 87
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v5, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v1    # "in":Ljava/io/InputStream;
    .local v2, "in":Ljava/io/InputStream;
    move-object v1, v2

    .line 91
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :goto_d
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 92
    .local v4, "props":Ljava/util/Properties;
    invoke-virtual {v4, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 93
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 95
    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->file:Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 96
    .local v3, "out":Ljava/io/FileOutputStream;
    invoke-virtual {v4, p1, p2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 98
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 102
    .end local v3    # "out":Ljava/io/FileOutputStream;
    .end local v4    # "props":Ljava/util/Properties;
    :goto_29
    return-void

    .line 89
    :cond_2a
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    iget-object v6, p0, Lorg/owasp/benchmark/helpers/PropertiesManager;->propertiesFileName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_37} :catch_39

    move-result-object v1

    goto :goto_d

    .line 99
    :catch_39
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "There was a problem saving a property in the properties file"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_29
.end method
