.class public Lorg/owasp/benchmark/helpers/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static final BENCHMARK_DATA:Ljava/lang/String;

.field public static final DATAFOLDER_PATH:Ljava/lang/String;

.field private static cipher:Ljavax/crypto/Cipher;

.field public static final commonHeaders:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final failedTCFile:Ljava/lang/String;

.field public static final testfileDir:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    .prologue
    .line 88
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "user.dir"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "testfiles"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lorg/owasp/benchmark/helpers/Utils;->testfileDir:Ljava/lang/String;

    .line 91
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "user.dir"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "data"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "benchmark-failed-http.xml"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lorg/owasp/benchmark/helpers/Utils;->failedTCFile:Ljava/lang/String;

    .line 94
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "user.dir"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "data"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lorg/owasp/benchmark/helpers/Utils;->BENCHMARK_DATA:Ljava/lang/String;

    .line 97
    new-instance v8, Ljava/util/HashSet;

    const/16 v9, 0xe

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "host"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string v11, "user-agent"

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string v11, "accept"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-string v11, "accept-language"

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-string v11, "accept-encoding"

    aput-object v11, v9, v10

    const/4 v10, 0x5

    const-string v11, "content-type"

    aput-object v11, v9, v10

    const/4 v10, 0x6

    const-string v11, "x-requested-with"

    aput-object v11, v9, v10

    const/4 v10, 0x7

    const-string v11, "referer"

    aput-object v11, v9, v10

    const/16 v10, 0x8

    const-string v11, "content-length"

    aput-object v11, v9, v10

    const/16 v10, 0x9

    const-string v11, "connection"

    aput-object v11, v9, v10

    const/16 v10, 0xa

    const-string v11, "pragma"

    aput-object v11, v9, v10

    const/16 v10, 0xb

    const-string v11, "cache-control"

    aput-object v11, v9, v10

    const/16 v10, 0xc

    const-string v11, "origin"

    aput-object v11, v9, v10

    const/16 v10, 0xd

    const-string v11, "cookie"

    aput-object v11, v9, v10

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v8, Lorg/owasp/benchmark/helpers/Utils;->commonHeaders:Ljava/util/Set;

    .line 101
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "user.dir"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "data"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lorg/owasp/benchmark/helpers/Utils;->DATAFOLDER_PATH:Ljava/lang/String;

    .line 104
    const/4 v8, 0x0

    sput-object v8, Lorg/owasp/benchmark/helpers/Utils;->cipher:Ljavax/crypto/Cipher;

    .line 107
    new-instance v5, Ljava/io/File;

    sget-object v8, Lorg/owasp/benchmark/helpers/Utils;->testfileDir:Ljava/lang/String;

    invoke-direct {v5, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 108
    .local v5, "tempDir":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_185

    .line 109
    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    .line 110
    new-instance v6, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lorg/owasp/benchmark/helpers/Utils;->testfileDir:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "FileName"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    .local v6, "testFile":Ljava/io/File;
    :try_start_12a
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v6}, Ljava/io/PrintWriter;-><init>(Ljava/io/File;)V

    .line 113
    .local v1, "out":Ljava/io/PrintWriter;
    const-string v8, "Test is a test file.\n"

    invoke-virtual {v1, v8}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 114
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V
    :try_end_137
    .catch Ljava/io/FileNotFoundException; {:try_start_12a .. :try_end_137} :catch_1cf

    .line 118
    .end local v1    # "out":Ljava/io/PrintWriter;
    :goto_137
    new-instance v7, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lorg/owasp/benchmark/helpers/Utils;->testfileDir:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "SafeText"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 120
    .local v7, "testFile2":Ljava/io/File;
    :try_start_151
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v7}, Ljava/io/PrintWriter;-><init>(Ljava/io/File;)V

    .line 121
    .restart local v1    # "out":Ljava/io/PrintWriter;
    const-string v8, "Test is a \'safe\' test file.\n"

    invoke-virtual {v1, v8}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 122
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V
    :try_end_15e
    .catch Ljava/io/FileNotFoundException; {:try_start_151 .. :try_end_15e} :catch_1d5

    .line 126
    .end local v1    # "out":Ljava/io/PrintWriter;
    :goto_15e
    new-instance v4, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lorg/owasp/benchmark/helpers/Utils;->testfileDir:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "SecretFile"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 128
    .local v4, "secreTestFile":Ljava/io/File;
    :try_start_178
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/File;)V

    .line 129
    .restart local v1    # "out":Ljava/io/PrintWriter;
    const-string v8, "Test is a \'secret\' file that no one should find.\n"

    invoke-virtual {v1, v8}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 130
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V
    :try_end_185
    .catch Ljava/io/FileNotFoundException; {:try_start_178 .. :try_end_185} :catch_1da

    .line 135
    .end local v1    # "out":Ljava/io/PrintWriter;
    .end local v4    # "secreTestFile":Ljava/io/File;
    .end local v6    # "testFile":Ljava/io/File;
    .end local v7    # "testFile2":Ljava/io/File;
    :cond_185
    :goto_185
    const-string v8, "os.name"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "Windows"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1ce

    .line 136
    const-string v8, "insecureCmd.sh"

    const-class v9, Lorg/owasp/benchmark/helpers/Utils;

    invoke-virtual {v9}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v3

    .line 137
    .local v3, "script":Ljava/io/File;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 138
    .local v2, "perms":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/file/attribute/PosixFilePermission;>;"
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->OWNER_READ:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->OWNER_WRITE:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->OWNER_EXECUTE:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 141
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->GROUP_READ:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 142
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->GROUP_EXECUTE:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 143
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->OTHERS_READ:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 144
    sget-object v8, Ljava/nio/file/attribute/PosixFilePermission;->OTHERS_EXECUTE:Ljava/nio/file/attribute/PosixFilePermission;

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 147
    :try_start_1c7
    invoke-virtual {v3}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v8

    invoke-static {v8, v2}, Ljava/nio/file/Files;->setPosixFilePermissions(Ljava/nio/file/Path;Ljava/util/Set;)Ljava/nio/file/Path;
    :try_end_1ce
    .catch Ljava/io/IOException; {:try_start_1c7 .. :try_end_1ce} :catch_1df

    .line 153
    .end local v2    # "perms":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/file/attribute/PosixFilePermission;>;"
    .end local v3    # "script":Ljava/io/File;
    :cond_1ce
    :goto_1ce
    return-void

    .line 115
    .restart local v6    # "testFile":Ljava/io/File;
    :catch_1cf
    move-exception v0

    .line 116
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_137

    .line 123
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v7    # "testFile2":Ljava/io/File;
    :catch_1d5
    move-exception v0

    .line 124
    .restart local v0    # "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_15e

    .line 131
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v4    # "secreTestFile":Ljava/io/File;
    :catch_1da
    move-exception v0

    .line 132
    .restart local v0    # "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_185

    .line 148
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .end local v4    # "secreTestFile":Ljava/io/File;
    .end local v6    # "testFile":Ljava/io/File;
    .end local v7    # "testFile2":Ljava/io/File;
    .restart local v2    # "perms":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/file/attribute/PosixFilePermission;>;"
    .restart local v3    # "script":Ljava/io/File;
    :catch_1df
    move-exception v0

    .line 149
    .local v0, "e":Ljava/io/IOException;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Problem while changing executable permissions: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1ce
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deleteFile(Ljava/lang/String;)Z
    .registers 7
    .param p0, "completeName"    # Ljava/lang/String;

    .prologue
    .line 383
    const/4 v2, 0x1

    .line 384
    .local v2, "result":Z
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_f

    .line 387
    :try_start_c
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_f
    .catch Ljava/lang/SecurityException; {:try_start_c .. :try_end_f} :catch_10

    .line 393
    :cond_f
    :goto_f
    return v2

    .line 388
    :catch_10
    move-exception v0

    .line 389
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t delete file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 390
    const/4 v2, 0x0

    goto :goto_f
