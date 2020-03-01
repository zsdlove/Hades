.class Lorg/owasp/benchmark/score/WriteFiles;
.super Ljava/lang/Object;
.source "WriteTime.java"


# static fields
.field private static final CONTRAST_FILE:Ljava/lang/String; = "Benchmark_"

.field private static final CSV_TIMES_FILE:Ljava/lang/String; = "out.csv"

.field private static final FINDBUGS_FILE:Ljava/lang/String; = "target/findbugsXml.xml"

.field private static final PMD_FILE:Ljava/lang/String; = "target/pmd.xml"

.field private static final SONAR_FILE:Ljava/lang/String; = "target/sonarqube.xml"

.field private static final SPOTBUGS_FILE:Ljava/lang/String; = "target/spotbugsXml.xml"

.field private static final USER_AGENT:Ljava/lang/String; = "Mozilla/5.0"

.field private static final VERSION_FILE:Ljava/lang/String; = "benchmark.properties"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getFindFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 350
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 351
    .local v0, "folder":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 353
    .local v2, "listOfFiles":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v3, v2

    if-ge v1, v3, :cond_2b

    .line 354
    aget-object v3, v2, v1

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_28

    aget-object v3, v2, v1

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 355
    aget-object v3, v2, v1

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 358
    :goto_27
    return-object v3

    .line 353
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 358
    :cond_2b
    const-string v3, ""

    goto :goto_27
.end method

.method public static getLine(Ljava/io/File;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 11
    .param p0, "file"    # Ljava/io/File;
    .param p1, "toFind"    # Ljava/lang/String;
    .param p2, "nextLine"    # Z

    .prologue
    .line 147
    const/4 v0, 0x0

    .line 149
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_b5
    .catchall {:try_start_1 .. :try_end_b} :catchall_ea

    .line 150
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_b
    const-string v3, ""

    .line 151
    .local v3, "line":Ljava/lang/String;
    :goto_d
    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_84

    .line 152
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 153
    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_81

    .line 154
    if-eqz p2, :cond_53

    .line 155
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_24} :catch_11b
    .catchall {:try_start_b .. :try_end_24} :catchall_118

    move-result-object v3

    .line 168
    .end local v3    # "line":Ljava/lang/String;
    if-eqz v1, :cond_2a

    .line 169
    :try_start_27
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_2c

    :cond_2a
    :goto_2a
    move-object v0, v1

    .line 176
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_2b
    return-object v3

    .line 170
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_2c
    move-exception v2

    .line 171
    .local v2, "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t close filereader for file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 172
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for some reason."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 171
    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_2a

    .line 168
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_53
    if-eqz v1, :cond_58

    .line 169
    :try_start_55
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_5a

    :cond_58
    :goto_58
    move-object v0, v1

    .line 157
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_2b

    .line 170
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_5a
    move-exception v2

    .line 171
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t close filereader for file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 172
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for some reason."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 171
    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_58

    .line 160
    .end local v2    # "e":Ljava/io/IOException;
    :cond_81
    :try_start_81
    const-string v3, ""
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_81 .. :try_end_83} :catch_11b
    .catchall {:try_start_81 .. :try_end_83} :catchall_118

    goto :goto_d

    .line 168
    :cond_84
    if-eqz v1, :cond_89

    .line 169
    :try_start_86
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_89} :catch_8d

    :cond_89
    move-object v0, v1

    .line 176
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :cond_8a
    :goto_8a
    const-string v3, ""

    goto :goto_2b

    .line 170
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :catch_8d
    move-exception v2

    .line 171
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t close filereader for file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 172
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for some reason."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 171
    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-object v0, v1

    .line 175
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_8a

    .line 164
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "line":Ljava/lang/String;
    :catch_b5
    move-exception v2

    .line 165
    .local v2, "e":Ljava/lang/Exception;
    :goto_b6
    :try_start_b6
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Error"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_bd
    .catchall {:try_start_b6 .. :try_end_bd} :catchall_ea

    .line 168
    if-eqz v0, :cond_8a

    .line 169
    :try_start_bf
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_c2
    .catch Ljava/io/IOException; {:try_start_bf .. :try_end_c2} :catch_c3

    goto :goto_8a

    .line 170
    :catch_c3
    move-exception v2

    .line 171
    .local v2, "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t close filereader for file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 172
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for some reason."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 171
    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_8a

    .line 167
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_ea
    move-exception v4

    .line 168
    :goto_eb
    if-eqz v0, :cond_f0

    .line 169
    :try_start_ed
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_f0
    .catch Ljava/io/IOException; {:try_start_ed .. :try_end_f0} :catch_f1

    .line 175
    :cond_f0
    :goto_f0
    throw v4

    .line 170
    :catch_f1
    move-exception v2

    .line 171
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can\'t close filereader for file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 172
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for some reason."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 171
    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_f0

    .line 167
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_118
    move-exception v4

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_eb

    .line 164
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_11b
    move-exception v2

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_b6
.end method

