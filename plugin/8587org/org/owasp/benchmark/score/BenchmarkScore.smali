.class public Lorg/owasp/benchmark/score/BenchmarkScore;
.super Ljava/lang/Object;
.source "BenchmarkScore.java"


# static fields
.field public static final BENCHMARKTESTNAME:Ljava/lang/String; = "BenchmarkTest"

.field private static final BENCHMARK_VERSION_PREFIX:Ljava/lang/String; = "Benchmark version: "

.field private static final GUIDEFILENAME:Ljava/lang/String; = "OWASP_Benchmark_Guide.html"

.field private static final HOMEFILENAME:Ljava/lang/String; = "OWASP_Benchmark_Home.html"

.field public static anonymousMode:Z = false

.field public static benchmarkVersion:Ljava/lang/String; = null

.field private static commercialAveScorecardFilename:Ljava/lang/String; = null

.field private static focus:Ljava/lang/String; = null

.field public static mixedMode:Z = false

.field public static final pathToScorecardResources:Ljava/lang/String; = "src/main/resources/scorecard/"

.field public static final scoreCardDirName:Ljava/lang/String; = "scorecard"

.field public static showAveOnlyMode:Z = false

.field private static toolResults:Ljava/util/Set; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;"
        }
    .end annotation
.end field

.field private static final usageNotice:Ljava/lang/String; = "Usage: BenchmarkScore expected actual (optional) toolname anonymous/show_ave_only\n  expected - path of expected results file from Benchmark distribution.\n    Use value: \'mixed\' if there are multiple results subdirectories for different versions of the Benchmark.\n  actual   - results file, or directory with result files from tools (.ozasmt, .fpr, .fvdl, .xml, etc...\n    For \'mixed\' mode, this is the root directory that contains subdirectories with results files.\n  An optional 3rd parameter - Name of tool to focus on, or \'none\'. This highlights that particular tool in the    generated charts.  And two optional 4th parameters - can only use one or the other    anonymous - tells the scorecard generator to hide the names of commercial tools.\n    show_ave_only - tells the scorecard generator to hide the commercial tool results      entirely, and only show the commercial average.\n"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 110
    sput-object v1, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    .line 114
    sput-boolean v0, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    .line 116
    sput-boolean v0, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    .line 118
    sput-boolean v0, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    .line 120
    sput-object v1, Lorg/owasp/benchmark/score/BenchmarkScore;->commercialAveScorecardFilename:Ljava/lang/String;

    .line 122
    const-string v0, "none"

    sput-object v0, Lorg/owasp/benchmark/score/BenchmarkScore;->focus:Ljava/lang/String;

    .line 127
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    sput-object v0, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static analyze(Lorg/owasp/benchmark/score/parsers/TestResults;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    .registers 9
    .param p0, "expected"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p1, "actual"    # Lorg/owasp/benchmark/score/parsers/TestResults;

    .prologue
    .line 925
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setBenchmarkVersion(Ljava/lang/String;)V

    .line 929
    sget-boolean v4, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    if-eqz v4, :cond_26

    iget-boolean v4, p1, Lorg/owasp/benchmark/score/parsers/TestResults;->isCommercial:Z

    if-eqz v4, :cond_26

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x20

    const/16 v6, 0x5f

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/owasp/benchmark/score/BenchmarkScore;->focus:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_26

    .line 930
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setAnonymous()V

    .line 933
    :cond_26
    const/4 v2, 0x0

    .line 934
    .local v2, "pass":Z
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 935
    .local v3, "tc":I
    invoke-virtual {p0, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v4

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .line 936
    .local v1, "exp":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {p1, v3}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v0

    .line 938
    .local v0, "act":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v0, v4}, Lorg/owasp/benchmark/score/BenchmarkScore;->compare(Lorg/owasp/benchmark/score/parsers/TestCaseResult;Ljava/util/List;Ljava/lang/String;)Z

    move-result v2

    .line 944
    invoke-virtual {v1, v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setPassed(Z)V

    goto :goto_2f

    .line 948
    .end local v0    # "act":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    .end local v1    # "exp":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v3    # "tc":I
    :cond_5a
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    .line 949
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 950
    return-void
.end method

.method private static calculateResults(Ljava/util/Map;)Lorg/owasp/benchmark/score/parsers/OverallResults;
    .registers 39
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;)",
            "Lorg/owasp/benchmark/score/parsers/OverallResults;"
        }
    .end annotation

    .prologue
    .line 495
    .local p0, "results":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    new-instance v4, Lorg/owasp/benchmark/score/parsers/OverallResults;

    invoke-direct {v4}, Lorg/owasp/benchmark/score/parsers/OverallResults;-><init>()V

    .line 496
    .local v4, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    const-wide/16 v26, 0x0

    .line 497
    .local v26, "totalScore":D
    const-wide/16 v24, 0x0

    .line 498
    .local v24, "totalFPRate":D
    const-wide/16 v30, 0x0

    .line 499
    .local v30, "totalTPRate":D
    const/16 v19, 0x0

    .line 500
    .local v19, "total":I
    const/16 v29, 0x0

    .line 501
    .local v29, "totalTP":I
    const/16 v23, 0x0

    .line 502
    .local v23, "totalFP":I
    const/16 v22, 0x0

    .line 503
    .local v22, "totalFN":I
    const/16 v28, 0x0

    .line 504
    .local v28, "totalTN":I
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v32

    :goto_1d
    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_bc

    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 505
    .local v5, "category":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/owasp/benchmark/score/parsers/Counter;

    .line 506
    .local v13, "c":Lorg/owasp/benchmark/score/parsers/Counter;
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v33, v0

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v34, v0

    add-int v33, v33, v34

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v34, v0

    add-int v33, v33, v34

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v34, v0

    add-int v10, v33, v34

    .line 507
    .local v10, "rowTotal":I
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-double v0, v0

    move-wide/from16 v34, v0

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v33, v0

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v36, v0

    add-int v33, v33, v36

    move/from16 v0, v33

    int-to-double v0, v0

    move-wide/from16 v36, v0

    div-double v6, v34, v36

    .line 508
    .local v6, "tpr":D
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-double v0, v0

    move-wide/from16 v34, v0

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v33, v0

    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v36, v0

    add-int v33, v33, v36

    move/from16 v0, v33

    int-to-double v0, v0

    move-wide/from16 v36, v0

    div-double v8, v34, v36

    .line 512
    .local v8, "fpr":D
    sub-double v20, v6, v8

    .line 513
    .local v20, "side":D
    const-wide/high16 v34, 0x4000000000000000L

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v34

    mul-double v14, v20, v34

    .line 514
    .local v14, "hyp":D
    const-wide/high16 v34, 0x4000000000000000L

    div-double v16, v14, v34

    .line 515
    .local v16, "raw":D
    const-wide/high16 v34, 0x4000000000000000L

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v34

    mul-double v11, v16, v34

    .line 517
    .local v11, "score":D
    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    move-result v33

    if-nez v33, :cond_99

    .line 518
    add-double v26, v26, v11

    .line 520
    :cond_99
    add-double v24, v24, v8

    .line 521
    add-double v30, v30, v6

    .line 522
    add-int v19, v19, v10

    .line 523
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    move/from16 v33, v0

    add-int v29, v29, v33

    .line 524
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    move/from16 v33, v0

    add-int v23, v23, v33

    .line 525
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    move/from16 v33, v0

    add-int v22, v22, v33

    .line 526
    iget v0, v13, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    move/from16 v33, v0

    add-int v28, v28, v33

    .line 528
    invoke-virtual/range {v4 .. v12}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    goto/16 :goto_1d

    .line 531
    .end local v5    # "category":Ljava/lang/String;
    .end local v6    # "tpr":D
    .end local v8    # "fpr":D
    .end local v10    # "rowTotal":I
    .end local v11    # "score":D
    .end local v13    # "c":Lorg/owasp/benchmark/score/parsers/Counter;
    .end local v14    # "hyp":D
    .end local v16    # "raw":D
    .end local v20    # "side":D
    :cond_bc
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->size()I

    move-result v18

    .line 532
    .local v18, "resultsSize":I
    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v32, v0

    div-double v32, v26, v32

    move-wide/from16 v0, v32

    invoke-virtual {v4, v0, v1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->setScore(D)V

    .line 533
    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v32, v0

    div-double v32, v24, v32

    move-wide/from16 v0, v32

    invoke-virtual {v4, v0, v1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->setFalsePositiveRate(D)V

    .line 534
    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v32, v0

    div-double v32, v30, v32

    move-wide/from16 v0, v32

    invoke-virtual {v4, v0, v1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->setTruePositiveRate(D)V

    .line 535
    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->setTotal(I)V

    .line 536
    move/from16 v0, v29

    move/from16 v1, v23

    move/from16 v2, v22

    move/from16 v3, v28

    invoke-virtual {v4, v0, v1, v2, v3}, Lorg/owasp/benchmark/score/parsers/OverallResults;->setFindingCounts(IIII)V

    .line 538
    return-object v4
.end method

.method private static calculateScores(Lorg/owasp/benchmark/score/parsers/TestResults;)Ljava/util/Map;
    .registers 9
    .param p0, "expectedResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/score/parsers/TestResults;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/owasp/benchmark/score/parsers/Counter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 619
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 621
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_d
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 622
    .local v4, "tn":Ljava/lang/Integer;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p0, v6}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .line 623
    .local v3, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCategory()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/owasp/benchmark/score/BenchmarkScore;->translateCategoryToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 625
    .local v1, "cat":Ljava/lang/String;
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/owasp/benchmark/score/parsers/Counter;

    .line 626
    .local v0, "c":Lorg/owasp/benchmark/score/parsers/Counter;
    if-nez v0, :cond_40

    .line 627
    new-instance v0, Lorg/owasp/benchmark/score/parsers/Counter;

    .end local v0    # "c":Lorg/owasp/benchmark/score/parsers/Counter;
    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/Counter;-><init>()V

    .line 628
    .restart local v0    # "c":Lorg/owasp/benchmark/score/parsers/Counter;
    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    :cond_40
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v6

    if-eqz v6, :cond_53

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isPassed()Z

    move-result v6

    if-eqz v6, :cond_53

    iget v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    goto :goto_d

    .line 632
    :cond_53
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v6

    if-eqz v6, :cond_66

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isPassed()Z

    move-result v6

    if-nez v6, :cond_66

    iget v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    goto :goto_d

    .line 635
    :cond_66
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v6

    if-nez v6, :cond_79

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isPassed()Z

    move-result v6

    if-eqz v6, :cond_79

    iget v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    goto :goto_d

    .line 636
    :cond_79
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v6

    if-nez v6, :cond_d

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isPassed()Z

    move-result v6

    if-nez v6, :cond_d

    iget v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    goto :goto_d

    .line 638
    .end local v0    # "c":Lorg/owasp/benchmark/score/parsers/Counter;
    .end local v1    # "cat":Ljava/lang/String;
    .end local v3    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v4    # "tn":Ljava/lang/Integer;
    :cond_8c
    return-object v2
.end method

.method private static compare(Lorg/owasp/benchmark/score/parsers/TestCaseResult;Ljava/util/List;Ljava/lang/String;)Z
    .registers 11
    .param p0, "exp"    # Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .param p2, "tool"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/score/parsers/TestCaseResult;",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/score/parsers/TestCaseResult;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "actList":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 961
    if-eqz p1, :cond_a

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_13

    .line 962
    :cond_a
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v6

    if-nez v6, :cond_11

    .line 994
    :cond_10
    :goto_10
    return v4

    :cond_11
    move v4, v5

    .line 962
    goto :goto_10

    .line 966
    :cond_13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_17
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .line 970
    .local v0, "act":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v1

    .line 971
    .local v1, "actualCWE":I
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v2

    .line 973
    .local v2, "expectedCWE":I
    if-ne v1, v2, :cond_59

    move v3, v4

    .line 977
    .local v3, "match":Z
    :goto_2e
    if-nez v3, :cond_39

    const/16 v7, 0x234

    if-ne v2, v7, :cond_39

    .line 978
    const/16 v7, 0x59

    if-ne v1, v7, :cond_5b

    move v3, v4

    .line 982
    :cond_39
    :goto_39
    const-string v7, "AppScan"

    invoke-virtual {p2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_49

    const-string v7, "Vera"

    invoke-virtual {p2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_52

    .line 983
    :cond_49
    const/16 v7, 0x148

    if-ne v2, v7, :cond_52

    const/16 v7, 0x147

    if-ne v1, v7, :cond_52

    .line 984
    const/4 v3, 0x1

    .line 989
    :cond_52
    if-eqz v3, :cond_17

    .line 990
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v4

    goto :goto_10

    .end local v3    # "match":Z
    :cond_59
    move v3, v5

    .line 973
    goto :goto_2e

    .restart local v3    # "match":Z
    :cond_5b
    move v3, v5

    .line 978
    goto :goto_39

    .line 994
    .end local v0    # "act":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v1    # "actualCWE":I
    .end local v2    # "expectedCWE":I
    .end local v3    # "match":Z
    :cond_5d
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v6

    if-eqz v6, :cond_10

    move v4, v5

    goto :goto_10
.end method

.method public static difference(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<TT;>;",
            "Ljava/util/Set",
            "<TT;>;)",
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 488
    .local p0, "setA":Ljava/util/Set;, "Ljava/util/Set<TT;>;"
    .local p1, "setB":Ljava/util/Set;, "Ljava/util/Set<TT;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 489
    .local v0, "tmp":Ljava/util/Set;, "Ljava/util/Set<TT;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 490
    return-object v0
.end method

.method private static generateOverallStatsTable(Ljava/util/Set;)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1317
    .local p0, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1318
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v4, "<table class=\"table\">\n"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1319
    const-string v4, "<tr>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1320
    const-string v4, "<th>Tool</th>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1321
    sget-boolean v4, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    if-eqz v4, :cond_1d

    const-string v4, "<th>Benchmark Version</th>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1322
    :cond_1d
    const-string v4, "<th>TPR*</th>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1323
    const-string v4, "<th>FPR*</th>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1324
    const-string v4, "<th>Score*</th>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1325
    const-string v4, "</tr>\n"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1327
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_35
    :goto_35
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_16f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/owasp/benchmark/score/report/Report;

    .line 1329
    .local v3, "toolResult":Lorg/owasp/benchmark/score/report/Report;
    sget-boolean v5, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v5, :cond_4b

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v5

    if-nez v5, :cond_35

    .line 1330
    :cond_4b
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v0

    .line 1331
    .local v0, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    const-string v2, ""

    .line 1333
    .local v2, "style":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v6

    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v8

    sub-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    const-wide v8, 0x3fb999999999999aL

    cmpg-double v5, v6, v8

    if-gez v5, :cond_151

    .line 1334
    const-string v2, "class=\"danger\""

    .line 1337
    :cond_69
    :goto_69
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<tr "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ">"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1338
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1339
    sget-boolean v5, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    if-eqz v5, :cond_c9

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1340
    :cond_c9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/text/DecimalFormat;

    const-string v7, "#0.00%"

    invoke-direct {v6, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1341
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/text/DecimalFormat;

    const-string v7, "#0.00%"

    invoke-direct {v6, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1342
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/text/DecimalFormat;

    const-string v7, "#0.00%"

    invoke-direct {v6, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getScore()D

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</td>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1343
    const-string v5, "</tr>\n"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_35

    .line 1335
    :cond_151
    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v6

    const-wide v8, 0x3fe6666666666666L

    cmpl-double v5, v6, v8

    if-lez v5, :cond_69

    invoke-virtual {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v6

    const-wide v8, 0x3fd3333333333333L

    cmpg-double v5, v6, v8

    if-gez v5, :cond_69

    .line 1336
    const-string v2, "class=\"success\""

    goto/16 :goto_69

    .line 1347
    .end local v0    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v2    # "style":Ljava/lang/String;
    .end local v3    # "toolResult":Lorg/owasp/benchmark/score/report/Report;
    :cond_16f
    const-string v4, "</tr>\n"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1348
    const-string v4, "</table>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1349
    const-string v4, "<p>*-Please refer to each tool\'s scorecard for the data used to calculate these values."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1351
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static generateVulnStatsTable(Ljava/util/Set;Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "category"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1262
    .local p0, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1263
    .local v3, "sb":Ljava/lang/StringBuilder;
    const-string v7, "<table class=\"table\">\n"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1264
    const-string v7, "<tr>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1265
    const-string v7, "<th>Tool</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1266
    sget-boolean v7, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    if-eqz v7, :cond_1d

    const-string v7, "<th>Benchmark Version</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1267
    :cond_1d
    const-string v7, "<th>TP</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1268
    const-string v7, "<th>FN</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1269
    const-string v7, "<th>TN</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1270
    const-string v7, "<th>FP</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1271
    const-string v7, "<th>Total</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1272
    const-string v7, "<th>TPR</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1273
    const-string v7, "<th>FPR</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1274
    const-string v7, "<th>Score</th>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1275
    const-string v7, "</tr>\n"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1277
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4e
    :goto_4e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_21e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/owasp/benchmark/score/report/Report;

    .line 1279
    .local v6, "toolResult":Lorg/owasp/benchmark/score/report/Report;
    sget-boolean v8, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v8, :cond_64

    invoke-virtual {v6}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v8

    if-nez v8, :cond_4e

    .line 1280
    :cond_64
    invoke-virtual {v6}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v1

    .line 1281
    .local v1, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual {v6}, Lorg/owasp/benchmark/score/report/Report;->getScores()Ljava/util/Map;

    move-result-object v4

    .line 1282
    .local v4, "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/owasp/benchmark/score/parsers/Counter;

    .line 1283
    .local v0, "c":Lorg/owasp/benchmark/score/parsers/Counter;
    invoke-virtual {v1, p1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v2

    .line 1284
    .local v2, "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    const-string v5, ""

    .line 1286
    .local v5, "style":Ljava/lang/String;
    iget-wide v8, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    iget-wide v10, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    sub-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    const-wide v10, 0x3fb999999999999aL

    cmpg-double v8, v8, v10

    if-gez v8, :cond_204

    .line 1287
    const-string v5, "class=\"danger\""

    .line 1290
    :cond_8c
    :goto_8c
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<tr "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ">"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1291
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1292
    sget-boolean v8, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    if-eqz v8, :cond_ec

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lorg/owasp/benchmark/score/report/Report;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1293
    :cond_ec
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tp:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1294
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fn:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1295
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lorg/owasp/benchmark/score/parsers/Counter;->tn:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1296
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lorg/owasp/benchmark/score/parsers/Counter;->fp:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1297
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->total:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1298
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/text/DecimalFormat;

    const-string v10, "#0.00%"

    invoke-direct {v9, v10}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v10, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1299
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/text/DecimalFormat;

    const-string v10, "#0.00%"

    invoke-direct {v9, v10}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v10, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1300
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/text/DecimalFormat;

    const-string v10, "#0.00%"

    invoke-direct {v9, v10}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v10, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</td>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1301
    const-string v8, "</tr>\n"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4e

    .line 1288
    :cond_204
    iget-wide v8, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    const-wide v10, 0x3fe6666666666666L

    cmpl-double v8, v8, v10

    if-lez v8, :cond_8c

    iget-wide v8, v2, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    const-wide v10, 0x3fd3333333333333L

    cmpg-double v8, v8, v10

    if-gez v8, :cond_8c

    .line 1289
    const-string v5, "class=\"success\""

    goto/16 :goto_8c

    .line 1305
    .end local v0    # "c":Lorg/owasp/benchmark/score/parsers/Counter;
    .end local v1    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v2    # "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v4    # "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    .end local v5    # "style":Ljava/lang/String;
    .end local v6    # "toolResult":Lorg/owasp/benchmark/score/report/Report;
    :cond_21e
    const-string v7, "</tr>\n"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1306
    const-string v7, "</table>"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1307
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method private static generateVulnerabilityScorecards(Ljava/util/Set;Ljava/util/Set;)V
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1144
    .local p0, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    .local p1, "catSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v11, 0x0

    .line 1146
    .local v11, "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 1147
    .local v6, "commercialToolTotal":I
    const/4 v14, 0x0

    .line 1148
    .local v14, "numberOfVulnCategories":I
    const/4 v5, 0x0

    .line 1149
    .local v5, "commercialLowTotal":I
    const/4 v3, 0x0

    .line 1150
    .local v3, "commercialAveTotal":I
    const/4 v4, 0x0

    .line 1152
    .local v4, "commercialHighTotal":I
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_a
    :goto_a
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2f9

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1154
    .local v2, "cat":Ljava/lang/String;
    :try_start_16
    sget-object v19, Lorg/owasp/benchmark/score/BenchmarkScore;->focus:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v2, v0, v1}, Lorg/owasp/benchmark/score/report/ScatterVulns;->generateComparisonChart(Ljava/lang/String;Ljava/util/Set;Ljava/lang/String;)Lorg/owasp/benchmark/score/report/ScatterVulns;

    move-result-object v15

    .line 1155
    .local v15, "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Benchmark_v"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sget-object v20, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "_Scorecard_for_"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x20

    const/16 v21, 0x5f

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1156
    .local v8, "filename":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "scorecard/"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ".html"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v13

    .line 1157
    .local v13, "htmlfile":Ljava/nio/file/Path;
    const-string v19, "src/main/resources/scorecard/vulntemplate.html"

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    sget-object v22, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v22, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v13, v1}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 1158
    new-instance v10, Ljava/lang/String;

    invoke-static {v13}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Ljava/lang/String;-><init>([B)V

    .line 1159
    .local v10, "html":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "OWASP Benchmark Scorecard for "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1161
    .local v9, "fullTitle":Ljava/lang/String;
    const-string v19, "${image}"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ".png"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1162
    const-string v19, "${title}"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1163
    const-string v19, "${vulnerability}"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " (CWE #"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 1164
    invoke-static {v2}, Lorg/owasp/benchmark/score/BenchmarkScore;->translateNameToCWE(Ljava/lang/String;)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ")"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 1163
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1165
    const-string v19, "${version}"

    sget-object v20, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1167
    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lorg/owasp/benchmark/score/BenchmarkScore;->generateVulnStatsTable(Ljava/util/Set;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1168
    .local v17, "table":Ljava/lang/String;
    const-string v19, "${table}"

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1170
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/nio/file/OpenOption;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v13, v0, v1}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;

    .line 1173
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialToolCount()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_a

    .line 1174
    if-nez v11, :cond_18f

    .line 1175
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialToolCount()I

    move-result v6

    .line 1176
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_14f
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_14f} :catch_2b7

    .line 1177
    .end local v11    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    .local v12, "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    :try_start_14f
    const-string v19, "<table class=\"table\">\n"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1178
    const-string v19, "<tr>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1179
    const-string v19, "<th>Vulnerability Category</th>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1180
    const-string v19, "<th>Low Tool Type</th>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1181
    const-string v19, "<th>Low Score</th>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1182
    const-string v19, "<th>Ave Score</th>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1183
    const-string v19, "<th>High Score</th>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1184
    const-string v19, "<th>High Tool Type</th>"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1185
    const-string v19, "</tr>\n"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_18e
    .catch Ljava/io/IOException; {:try_start_14f .. :try_end_18e} :catch_4a1

    move-object v11, v12

    .line 1188
    .end local v12    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    .restart local v11    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    :cond_18f
    add-int/lit8 v14, v14, 0x1

    .line 1190
    :try_start_191
    const-string v16, ""

    .line 1191
    .local v16, "style":Ljava/lang/String;
    const-string v19, "<tr>"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1192
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "<td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "</td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1193
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "<td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialLowToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "</td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1194
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialLow()I

    move-result v19

    const/16 v20, 0xa

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_2d9

    .line 1195
    const-string v16, "class=\"danger\""

    .line 1198
    :cond_1ea
    :goto_1ea
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "<td "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ">"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialLow()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "</td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1199
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialLow()I

    move-result v19

    add-int v5, v5, v19

    .line 1200
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "<td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialAve()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "</td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1201
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialAve()I

    move-result v19

    add-int v3, v3, v19

    .line 1202
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialHigh()I

    move-result v19

    const/16 v20, 0xa

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_2e9

    .line 1203
    const-string v16, "class=\"danger\""

    .line 1206
    :cond_256
    :goto_256
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "<td "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ">"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialHigh()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "</td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1207
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialHigh()I

    move-result v19

    add-int v4, v4, v19

    .line 1208
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "<td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialHighToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "</td>"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1209
    const-string v19, "</tr>\n"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2b5
    .catch Ljava/io/IOException; {:try_start_191 .. :try_end_2b5} :catch_2b7

    goto/16 :goto_a

    .line 1212
    .end local v8    # "filename":Ljava/lang/String;
    .end local v9    # "fullTitle":Ljava/lang/String;
    .end local v10    # "html":Ljava/lang/String;
    .end local v13    # "htmlfile":Ljava/nio/file/Path;
    .end local v15    # "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    .end local v16    # "style":Ljava/lang/String;
    .end local v17    # "table":Ljava/lang/String;
    :catch_2b7
    move-exception v7

    .line 1213
    .local v7, "e":Ljava/io/IOException;
    :goto_2b8
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error generating vulnerability summaries: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1214
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_a

    .line 1196
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v8    # "filename":Ljava/lang/String;
    .restart local v9    # "fullTitle":Ljava/lang/String;
    .restart local v10    # "html":Ljava/lang/String;
    .restart local v13    # "htmlfile":Ljava/nio/file/Path;
    .restart local v15    # "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    .restart local v16    # "style":Ljava/lang/String;
    .restart local v17    # "table":Ljava/lang/String;
    :cond_2d9
    :try_start_2d9
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialLow()I

    move-result v19

    const/16 v20, 0x32

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_1ea

    .line 1197
    const-string v16, "class=\"success\""

    goto/16 :goto_1ea

    .line 1204
    :cond_2e9
    invoke-virtual {v15}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getCommercialHigh()I

    move-result v19

    const/16 v20, 0x32

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_256

    .line 1205
    const-string v16, "class=\"success\""
    :try_end_2f7
    .catch Ljava/io/IOException; {:try_start_2d9 .. :try_end_2f7} :catch_2b7

    goto/16 :goto_256

    .line 1219
    .end local v2    # "cat":Ljava/lang/String;
    .end local v8    # "filename":Ljava/lang/String;
    .end local v9    # "fullTitle":Ljava/lang/String;
    .end local v10    # "html":Ljava/lang/String;
    .end local v13    # "htmlfile":Ljava/nio/file/Path;
    .end local v15    # "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    .end local v16    # "style":Ljava/lang/String;
    .end local v17    # "table":Ljava/lang/String;
    :cond_2f9
    if-eqz v11, :cond_47f

    .line 1221
    const-string v18, "<tr>"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1222
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "<td>Average across all categories for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " tools</td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1223
    const-string v18, "<td></td>"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1224
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "<td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    new-instance v19, Ljava/text/DecimalFormat;

    const-string v20, "0.0"

    invoke-direct/range {v19 .. v20}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    int-to-float v0, v5

    move/from16 v20, v0

    int-to-float v0, v14

    move/from16 v21, v0

    div-float v20, v20, v21

    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v20, v0

    .line 1225
    invoke-virtual/range {v19 .. v21}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "</td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1224
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1226
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "<td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    new-instance v19, Ljava/text/DecimalFormat;

    const-string v20, "0.0"

    invoke-direct/range {v19 .. v20}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    int-to-float v0, v3

    move/from16 v20, v0

    int-to-float v0, v14

    move/from16 v21, v0

    div-float v20, v20, v21

    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v20, v0

    .line 1227
    invoke-virtual/range {v19 .. v21}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "</td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1226
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1228
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "<td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    new-instance v19, Ljava/text/DecimalFormat;

    const-string v20, "0.0"

    invoke-direct/range {v19 .. v20}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    int-to-float v0, v4

    move/from16 v20, v0

    int-to-float v0, v14

    move/from16 v21, v0

    div-float v20, v20, v21

    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v20, v0

    .line 1229
    invoke-virtual/range {v19 .. v21}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "</td>"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1228
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1230
    const-string v18, "<td></td>"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1231
    const-string v18, "</tr>\n"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1235
    :try_start_3d9
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Benchmark_v"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "_Scorecard_for_Commercial_Tools"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    sput-object v18, Lorg/owasp/benchmark/score/BenchmarkScore;->commercialAveScorecardFilename:Ljava/lang/String;

    .line 1236
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "scorecard/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Lorg/owasp/benchmark/score/BenchmarkScore;->commercialAveScorecardFilename:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".html"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v13

    .line 1237
    .restart local v13    # "htmlfile":Ljava/nio/file/Path;
    const-string v18, "src/main/resources/scorecard/commercialAveTemplate.html"

    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    sget-object v21, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v21, v19, v20

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v13, v1}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 1238
    new-instance v10, Ljava/lang/String;

    invoke-static {v13}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v10, v0}, Ljava/lang/String;-><init>([B)V

    .line 1240
    .restart local v10    # "html":Ljava/lang/String;
    const-string v18, "${version}"

    sget-object v19, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1242
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1243
    .restart local v17    # "table":Ljava/lang/String;
    const-string v18, "${table}"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 1245
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v18

    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/nio/file/OpenOption;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v13, v0, v1}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;

    .line 1246
    sget-object v18, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v19, "Commercial average scorecard computed."

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_47f
    .catch Ljava/io/IOException; {:try_start_3d9 .. :try_end_47f} :catch_480

    .line 1252
    .end local v10    # "html":Ljava/lang/String;
    .end local v13    # "htmlfile":Ljava/nio/file/Path;
    .end local v17    # "table":Ljava/lang/String;
    :cond_47f
    :goto_47f
    return-void

    .line 1247
    :catch_480
    move-exception v7

    .line 1248
    .restart local v7    # "e":Ljava/io/IOException;
    sget-object v18, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error generating commercial scorecard: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1249
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_47f

    .line 1212
    .end local v7    # "e":Ljava/io/IOException;
    .end local v11    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    .restart local v2    # "cat":Ljava/lang/String;
    .restart local v8    # "filename":Ljava/lang/String;
    .restart local v9    # "fullTitle":Ljava/lang/String;
    .restart local v10    # "html":Ljava/lang/String;
    .restart local v12    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    .restart local v13    # "htmlfile":Ljava/nio/file/Path;
    .restart local v15    # "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    .restart local v17    # "table":Ljava/lang/String;
    :catch_4a1
    move-exception v7

    move-object v11, v12

    .end local v12    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    .restart local v11    # "htmlForCommercialAverages":Ljava/lang/StringBuilder;
    goto/16 :goto_2b8
.end method

.method private static getLine(Ljava/io/File;I)Ljava/lang/String;
    .registers 11
    .param p0, "actual"    # Ljava/io/File;
    .param p1, "line"    # I

    .prologue
    .line 896
    const/4 v0, 0x0

    .line 898
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_51
    .catchall {:try_start_1 .. :try_end_b} :catchall_81

    .line 899
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_c
    if-ge v3, p1, :cond_14

    .line 900
    :try_start_e
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 899
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 902
    :cond_14
    const-string v4, ""

    .line 903
    .local v4, "line2":Ljava/lang/String;
    :goto_16
    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 904
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_21} :catch_b2
    .catchall {:try_start_e .. :try_end_21} :catchall_af

    move-result-object v4

    goto :goto_16

    .line 911
    :cond_23
    if-eqz v1, :cond_28

    :try_start_25
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_2a

    :cond_28
    :goto_28
    move-object v0, v1

    .line 908
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "i":I
    .end local v4    # "line2":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :cond_29
    :goto_29
    return-object v4

    .line 912
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "i":I
    .restart local v4    # "line2":Ljava/lang/String;
    :catch_2a
    move-exception v2

    .line 913
    .local v2, "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can\'t close filereader for file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for some reason."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 915
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_28

    .line 907
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "i":I
    .end local v4    # "line2":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :catch_51
    move-exception v2

    .line 908
    .local v2, "e":Ljava/lang/Exception;
    :goto_52
    :try_start_52
    const-string v4, ""
    :try_end_54
    .catchall {:try_start_52 .. :try_end_54} :catchall_81

    .line 911
    if-eqz v0, :cond_29

    :try_start_56
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_59} :catch_5a

    goto :goto_29

    .line 912
    :catch_5a
    move-exception v2

    .line 913
    .local v2, "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can\'t close filereader for file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for some reason."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 915
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_29

    .line 910
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_81
    move-exception v5

    .line 911
    :goto_82
    if-eqz v0, :cond_87

    :try_start_84
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_88

    .line 917
    :cond_87
    :goto_87
    throw v5

    .line 912
    :catch_88
    move-exception v2

    .line 913
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Can\'t close filereader for file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " for some reason."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 915
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    goto :goto_87

    .line 910
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "i":I
    :catchall_af
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_82

    .line 907
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_b2
    move-exception v2

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_52
.end method

.method private static getXMLDocument(Ljava/io/File;)Lorg/w3c/dom/Document;
    .registers 7
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1423
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 1427
    .local v2, "docBuilderFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v4, "http://xml.org/sax/features/external-general-entities"

    invoke-virtual {v2, v4, v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 1428
    const-string v4, "http://xml.org/sax/features/external-parameter-entities"

    invoke-virtual {v2, v4, v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V

    .line 1429
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 1430
    .local v1, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v3, Lorg/xml/sax/InputSource;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 1431
    .local v3, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, v3}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 1432
    .local v0, "doc":Lorg/w3c/dom/Document;
    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 32
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 142
    if-eqz p0, :cond_f

    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v22, v0

    const/16 v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_1b

    .line 143
    :cond_f
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Usage: BenchmarkScore expected actual (optional) toolname anonymous/show_ave_only\n  expected - path of expected results file from Benchmark distribution.\n    Use value: \'mixed\' if there are multiple results subdirectories for different versions of the Benchmark.\n  actual   - results file, or directory with result files from tools (.ozasmt, .fpr, .fvdl, .xml, etc...\n    For \'mixed\' mode, this is the root directory that contains subdirectories with results files.\n  An optional 3rd parameter - Name of tool to focus on, or \'none\'. This highlights that particular tool in the    generated charts.  And two optional 4th parameters - can only use one or the other    anonymous - tells the scorecard generator to hide the names of commercial tools.\n    show_ave_only - tells the scorecard generator to hide the commercial tool results      entirely, and only show the commercial average.\n"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 144
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 147
    :cond_1b
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v22, v0

    const/16 v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_36

    .line 148
    const/16 v22, 0x2

    aget-object v22, p0, v22

    const/16 v23, 0x20

    const/16 v24, 0x5f

    invoke-virtual/range {v22 .. v24}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v22

    sput-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->focus:Ljava/lang/String;

    .line 151
    :cond_36
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v22, v0

    const/16 v23, 0x3

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_53

    .line 152
    const-string v22, "anonymous"

    const/16 v23, 0x3

    aget-object v23, p0, v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_250

    .line 153
    const/16 v22, 0x1

    sput-boolean v22, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    .line 164
    :cond_53
    :goto_53
    new-instance v18, Ljava/io/File;

    const-string v22, "scorecard"

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 166
    .local v18, "scoreCardDir":Ljava/io/File;
    :try_start_5e
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_270

    .line 167
    const-string v22, "scorecard"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v22

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/nio/file/attribute/FileAttribute;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Ljava/nio/file/Files;->createDirectories(Ljava/nio/file/Path;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/file/Path;

    .line 174
    :goto_7d
    new-instance v4, Ljava/io/File;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "scorecard"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    sget-object v23, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "content"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 175
    .local v4, "dest1":Ljava/io/File;
    new-instance v22, Ljava/io/File;

    const-string v23, "src/main/resources/scorecard/content"

    invoke-direct/range {v22 .. v23}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-static {v0, v4}, Lorg/apache/commons/io/FileUtils;->copyDirectory(Ljava/io/File;Ljava/io/File;)V
    :try_end_ab
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_ab} :catch_291

    .line 184
    .end local v4    # "dest1":Ljava/io/File;
    :goto_ab
    :try_start_ab
    const-string v22, "src/main/resources/scorecard/OWASP_Benchmark_Home.html"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v22

    const-string v23, "scorecard/OWASP_Benchmark_Home.html"

    const/16 v24, 0x0

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    .line 185
    invoke-static/range {v23 .. v24}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v23

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    sget-object v26, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v26, v24, v25

    .line 184
    invoke-static/range {v22 .. v24}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 188
    const-string v22, "src/main/resources/scorecard/OWASP_Benchmark_Guide.html"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v22

    const-string v23, "scorecard/OWASP_Benchmark_Guide.html"

    const/16 v24, 0x0

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    .line 189
    invoke-static/range {v23 .. v24}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v23

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    sget-object v26, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v26, v24, v25

    .line 188
    invoke-static/range {v22 .. v24}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    :try_end_105
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_105} :catch_2b9

    .line 199
    :goto_105
    :try_start_105
    const-string v22, "mixed"

    const/16 v23, 0x0

    aget-object v23, p0, v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_3ef

    .line 201
    const/16 v22, 0x1

    sput-boolean v22, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    .line 203
    new-instance v9, Ljava/io/File;

    const/16 v22, 0x1

    aget-object v22, p0, v22

    move-object/from16 v0, v22

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 204
    .local v9, "f":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_14d

    .line 205
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error! - results directory: \'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\' doesn\'t exist."

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 206
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 208
    :cond_14d
    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v22

    if-nez v22, :cond_17a

    .line 209
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error! - results parameter is a file: \'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\' but must be a directory when processing results in \'mixed\' mode."

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 211
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 219
    :cond_17a
    invoke-virtual {v9}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v24

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v25, v0

    const/16 v22, 0x0

    move/from16 v23, v22

    :goto_187
    move/from16 v0, v23

    move/from16 v1, v25

    if-ge v0, v1, :cond_563

    aget-object v17, v24, v23

    .line 221
    .local v17, "rootDirFile":Ljava/io/File;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->isDirectory()Z

    move-result v22

    if-eqz v22, :cond_3e9

    .line 224
    const/4 v7, 0x0

    .line 225
    .local v7, "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    const/4 v8, 0x0

    .line 228
    .local v8, "expectedResultsFilename":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v26

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    const/16 v22, 0x0

    :goto_1a2
    move/from16 v0, v22

    move/from16 v1, v27

    if-ge v0, v1, :cond_32c

    aget-object v16, v26, v22

    .line 230
    .local v16, "resultsDirFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v28

    const-string v29, "expectedresults-"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v28

    if-eqz v28, :cond_24c

    .line 231
    if-eqz v7, :cond_1df

    .line 232
    sget-object v28, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Found 2nd expected results file "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " in same directory. Can only have 1 in each results directory"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 234
    const/16 v28, -0x1

    invoke-static/range {v28 .. v28}, Ljava/lang/System;->exit(I)V

    .line 238
    :cond_1df
    invoke-static/range {v16 .. v16}, Lorg/owasp/benchmark/score/BenchmarkScore;->readExpectedResults(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v7

    .line 239
    sget-object v28, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Getting expected results from: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 240
    if-nez v7, :cond_222

    .line 241
    sget-object v28, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Couldn\'t read expected results file: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    .line 242
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 241
    invoke-virtual/range {v28 .. v29}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 243
    const/16 v28, -0x1

    invoke-static/range {v28 .. v28}, Ljava/lang/System;->exit(I)V

    .line 246
    :cond_222
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    .line 247
    sget-object v28, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    if-nez v28, :cond_2c6

    .line 248
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v28

    sput-object v28, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    .line 250
    :goto_230
    sget-object v28, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "\nFound expected results file: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_24c
    .catch Ljava/lang/Exception; {:try_start_105 .. :try_end_24c} :catch_2e7

    .line 228
    :cond_24c
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_1a2

    .line 154
    .end local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    .end local v8    # "expectedResultsFilename":Ljava/lang/String;
    .end local v9    # "f":Ljava/io/File;
    .end local v16    # "resultsDirFile":Ljava/io/File;
    .end local v17    # "rootDirFile":Ljava/io/File;
    .end local v18    # "scoreCardDir":Ljava/io/File;
    :cond_250
    const-string v22, "show_ave_only"

    const/16 v23, 0x3

    aget-object v23, p0, v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_262

    .line 155
    const/16 v22, 0x1

    sput-boolean v22, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    goto/16 :goto_53

    .line 157
    :cond_262
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Usage: BenchmarkScore expected actual (optional) toolname anonymous/show_ave_only\n  expected - path of expected results file from Benchmark distribution.\n    Use value: \'mixed\' if there are multiple results subdirectories for different versions of the Benchmark.\n  actual   - results file, or directory with result files from tools (.ozasmt, .fpr, .fvdl, .xml, etc...\n    For \'mixed\' mode, this is the root directory that contains subdirectories with results files.\n  An optional 3rd parameter - Name of tool to focus on, or \'none\'. This highlights that particular tool in the    generated charts.  And two optional 4th parameters - can only use one or the other    anonymous - tells the scorecard generator to hide the names of commercial tools.\n    show_ave_only - tells the scorecard generator to hide the commercial tool results      entirely, and only show the commercial average.\n"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 158
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_53

    .line 169
    .restart local v18    # "scoreCardDir":Ljava/io/File;
    :cond_270
    :try_start_270
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Deleting previously generated scorecard files in: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 170
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/io/FileUtils;->cleanDirectory(Ljava/io/File;)V
    :try_end_28f
    .catch Ljava/io/IOException; {:try_start_270 .. :try_end_28f} :catch_291

    goto/16 :goto_7d

    .line 177
    :catch_291
    move-exception v5

    .line 178
    .local v5, "e":Ljava/io/IOException;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error dealing with scorecard directory: \'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\' for some reason!"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 179
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_ab

    .line 191
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2b9
    move-exception v5

    .line 192
    .restart local v5    # "e":Ljava/io/IOException;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Problem copying home and guide files"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 193
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_105

    .line 249
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    .restart local v8    # "expectedResultsFilename":Ljava/lang/String;
    .restart local v9    # "f":Ljava/io/File;
    .restart local v16    # "resultsDirFile":Ljava/io/File;
    .restart local v17    # "rootDirFile":Ljava/io/File;
    :cond_2c6
    :try_start_2c6
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v29, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, ","

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    sput-object v28, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;
    :try_end_2e5
    .catch Ljava/lang/Exception; {:try_start_2c6 .. :try_end_2e5} :catch_2e7

    goto/16 :goto_230

    .line 362
    .end local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    .end local v8    # "expectedResultsFilename":Ljava/lang/String;
    .end local v9    # "f":Ljava/io/File;
    .end local v16    # "resultsDirFile":Ljava/io/File;
    .end local v17    # "rootDirFile":Ljava/io/File;
    :catch_2e7
    move-exception v5

    .line 363
    .local v5, "e":Ljava/lang/Exception;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error during processing: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 364
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 371
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_307
    new-instance v3, Ljava/util/TreeSet;

    invoke-direct {v3}, Ljava/util/TreeSet;-><init>()V

    .line 372
    .local v3, "catSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    invoke-interface/range {v22 .. v22}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_312
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_56c

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/owasp/benchmark/score/report/Report;

    .line 373
    .local v20, "toolReport":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v20 .. v20}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getCategories()Ljava/util/Collection;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v3, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_312

    .line 255
    .end local v3    # "catSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v20    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    .restart local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    .restart local v8    # "expectedResultsFilename":Ljava/lang/String;
    .restart local v9    # "f":Ljava/io/File;
    .restart local v17    # "rootDirFile":Ljava/io/File;
    :cond_32c
    if-nez v7, :cond_35e

    .line 256
    :try_start_32e
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Couldn\'t find expected results file in results directory: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    .line 257
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .line 256
    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 258
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v26, "Expected results file has to be a .csv file that starts with: \'expectedresults-\'"

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 259
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 263
    :cond_35e
    sget-boolean v22, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    if-nez v22, :cond_391

    .line 264
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v26

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    const/16 v22, 0x0

    :goto_36d
    move/from16 v0, v22

    move/from16 v1, v27

    if-ge v0, v1, :cond_3e9

    aget-object v2, v26, v22

    .line 266
    .local v2, "actual":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v28

    if-nez v28, :cond_38e

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_38e

    .line 267
    sget-object v28, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v28

    invoke-static {v2, v7, v0}, Lorg/owasp/benchmark/score/BenchmarkScore;->process(Ljava/io/File;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Set;)V

    .line 264
    :cond_38e
    add-int/lit8 v22, v22, 0x1

    goto :goto_36d

    .line 274
    .end local v2    # "actual":Ljava/io/File;
    :cond_391
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 275
    .local v12, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v26

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    const/16 v22, 0x0

    :goto_3a1
    move/from16 v0, v22

    move/from16 v1, v27

    if-ge v0, v1, :cond_3af

    aget-object v10, v26, v22

    .line 276
    .local v10, "file":Ljava/io/File;
    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    add-int/lit8 v22, v22, 0x1

    goto :goto_3a1

    .line 279
    .end local v10    # "file":Ljava/io/File;
    :cond_3af
    const-string v22, "SHA1PRNG"

    invoke-static/range {v22 .. v22}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v13

    .line 280
    .local v13, "generator":Ljava/security/SecureRandom;
    :cond_3b5
    :goto_3b5
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v22

    if-lez v22, :cond_3e9

    .line 282
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    invoke-virtual {v13, v0}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(I)I

    move-result v11

    .line 283
    .local v11, "fileToGet":I
    invoke-interface {v12, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 285
    .restart local v2    # "actual":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v22

    if-nez v22, :cond_3b5

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_3b5

    .line 286
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v22

    invoke-static {v2, v7, v0}, Lorg/owasp/benchmark/score/BenchmarkScore;->process(Ljava/io/File;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Set;)V

    goto :goto_3b5

    .line 219
    .end local v2    # "actual":Ljava/io/File;
    .end local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    .end local v8    # "expectedResultsFilename":Ljava/lang/String;
    .end local v11    # "fileToGet":I
    .end local v12    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v13    # "generator":Ljava/security/SecureRandom;
    :cond_3e9
    add-int/lit8 v22, v23, 0x1

    move/from16 v23, v22

    goto/16 :goto_187

    .line 297
    .end local v9    # "f":Ljava/io/File;
    .end local v17    # "rootDirFile":Ljava/io/File;
    :cond_3ef
    new-instance v6, Ljava/io/File;

    const/16 v22, 0x0

    aget-object v22, p0, v22

    move-object/from16 v0, v22

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 298
    .local v6, "expected":Ljava/io/File;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Getting expected results from: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x0

    aget-object v24, p0, v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 299
    invoke-static {v6}, Lorg/owasp/benchmark/score/BenchmarkScore;->readExpectedResults(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v7

    .line 300
    .restart local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    if-nez v7, :cond_4ae

    .line 301
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Couldn\'t read expected results file: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 302
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 316
    :goto_43b
    new-instance v9, Ljava/io/File;

    const/16 v22, 0x1

    aget-object v22, p0, v22

    move-object/from16 v0, v22

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 317
    .restart local v9    # "f":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_473

    .line 318
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error! - results file: \'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\' doesn\'t exist."

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 319
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 321
    :cond_473
    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v22

    if-eqz v22, :cond_55c

    .line 322
    sget-boolean v22, Lorg/owasp/benchmark/score/BenchmarkScore;->anonymousMode:Z

    if-nez v22, :cond_502

    .line 323
    invoke-virtual {v9}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v23

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v24, v0

    const/16 v22, 0x0

    :goto_488
    move/from16 v0, v22

    move/from16 v1, v24

    if-ge v0, v1, :cond_563

    aget-object v2, v23, v22

    .line 325
    .restart local v2    # "actual":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v25

    if-nez v25, :cond_4ab

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_4ab

    .line 326
    sget-object v25, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v25

    invoke-static {v2, v7, v0}, Lorg/owasp/benchmark/score/BenchmarkScore;->process(Ljava/io/File;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Set;)V

    .line 323
    :cond_4ab
    add-int/lit8 v22, v22, 0x1

    goto :goto_488

    .line 304
    .end local v2    # "actual":Ljava/io/File;
    .end local v9    # "f":Ljava/io/File;
    :cond_4ae
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Read expected results from file: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 305
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->totalResults()I

    move-result v21

    .line 306
    .local v21, "totalResults":I
    if-eqz v21, :cond_4f4

    .line 307
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " results found."

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 308
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v22

    sput-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    goto/16 :goto_43b

    .line 310
    :cond_4f4
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Error! - zero expected results found in results file."

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 311
    const/16 v22, -0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_43b

    .line 333
    .end local v21    # "totalResults":I
    .restart local v9    # "f":Ljava/io/File;
    :cond_502
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 334
    .restart local v12    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {v9}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v23

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v24, v0

    const/16 v22, 0x0

    :goto_512
    move/from16 v0, v22

    move/from16 v1, v24

    if-ge v0, v1, :cond_520

    aget-object v10, v23, v22

    .line 335
    .restart local v10    # "file":Ljava/io/File;
    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    add-int/lit8 v22, v22, 0x1

    goto :goto_512

    .line 338
    .end local v10    # "file":Ljava/io/File;
    :cond_520
    const-string v22, "SHA1PRNG"

    invoke-static/range {v22 .. v22}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v13

    .line 339
    .restart local v13    # "generator":Ljava/security/SecureRandom;
    :cond_526
    :goto_526
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v22

    if-lez v22, :cond_563

    .line 340
    invoke-virtual {v13}, Ljava/security/SecureRandom;->nextInt()I

    move-result v15

    .line 342
    .local v15, "randomNum":I
    if-gez v15, :cond_534

    mul-int/lit8 v15, v15, -0x1

    .line 343
    :cond_534
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v22

    rem-int v11, v15, v22

    .line 344
    .restart local v11    # "fileToGet":I
    invoke-interface {v12, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 346
    .restart local v2    # "actual":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v22

    if-nez v22, :cond_526

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_526

    .line 347
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v22

    invoke-static {v2, v7, v0}, Lorg/owasp/benchmark/score/BenchmarkScore;->process(Ljava/io/File;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Set;)V

    goto :goto_526

    .line 355
    .end local v2    # "actual":Ljava/io/File;
    .end local v11    # "fileToGet":I
    .end local v12    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v13    # "generator":Ljava/security/SecureRandom;
    .end local v15    # "randomNum":I
    :cond_55c
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v22

    invoke-static {v9, v7, v0}, Lorg/owasp/benchmark/score/BenchmarkScore;->process(Ljava/io/File;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Set;)V

    .line 359
    .end local v6    # "expected":Ljava/io/File;
    .end local v7    # "expectedResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    :cond_563
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Tool scorecards computed."

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_56a
    .catch Ljava/lang/Exception; {:try_start_32e .. :try_end_56a} :catch_2e7

    goto/16 :goto_307

    .line 377
    .end local v9    # "f":Ljava/io/File;
    .restart local v3    # "catSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_56c
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v22

    invoke-static {v0, v3}, Lorg/owasp/benchmark/score/BenchmarkScore;->generateVulnerabilityScorecards(Ljava/util/Set;Ljava/util/Set;)V

    .line 378
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Vulnerability scorecards computed."

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 381
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    move-object/from16 v0, v22

    invoke-static {v0, v3}, Lorg/owasp/benchmark/score/BenchmarkScore;->updateMenus(Ljava/util/Set;Ljava/util/Set;)V

    .line 384
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    sget-object v23, Lorg/owasp/benchmark/score/BenchmarkScore;->focus:Ljava/lang/String;

    invoke-static/range {v22 .. v23}, Lorg/owasp/benchmark/score/report/ScatterHome;->generateComparisonChart(Ljava/util/Set;Ljava/lang/String;)V

    .line 387
    sget-object v22, Lorg/owasp/benchmark/score/BenchmarkScore;->toolResults:Ljava/util/Set;

    invoke-static/range {v22 .. v22}, Lorg/owasp/benchmark/score/BenchmarkScore;->generateOverallStatsTable(Ljava/util/Set;)Ljava/lang/String;

    move-result-object v19

    .line 389
    .local v19, "table":Ljava/lang/String;
    const-string v22, "scorecard/OWASP_Benchmark_Home.html"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/nio/file/Path;->toFile()Ljava/io/File;

    move-result-object v9

    .line 391
    .restart local v9    # "f":Ljava/io/File;
    :try_start_5a0
    new-instance v14, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v14, v0}, Ljava/lang/String;-><init>([B)V

    .line 392
    .local v14, "html":Ljava/lang/String;
    const-string v22, "${table}"

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    .line 393
    invoke-virtual {v9}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v22

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v23

    const/16 v24, 0x0

    move/from16 v0, v24

    new-array v0, v0, [Ljava/nio/file/OpenOption;

    move-object/from16 v24, v0

    invoke-static/range {v22 .. v24}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;
    :try_end_5cc
    .catch Ljava/io/IOException; {:try_start_5a0 .. :try_end_5cc} :catch_5d9

    .line 399
    .end local v14    # "html":Ljava/lang/String;
    :goto_5cc
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v23, "Benchmark scorecards complete."

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 401
    const/16 v22, 0x0

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->exit(I)V

    .line 402
    return-void

    .line 394
    :catch_5d9
    move-exception v5

    .line 395
    .local v5, "e":Ljava/io/IOException;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error updating results table in: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 396
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5cc
.end method

.method private static printExtraCWE(Lorg/owasp/benchmark/score/parsers/TestResults;Lorg/owasp/benchmark/score/parsers/TestResults;)V
    .registers 13
    .param p0, "expectedResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .param p1, "actualResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;

    .prologue
    .line 463
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 464
    .local v2, "expectedCWE":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 465
    .local v4, "i":I
    invoke-virtual {p0, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v5

    .line 466
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_25
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .line 467
    .local v6, "t":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 471
    .end local v4    # "i":I
    .end local v5    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    .end local v6    # "t":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_3d
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 472
    .local v0, "actualCWE":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 473
    .restart local v4    # "i":I
    invoke-virtual {p1, v4}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v5

    .line 474
    .restart local v5    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    if-eqz v5, :cond_4a

    .line 475
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_64
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .line 476
    .restart local v6    # "t":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v0, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_64

    .line 481
    .end local v4    # "i":I
    .end local v5    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/score/parsers/TestCaseResult;>;"
    .end local v6    # "t":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_7c
    invoke-static {v0, v2}, Lorg/owasp/benchmark/score/BenchmarkScore;->difference(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    .line 482
    .local v3, "extras":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_84
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_ad

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 483
    .local v1, "cwe":I
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Extra: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_84

    .line 485
    .end local v1    # "cwe":I
    :cond_ad
    return-void
.end method

.method private static process(Ljava/io/File;Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Set;)V
    .registers 12
    .param p0, "f"    # Ljava/io/File;
    .param p1, "expectedResults"    # Lorg/owasp/benchmark/score/parsers/TestResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lorg/owasp/benchmark/score/parsers/TestResults;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 417
    .local p2, "toolreports":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    :try_start_0
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\nAnalyzing results from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 418
    invoke-static {p0}, Lorg/owasp/benchmark/score/BenchmarkScore;->readActualResults(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v1

    .line 421
    .local v1, "actualResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    if-eqz p1, :cond_59

    if-eqz v1, :cond_59

    .line 424
    invoke-static {p1, v1}, Lorg/owasp/benchmark/score/BenchmarkScore;->analyze(Lorg/owasp/benchmark/score/parsers/TestResults;Lorg/owasp/benchmark/score/parsers/TestResults;)V

    .line 428
    const-string v5, "notProduced"

    .line 429
    .local v5, "actualResultsFileName":Ljava/lang/String;
    sget-boolean v4, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v4, :cond_31

    iget-boolean v4, v1, Lorg/owasp/benchmark/score/parsers/TestResults;->isCommercial:Z

    if-nez v4, :cond_35

    .line 430
    :cond_31
    invoke-static {p1}, Lorg/owasp/benchmark/score/BenchmarkScore;->produceResultsFile(Lorg/owasp/benchmark/score/parsers/TestResults;)Ljava/lang/String;

    move-result-object v5

    .line 433
    :cond_35
    invoke-static {p1}, Lorg/owasp/benchmark/score/BenchmarkScore;->calculateScores(Lorg/owasp/benchmark/score/parsers/TestResults;)Ljava/util/Map;

    move-result-object v2

    .line 435
    .local v2, "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    invoke-static {v2}, Lorg/owasp/benchmark/score/BenchmarkScore;->calculateResults(Ljava/util/Map;)Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v3

    .line 436
    .local v3, "results":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual {v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTime()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/owasp/benchmark/score/parsers/OverallResults;->setTime(Ljava/lang/String;)V

    .line 439
    new-instance v0, Lorg/owasp/benchmark/score/report/Report;

    invoke-virtual {p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->totalResults()I

    move-result v4

    .line 440
    invoke-virtual {v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->isCommercial()Z

    move-result v6

    invoke-virtual {v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lorg/owasp/benchmark/score/report/Report;-><init>(Lorg/owasp/benchmark/score/parsers/TestResults;Ljava/util/Map;Lorg/owasp/benchmark/score/parsers/OverallResults;ILjava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 443
    .local v0, "scoreCard":Lorg/owasp/benchmark/score/report/Report;
    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 459
    .end local v0    # "scoreCard":Lorg/owasp/benchmark/score/report/Report;
    .end local v1    # "actualResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    .end local v2    # "scores":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/owasp/benchmark/score/parsers/Counter;>;"
    .end local v3    # "results":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v5    # "actualResultsFileName":Ljava/lang/String;
    :goto_58
    return-void

    .line 449
    .restart local v1    # "actualResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    :cond_59
    if-nez p1, :cond_86

    .line 450
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Error!!: expected results were null."

    invoke-virtual {v4, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_62} :catch_63

    goto :goto_58

    .line 455
    .end local v1    # "actualResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    :catch_63
    move-exception v8

    .line 456
    .local v8, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error processing "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Continuing."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 457
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_58

    .line 452
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v1    # "actualResults":Lorg/owasp/benchmark/score/parsers/TestResults;
    :cond_86
    :try_start_86
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error!!: actual results were null for file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_86 .. :try_end_9e} :catch_63

    goto :goto_58
.end method

.method private static produceResultsFile(Lorg/owasp/benchmark/score/parsers/TestResults;)Ljava/lang/String;
    .registers 24
    .param p0, "actual"    # Lorg/owasp/benchmark/score/parsers/TestResults;

    .prologue
    .line 1081
    const/4 v13, 0x0

    .line 1082
    .local v13, "resultsFile":Ljava/io/File;
    const/4 v11, 0x0

    .line 1085
    .local v11, "ps":Ljava/io/PrintStream;
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->getBenchmarkVersion()Ljava/lang/String;

    move-result-object v3

    .line 1086
    .local v3, "benchmarkVersion":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "scorecard"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sget-object v20, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "Benchmark_v"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "_Scorecard_for_"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    .line 1087
    invoke-virtual/range {p0 .. p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x20

    const/16 v22, 0x5f

    invoke-virtual/range {v20 .. v22}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ".csv"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 1089
    .local v15, "resultsFileName":Ljava/lang/String;
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_48
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_48} :catch_29a
    .catchall {:try_start_2 .. :try_end_48} :catchall_28c

    .line 1090
    .end local v13    # "resultsFile":Ljava/io/File;
    .local v14, "resultsFile":Ljava/io/File;
    :try_start_48
    new-instance v7, Ljava/io/FileOutputStream;

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-direct {v7, v14, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 1091
    .local v7, "fos":Ljava/io/FileOutputStream;
    new-instance v12, Ljava/io/PrintStream;

    invoke-direct {v12, v7}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_56
    .catch Ljava/io/FileNotFoundException; {:try_start_48 .. :try_end_56} :catch_29c
    .catchall {:try_start_48 .. :try_end_56} :catchall_293

    .line 1093
    .end local v11    # "ps":Ljava/io/PrintStream;
    .local v12, "ps":Ljava/io/PrintStream;
    :try_start_56
    invoke-virtual/range {p0 .. p0}, Lorg/owasp/benchmark/score/parsers/TestResults;->keySet()Ljava/util/Set;

    move-result-object v17

    .line 1095
    .local v17, "testCaseKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v19

    const/16 v20, 0x0

    invoke-interface/range {v19 .. v20}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-virtual/range {v19 .. v19}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getSource()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_25b

    const/4 v8, 0x1

    .line 1098
    .local v8, "fulldetails":Z
    :goto_7f
    const-string v19, "# test name, category, CWE, "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1099
    if-eqz v8, :cond_8f

    const-string v19, "source, data flow, sink, "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1100
    :cond_8f
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "real vulnerability, identified by tool, pass/fail, Benchmark version: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1103
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    .line 1104
    .local v4, "c":Ljava/util/Calendar;
    const-string v19, "%1$tY-%1$tm-%1$te"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v4, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 1105
    .local v16, "s":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ", Actual results generated: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1107
    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_df
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_264

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 1109
    .local v6, "expectedResultsKey":Ljava/lang/Integer;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->get(I)Ljava/util/List;

    move-result-object v19

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    .line 1110
    .local v2, "actualResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1111
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ", "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCategory()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1112
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ", "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getCWE()I

    move-result v21

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1113
    if-eqz v8, :cond_1c2

    .line 1114
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ","

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getSource()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1115
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ","

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getDataFlow()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1116
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ","

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->getSink()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1118
    :cond_1c2
    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isReal()Z

    move-result v9

    .line 1119
    .local v9, "isreal":Z
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ", "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1120
    invoke-virtual {v2}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->isPassed()Z

    move-result v10

    .line 1121
    .local v10, "passed":Z
    xor-int v19, v9, v10

    if-nez v19, :cond_25e

    const/16 v18, 0x1

    .line 1122
    .local v18, "toolresult":Z
    :goto_1ee
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ", "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1123
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ", "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    if-eqz v10, :cond_261

    const-string v19, "pass"

    :goto_221
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_232
    .catch Ljava/io/FileNotFoundException; {:try_start_56 .. :try_end_232} :catch_234
    .catchall {:try_start_56 .. :try_end_232} :catchall_296

    goto/16 :goto_df

    .line 1130
    .end local v2    # "actualResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v4    # "c":Ljava/util/Calendar;
    .end local v6    # "expectedResultsKey":Ljava/lang/Integer;
    .end local v8    # "fulldetails":Z
    .end local v9    # "isreal":Z
    .end local v10    # "passed":Z
    .end local v16    # "s":Ljava/lang/String;
    .end local v17    # "testCaseKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v18    # "toolresult":Z
    :catch_234
    move-exception v5

    move-object v11, v12

    .end local v12    # "ps":Ljava/io/PrintStream;
    .restart local v11    # "ps":Ljava/io/PrintStream;
    move-object v13, v14

    .line 1131
    .end local v3    # "benchmarkVersion":Ljava/lang/String;
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v14    # "resultsFile":Ljava/io/File;
    .end local v15    # "resultsFileName":Ljava/lang/String;
    .local v5, "e":Ljava/io/FileNotFoundException;
    .restart local v13    # "resultsFile":Ljava/io/File;
    :goto_237
    :try_start_237
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "ERROR: Can\'t create actual results file: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_253
    .catchall {:try_start_237 .. :try_end_253} :catchall_28c

    .line 1133
    if-eqz v11, :cond_258

    invoke-virtual {v11}, Ljava/io/PrintStream;->close()V

    .line 1136
    :cond_258
    const/16 v19, 0x0

    .end local v5    # "e":Ljava/io/FileNotFoundException;
    :goto_25a
    return-object v19

    .line 1095
    .end local v11    # "ps":Ljava/io/PrintStream;
    .end local v13    # "resultsFile":Ljava/io/File;
    .restart local v3    # "benchmarkVersion":Ljava/lang/String;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "ps":Ljava/io/PrintStream;
    .restart local v14    # "resultsFile":Ljava/io/File;
    .restart local v15    # "resultsFileName":Ljava/lang/String;
    .restart local v17    # "testCaseKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_25b
    const/4 v8, 0x0

    goto/16 :goto_7f

    .line 1121
    .restart local v2    # "actualResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v4    # "c":Ljava/util/Calendar;
    .restart local v6    # "expectedResultsKey":Ljava/lang/Integer;
    .restart local v8    # "fulldetails":Z
    .restart local v9    # "isreal":Z
    .restart local v10    # "passed":Z
    .restart local v16    # "s":Ljava/lang/String;
    :cond_25e
    const/16 v18, 0x0

    goto :goto_1ee

    .line 1123
    .restart local v18    # "toolresult":Z
    :cond_261
    :try_start_261
    const-string v19, "fail"

    goto :goto_221

    .line 1126
    .end local v2    # "actualResult":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "expectedResultsKey":Ljava/lang/Integer;
    .end local v9    # "isreal":Z
    .end local v10    # "passed":Z
    .end local v18    # "toolresult":Z
    :cond_264
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Actual results file generated: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1128
    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;
    :try_end_283
    .catch Ljava/io/FileNotFoundException; {:try_start_261 .. :try_end_283} :catch_234
    .catchall {:try_start_261 .. :try_end_283} :catchall_296

    move-result-object v19

    .line 1133
    if-eqz v12, :cond_289

    invoke-virtual {v12}, Ljava/io/PrintStream;->close()V

    :cond_289
    move-object v11, v12

    .end local v12    # "ps":Ljava/io/PrintStream;
    .restart local v11    # "ps":Ljava/io/PrintStream;
    move-object v13, v14

    .line 1128
    .end local v14    # "resultsFile":Ljava/io/File;
    .restart local v13    # "resultsFile":Ljava/io/File;
    goto :goto_25a

    .line 1133
    .end local v3    # "benchmarkVersion":Ljava/lang/String;
    .end local v4    # "c":Ljava/util/Calendar;
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "fulldetails":Z
    .end local v15    # "resultsFileName":Ljava/lang/String;
    .end local v16    # "s":Ljava/lang/String;
    .end local v17    # "testCaseKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :catchall_28c
    move-exception v19

    :goto_28d
    if-eqz v11, :cond_292

    invoke-virtual {v11}, Ljava/io/PrintStream;->close()V

    .line 1134
    :cond_292
    throw v19

    .line 1133
    .end local v13    # "resultsFile":Ljava/io/File;
    .restart local v3    # "benchmarkVersion":Ljava/lang/String;
    .restart local v14    # "resultsFile":Ljava/io/File;
    .restart local v15    # "resultsFileName":Ljava/lang/String;
    :catchall_293
    move-exception v19

    move-object v13, v14

    .end local v14    # "resultsFile":Ljava/io/File;
    .restart local v13    # "resultsFile":Ljava/io/File;
    goto :goto_28d

    .end local v11    # "ps":Ljava/io/PrintStream;
    .end local v13    # "resultsFile":Ljava/io/File;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "ps":Ljava/io/PrintStream;
    .restart local v14    # "resultsFile":Ljava/io/File;
    :catchall_296
    move-exception v19

    move-object v11, v12

    .end local v12    # "ps":Ljava/io/PrintStream;
    .restart local v11    # "ps":Ljava/io/PrintStream;
    move-object v13, v14

    .end local v14    # "resultsFile":Ljava/io/File;
    .restart local v13    # "resultsFile":Ljava/io/File;
    goto :goto_28d

    .line 1130
    .end local v3    # "benchmarkVersion":Ljava/lang/String;
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v15    # "resultsFileName":Ljava/lang/String;
    :catch_29a
    move-exception v5

    goto :goto_237

    .end local v13    # "resultsFile":Ljava/io/File;
    .restart local v3    # "benchmarkVersion":Ljava/lang/String;
    .restart local v14    # "resultsFile":Ljava/io/File;
    .restart local v15    # "resultsFileName":Ljava/lang/String;
    :catch_29c
    move-exception v5

    move-object v13, v14

    .end local v14    # "resultsFile":Ljava/io/File;
    .restart local v13    # "resultsFile":Ljava/io/File;
    goto :goto_237
.end method

.method private static readActualResults(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 30
    .param p0, "fileToParse"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 643
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    .line 644
    .local v7, "filename":Ljava/lang/String;
    const/16 v23, 0x0

    .line 646
    .local v23, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const-string v25, ".csv"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_5b

    .line 647
    new-instance v25, Lorg/owasp/benchmark/score/parsers/SeekerReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/SeekerReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/SeekerReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    .line 878
    :cond_1d
    :goto_1d
    const-string v25, "-v"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    .line 879
    .local v10, "indexOfVersionMarker":I
    const/16 v25, -0x1

    move/from16 v0, v25

    if-eq v10, v0, :cond_5a

    .line 880
    add-int/lit8 v25, v10, 0x2

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 881
    .local v18, "restOfFileName":Ljava/lang/String;
    const/16 v25, 0x2d

    move-object/from16 v0, v18

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 882
    .local v5, "endIndex":I
    const/16 v25, -0x1

    move/from16 v0, v25

    if-ne v5, v0, :cond_4d

    const/16 v25, 0x2e

    move-object/from16 v0, v18

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 883
    :cond_4d
    const/16 v25, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v25

    invoke-virtual {v0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v24

    .line 884
    .local v24, "version":Ljava/lang/String;
    invoke-virtual/range {v23 .. v24}, Lorg/owasp/benchmark/score/parsers/TestResults;->setToolVersion(Ljava/lang/String;)V

    .line 887
    .end local v5    # "endIndex":I
    .end local v18    # "restOfFileName":Ljava/lang/String;
    .end local v24    # "version":Ljava/lang/String;
    :cond_5a
    return-object v23

    .line 650
    .end local v10    # "indexOfVersionMarker":I
    :cond_5b
    const-string v25, ".ozasmt"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_73

    .line 651
    new-instance v25, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto :goto_1d

    .line 654
    :cond_73
    const-string v25, ".faast"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_8b

    .line 655
    new-instance v25, Lorg/owasp/benchmark/score/parsers/FaastReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/FaastReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/FaastReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto :goto_1d

    .line 658
    :cond_8b
    const-string v25, ".json"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_e5

    .line 659
    const/16 v25, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/BenchmarkScore;->getLine(Ljava/io/File;I)Ljava/lang/String;

    move-result-object v13

    .line 660
    .local v13, "line2":Ljava/lang/String;
    const-string v25, "Coverity"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_b3

    const-string v25, "formatVersion"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-eqz v25, :cond_c2

    .line 661
    :cond_b3
    new-instance v25, Lorg/owasp/benchmark/score/parsers/CoverityReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/CoverityReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/CoverityReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 662
    :cond_c2
    const-string v25, "Vendor"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-eqz v25, :cond_1d

    const-string v25, "Checkmarx"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-eqz v25, :cond_1d

    .line 663
    new-instance v25, Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxESReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 667
    .end local v13    # "line2":Ljava/lang/String;
    :cond_e5
    const-string v25, ".sarif"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_fe

    .line 668
    new-instance v25, Lorg/owasp/benchmark/score/parsers/LGTMReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/LGTMReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/LGTMReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 671
    :cond_fe
    const-string v25, ".threadfix"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_117

    .line 672
    new-instance v25, Lorg/owasp/benchmark/score/parsers/KiuwanReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/KiuwanReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/KiuwanReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 675
    :cond_117
    const-string v25, ".txt"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_144

    .line 676
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/BenchmarkScore;->getLine(Ljava/io/File;I)Ljava/lang/String;

    move-result-object v12

    .line 677
    .local v12, "line1":Ljava/lang/String;
    const-string v25, "Possible "

    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_1d

    .line 678
    new-instance v25, Lorg/owasp/benchmark/score/parsers/SourceMeterReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/SourceMeterReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/SourceMeterReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 682
    .end local v12    # "line1":Ljava/lang/String;
    :cond_144
    const-string v25, ".xml"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_48a

    .line 686
    const/16 v25, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/BenchmarkScore;->getLine(Ljava/io/File;I)Ljava/lang/String;

    move-result-object v12

    .line 687
    .restart local v12    # "line1":Ljava/lang/String;
    const/16 v25, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/BenchmarkScore;->getLine(Ljava/io/File;I)Ljava/lang/String;

    move-result-object v13

    .line 689
    .restart local v13    # "line2":Ljava/lang/String;
    const-string v25, "  <ProjectName>"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_17b

    .line 690
    new-instance v25, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ThunderScanReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 693
    :cond_17b
    const-string v25, "<pmd"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_194

    .line 694
    new-instance v25, Lorg/owasp/benchmark/score/parsers/PMDReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/PMDReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/PMDReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 697
    :cond_194
    invoke-virtual {v13}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v25

    const-string v26, "<castaip"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_1af

    .line 698
    new-instance v25, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/CASTAIPReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 701
    :cond_1af
    const-string v25, "<FusionLiteInsight"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_1c8

    .line 702
    new-instance v25, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/FusionLiteInsightReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 705
    :cond_1c8
    const-string v25, "<XanitizerFindingsList"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_1e1

    .line 706
    new-instance v25, Lorg/owasp/benchmark/score/parsers/XanitizerReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/XanitizerReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/XanitizerReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 709
    :cond_1e1
    const-string v25, "<BugCollection"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_226

    .line 710
    new-instance v25, Lorg/owasp/benchmark/score/parsers/FindbugsReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/FindbugsReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/FindbugsReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    .line 713
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "findsecbugs"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-eqz v25, :cond_1d

    .line 714
    invoke-virtual/range {v23 .. v23}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v25

    const-string v26, "Find"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_21b

    .line 715
    const-string v25, "FBwFindSecBugs"

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 717
    :cond_21b
    const-string v25, "SBwFindSecBugs"

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 722
    :cond_226
    const-string v25, "<ResultsSession"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_23f

    .line 723
    new-instance v25, Lorg/owasp/benchmark/score/parsers/ParasoftReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ParasoftReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 726
    :cond_23f
    const-string v25, "<detailedreport"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_258

    .line 727
    new-instance v25, Lorg/owasp/benchmark/score/parsers/VeracodeReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/VeracodeReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 730
    :cond_258
    const-string v25, "<total"

    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_271

    .line 731
    new-instance v25, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/SonarQubeReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 734
    :cond_271
    const-string v25, "<OWASPZAPReport"

    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_285

    const-string v25, "<OWASPZAPReport"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    if-eqz v25, :cond_294

    .line 735
    :cond_285
    new-instance v25, Lorg/owasp/benchmark/score/parsers/ZapReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/ZapReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ZapReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 738
    :cond_294
    const-string v25, "<CxXMLResults"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_2ad

    .line 739
    new-instance v25, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/CheckmarxReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 742
    :cond_2ad
    const-string v25, "<report"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_2c6

    .line 743
    new-instance v25, Lorg/owasp/benchmark/score/parsers/ArachniReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/ArachniReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ArachniReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 746
    :cond_2c6
    const-string v25, "<analysisResult"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-nez v25, :cond_2da

    const-string v25, "<analysisReportResult"

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_2e9

    .line 747
    :cond_2da
    new-instance v25, Lorg/owasp/benchmark/score/parsers/JuliaReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/JuliaReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/JuliaReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 752
    :cond_2e9
    invoke-static/range {p0 .. p0}, Lorg/owasp/benchmark/score/BenchmarkScore;->getXMLDocument(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 753
    .local v4, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v4}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v19

    .line 754
    .local v19, "root":Lorg/w3c/dom/Node;
    invoke-interface/range {v19 .. v19}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v15

    .line 756
    .local v15, "nodeName":Ljava/lang/String;
    const-string v25, "ScanGroup"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_30e

    .line 757
    new-instance v25, Lorg/owasp/benchmark/score/parsers/AcunetixReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/AcunetixReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 760
    :cond_30e
    const-string v25, "XmlReport"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_327

    .line 761
    new-instance v25, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 764
    :cond_327
    const-string v25, "xml-report"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3bf

    .line 766
    const-string v25, "name"

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/Reader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v14

    .line 767
    .local v14, "name":Ljava/lang/String;
    const-string v25, "AppScan Report"

    move-object/from16 v0, v25

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3a3

    .line 768
    const-string v25, "technology"

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/owasp/benchmark/score/parsers/Reader;->getAttributeValue(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v22

    .line 769
    .local v22, "tech":Ljava/lang/String;
    const-string v25, "SAST"

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_36a

    .line 770
    new-instance v25, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanSourceReader2;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 771
    :cond_36a
    const-string v25, "DAST"

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_385

    .line 772
    new-instance v25, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/AppScanDynamicReader2;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 773
    :cond_385
    sget-object v25, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Found AppScan Report with unfamiliar technology type: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 774
    .end local v22    # "tech":Ljava/lang/String;
    :cond_3a3
    sget-object v25, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Found xml-report that was expected to have a name \'AppScan Report  but had name: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 778
    .end local v14    # "name":Ljava/lang/String;
    :cond_3bf
    const-string v25, "issues"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3d8

    .line 779
    new-instance v25, Lorg/owasp/benchmark/score/parsers/BurpReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/BurpReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/BurpReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 782
    :cond_3d8
    const-string v25, "netsparker"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3f1

    .line 783
    new-instance v25, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/NetsparkerReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 786
    :cond_3f1
    const-string v25, "noisycricket"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_40a

    .line 787
    new-instance v25, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/NoisyCricketReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 790
    :cond_40a
    const-string v25, "VulnSummary"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_423

    .line 791
    new-instance v25, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/Rapid7Reader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 794
    :cond_423
    const-string v25, "Report"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_43c

    .line 795
    new-instance v25, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/SnappyTickReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 798
    :cond_43c
    const-string v25, "Scan"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_455

    .line 799
    new-instance v25, Lorg/owasp/benchmark/score/parsers/WebInspectReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/WebInspectReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 802
    :cond_455
    const-string v25, "WAS_SCAN_REPORT"

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_46e

    .line 803
    new-instance v25, Lorg/owasp/benchmark/score/parsers/QualysWASReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/QualysWASReader;->parse(Lorg/w3c/dom/Node;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 806
    :cond_46e
    sget-object v25, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Error: No matching parser found for XML file: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 811
    .end local v4    # "doc":Lorg/w3c/dom/Document;
    .end local v12    # "line1":Ljava/lang/String;
    .end local v13    # "line2":Ljava/lang/String;
    .end local v15    # "nodeName":Ljava/lang/String;
    .end local v19    # "root":Lorg/w3c/dom/Node;
    :cond_48a
    const-string v25, ".fpr"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_5ab

    .line 814
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x0

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-static/range {v25 .. v26}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v17

    .line 815
    .local v17, "path":Ljava/nio/file/Path;
    const/16 v25, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Ljava/nio/file/FileSystems;->newFileSystem(Ljava/nio/file/Path;Ljava/lang/ClassLoader;)Ljava/nio/file/FileSystem;

    move-result-object v6

    .line 816
    .local v6, "fileSystem":Ljava/nio/file/FileSystem;
    const-string v25, ".fvdl"

    move-object/from16 v0, v25

    invoke-static {v7, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v16

    .line 817
    .local v16, "outputFile":Ljava/io/File;
    const-string v25, "audit.fvdl"

    const/16 v26, 0x0

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Ljava/nio/file/FileSystem;->getPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v21

    .line 818
    .local v21, "source":Ljava/nio/file/Path;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v28, v26, v27

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 819
    invoke-static/range {v16 .. v16}, Lorg/owasp/benchmark/score/parsers/FortifyReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    .line 820
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z

    .line 825
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "-filtertemplate"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    const-string v26, ".xml"

    invoke-static/range {v25 .. v26}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v16

    .line 826
    const-string v25, "filtertemplate.xml"

    const/16 v26, 0x0

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Ljava/nio/file/FileSystem;->getPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v21

    .line 831
    :try_start_517
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v28, v26, v27

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 833
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v25, Ljava/io/FileReader;

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v25

    invoke-direct {v3, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_542
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_517 .. :try_end_542} :catch_5a0
    .catchall {:try_start_517 .. :try_end_542} :catchall_5a6

    .line 835
    .local v3, "br":Ljava/io/BufferedReader;
    :try_start_542
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    .line 836
    .local v20, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v11

    .line 839
    .local v11, "line":Ljava/lang/String;
    const/4 v8, 0x1

    .local v8, "i":I
    move v9, v8

    .line 840
    .end local v8    # "i":I
    .local v9, "i":I
    :goto_54d
    if-eqz v11, :cond_562

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "i":I
    .restart local v8    # "i":I
    const/16 v25, 0x3

    move/from16 v0, v25

    if-gt v9, v0, :cond_563

    .line 841
    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v11

    move v9, v8

    .end local v8    # "i":I
    .restart local v9    # "i":I
    goto :goto_54d

    :cond_562
    move v8, v9

    .line 844
    .end local v9    # "i":I
    .restart local v8    # "i":I
    :cond_563
    const-string v25, "Fortify-FOD-"

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v25

    const/16 v26, -0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-le v0, v1, :cond_593

    .line 845
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v23 .. v23}, Lorg/owasp/benchmark/score/parsers/TestResults;->getTool()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "-OnDemand"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTool(Ljava/lang/String;)V
    :try_end_593
    .catchall {:try_start_542 .. :try_end_593} :catchall_59b

    .line 848
    :cond_593
    :try_start_593
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_596
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_593 .. :try_end_596} :catch_5a0
    .catchall {:try_start_593 .. :try_end_596} :catchall_5a6

    .line 853
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z

    goto/16 :goto_1d

    .line 848
    .end local v8    # "i":I
    .end local v11    # "line":Ljava/lang/String;
    .end local v20    # "sb":Ljava/lang/StringBuilder;
    :catchall_59b
    move-exception v25

    :try_start_59c
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 849
    throw v25
    :try_end_5a0
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_59c .. :try_end_5a0} :catch_5a0
    .catchall {:try_start_59c .. :try_end_5a0} :catchall_5a6

    .line 850
    .end local v3    # "br":Ljava/io/BufferedReader;
    :catch_5a0
    move-exception v25

    .line 853
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z

    goto/16 :goto_1d

    :catchall_5a6
    move-exception v25

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z

    .line 854
    throw v25

    .line 857
    .end local v6    # "fileSystem":Ljava/nio/file/FileSystem;
    .end local v16    # "outputFile":Ljava/io/File;
    .end local v17    # "path":Ljava/nio/file/Path;
    .end local v21    # "source":Ljava/nio/file/Path;
    :cond_5ab
    const-string v25, ".log"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_5c4

    .line 858
    new-instance v25, Lorg/owasp/benchmark/score/parsers/ContrastReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/ContrastReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ContrastReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 861
    :cond_5c4
    const-string v25, ".hcl"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_5dd

    .line 862
    new-instance v25, Lorg/owasp/benchmark/score/parsers/HCLReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/HCLReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/HCLReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 865
    :cond_5dd
    const-string v25, ".hlg"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_5f6

    .line 866
    new-instance v25, Lorg/owasp/benchmark/score/parsers/HdivReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/HdivReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/HdivReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 869
    :cond_5f6
    const-string v25, ".sl"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_60f

    .line 870
    new-instance v25, Lorg/owasp/benchmark/score/parsers/ShiftLeftReader;

    invoke-direct/range {v25 .. v25}, Lorg/owasp/benchmark/score/parsers/ShiftLeftReader;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/ShiftLeftReader;->parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;

    move-result-object v23

    goto/16 :goto_1d

    .line 873
    :cond_60f
    sget-object v25, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Error: No matching parser found for file: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_1d
.end method

.method private static readExpectedResults(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 16
    .param p0, "f1"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1001
    new-instance v10, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v12, "Expected"

    const/4 v13, 0x1

    const/4 v14, 0x0

    invoke-direct {v10, v12, v13, v14}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 1002
    .local v10, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    const/4 v1, 0x0

    .line 1005
    .local v1, "fr":Ljava/io/BufferedReader;
    :try_start_a
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/FileReader;

    invoke-direct {v12, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_df

    .line 1007
    .end local v1    # "fr":Ljava/io/BufferedReader;
    .local v2, "fr":Ljava/io/BufferedReader;
    :try_start_14
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 1008
    .local v3, "line":Ljava/lang/String;
    if-eqz v3, :cond_3f

    .line 1009
    const-string v12, "Benchmark version: "

    invoke-virtual {v3, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 1010
    .local v7, "startOfBenchmarkVersionLocation":I
    const/4 v12, -0x1

    if-eq v7, v12, :cond_bc

    .line 1011
    const-string v12, "Benchmark version: "

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v7, v12

    .line 1019
    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 1020
    const-string v12, ","

    invoke-virtual {v3, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1021
    .local v0, "commaLocation":I
    const/4 v12, -0x1

    if-eq v0, v12, :cond_c9

    .line 1022
    const/4 v12, 0x0

    invoke-virtual {v3, v12, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Lorg/owasp/benchmark/score/parsers/TestResults;->setBenchmarkVersion(Ljava/lang/String;)V

    .line 1031
    .end local v0    # "commaLocation":I
    .end local v7    # "startOfBenchmarkVersionLocation":I
    :cond_3f
    const/4 v6, 0x1

    .line 1032
    .local v6, "reading":Z
    :cond_40
    :goto_40
    if-eqz v6, :cond_d9

    .line 1033
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 1034
    if-eqz v3, :cond_d6

    const/4 v6, 0x1

    .line 1035
    :goto_49
    if-eqz v6, :cond_40

    .line 1041
    const-string v12, ",(?=([^\"]*\"[^\"]*\")*[^\"]*$)"

    invoke-virtual {v3, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1042
    .local v5, "parts":[Ljava/lang/String;
    const/4 v12, 0x0

    aget-object v12, v5, v12

    if-eqz v12, :cond_40

    const/4 v12, 0x0

    aget-object v12, v5, v12

    const-string v13, "BenchmarkTest"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_40

    .line 1043
    new-instance v9, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 1044
    .local v9, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const/4 v12, 0x0

    aget-object v12, v5, v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setTestCaseName(Ljava/lang/String;)V

    .line 1045
    const/4 v12, 0x1

    aget-object v12, v5, v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 1046
    const/4 v12, 0x2

    aget-object v12, v5, v12

    invoke-static {v12}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setReal(Z)V

    .line 1047
    const/4 v12, 0x3

    aget-object v12, v5, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 1049
    const/4 v12, 0x0

    aget-object v12, v5, v12

    const-string v13, "BenchmarkTest"

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 1050
    .local v8, "tcname":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 1055
    array-length v12, v5

    const/4 v13, 0x4

    if-le v12, v13, :cond_b0

    .line 1056
    const/4 v12, 0x4

    aget-object v12, v5, v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setSource(Ljava/lang/String;)V

    .line 1057
    const/4 v12, 0x5

    aget-object v12, v5, v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setDataFlow(Ljava/lang/String;)V

    .line 1059
    const/4 v12, 0x6

    aget-object v12, v5, v12

    invoke-virtual {v9, v12}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setSink(Ljava/lang/String;)V

    .line 1062
    :cond_b0
    invoke-virtual {v10, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V
    :try_end_b3
    .catchall {:try_start_14 .. :try_end_b3} :catchall_b4

    goto :goto_40

    .line 1067
    .end local v3    # "line":Ljava/lang/String;
    .end local v5    # "parts":[Ljava/lang/String;
    .end local v6    # "reading":Z
    .end local v8    # "tcname":Ljava/lang/String;
    .end local v9    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :catchall_b4
    move-exception v12

    move-object v1, v2

    .end local v2    # "fr":Ljava/io/BufferedReader;
    .restart local v1    # "fr":Ljava/io/BufferedReader;
    :goto_b6
    if-eqz v1, :cond_bb

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 1068
    :cond_bb
    throw v12

    .line 1013
    .end local v1    # "fr":Ljava/io/BufferedReader;
    .restart local v2    # "fr":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v7    # "startOfBenchmarkVersionLocation":I
    :cond_bc
    :try_start_bc
    const-string v11, "Couldn\'t find Benchmark version:  on first line of expected results file"

    .line 1015
    .local v11, "versionNumError":Ljava/lang/String;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v12, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1016
    new-instance v12, Ljava/io/IOException;

    invoke-direct {v12, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1024
    .end local v11    # "versionNumError":Ljava/lang/String;
    .restart local v0    # "commaLocation":I
    :cond_c9
    const-string v4, "Couldn\'t find comma after version # listed after Benchmark version: "

    .line 1026
    .local v4, "missingCommaError":Ljava/lang/String;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v12, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1027
    new-instance v12, Ljava/io/IOException;

    invoke-direct {v12, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_d6
    .catchall {:try_start_bc .. :try_end_d6} :catchall_b4

    .line 1034
    .end local v0    # "commaLocation":I
    .end local v4    # "missingCommaError":Ljava/lang/String;
    .end local v7    # "startOfBenchmarkVersionLocation":I
    .restart local v6    # "reading":Z
    :cond_d6
    const/4 v6, 0x0

    goto/16 :goto_49

    .line 1067
    :cond_d9
    if-eqz v2, :cond_de

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 1069
    :cond_de
    return-object v10

    .line 1067
    .end local v2    # "fr":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .end local v6    # "reading":Z
    .restart local v1    # "fr":Ljava/io/BufferedReader;
    :catchall_df
    move-exception v12

    goto :goto_b6
.end method

.method public static translateCategoryToCWE(Ljava/lang/String;)I
    .registers 4
    .param p0, "category"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 571
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_b8

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_ea

    .line 584
    :goto_c
    return v0

    .line 571
    :sswitch_d
    const-string v2, "cmdi"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "xss"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "ldapi"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "securecookie"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_35
    const-string v2, "pathtraver"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_3f
    const-string v2, "crypto"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_49
    const-string v2, "hash"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x6

    goto :goto_9

    :sswitch_53
    const-string v2, "weakrand"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x7

    goto :goto_9

    :sswitch_5d
    const-string v2, "sqli"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x8

    goto :goto_9

    :sswitch_68
    const-string v2, "hqli"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0x9

    goto :goto_9

    :sswitch_73
    const-string v2, "trustbound"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xa

    goto :goto_9

    :sswitch_7e
    const-string v2, "xpathi"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v1, 0xb

    goto :goto_9

    .line 572
    :pswitch_89
    const/16 v0, 0x4e

    goto :goto_c

    .line 573
    :pswitch_8c
    const/16 v0, 0x4f

    goto/16 :goto_c

    .line 574
    :pswitch_90
    const/16 v0, 0x5a

    goto/16 :goto_c

    .line 575
    :pswitch_94
    const/16 v0, 0x266

    goto/16 :goto_c

    .line 576
    :pswitch_98
    const/16 v0, 0x16

    goto/16 :goto_c

    .line 577
    :pswitch_9c
    const/16 v0, 0x147

    goto/16 :goto_c

    .line 578
    :pswitch_a0
    const/16 v0, 0x148

    goto/16 :goto_c

    .line 579
    :pswitch_a4
    const/16 v0, 0x14a

    goto/16 :goto_c

    .line 580
    :pswitch_a8
    const/16 v0, 0x59

    goto/16 :goto_c

    .line 581
    :pswitch_ac
    const/16 v0, 0x234

    goto/16 :goto_c

    .line 582
    :pswitch_b0
    const/16 v0, 0x1f5

    goto/16 :goto_c

    .line 583
    :pswitch_b4
    const/16 v0, 0x283

    goto/16 :goto_c

    .line 571
    :sswitch_data_b8
    .sparse-switch
        -0x50910f3f -> :sswitch_3f
        -0x3f5dcdda -> :sswitch_73
        -0x2ce25494 -> :sswitch_7e
        -0x2bdf9063 -> :sswitch_53
        0x1d0d8 -> :sswitch_17
        0x2ea66f -> :sswitch_d
        0x30c10e -> :sswitch_49
        0x30fc46 -> :sswitch_68
        0x35fc5b -> :sswitch_5d
        0x620d9a2 -> :sswitch_21
        0x3f10b09b -> :sswitch_2b
        0x6a067385 -> :sswitch_35
    .end sparse-switch

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_89
        :pswitch_8c
        :pswitch_90
        :pswitch_94
        :pswitch_98
        :pswitch_9c
        :pswitch_a0
        :pswitch_a4
        :pswitch_a8
        :pswitch_ac
        :pswitch_b0
        :pswitch_b4
    .end packed-switch
.end method

.method public static translateCategoryToName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "category"    # Ljava/lang/String;

    .prologue
    .line 547
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_de

    :cond_8
    :goto_8
    packed-switch v0, :pswitch_data_114

    .line 561
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown Vulnerability: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1e
    return-object v0

    .line 547
    :sswitch_1f
    const-string v1, "cmdi"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x0

    goto :goto_8

    :sswitch_29
    const-string v1, "xss"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x1

    goto :goto_8

    :sswitch_33
    const-string v1, "ldapi"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x2

    goto :goto_8

    :sswitch_3d
    const-string v1, "headeri"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x3

    goto :goto_8

    :sswitch_47
    const-string v1, "securecookie"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x4

    goto :goto_8

    :sswitch_51
    const-string v1, "pathtraver"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x5

    goto :goto_8

    :sswitch_5b
    const-string v1, "crypto"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x6

    goto :goto_8

    :sswitch_65
    const-string v1, "hash"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v0, 0x7

    goto :goto_8

    :sswitch_6f
    const-string v1, "weakrand"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x8

    goto :goto_8

    :sswitch_7a
    const-string v1, "sqli"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0x9

    goto :goto_8

    :sswitch_85
    const-string v1, "hqli"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xa

    goto/16 :goto_8

    :sswitch_91
    const-string v1, "trustbound"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xb

    goto/16 :goto_8

    :sswitch_9d
    const-string v1, "xpathi"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v0, 0xc

    goto/16 :goto_8

    .line 548
    :pswitch_a9
    const-string v0, "Command Injection"

    goto/16 :goto_1e

    .line 549
    :pswitch_ad
    const-string v0, "Cross-Site Scripting"

    goto/16 :goto_1e

    .line 550
    :pswitch_b1
    const-string v0, "LDAP Injection"

    goto/16 :goto_1e

    .line 551
    :pswitch_b5
    const-string v0, "Header Injection"

    goto/16 :goto_1e

    .line 552
    :pswitch_b9
    const-string v0, "Insecure Cookie"

    goto/16 :goto_1e

    .line 553
    :pswitch_bd
    const-string v0, "Path Traversal"

    goto/16 :goto_1e

    .line 554
    :pswitch_c1
    const-string v0, "Weak Encryption Algorithm"

    goto/16 :goto_1e

    .line 555
    :pswitch_c5
    const-string v0, "Weak Hash Algorithm"

    goto/16 :goto_1e

    .line 556
    :pswitch_c9
    const-string v0, "Weak Random Number"

    goto/16 :goto_1e

    .line 557
    :pswitch_cd
    const-string v0, "SQL Injection"

    goto/16 :goto_1e

    .line 558
    :pswitch_d1
    const-string v0, "Hibernate Injection"

    goto/16 :goto_1e

    .line 559
    :pswitch_d5
    const-string v0, "Trust Boundary Violation"

    goto/16 :goto_1e

    .line 560
    :pswitch_d9
    const-string v0, "XPath Injection"

    goto/16 :goto_1e

    .line 547
    nop

    :sswitch_data_de
    .sparse-switch
        -0x50910f3f -> :sswitch_5b
        -0x3f5dcdda -> :sswitch_91
        -0x2ce25494 -> :sswitch_9d
        -0x2bdf9063 -> :sswitch_6f
        0x1d0d8 -> :sswitch_29
        0x2ea66f -> :sswitch_1f
        0x30c10e -> :sswitch_65
        0x30fc46 -> :sswitch_85
        0x35fc5b -> :sswitch_7a
        0x620d9a2 -> :sswitch_33
        0x2f676f7c -> :sswitch_3d
        0x3f10b09b -> :sswitch_47
        0x6a067385 -> :sswitch_51
    .end sparse-switch

    :pswitch_data_114
    .packed-switch 0x0
        :pswitch_a9
        :pswitch_ad
        :pswitch_b1
        :pswitch_b5
        :pswitch_b9
        :pswitch_bd
        :pswitch_c1
        :pswitch_c5
        :pswitch_c9
        :pswitch_cd
        :pswitch_d1
        :pswitch_d5
        :pswitch_d9
    .end packed-switch
.end method

.method public static translateNameToCWE(Ljava/lang/String;)I
    .registers 5
    .param p0, "category"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 594
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_da

    :cond_8
    move v1, v0

    :goto_9
    packed-switch v1, :pswitch_data_10c

    .line 608
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error: Category: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not supported."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 609
    :goto_2a
    return v0

    .line 594
    :sswitch_2b
    const-string v1, "Command Injection"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x0

    goto :goto_9

    :sswitch_35
    const-string v1, "Cross-Site Scripting"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_3f
    const-string v1, "LDAP Injection"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_49
    const-string v1, "Insecure Cookie"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x3

    goto :goto_9

    :sswitch_53
    const-string v1, "Path Traversal"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x4

    goto :goto_9

    :sswitch_5d
    const-string v1, "Weak Encryption Algorithm"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x5

    goto :goto_9

    :sswitch_67
    const-string v1, "Weak Hash Algorithm"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x6

    goto :goto_9

    :sswitch_71
    const-string v1, "Weak Random Number"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x7

    goto :goto_9

    :sswitch_7b
    const-string v1, "SQL Injection"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0x8

    goto :goto_9

    :sswitch_86
    const-string v1, "Hibernate Injection"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0x9

    goto/16 :goto_9

    :sswitch_92
    const-string v1, "Trust Boundary Violation"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0xa

    goto/16 :goto_9

    :sswitch_9e
    const-string v1, "XPath Injection"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0xb

    goto/16 :goto_9

    .line 595
    :pswitch_aa
    const/16 v0, 0x4e

    goto/16 :goto_2a

    .line 596
    :pswitch_ae
    const/16 v0, 0x4f

    goto/16 :goto_2a

    .line 597
    :pswitch_b2
    const/16 v0, 0x5a

    goto/16 :goto_2a

    .line 598
    :pswitch_b6
    const/16 v0, 0x266

    goto/16 :goto_2a

    .line 599
    :pswitch_ba
    const/16 v0, 0x16

    goto/16 :goto_2a

    .line 600
    :pswitch_be
    const/16 v0, 0x147

    goto/16 :goto_2a

    .line 601
    :pswitch_c2
    const/16 v0, 0x148

    goto/16 :goto_2a

    .line 602
    :pswitch_c6
    const/16 v0, 0x14a

    goto/16 :goto_2a

    .line 603
    :pswitch_ca
    const/16 v0, 0x59

    goto/16 :goto_2a

    .line 604
    :pswitch_ce
    const/16 v0, 0x234

    goto/16 :goto_2a

    .line 605
    :pswitch_d2
    const/16 v0, 0x1f5

    goto/16 :goto_2a

    .line 606
    :pswitch_d6
    const/16 v0, 0x283

    goto/16 :goto_2a

    .line 594
    :sswitch_data_da
    .sparse-switch
        -0x216cf70c -> :sswitch_9e
        -0x130bd469 -> :sswitch_92
        -0xefd1482 -> :sswitch_3f
        0x45ffcc5 -> :sswitch_7b
        0xf801e49 -> :sswitch_86
        0x25c892eb -> :sswitch_35
        0x2c8e6e28 -> :sswitch_49
        0x3aa1b283 -> :sswitch_53
        0x3caa3a02 -> :sswitch_2b
        0x479a46be -> :sswitch_71
        0x6c049d65 -> :sswitch_67
        0x79443f9a -> :sswitch_5d
    .end sparse-switch

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_aa
        :pswitch_ae
        :pswitch_b2
        :pswitch_b6
        :pswitch_ba
        :pswitch_be
        :pswitch_c2
        :pswitch_c6
        :pswitch_ca
        :pswitch_ce
        :pswitch_d2
        :pswitch_d6
    .end packed-switch
.end method

.method private static updateMenuTemplates(Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p0, "toolmenu"    # Ljava/lang/String;
    .param p1, "vulnmenu"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1405
    new-instance v3, Ljava/io/File;

    const-string v5, "scorecard"

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1406
    .local v3, "root":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    array-length v6, v5

    :goto_d
    if-ge v4, v6, :cond_76

    aget-object v1, v5, v4

    .line 1407
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_52

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, ".html"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_52

    .line 1409
    :try_start_23
    new-instance v2, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v7

    invoke-static {v7}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/lang/String;-><init>([B)V

    .line 1410
    .local v2, "html":Ljava/lang/String;
    const-string v7, "${toolmenu}"

    invoke-virtual {v2, v7, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 1411
    const-string v7, "${vulnmenu}"

    invoke-virtual {v2, v7, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 1412
    const-string v7, "${version}"

    sget-object v8, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 1413
    invoke-virtual {v1}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/nio/file/OpenOption;

    invoke-static {v7, v8, v9}, Ljava/nio/file/Files;->write(Ljava/nio/file/Path;[B[Ljava/nio/file/OpenOption;)Ljava/nio/file/Path;
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_52} :catch_55

    .line 1406
    .end local v2    # "html":Ljava/lang/String;
    :cond_52
    :goto_52
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 1414
    :catch_55
    move-exception v0

    .line 1415
    .local v0, "e":Ljava/io/IOException;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error updating menus in: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1416
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_52

    .line 1420
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "f":Ljava/io/File;
    :cond_76
    return-void
.end method

.method private static updateMenus(Ljava/util/Set;Ljava/util/Set;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1362
    .local p0, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    .local p1, "catSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1363
    .local v2, "sb":Ljava/lang/StringBuffer;
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_9
    :goto_9
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_44

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/owasp/benchmark/score/report/Report;

    .line 1364
    .local v3, "toolReport":Lorg/owasp/benchmark/score/report/Report;
    sget-boolean v7, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v7, :cond_1f

    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v7

    if-nez v7, :cond_9

    .line 1365
    :cond_1f
    const-string v7, "<li><a href=\""

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1366
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->getFilename()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1367
    const-string v7, ".html\">"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1368
    invoke-virtual {v3}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1369
    const-string v7, "</a></li>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1370
    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_9

    .line 1376
    .end local v3    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    :cond_44
    sget-object v6, Lorg/owasp/benchmark/score/BenchmarkScore;->commercialAveScorecardFilename:Ljava/lang/String;

    if-eqz v6, :cond_68

    .line 1377
    const-string v6, "<li><a href=\""

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1378
    sget-object v6, Lorg/owasp/benchmark/score/BenchmarkScore;->commercialAveScorecardFilename:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1379
    const-string v6, ".html\">"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1380
    const-string v6, "Commercial Average"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1381
    const-string v6, "</a></li>"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1382
    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1385
    :cond_68
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1388
    .local v4, "toolmenu":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    .end local v2    # "sb":Ljava/lang/StringBuffer;
    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1389
    .restart local v2    # "sb":Ljava/lang/StringBuffer;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_75
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1390
    .local v0, "cat":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Benchmark_v"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_Scorecard_for_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x20

    const/16 v9, 0x5f

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1391
    .local v1, "filename":Ljava/lang/String;
    const-string v7, "            <li><a href=\""

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1392
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1393
    const-string v7, ".html\">"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1394
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1395
    const-string v7, "</a></li>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1396
    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_75

    .line 1398
    .end local v0    # "cat":Ljava/lang/String;
    .end local v1    # "filename":Ljava/lang/String;
    :cond_c5
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1401
    .local v5, "vulnmenu":Ljava/lang/String;
    invoke-static {v4, v5}, Lorg/owasp/benchmark/score/BenchmarkScore;->updateMenuTemplates(Ljava/lang/String;Ljava/lang/String;)V

    .line 1402
    return-void
.end method