.end method

.method public static encodeForHTML(Ljava/lang/Object;)Ljava/lang/String;
    .registers 10
    .param p0, "param"    # Ljava/lang/Object;

    .prologue
    const/4 v8, 0x0

    .line 310
    const-string v6, "objectTypeUnknown"

    .line 311
    .local v6, "value":Ljava/lang/String;
    instance-of v7, p0, Ljava/lang/String;

    if-eqz v7, :cond_10

    .line 327
    :cond_7
    :goto_7
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v7

    invoke-interface {v7, v6}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 312
    :cond_10
    instance-of v7, p0, Ljava/io/InputStream;

    if-eqz v7, :cond_7

    .line 313
    const/16 v7, 0x3e8

    new-array v2, v7, [B

    .line 314
    .local v2, "buff":[B
    const/4 v4, 0x0

    .line 316
    .local v4, "length":I
    :try_start_19
    move-object v0, p0

    check-cast v0, Ljava/io/InputStream;

    move-object v5, v0

    .line 317
    .local v5, "stream":Ljava/io/InputStream;
    invoke-virtual {v5}, Ljava/io/InputStream;->reset()V

    .line 318
    invoke-virtual {v5, v2}, Ljava/io/InputStream;->read([B)I
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_23} :catch_31

    move-result v4

    .line 323
    .end local v5    # "stream":Ljava/io/InputStream;
    :goto_24
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 324
    .local v1, "b":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {v1, v2, v8, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 325
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    .line 319
    .end local v1    # "b":Ljava/io/ByteArrayOutputStream;
    :catch_31
    move-exception v3

    .line 320
    .local v3, "e":Ljava/io/IOException;
    const/16 v7, 0x3f

    aput-byte v7, v2, v8

    .line 321
    const/4 v4, 0x1

    goto :goto_24
.end method

.method public static getCipher()Ljavax/crypto/Cipher;
    .registers 5

    .prologue
    .line 531
    sget-object v3, Lorg/owasp/benchmark/helpers/Utils;->cipher:Ljavax/crypto/Cipher;

    if-nez v3, :cond_27

    .line 533
    :try_start_4
    const-string v3, "RSA/ECB/PKCS1Padding"

    const-string v4, "SunJCE"

    invoke-static {v3, v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    sput-object v3, Lorg/owasp/benchmark/helpers/Utils;->cipher:Ljavax/crypto/Cipher;

    .line 535
    const-string v3, "RSA"

    invoke-static {v3}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v1

    .line 536
    .local v1, "keyGen":Ljava/security/KeyPairGenerator;
    const/16 v3, 0x1000

    invoke-virtual {v1, v3}, Ljava/security/KeyPairGenerator;->initialize(I)V

    .line 537
    invoke-virtual {v1}, Ljava/security/KeyPairGenerator;->genKeyPair()Ljava/security/KeyPair;

    move-result-object v3

    invoke-virtual {v3}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v2

    .line 538
    .local v2, "publicKey":Ljava/security/PublicKey;
    sget-object v3, Lorg/owasp/benchmark/helpers/Utils;->cipher:Ljavax/crypto/Cipher;

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V
    :try_end_27
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_27} :catch_2f
    .catch Ljava/security/NoSuchProviderException; {:try_start_4 .. :try_end_27} :catch_2a
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_4 .. :try_end_27} :catch_31
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_27} :catch_33

    .line 544
    .end local v2    # "publicKey":Ljava/security/PublicKey;
    :cond_27
    :goto_27
    sget-object v3, Lorg/owasp/benchmark/helpers/Utils;->cipher:Ljavax/crypto/Cipher;

    return-object v3

    .line 539
    :catch_2a
    move-exception v0

    .line 541
    .local v0, "e":Ljava/security/GeneralSecurityException;
    :goto_2b
    invoke-virtual {v0}, Ljava/security/GeneralSecurityException;->printStackTrace()V

    goto :goto_27

    .line 539
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    :catch_2f
    move-exception v0

    goto :goto_2b

    :catch_31
    move-exception v0

    goto :goto_2b

    :catch_33
    move-exception v0

    goto :goto_2b
.end method

.method public static getCrawlerBenchmarkVersion(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 7
    .param p0, "http"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 465
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 466
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 467
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 468
    .local v3, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v3}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 469
    .local v0, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v4

    .line 471
    .local v4, "root":Lorg/w3c/dom/Node;
    const-string v5, "version"

    invoke-static {v5, v4}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;
    .registers 6
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 265
    invoke-virtual {p1, p0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 267
    .local v1, "url":Ljava/net/URL;
    :try_start_4
    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_11} :catch_12

    .line 271
    :goto_11
    return-object v2

    .line 268
    :catch_12
    move-exception v0

    .line 269
    .local v0, "e":Ljava/net/URISyntaxException;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "The file form the classpath cannot be loaded."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 271
    const/4 v2, 0x0

    goto :goto_11
.end method

.method public static getInsecureOSCommandString(Ljava/lang/ClassLoader;)Ljava/lang/String;
    .registers 5
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 169
    const/4 v0, 0x0

    .line 170
    .local v0, "command":Ljava/lang/String;
    const-string v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 171
    .local v1, "osName":Ljava/lang/String;
    const-string v2, "Windows"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1b

    .line 172
    const-string v2, "insecureCmd.bat"

    invoke-static {v2, p0}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 176
    :goto_1a
    return-object v0

    .line 174
    :cond_1b
    const-string v2, "insecureCmd.sh"

    invoke-static {v2, p0}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_1a
.end method

.method public static getLinesFromFile(Ljava/io/File;)Ljava/util/List;
    .registers 9
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 276
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_f

    .line 277
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "Can\'t find file to get lines from File."

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 278
    const/4 v5, 0x0

    .line 305
    :cond_e
    :goto_e
    return-object v5

    .line 281
    :cond_f
    const/4 v2, 0x0

    .line 282
    .local v2, "fr":Ljava/io/FileReader;
    const/4 v0, 0x0

    .line 284
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 287
    .local v5, "sourceLines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_16
    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_1b} :catch_60
    .catchall {:try_start_16 .. :try_end_1b} :catchall_4b

    .line 288
    .end local v2    # "fr":Ljava/io/FileReader;
    .local v3, "fr":Ljava/io/FileReader;
    :try_start_1b
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_20} :catch_62
    .catchall {:try_start_1b .. :try_end_20} :catchall_59

    .line 290
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_20
    :try_start_20
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_3a

    .line 291
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_29} :catch_2a
    .catchall {:try_start_20 .. :try_end_29} :catchall_5c

    goto :goto_20

    .line 293
    .end local v4    # "line":Ljava/lang/String;
    :catch_2a
    move-exception v6

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v2, v3

    .line 297
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    :goto_2d
    if-eqz v0, :cond_32

    .line 298
    :try_start_2f
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 299
    :cond_32
    if-eqz v2, :cond_e

    .line 300
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_37} :catch_38

    goto :goto_e

    .line 301
    :catch_38
    move-exception v6

    goto :goto_e

    .line 297
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    .restart local v4    # "line":Ljava/lang/String;
    :cond_3a
    if-eqz v1, :cond_3f

    .line 298
    :try_start_3c
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 299
    :cond_3f
    if-eqz v3, :cond_44

    .line 300
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_44} :catch_47

    :cond_44
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v2, v3

    .line 302
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    goto :goto_e

    .line 301
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    :catch_47
    move-exception v6

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v2, v3

    .line 303
    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    goto :goto_e

    .line 296
    .end local v4    # "line":Ljava/lang/String;
    :catchall_4b
    move-exception v6

    .line 297
    :goto_4c
    if-eqz v0, :cond_51

    .line 298
    :try_start_4e
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 299
    :cond_51
    if-eqz v2, :cond_56

    .line 300
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_56} :catch_57

    .line 303
    :cond_56
    :goto_56
    throw v6

    .line 301
    :catch_57
    move-exception v7

    goto :goto_56

    .line 296
    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    :catchall_59
    move-exception v6

    move-object v2, v3

    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    goto :goto_4c

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    :catchall_5c
    move-exception v6

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v2, v3

    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    goto :goto_4c

    .line 293
    :catch_60
    move-exception v6

    goto :goto_2d

    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v3    # "fr":Ljava/io/FileReader;
    :catch_62
    move-exception v6

    move-object v2, v3

    .end local v3    # "fr":Ljava/io/FileReader;
    .restart local v2    # "fr":Ljava/io/FileReader;
    goto :goto_2d