.method public static getSonarResults(Ljava/lang/String;I)Ljava/lang/String;
    .registers 11
    .param p0, "sonarURL"    # Ljava/lang/String;
    .param p1, "page"    # I

    .prologue
    .line 291
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 293
    .local v5, "response":Ljava/lang/StringBuffer;
    :try_start_5
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/api/issues/search?resolved=false&ps=500&p="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 294
    .local v6, "url":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 295
    .local v4, "obj":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 296
    .local v0, "con":Ljava/net/HttpURLConnection;
    const-string v7, "GET"

    invoke-virtual {v0, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 297
    const-string v7, "User-Agent"

    const-string v8, "Mozilla/5.0"

    invoke-virtual {v0, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    .line 300
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 303
    .local v2, "in":Ljava/io/BufferedReader;
    :goto_41
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "inputLine":Ljava/lang/String;
    if-eqz v3, :cond_58

    .line 304
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_4a} :catch_4b

    goto :goto_41

    .line 307
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v3    # "inputLine":Ljava/lang/String;
    .end local v4    # "obj":Ljava/net/URL;
    .end local v6    # "url":Ljava/lang/String;
    :catch_4b
    move-exception v1

    .line 308
    .local v1, "e":Ljava/lang/Exception;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "There was an error trying to retrieve SonarQube results."

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 310
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_53
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 306
    .restart local v0    # "con":Ljava/net/HttpURLConnection;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "inputLine":Ljava/lang/String;
    .restart local v4    # "obj":Ljava/net/URL;
    .restart local v6    # "url":Ljava/lang/String;
    :cond_58
    :try_start_58
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5b} :catch_4b

    goto :goto_53
.end method

.method public static listPathFiles(Ljava/lang/String;)V
    .registers 6
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 181
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 182
    .local v1, "folder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 184
    .local v3, "listOfFiles":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    array-length v4, v3

    if-ge v2, v4, :cond_23

    .line 186
    aget-object v4, v3, v2

    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_20

    .line 187
    aget-object v4, v3, v2

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "files":Ljava/lang/String;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 184
    .end local v0    # "files":Ljava/lang/String;
    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 191
    :cond_23
    return-void
.end method


