.class public Lorg/owasp/benchmark/score/report/Report;
.super Ljava/lang/Object;
.source "Report.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/owasp/benchmark/score/report/Report;",
        ">;"
    }
.end annotation


# instance fields
.field private final benchmarkVersion:Ljava/lang/String;

.field private filename:Ljava/lang/String;

.field private final isCommercial:Z

.field private final overallResults:Lorg/owasp/benchmark/score/parsers/OverallResults;

.field private final reportPath:Ljava/lang/String;

.field private final scores:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;"
        }
    .end annotation
.end field

.field private toolName:Ljava/lang/String;

.field private final toolNameAndVersion:Ljava/lang/String;

.field private toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;


# direct methods
.method public constructor <init>(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Map;Lorg/owasp/benchmark/score/parsers/OverallResults;ILjava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V
    .registers 20
    .param p1, "actualResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p3, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;
    .param p4, "totalResults"    # I
    .param p5, "actualResultsFileName"    # Ljava/lang/String;
    .param p6, "isCommercial"    # Z
    .param p7, "toolType"    # Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/score/parsers/TestResults;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;",
            "Lorg/owasp/benchmark/score/parsers/OverallResults;",
            "I",
            "Ljava/lang/String;",
            "Z",
            "Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 51
    .local p2, "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-string v1, "not specified"

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->toolName:Ljava/lang/String;

    .line 48
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    .line 52
    move/from16 v0, p6

    iput-boolean v0, p0, Lorg/owasp/benchmark/score/report/Report;->isCommercial:Z

    .line 53
    move-object/from16 v0, p7

    iput-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 54
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->toolName:Ljava/lang/String;

    .line 55
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->toolNameAndVersion:Ljava/lang/String;

    .line 56
    iget-object v1, p1, Lorg/owasp/benchmark/score/parsers/TestResults;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 57
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->benchmarkVersion:Ljava/lang/String;

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OWASP Benchmark Scorecard for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, "fullTitle":Ljava/lang/String;
    sget-boolean v1, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    if-eqz v1, :cond_45

    if-nez p6, :cond_64

    .line 63
    :cond_45
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " ("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p1, Lorg/owasp/benchmark/score/parsers/TestResults;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 66
    :cond_64
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Benchmark v"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " Scorecard for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/owasp/benchmark/score/report/Report;->getToolName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 67
    .local v11, "shortTitle":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Benchmark v"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " Scorecard for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 68
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    .line 69
    iget-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    const/16 v3, 0x20

    const/16 v4, 0x5f

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    .line 71
    iput-object p2, p0, Lorg/owasp/benchmark/score/report/Report;->scores:Ljava/util/Map;

    .line 72
    iput-object p3, p0, Lorg/owasp/benchmark/score/report/Report;->overallResults:Lorg/owasp/benchmark/score/parsers/OverallResults;

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "scorecard"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".html"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->reportPath:Ljava/lang/String;

    .line 75
    new-instance v7, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "scorecard"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".png"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 76
    .local v7, "img":Ljava/io/File;
    new-instance v9, Lorg/owasp/benchmark/score/report/ScatterTools;

    const/16 v1, 0x320

    invoke-direct {v9, v11, v1, p3}, Lorg/owasp/benchmark/score/report/ScatterTools;-><init>(Ljava/lang/String;ILorg/owasp/benchmark/score/parsers/OverallResults;)V

    .line 78
    .local v9, "graph":Lorg/owasp/benchmark/score/report/ScatterTools;
    sget-boolean v1, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v1, :cond_118

    iget-boolean v1, p0, Lorg/owasp/benchmark/score/report/Report;->isCommercial:Z

    if-nez v1, :cond_15f

    .line 79
    :cond_118
    const/16 v1, 0x320

    invoke-virtual {v9, v7, v1}, Lorg/owasp/benchmark/score/report/ScatterTools;->writeChartToFile(Ljava/io/File;I)V

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move/from16 v6, p4

    move-object/from16 v8, p5

    .line 80
    invoke-direct/range {v1 .. v8}, Lorg/owasp/benchmark/score/report/Report;->generateHtml(Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Map;Lorg/owasp/benchmark/score/parsers/OverallResults;ILjava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 81
    .local v10, "reportHtml":Ljava/lang/String;
    iget-object v1, p0, Lorg/owasp/benchmark/score/report/Report;->reportPath:Ljava/lang/String;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v1

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/nio/file/OpenOption;

    invoke-static {v1, v3, v4}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;

    .line 82
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Report written to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/owasp/benchmark/score/report/Report;->reportPath:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    .end local v10    # "reportHtml":Ljava/lang/String;
    :cond_15f
    return-void
.end method

.method private generateHtml(Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Map;Lorg/owasp/benchmark/score/parsers/OverallResults;ILjava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .registers 20
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "actualResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p4, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;
    .param p5, "totalResults"    # I
    .param p6, "img"    # Ljava/io/File;
    .param p7, "actualResultsFileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/TestResults;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;",
            "Lorg/owasp/benchmark/score/parsers/OverallResults;",
            "I",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 131
    .local p3, "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    new-instance v5, Ljava/lang/String;

    const-string v6, "src/main/resources/scorecard/template.html"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/String;

    .line 132
    invoke-static {v6, v7}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v6

    invoke-static {v6}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    .line 139
    .local v5, "template":Ljava/lang/String;
    move-object v2, v5

    .line 140
    .local v2, "html":Ljava/lang/String;
    const-string v6, "${title}"

    invoke-virtual {v2, v6, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 141
    const-string v6, "${tests}"

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 142
    const-string v6, "${time}"

    invoke-virtual/range {p4 .. p4}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTime()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 143
    const-string v6, "${score}"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Ljava/text/DecimalFormat;

    const-string v9, "#0.00%"

    invoke-direct {v8, v9}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p4 .. p4}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getScore()D

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 144
    const-string v6, "${tool}"

    invoke-virtual {p2}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 145
    const-string v6, "${version}"

    invoke-virtual {p2}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 146
    const-string v6, "${actualResultsFile}"

    move-object/from16 v0, p7

    invoke-virtual {v2, v6, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 148
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<img align=\"middle\" src=\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p6 .. p6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\" />"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, "imgTag":Ljava/lang/String;
    const-string v6, "${image}"

    invoke-virtual {v2, v6, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 151
    move-object/from16 v0, p4

    invoke-direct {p0, p2, p3, v0}, Lorg/owasp/benchmark/score/report/Report;->generateTable(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Map;Lorg/owasp/benchmark/score/parsers/OverallResults;)Ljava/lang/String;

    move-result-object v4

    .line 152
    .local v4, "table":Ljava/lang/String;
    const-string v6, "${table}"

    invoke-virtual {v2, v6, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 154
    return-object v2
.end method

.method private generateTable(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Map;Lorg/owasp/benchmark/score/parsers/OverallResults;)Ljava/lang/String;
    .registers 32
    .param p1, "actualResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p3, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/score/parsers/TestResults;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;",
            "Lorg/owasp/benchmark/score/parsers/OverallResults;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 161
    .local p2, "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .local v9, "sb":Ljava/lang/StringBuilder;
    const-string v21, "<table class=\"table\">\n"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    const-string v21, "<tr>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    const-string v21, "<th>Category</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    const-string v21, "<th>CWE #</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    const-string v21, "<th>TP</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    const-string v21, "<th>FN</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    const-string v21, "<th>TN</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    const-string v21, "<th>FP</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    const-string v21, "<th>Total</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const-string v21, "<th>TPR</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    const-string v21, "<th>FPR</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    const-string v21, "<th>Score</th>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    const-string v21, "</tr>\n"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    new-instance v20, Lorg/owasp/benchmark/score/parsers/Counter;

    invoke-direct/range {v20 .. v20}, Lorg/owasp/benchmark/score/parsers/Counter;-><init>()V

    .line 176
    .local v20, "totals":Lorg/owasp/benchmark/score/parsers/Counter;
    const-wide/16 v18, 0x0

    .line 177
    .local v18, "totalTPR":D
    const-wide/16 v14, 0x0

    .line 178
    .local v14, "totalFPR":D
    const-wide/16 v16, 0x0

    .line 180
    .local v16, "totalScore":D
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_73
    :goto_73
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_2da

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 182
    .local v5, "category":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/owasp/benchmark/score/parsers/Counter;

    .line 183
    .local v4, "c":Lorg/owasp/benchmark/score/parsers/Counter;
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v8

    .line 184
    .local v8, "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    const-string v12, ""

    .line 186
    .local v12, "style":Ljava/lang/String;
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v24, v0

    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v26, v0

    sub-double v24, v24, v26

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->abs(D)D

    move-result-wide v24

    const-wide v26, 0x3fb999999999999aL

    cmpg-double v24, v24, v26

    if-gez v24, :cond_2bc

    .line 187
    const-string v12, "class=\"danger\""

    .line 190
    :cond_a8
    :goto_a8
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<tr "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, ">"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-static {v5}, Lorg/owasp/benchmark/score/BenchmarkScore;->translateNameToCWE(Ljava/lang/String;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->total:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    new-instance v25, Ljava/text/DecimalFormat;

    const-string v26, "#0.00%"

    invoke-direct/range {v25 .. v26}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v26, v0

    invoke-virtual/range {v25 .. v27}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    new-instance v25, Ljava/text/DecimalFormat;

    const-string v26, "#0.00%"

    invoke-direct/range {v25 .. v26}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v26, v0

    invoke-virtual/range {v25 .. v27}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "<td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    new-instance v25, Ljava/text/DecimalFormat;

    const-string v26, "#0.00%"

    invoke-direct/range {v25 .. v26}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    move-wide/from16 v26, v0

    invoke-virtual/range {v25 .. v27}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "</td>"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    const-string v24, "</tr>\n"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v24, v0

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v25, v0

    add-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, v20

    iput v0, v1, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    .line 203
    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v24, v0

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v25, v0

    add-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, v20

    iput v0, v1, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    .line 204
    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v24, v0

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v25, v0

    add-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, v20

    iput v0, v1, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    .line 205
    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v24, v0

    iget v0, v4, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v25, v0

    add-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, v20

    iput v0, v1, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    .line 206
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Double;->isNaN(D)Z

    move-result v24

    if-nez v24, :cond_29a

    .line 207
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v24, v0

    add-double v18, v18, v24

    .line 208
    :cond_29a
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Double;->isNaN(D)Z

    move-result v24

    if-nez v24, :cond_2aa

    .line 209
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v24, v0

    add-double v14, v14, v24

    .line 210
    :cond_2aa
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Double;->isNaN(D)Z

    move-result v24

    if-nez v24, :cond_73

    .line 211
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    move-wide/from16 v24, v0

    add-double v16, v16, v24

    goto/16 :goto_73

    .line 188
    :cond_2bc
    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v24, v0

    const-wide v26, 0x3fe6666666666666L

    cmpl-double v24, v24, v26

    if-lez v24, :cond_a8

    iget-wide v0, v8, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v24, v0

    const-wide v26, 0x3fd3333333333333L

    cmpg-double v24, v24, v26

    if-gez v24, :cond_a8

    .line 189
    const-string v12, "class=\"success\""

    goto/16 :goto_a8

    .line 213
    .end local v4    # "c":Lorg/owasp/benchmark/score/parsers/Counter;
    .end local v5    # "category":Ljava/lang/String;
    .end local v8    # "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v12    # "style":Ljava/lang/String;
    :cond_2da
    const-string v21, "<th>Totals*</th><th/>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v21, v0

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v24, v0

    add-int v21, v21, v24

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v24, v0

    add-int v21, v21, v24

    move-object/from16 v0, v20

    iget v0, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v24, v0

    add-int v13, v21, v24

    .line 219
    .local v13, "total":I
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    const-string v21, "<th/><th/><th/></tr>\n"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    const-string v21, "<th>Overall Results*</th><th/><th/><th/><th/><th/><th/>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->size()I

    move-result v21

    move/from16 v0, v21

    int-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v22, v18, v24

    .line 224
    .local v22, "tpr":D
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    new-instance v24, Ljava/text/DecimalFormat;

    const-string v25, "#0.00%"

    invoke-direct/range {v24 .. v25}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->size()I

    move-result v21

    move/from16 v0, v21

    int-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v6, v14, v24

    .line 226
    .local v6, "fpr":D
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    new-instance v24, Ljava/text/DecimalFormat;

    const-string v25, "#0.00%"

    invoke-direct/range {v24 .. v25}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->size()I

    move-result v21

    move/from16 v0, v21

    int-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v10, v16, v24

    .line 228
    .local v10, "score":D
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "<th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    new-instance v24, Ljava/text/DecimalFormat;

    const-string v25, "#0.00%"

    invoke-direct/range {v24 .. v25}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v24, "</th>"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const-string v21, "</tr>\n"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    const-string v21, "</table>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    const-string v21, "<p>*-The Overall Results are averages across all the vulnerability categories.  You can\'t compute these averages by simply calculating the TPR and FPR rates using  the values in the Totals row. If you did that, categories with larger number of tests would carry  more weight than categories with less tests. The proper calculation of the Overall Results is to add up all the TPR, FPR, and Score values,  and then divide by the number of vulnerability categories, which is how they are calculated.<p/>"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    return-object v21
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 36
    check-cast p1, Lorg/owasp/benchmark/score/report/Report;

    invoke-virtual {p0, p1}, Lorg/owasp/benchmark/score/report/Report;->compareTo(Lorg/owasp/benchmark/score/report/Report;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/owasp/benchmark/score/report/Report;)I
    .registers 4
    .param p1, "r"    # Lorg/owasp/benchmark/score/report/Report;

    .prologue
    .line 242
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getBenchmarkVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->benchmarkVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->overallResults:Lorg/owasp/benchmark/score/parsers/OverallResults;

    return-object v0
.end method

.method public getScores()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 246
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->scores:Ljava/util/Map;

    return-object v0
.end method

.method public getToolName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->toolName:Ljava/lang/String;

    return-object v0
.end method

.method public getToolNameAndVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->toolNameAndVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/Report;->toolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-object v0
.end method

.method public isCommercial()Z
    .registers 2

    .prologue
    .line 100
    iget-boolean v0, p0, Lorg/owasp/benchmark/score/report/Report;->isCommercial:Z

    return v0
.end method