.end method

.method public static getOSCommandArray(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p0, "append"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .local v0, "cmds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "osName":Ljava/lang/String;
    const-string v2, "Windows"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_24

    .line 185
    const-string v2, "cmd.exe"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    const-string v2, "/c"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    if-eqz p0, :cond_23

    .line 188
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    :cond_23
    :goto_23
    return-object v0

    .line 191
    :cond_24
    const-string v2, "sh"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    const-string v2, "-c"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    if-eqz p0, :cond_23

    .line 194
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23
.end method

.method public static getOSCommandString(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "append"    # Ljava/lang/String;

    .prologue
    .line 157
    const/4 v0, 0x0

    .line 158
    .local v0, "command":Ljava/lang/String;
    const-string v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "osName":Ljava/lang/String;
    const-string v2, "Windows"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2a

    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cmd.exe /c "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 165
    :goto_29
    return-object v0

    .line 162
    :cond_2a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_29
.end method

.method public static getSSLFactory()Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 548
    invoke-static {}, Lorg/apache/http/ssl/SSLContexts;->custom()Lorg/apache/http/ssl/SSLContextBuilder;

    move-result-object v2

    new-instance v3, Lorg/apache/http/conn/ssl/TrustSelfSignedStrategy;

    invoke-direct {v3}, Lorg/apache/http/conn/ssl/TrustSelfSignedStrategy;-><init>()V

    invoke-virtual {v2, v5, v3}, Lorg/apache/http/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;Lorg/apache/http/ssl/TrustStrategy;)Lorg/apache/http/ssl/SSLContextBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/http/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 550
    .local v0, "sslcontext":Ljavax/net/ssl/SSLContext;
    new-instance v1, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "TLSv1"

    aput-object v4, v2, v3

    sget-object v3, Lorg/apache/http/conn/ssl/NoopHostnameVerifier;->INSTANCE:Lorg/apache/http/conn/ssl/NoopHostnameVerifier;

    invoke-direct {v1, v0, v2, v5, v3}, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;[Ljava/lang/String;[Ljava/lang/String;Ljavax/net/ssl/HostnameVerifier;)V

    .line 552
    .local v1, "sslsf":Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;
    return-object v1
.end method

.method public static parseHttpFile(Ljava/io/InputStream;)Ljava/util/List;
    .registers 12
    .param p0, "http"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 475
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 476
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 477
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 478
    .local v3, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v3}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 479
    .local v0, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 481
    .local v6, "root":Lorg/w3c/dom/Node;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 482
    .local v5, "requests":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;>;"
    const-string v9, "benchmarkTest"

    invoke-static {v9, v6}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v8

    .line 483
    .local v8, "tests":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_24
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_38

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Node;

    .line 484
    .local v7, "test":Lorg/w3c/dom/Node;
    invoke-static {v7}, Lorg/owasp/benchmark/helpers/Utils;->parseHttpTest(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;

    move-result-object v4

    .line 485
    .local v4, "request":Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_24

    .line 487
    .end local v4    # "request":Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
    .end local v7    # "test":Lorg/w3c/dom/Node;
    :cond_38
    return-object v5
.end method

.method public static parseHttpFile(Ljava/io/InputStream;Ljava/util/List;)Ljava/util/List;
    .registers 27
    .param p0, "http"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 398
    .local p1, "failedTestCases":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v2, ""

    .line 400
    .local v2, "URL":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v5

    .line 401
    .local v5, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v4

    .line 402
    .local v4, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v8, Lorg/xml/sax/InputSource;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 403
    .local v8, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v4, v8}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v3

    .line 404
    .local v3, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v3}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v16

    .line 406
    .local v16, "root":Lorg/w3c/dom/Node;
    const/4 v10, 0x0

    .line 407
    .local v10, "newCrawlerBF":Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v11, 0x0

    .line 408
    .local v11, "newCrawlerBuilder":Ljavax/xml/parsers/DocumentBuilder;
    const/4 v12, 0x0

    .line 409
    .local v12, "newCrawlerDoc":Lorg/w3c/dom/Document;
    const/4 v9, 0x0

    .line 410
    .local v9, "newCrawkerRootElement":Lorg/w3c/dom/Element;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v10

    .line 414
    :try_start_21
    invoke-virtual {v10}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    :try_end_24
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_21 .. :try_end_24} :catch_a5

    move-result-object v11

    .line 418
    :goto_25
    invoke-virtual {v11}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v12

    .line 419
    const-string v22, "benchmarkSuite"

    move-object/from16 v0, v22

    invoke-interface {v12, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v9

    .line 420
    invoke-interface {v12, v9}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 422
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 423
    .local v14, "requests":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;>;"
    const-string v22, "benchmarkTest"

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v19

    .line 424
    .local v19, "tests":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :cond_47
    :goto_47
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_af

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/w3c/dom/Node;

    .line 425
    .local v18, "test":Lorg/w3c/dom/Node;
    const-string v23, "URL"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 426
    const-string v23, "BenchmarkTest"

    .line 427
    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v23

    const-string v24, "BenchmarkTest"

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v24

    add-int/lit8 v24, v24, 0x12

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_47

    .line 428
    invoke-static/range {v18 .. v18}, Lorg/owasp/benchmark/helpers/Utils;->parseHttpTest(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 429
    const/16 v23, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v13

    .line 430
    .local v13, "newNode":Lorg/w3c/dom/Node;
    invoke-interface {v12, v13}, Lorg/w3c/dom/Document;->adoptNode(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 431
    invoke-interface {v12}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v0, v13}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_47

    .line 415
    .end local v13    # "newNode":Lorg/w3c/dom/Node;
    .end local v14    # "requests":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;>;"
    .end local v18    # "test":Lorg/w3c/dom/Node;
    .end local v19    # "tests":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :catch_a5
    move-exception v6

    .line 416
    .local v6, "e":Ljavax/xml/parsers/ParserConfigurationException;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Problem init the Crawler XML file"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_25

    .line 437
    .end local v6    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v14    # "requests":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;>;"
    .restart local v19    # "tests":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :cond_af
    new-instance v7, Ljava/io/File;

    sget-object v22, Lorg/owasp/benchmark/helpers/Utils;->failedTCFile:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 438
    .local v7, "file":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_c4

    .line 439
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    move-result v22

    if-eqz v22, :cond_c4

    .line 444
    :cond_c4
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v21

    .line 446
    .local v21, "transformerFactory":Ljavax/xml/transform/TransformerFactory;
    :try_start_c8
    invoke-virtual/range {v21 .. v21}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v20

    .line 447
    .local v20, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v17, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 449
    .local v17, "source":Ljavax/xml/transform/dom/DOMSource;
    new-instance v15, Ljavax/xml/transform/stream/StreamResult;

    sget-object v22, Lorg/owasp/benchmark/helpers/Utils;->failedTCFile:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-direct {v15, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/lang/String;)V

    .line 454
    .local v15, "result":Ljavax/xml/transform/stream/StreamResult;
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v15}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_e3
    .catch Ljavax/xml/transform/TransformerException; {:try_start_c8 .. :try_end_e3} :catch_e4

    .line 461
    .end local v15    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v17    # "source":Ljavax/xml/transform/dom/DOMSource;
    .end local v20    # "transformer":Ljavax/xml/transform/Transformer;
    :goto_e3
    return-object v14

    .line 455
    :catch_e4
    move-exception v6

    .line 458
    .local v6, "e":Ljavax/xml/transform/TransformerException;
    invoke-virtual {v6}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_e3
.end method

.method public static parseHttpTest(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/tools/AbstractTestCaseRequest;
    .registers 12
    .param p0, "test"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 491
    const-string v9, "tcType"

    invoke-static {v9, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 492
    .local v3, "tcType":Ljava/lang/String;
    const-string v9, "URL"

    invoke-static {v9, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 493
    .local v2, "fullURL":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "BenchmarkTest"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "tname"

    invoke-static {v10, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 494
    .local v1, "name":Ljava/lang/String;
    const-string v8, ""

    .line 496
    .local v8, "payload":Ljava/lang/String;
    const-string v9, "header"

    invoke-static {v9, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v4

    .line 497
    .local v4, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v9, "cookie"

    invoke-static {v9, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v5

    .line 498
    .local v5, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v9, "getparam"

    invoke-static {v9, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v6

    .line 499
    .local v6, "getParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const-string v9, "formparam"

    invoke-static {v9, p0}, Lorg/owasp/benchmark/tools/XMLCrawler;->getNamedChildren(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/util/List;

    move-result-object v7

    .line 501
    .local v7, "formParams":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const/4 v9, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v10

    packed-switch v10, :pswitch_data_5c

    :cond_47
    :goto_47
    packed-switch v9, :pswitch_data_62

    .line 508
    const/4 v0, 0x0

    :goto_4b
    return-object v0

    .line 501
    :pswitch_4c
    const-string v10, "SERVLET"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_47

    const/4 v9, 0x0

    goto :goto_47

    .line 503
    :pswitch_56
    new-instance v0, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;

    invoke-direct/range {v0 .. v8}, Lorg/owasp/benchmark/tools/ServletTestCaseRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 505
    .local v0, "svlTC":Lorg/owasp/benchmark/tools/ServletTestCaseRequest;
    goto :goto_4b

    .line 501
    :pswitch_data_5c
    .packed-switch -0x5ef0a1db
        :pswitch_4c
    .end packed-switch

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_56
    .end packed-switch
.end method

.method public static printOSCommandResults(Ljava/lang/Process;Ljava/util/List;)V
    .registers 11
    .param p0, "proc"    # Ljava/lang/Process;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Process;",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 239
    .local p1, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 240
    .local v5, "stdInput":Ljava/io/BufferedReader;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 244
    .local v4, "stdError":Ljava/io/BufferedReader;
    :try_start_1c
    new-instance v6, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v7, "Message"

    const-string v8, "Here is the standard output of the command:<br>"

    invoke-direct {v6, v7, v8}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    const/4 v3, 0x0

    .line 246
    .local v3, "s":Ljava/lang/String;
    const/4 v1, 0x0

    .line 247
    .local v1, "out":Ljava/lang/String;
    const/4 v2, 0x0

    .line 248
    .local v2, "outError":Ljava/lang/String;
    :goto_2b
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4d

    .line 249
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v7

    invoke-interface {v7, v3}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "<br>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2b

    .line 251
    :cond_4d
    new-instance v6, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v7, "Message"

    invoke-direct {v6, v7, v1}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    new-instance v6, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v7, "Message"

    const-string v8, "<br>Here is the std err of the command (if any):<br>"

    invoke-direct {v6, v7, v8}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    :goto_63
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_85

    .line 255
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v7

    invoke-interface {v7, v3}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "<br>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_63

    .line 258
    :cond_85
    new-instance v6, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v7, "Message"

    invoke-direct {v6, v7, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_8f
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_8f} :catch_90

    .line 262
    .end local v1    # "out":Ljava/lang/String;
    .end local v2    # "outError":Ljava/lang/String;
    .end local v3    # "s":Ljava/lang/String;
    :goto_8f
    return-void

    .line 259
    :catch_90
    move-exception v0

    .line 260
    .local v0, "e":Ljava/io/IOException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "An error ocurred while printOSCommandResults"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_8f
.end method

.method public static printOSCommandResults(Ljava/lang/Process;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 9
    .param p0, "proc"    # Ljava/lang/Process;
    .param p1, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v1

    .line 203
    .local v1, "out":Ljava/io/PrintWriter;
    const-string v5, "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n</head>\n<body>\n<p>\n"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 209
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 210
    .local v4, "stdInput":Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 216
    .local v3, "stdError":Ljava/io/BufferedReader;
    :try_start_25
    const-string v5, "Here is the standard output of the command:<br>"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 217
    const/4 v2, 0x0

    .line 218
    .local v2, "s":Ljava/lang/String;
    :goto_2b
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4b

    .line 220
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v5

    invoke-interface {v5, v2}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 221
    const-string v5, "<br>"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_41} :catch_42

    goto :goto_2b

    .line 233
    .end local v2    # "s":Ljava/lang/String;
    :catch_42
    move-exception v0

    .line 234
    .local v0, "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "An error ocurred while printOSCommandResults"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 236
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4a
    return-void

    .line 227
    .restart local v2    # "s":Ljava/lang/String;
    :cond_4b
    :try_start_4b
    const-string v5, "<br>Here is the std err of the command (if any):<br>"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 228
    :goto_50
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4a

    .line 230
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v5

    invoke-interface {v5, v2}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 231
    const-string v5, "<br>"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_66} :catch_42

    goto :goto_50
.end method

.method public static printRequestBase(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .registers 10
    .param p0, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 556
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 557
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v5, :cond_3a

    aget-object v2, v4, v3

    .line 558
    .local v2, "header":Lorg/apache/http/Header;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 557
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 560
    .end local v2    # "header":Lorg/apache/http/Header;
    :cond_3a
    check-cast p0, Lorg/apache/http/client/methods/HttpPost;

    .end local p0    # "request":Lorg/apache/http/client/methods/HttpRequestBase;
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpPost;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 563
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    :try_start_40
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_49
    .catch Lorg/apache/http/ParseException; {:try_start_40 .. :try_end_49} :catch_4a
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_49} :catch_4f

    .line 567
    :goto_49
    return-void

    .line 564
    :catch_4a
    move-exception v0

    .line 565
    .local v0, "e":Ljava/lang/Exception;
    :goto_4b
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_49

    .line 564
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_4f
    move-exception v0

    goto :goto_4b
.end method

.method public static readCSVFailedTC(Ljava/lang/String;)Ljava/util/List;
    .registers 10
    .param p0, "csvFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 512
    const-string v4, ""

    .line 513
    .local v4, "line":Ljava/lang/String;
    const-string v2, ","

    .line 514
    .local v2, "cvsSplitBy":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 517
    .local v1, "csv":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_9
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_13} :catch_40

    .local v0, "br":Ljava/io/BufferedReader;
    const/4 v8, 0x0

    .line 518
    :cond_14
    :goto_14
    :try_start_14
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_45

    .line 519
    invoke-virtual {v4, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 520
    .local v5, "tempLine":[Ljava/lang/String;
    const/4 v6, 0x5

    aget-object v6, v5, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, "fail"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 521
    const/4 v6, 0x0

    aget-object v6, v5, v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_33} :catch_34
    .catchall {:try_start_14 .. :try_end_33} :catchall_5f

    goto :goto_14

    .line 517
    .end local v5    # "tempLine":[Ljava/lang/String;
    :catch_34
    move-exception v6

    :try_start_35
    throw v6
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_36

    .line 524
    :catchall_36
    move-exception v7

    move-object v8, v6

    :goto_38
    if-eqz v0, :cond_3f

    if-eqz v8, :cond_5b

    :try_start_3c
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3f} :catch_56
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3f} :catch_40

    :cond_3f
    :goto_3f
    :try_start_3f
    throw v7
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_40} :catch_40

    .end local v0    # "br":Ljava/io/BufferedReader;
    :catch_40
    move-exception v3

    .line 525
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 527
    .end local v3    # "e":Ljava/io/IOException;
    :cond_44
    :goto_44
    return-object v1

    .line 524
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :cond_45
    if-eqz v0, :cond_44

    if-eqz v8, :cond_52

    :try_start_49
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_4c} :catch_4d
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_40

    goto :goto_44

    :catch_4d
    move-exception v6

    :try_start_4e
    invoke-virtual {v8, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_44

    :cond_52
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    goto :goto_44

    :catch_56
    move-exception v6

    invoke-virtual {v8, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3f

    :cond_5b
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_5e} :catch_40

    goto :goto_3f

    :catchall_5f
    move-exception v6

    move-object v7, v6

    goto :goto_38
.end method

.method public static writeLineToFile(Ljava/nio/file/Path;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 10
    .param p0, "pathToFileDir"    # Ljava/nio/file/Path;
    .param p1, "completeName"    # Ljava/lang/String;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 358
    const/4 v5, 0x1

    .line 359
    .local v5, "result":Z
    const/4 v3, 0x0

    .line 361
    .local v3, "os":Ljava/io/PrintStream;
    const/4 v6, 0x0

    :try_start_3
    new-array v6, v6, [Ljava/nio/file/attribute/FileAttribute;

    invoke-static {p0, v6}, Ljava/nio/file/Files;->createDirectories(Ljava/nio/file/Path;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/file/Path;

    .line 362
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 363
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_16

    .line 366
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 369
    :cond_16
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v6, 0x1

    invoke-direct {v2, v1, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 370
    .local v2, "fos":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/PrintStream;

    invoke-direct {v4, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_21} :catch_29
    .catchall {:try_start_3 .. :try_end_21} :catchall_32

    .line 371
    .end local v3    # "os":Ljava/io/PrintStream;
    .local v4, "os":Ljava/io/PrintStream;
    :try_start_21
    invoke-virtual {v4, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_24} :catch_3a
    .catchall {:try_start_21 .. :try_end_24} :catchall_37

    .line 376
    invoke-virtual {v4}, Ljava/io/PrintStream;->close()V

    move-object v3, v4

    .line 379
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v4    # "os":Ljava/io/PrintStream;
    .restart local v3    # "os":Ljava/io/PrintStream;
    :goto_28
    return v5

    .line 372
    :catch_29
    move-exception v0

    .line 373
    .local v0, "e1":Ljava/io/IOException;
    :goto_2a
    const/4 v5, 0x0

    .line 374
    :try_start_2b
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2e
    .catchall {:try_start_2b .. :try_end_2e} :catchall_32

    .line 376
    invoke-virtual {v3}, Ljava/io/PrintStream;->close()V

    goto :goto_28

    .end local v0    # "e1":Ljava/io/IOException;
    :catchall_32
    move-exception v6

    :goto_33
    invoke-virtual {v3}, Ljava/io/PrintStream;->close()V

    .line 377
    throw v6

    .line 376
    .end local v3    # "os":Ljava/io/PrintStream;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "os":Ljava/io/PrintStream;
    :catchall_37
    move-exception v6

    move-object v3, v4

    .end local v4    # "os":Ljava/io/PrintStream;
    .restart local v3    # "os":Ljava/io/PrintStream;
    goto :goto_33

    .line 372
    .end local v3    # "os":Ljava/io/PrintStream;
    .restart local v4    # "os":Ljava/io/PrintStream;
    :catch_3a
    move-exception v0

    move-object v3, v4

    .end local v4    # "os":Ljava/io/PrintStream;
    .restart local v3    # "os":Ljava/io/PrintStream;
    goto :goto_2a
.end method

.method public static writeTimeFile(Ljava/nio/file/Path;Ljava/lang/String;Ljava/util/List;Z)Z
    .registers 13
    .param p0, "pathToFileDir"    # Ljava/nio/file/Path;
    .param p1, "completeName"    # Ljava/lang/String;
    .param p3, "append"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/file/Path;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)Z"
        }
    .end annotation

    .prologue
    .line 332
    .local p2, "outputLines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x1

    .line 333
    .local v6, "result":Z
    const/4 v4, 0x0

    .line 335
    .local v4, "os":Ljava/io/PrintStream;
    const/4 v7, 0x0

    :try_start_3
    new-array v7, v7, [Ljava/nio/file/attribute/FileAttribute;

    invoke-static {p0, v7}, Ljava/nio/file/Files;->createDirectories(Ljava/nio/file/Path;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/file/Path;

    .line 336
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 337
    .local v1, "f":Ljava/io/File;
    if-nez p3, :cond_12

    .line 338
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 340
    :cond_12
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 341
    .local v2, "fos":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/io/PrintStream;

    invoke-direct {v5, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_1c} :catch_47
    .catchall {:try_start_3 .. :try_end_1c} :catchall_3f

    .line 343
    .end local v4    # "os":Ljava/io/PrintStream;
    .local v5, "os":Ljava/io/PrintStream;
    :try_start_1c
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_20
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 344
    .local v3, "ol":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_2f} :catch_30
    .catchall {:try_start_1c .. :try_end_2f} :catchall_44

    goto :goto_20

    .line 347
    .end local v3    # "ol":Ljava/lang/String;
    :catch_30
    move-exception v0

    move-object v4, v5

    .line 348
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "os":Ljava/io/PrintStream;
    .local v0, "e1":Ljava/io/IOException;
    .restart local v4    # "os":Ljava/io/PrintStream;
    :goto_32
    const/4 v6, 0x0

    .line 349
    :try_start_33
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_3f

    .line 351
    invoke-virtual {v4}, Ljava/io/PrintStream;->close()V

    .line 354
    .end local v0    # "e1":Ljava/io/IOException;
    :goto_39
    return v6

    .line 351
    .end local v4    # "os":Ljava/io/PrintStream;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "os":Ljava/io/PrintStream;
    :cond_3a
    invoke-virtual {v5}, Ljava/io/PrintStream;->close()V

    move-object v4, v5

    .line 352
    .end local v5    # "os":Ljava/io/PrintStream;
    .restart local v4    # "os":Ljava/io/PrintStream;
    goto :goto_39

    .line 351
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    :catchall_3f
    move-exception v7

    :goto_40
    invoke-virtual {v4}, Ljava/io/PrintStream;->close()V

    .line 352
    throw v7

    .line 351
    .end local v4    # "os":Ljava/io/PrintStream;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "os":Ljava/io/PrintStream;
    :catchall_44
    move-exception v7

    move-object v4, v5

    .end local v5    # "os":Ljava/io/PrintStream;
    .restart local v4    # "os":Ljava/io/PrintStream;
    goto :goto_40

    .line 347
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_47
    move-exception v0

    goto :goto_32
.end method