# virtual methods
.method public deletePreviousResults(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "toolName"    # Ljava/lang/String;
    .param p2, "toolVersion"    # Ljava/lang/String;
    .param p3, "benchmarkVersion"    # Ljava/lang/String;

    .prologue
    .line 195
    const-string v3, ""

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6f

    .line 196
    new-instance v2, Ljava/io/File;

    const-string v3, "results/"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 197
    .local v2, "targetDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 198
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 199
    .local v1, "files":[Ljava/io/File;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_1b
    if-ge v3, v4, :cond_68

    aget-object v0, v1, v3

    .line 200
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_65

    .line 201
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Benchmark_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-v"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_65

    .line 204
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "xml"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_65

    .line 205
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 199
    :cond_65
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 208
    .end local v0    # "file":Ljava/io/File;
    :cond_68
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Deleted previously generated results files."

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 211
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "targetDir":Ljava/io/File;
    :cond_6f
    return-void
.end method

.method public getToolTime(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "toolName"    # Ljava/lang/String;

    .prologue
    .line 314
    const/4 v4, 0x3

    new-array v2, v4, [Ljava/lang/String;

    .line 315
    .local v2, "results":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 316
    .local v3, "time":Ljava/lang/String;
    const-string v4, "out.csv"

    .line 317
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    .line 316
    invoke-static {v4, v5}, Lorg/owasp/benchmark/helpers/Utils;->getFileFromClasspath(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/owasp/benchmark/helpers/Utils;->getLinesFromFile(Ljava/io/File;)Ljava/util/List;

    move-result-object v1

    .line 318
    .local v1, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_47

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 319
    .local v0, "i":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 320
    const-string v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 321
    const/4 v4, 0x2

    aget-object v4, v2, v4

    const-string v5, "\""

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 323
    const-string v4, "\\."

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v4, v4, v5

    .line 326
    .end local v0    # "i":Ljava/lang/String;
    :goto_46
    return-object v4

    :cond_47
    const-string v4, ""

    goto :goto_46
.end method

.method public getVersionNumber(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "toolName"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 108
    :try_start_1
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 110
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v7, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v9, 0x1

    invoke-virtual {v2, v7, v9}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 111
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 112
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    const/4 v5, 0x0

    .line 113
    .local v5, "is":Lorg/xml/sax/InputSource;
    const/4 v0, 0x0

    .line 114
    .local v0, "doc":Lorg/w3c/dom/Document;
    const/4 v6, 0x0

    .line 116
    .local v6, "root":Lorg/w3c/dom/Node;
    new-instance v4, Ljava/io/File;

    const-string v7, "target/findbugsXml.xml"

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 118
    .local v4, "findbugsFile":Ljava/io/File;
    const/4 v7, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1d} :catch_c1

    move-result v9

    sparse-switch v9, :sswitch_data_e0

    :cond_21
    :goto_21
    packed-switch v7, :pswitch_data_f6

    .line 143
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v2    # "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v4    # "findbugsFile":Ljava/io/File;
    .end local v5    # "is":Lorg/xml/sax/InputSource;
    .end local v6    # "root":Lorg/w3c/dom/Node;
    :goto_24
    const-string v7, ""

    :goto_26
    return-object v7

    .line 118
    .restart local v0    # "doc":Lorg/w3c/dom/Document;
    .restart local v1    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2    # "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v4    # "findbugsFile":Ljava/io/File;
    .restart local v5    # "is":Lorg/xml/sax/InputSource;
    .restart local v6    # "root":Lorg/w3c/dom/Node;
    :sswitch_27
    :try_start_27
    const-string v8, "spotbugs"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    const/4 v7, 0x0

    goto :goto_21

    :sswitch_31
    const-string v9, "findbugs"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_21

    move v7, v8

    goto :goto_21

    :sswitch_3b
    const-string v8, "findsecbugs"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    const/4 v7, 0x2

    goto :goto_21

    :sswitch_45
    const-string v8, "pmd"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    const/4 v7, 0x3

    goto :goto_21

    :sswitch_4f
    const-string v8, "sonar"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    const/4 v7, 0x4

    goto :goto_21

    .line 120
    :pswitch_59
    new-instance v4, Ljava/io/File;

    .end local v4    # "findbugsFile":Ljava/io/File;
    const-string v7, "target/spotbugsXml.xml"

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 123
    .restart local v4    # "findbugsFile":Ljava/io/File;
    :pswitch_60
    new-instance v5, Lorg/xml/sax/InputSource;

    .end local v5    # "is":Lorg/xml/sax/InputSource;
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v7}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 124
    .restart local v5    # "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v5}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 125
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 126
    const-string v7, "version"

    invoke-static {v7, v6}, Lorg/owasp/benchmark/score/parsers/Reader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v7

    goto :goto_26

    .line 128
    :pswitch_79
    new-instance v7, Ljava/io/File;

    const-string v8, "pom.xml"

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v8, "findsecbugs-plugin"

    const/4 v9, 0x1

    .line 129
    invoke-static {v7, v8, v9}, Lorg/owasp/benchmark/score/WriteFiles;->getLine(Ljava/io/File;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 130
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "<version>"

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "</version>"

    const-string v9, ""

    .line 131
    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    goto :goto_26

    .line 133
    :pswitch_9c
    new-instance v5, Lorg/xml/sax/InputSource;

    .end local v5    # "is":Lorg/xml/sax/InputSource;
    new-instance v7, Ljava/io/FileInputStream;

    new-instance v8, Ljava/io/File;

    const-string v9, "target/pmd.xml"

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v7}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 134
    .restart local v5    # "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v5}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 135
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 136
    const-string v7, "version"

    invoke-static {v7, v6}, Lorg/owasp/benchmark/score/parsers/Reader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_26

    .line 138
    :pswitch_bd
    const-string v7, "TBD"
    :try_end_bf
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_bf} :catch_c1

    goto/16 :goto_26

    .line 140
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v2    # "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v4    # "findbugsFile":Ljava/io/File;
    .end local v5    # "is":Lorg/xml/sax/InputSource;
    .end local v6    # "root":Lorg/w3c/dom/Node;
    :catch_c1
    move-exception v3

    .line 141
    .local v3, "e":Ljava/lang/Exception;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "An error occurred during results file parsing: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_24

    .line 118
    :sswitch_data_e0
    .sparse-switch
        -0x6d24077f -> :sswitch_27
        -0x28753e48 -> :sswitch_31
        0x1b207 -> :sswitch_45
        0x688ad43 -> :sswitch_4f
        0x44035477 -> :sswitch_3b
    .end sparse-switch

    :pswitch_data_f6
    .packed-switch 0x0
        :pswitch_59
        :pswitch_60
        :pswitch_79
        :pswitch_9c
        :pswitch_bd
    .end packed-switch
.end method

.method public getbenchmarkVersion()Ljava/lang/String;
    .registers 7

    .prologue
    .line 335
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 337
    .local v0, "benchMprops":Ljava/util/Properties;
    :try_start_5
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    const-string v5, "benchmark.properties"

    invoke-virtual {v4, v5}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 338
    .local v2, "propsFile":Ljava/io/File;
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 339
    const-string v4, "benchmark-version"

    invoke-virtual {v0, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 340
    .local v3, "v":Ljava/lang/String;
    if-nez v3, :cond_32

    const-string v3, ""
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_32} :catch_41
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_32} :catch_33

    .line 345
    .end local v2    # "propsFile":Ljava/io/File;
    .end local v3    # "v":Ljava/lang/String;
    :cond_32
    :goto_32
    return-object v3

    .line 342
    :catch_33
    move-exception v1

    .line 343
    .local v1, "e":Ljava/lang/Exception;
    :goto_34
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Can\'t load version # from properties file."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 344
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 345
    const-string v3, ""

    goto :goto_32

    .line 342
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_41
    move-exception v1

    goto :goto_34
.end method

.method public resultsFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p1, "tool"    # Ljava/lang/String;
    .param p2, "benchmarkVersion"    # Ljava/lang/String;
    .param p3, "times"    # Ljava/lang/String;
    .param p4, "toolVersion"    # Ljava/lang/String;

    .prologue
    .line 215
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "results/Benchmark_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-v"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 217
    .local v1, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .line 219
    .local v0, "file":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "results/"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 220
    .local v2, "targetDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_48

    .line 221
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 225
    :cond_48
    const/4 v3, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_166

    :cond_50
    :goto_50
    packed-switch v3, :pswitch_data_180

    .line 258
    :cond_53
    :goto_53
    return-void

    .line 225
    :sswitch_54
    const-string v4, "findbugs"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v3, 0x0

    goto :goto_50

    :sswitch_5e
    const-string v4, "pmd"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v3, 0x1

    goto :goto_50

    :sswitch_68
    const-string v4, "sonar"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v3, 0x2

    goto :goto_50

    :sswitch_72
    const-string v4, "findsecbugs"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v3, 0x3

    goto :goto_50

    :sswitch_7c
    const-string v4, "spotbugs"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v3, 0x4

    goto :goto_50

    :sswitch_86
    const-string v4, "crawler"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v3, 0x5

    goto :goto_50

    .line 227
    :pswitch_90
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    const-string v3, "target/findbugsXml.xml"

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 228
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_53

    .line 229
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_53

    .line 233
    :pswitch_a6
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    const-string v3, "target/pmd.xml"

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 234
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_53

    .line 235
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_53

    .line 239
    :pswitch_bc
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    const-string v3, "target/sonarqube.xml"

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 240
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_53

    .line 241
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_53

    .line 246
    :pswitch_d2
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    const-string v3, "target/spotbugsXml.xml"

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 247
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_53

    .line 248
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto/16 :goto_53

    .line 252
    :pswitch_e9
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "results/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "results"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Benchmark_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-Contrast"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lorg/owasp/benchmark/score/WriteFiles;->getFindFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 253
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_53

    .line 254
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "results/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".zip"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "-"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".zip"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto/16 :goto_53

    .line 225
    :sswitch_data_166
    .sparse-switch
        -0x6d24077f -> :sswitch_7c
        -0x28753e48 -> :sswitch_54
        0x1b207 -> :sswitch_5e
        0x688ad43 -> :sswitch_68
        0x3d200314 -> :sswitch_86
        0x44035477 -> :sswitch_72
    .end sparse-switch

    :pswitch_data_180
    .packed-switch 0x0
        :pswitch_90
        :pswitch_a6
        :pswitch_bc
        :pswitch_d2
        :pswitch_d2
        :pswitch_e9
    .end packed-switch
.end method

.method public writeSonarResults()V
    .registers 13

    .prologue
    .line 262
    const/4 v7, 0x1

    .line 263
    .local v7, "page":I
    const/4 v8, 0x1

    .line 264
    .local v8, "total":I
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 265
    .local v4, "issues":Lorg/json/JSONArray;
    const/4 v5, 0x0

    .local v5, "json":Lorg/json/JSONObject;
    move-object v6, v5

    .line 268
    .end local v5    # "json":Lorg/json/JSONObject;
    .local v6, "json":Lorg/json/JSONObject;
    :goto_9
    :try_start_9
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v10, v8, :cond_41

    .line 269
    new-instance v5, Lorg/json/JSONObject;

    const-string v10, "http://localhost:9000"

    invoke-static {v10, v7}, Lorg/owasp/benchmark/score/WriteFiles;->getSonarResults(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v5, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_1a} :catch_59

    .line 270
    .end local v6    # "json":Lorg/json/JSONObject;
    .restart local v5    # "json":Lorg/json/JSONObject;
    :try_start_1a
    const-string v10, "total"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 272
    const-string v10, "issues"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 273
    .local v3, "issueSubset":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2d
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v2, v10, :cond_3d

    .line 274
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_3a} :catch_63

    .line 273
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 276
    :cond_3d
    add-int/lit8 v7, v7, 0x1

    move-object v6, v5

    .line 277
    .end local v5    # "json":Lorg/json/JSONObject;
    .restart local v6    # "json":Lorg/json/JSONObject;
    goto :goto_9

    .line 279
    .end local v2    # "i":I
    .end local v3    # "issueSubset":Lorg/json/JSONArray;
    :cond_41
    :try_start_41
    const-string v10, "issues"

    invoke-virtual {v6, v10, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 281
    invoke-static {v6}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 282
    .local v9, "xml":Ljava/lang/String;
    new-instance v1, Ljava/io/FileWriter;

    const-string v10, "target/sonarqube.xml"

    invoke-direct {v1, v10}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    .line 283
    .local v1, "fw":Ljava/io/FileWriter;
    invoke-virtual {v1, v9}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 284
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_57} :catch_59

    move-object v5, v6

    .line 288
    .end local v1    # "fw":Ljava/io/FileWriter;
    .end local v6    # "json":Lorg/json/JSONObject;
    .end local v9    # "xml":Ljava/lang/String;
    .restart local v5    # "json":Lorg/json/JSONObject;
    :goto_58
    return-void

    .line 285
    .end local v5    # "json":Lorg/json/JSONObject;
    .restart local v6    # "json":Lorg/json/JSONObject;
    :catch_59
    move-exception v0

    move-object v5, v6

    .line 286
    .end local v6    # "json":Lorg/json/JSONObject;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v5    # "json":Lorg/json/JSONObject;
    :goto_5b
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v11, "There was an error while writing SonarQube results."

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_58

    .line 285
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_63
    move-exception v0

    goto :goto_5b
.end method
