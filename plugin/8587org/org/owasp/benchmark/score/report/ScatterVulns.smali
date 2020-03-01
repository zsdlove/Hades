.class public Lorg/owasp/benchmark/score/report/ScatterVulns;
.super Lorg/owasp/benchmark/score/report/ScatterPlot;
.source "ScatterVulns.java"


# instance fields
.field afr:D

.field atr:D

.field averageLabel:C

.field public final category:Ljava/lang/String;

.field private commercialAve:D

.field private commercialHigh:D

.field private commercialHighToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field private commercialLow:D

.field private commercialLowToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

.field private commercialToolCount:I

.field public final focus:Ljava/lang/String;

.field private sr:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Ljava/lang/String;)V
    .registers 11
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I
    .param p3, "category"    # Ljava/lang/String;
    .param p5, "focus"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p4, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 81
    invoke-direct {p0}, Lorg/owasp/benchmark/score/report/ScatterPlot;-><init>()V

    .line 53
    iput-wide v2, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    .line 54
    iput-wide v2, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    .line 58
    const-wide/high16 v0, 0x4059000000000000L

    iput-wide v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLow:D

    .line 59
    iput-object v4, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLowToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 60
    iput-wide v2, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHigh:D

    .line 61
    iput-object v4, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHighToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 62
    iput-wide v2, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialAve:D

    .line 195
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    .line 82
    iput-object p3, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->category:Ljava/lang/String;

    .line 83
    iput-object p5, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->focus:Ljava/lang/String;

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "          "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/owasp/benchmark/score/report/ScatterVulns;->display(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)Lorg/jfree/chart/JFreeChart;

    .line 85
    return-void
.end method

.method private dedupify(Ljava/util/HashMap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/awt/geom/Point2D;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 248
    .local v0, "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-direct {p0, p1, v0}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 249
    .local v1, "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    :goto_18
    if-eqz v1, :cond_8

    .line 250
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    .local v2, "label":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2e

    .line 252
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    :cond_2e
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f

    .line 254
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    :cond_3f
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4e

    .line 256
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    :cond_4e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    invoke-direct {p0, p1, v0}, Lorg/owasp/benchmark/score/report/ScatterVulns;->getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 260
    goto :goto_18

    .line 262
    .end local v0    # "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "label":Ljava/lang/StringBuilder;
    :cond_5e
    return-void
.end method

.method private display(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)Lorg/jfree/chart/JFreeChart;
    .registers 54
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I
    .param p3, "category"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;)",
            "Lorg/jfree/chart/JFreeChart;"
        }
    .end annotation

    .prologue
    .line 88
    .local p4, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    new-instance v44, Ljavax/swing/JFrame;

    move-object/from16 v0, v44

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 89
    .local v44, "f":Ljavax/swing/JFrame;
    const/4 v4, 0x3

    move-object/from16 v0, v44

    invoke-virtual {v0, v4}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    .line 92
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v18, "averageFalseRates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Double;>;"
    new-instance v40, Ljava/util/ArrayList;

    invoke-direct/range {v40 .. v40}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .local v40, "averageTrueRates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Double;>;"
    const/16 v41, 0x0

    .line 96
    .local v41, "commercialToolCount":I
    new-instance v7, Lorg/jfree/data/xy/XYSeriesCollection;

    invoke-direct {v7}, Lorg/jfree/data/xy/XYSeriesCollection;-><init>()V

    .line 97
    .local v7, "dataset":Lorg/jfree/data/xy/XYSeriesCollection;
    new-instance v47, Lorg/jfree/data/xy/XYSeries;

    const-string v4, "Scores"

    move-object/from16 v0, v47

    invoke-direct {v0, v4}, Lorg/jfree/data/xy/XYSeries;-><init>(Ljava/lang/Comparable;)V

    .line 99
    .local v47, "series":Lorg/jfree/data/xy/XYSeries;
    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2d
    :goto_2d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Lorg/owasp/benchmark/score/report/Report;

    .line 100
    .local v48, "toolReport":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v48 .. v48}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v5

    if-nez v5, :cond_2d

    .line 101
    invoke-virtual/range {v48 .. v48}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v46

    .line 102
    .local v46, "overallResult":Lorg/owasp/benchmark/score/parsers/OverallResult;
    move-object/from16 v0, v46

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    move-object/from16 v0, v46

    iget-wide v10, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    const-wide/high16 v12, 0x4059000000000000L

    mul-double/2addr v10, v12

    move-object/from16 v0, v47

    invoke-virtual {v0, v8, v9, v10, v11}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    goto :goto_2d

    .line 106
    .end local v46    # "overallResult":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v48    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    :cond_5d
    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_61
    :goto_61
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Lorg/owasp/benchmark/score/report/Report;

    .line 107
    .restart local v48    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v48 .. v48}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v5

    if-eqz v5, :cond_61

    .line 108
    invoke-virtual/range {v48 .. v48}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v46

    .line 109
    .restart local v46    # "overallResult":Lorg/owasp/benchmark/score/parsers/OverallResult;
    sget-boolean v5, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-nez v5, :cond_94

    .line 110
    move-object/from16 v0, v46

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    move-object/from16 v0, v46

    iget-wide v10, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    const-wide/high16 v12, 0x4059000000000000L

    mul-double/2addr v10, v12

    move-object/from16 v0, v47

    invoke-virtual {v0, v8, v9, v10, v11}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 112
    :cond_94
    add-int/lit8 v41, v41, 0x1

    .line 113
    move-object/from16 v0, v46

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    move-object/from16 v0, v46

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, v40

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_61

    .line 118
    .end local v46    # "overallResult":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v48    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    :cond_b1
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_b5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v42

    .line 119
    .local v42, "d":D
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    add-double v8, v8, v42

    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    goto :goto_b5

    .line 121
    .end local v42    # "d":D
    :cond_d0
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v6

    int-to-double v8, v6

    div-double/2addr v4, v8

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    .line 123
    invoke-virtual/range {v40 .. v40}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_e2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_fd

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v42

    .line 124
    .restart local v42    # "d":D
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    add-double v8, v8, v42

    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    goto :goto_e2

    .line 126
    .end local v42    # "d":D
    :cond_fd
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    invoke-virtual/range {v40 .. v40}, Ljava/util/ArrayList;->size()I

    move-result v6

    int-to-double v8, v6

    div-double/2addr v4, v8

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    .line 128
    const/4 v4, 0x1

    move/from16 v0, v41

    if-gt v0, v4, :cond_119

    sget-boolean v4, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v4, :cond_12c

    const/4 v4, 0x1

    move/from16 v0, v41

    if-ne v0, v4, :cond_12c

    .line 129
    :cond_119
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    const-wide/high16 v8, 0x4059000000000000L

    mul-double/2addr v4, v8

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    move-object/from16 v0, v47

    invoke-virtual {v0, v4, v5, v8, v9}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 132
    :cond_12c
    move-object/from16 v0, v47

    invoke-virtual {v7, v0}, Lorg/jfree/data/xy/XYSeriesCollection;->addSeries(Lorg/jfree/data/xy/XYSeries;)V

    .line 134
    const-string v5, "False Positive Rate"

    const-string v6, "True Positive Rate"

    sget-object v8, Lorg/jfree/chart/plot/PlotOrientation;->VERTICAL:Lorg/jfree/chart/plot/PlotOrientation;

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x0

    move-object/from16 v4, p1

    invoke-static/range {v4 .. v11}, Lorg/jfree/chart/ChartFactory;->createScatterPlot(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jfree/data/xy/XYDataset;Lorg/jfree/chart/plot/PlotOrientation;ZZZ)Lorg/jfree/chart/JFreeChart;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->chart:Lorg/jfree/chart/JFreeChart;

    .line 136
    sget-object v4, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/StandardChartTheme;->apply(Lorg/jfree/chart/JFreeChart;)V

    .line 138
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v4}, Lorg/jfree/chart/JFreeChart;->getXYPlot()Lorg/jfree/chart/plot/XYPlot;

    move-result-object v17

    .line 140
    .local v17, "xyplot":Lorg/jfree/chart/plot/XYPlot;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/report/ScatterVulns;->initializePlot(Lorg/jfree/chart/plot/XYPlot;)V

    .line 142
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v17

    invoke-direct {v0, v1, v2, v3}, Lorg/owasp/benchmark/score/report/ScatterVulns;->makeDataLabels(Ljava/lang/String;Ljava/util/Set;Lorg/jfree/chart/plot/XYPlot;)V

    .line 143
    const-wide v12, 0x4059c00000000000L

    const-wide v14, 0x4059200000000000L

    move-object/from16 v9, p0

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v16, v7

    invoke-direct/range {v9 .. v17}, Lorg/owasp/benchmark/score/report/ScatterVulns;->makeLegend(Ljava/lang/String;Ljava/util/Set;DDLorg/jfree/data/xy/XYSeriesCollection;Lorg/jfree/chart/plot/XYPlot;)V

    .line 145
    invoke-virtual/range {v47 .. v47}, Lorg/jfree/data/xy/XYSeries;->getItems()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_184
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1b9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v45

    check-cast v45, Lorg/jfree/data/xy/XYDataItem;

    .line 146
    .local v45, "item":Lorg/jfree/data/xy/XYDataItem;
    invoke-virtual/range {v45 .. v45}, Lorg/jfree/data/xy/XYDataItem;->getX()Ljava/lang/Number;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v20

    .line 147
    .local v20, "x":D
    invoke-virtual/range {v45 .. v45}, Lorg/jfree/data/xy/XYDataItem;->getY()Ljava/lang/Number;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v22

    .line 148
    .local v22, "y":D
    add-double v8, v20, v22

    const-wide/high16 v10, 0x4000000000000000L

    div-double v24, v8, v10

    .line 149
    .local v24, "z":D
    new-instance v19, Lorg/jfree/chart/annotations/XYLineAnnotation;

    sget-object v28, Lorg/owasp/benchmark/score/report/ScatterVulns;->dashed:Ljava/awt/Stroke;

    sget-object v29, Ljava/awt/Color;->blue:Ljava/awt/Color;

    move-wide/from16 v26, v24

    invoke-direct/range {v19 .. v29}, Lorg/jfree/chart/annotations/XYLineAnnotation;-><init>(DDDDLjava/awt/Stroke;Ljava/awt/Paint;)V

    .line 150
    .local v19, "score":Lorg/jfree/chart/annotations/XYLineAnnotation;
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    goto :goto_184

    .line 153
    .end local v19    # "score":Lorg/jfree/chart/annotations/XYLineAnnotation;
    .end local v20    # "x":D
    .end local v22    # "y":D
    .end local v24    # "z":D
    .end local v45    # "item":Lorg/jfree/data/xy/XYDataItem;
    :cond_1b9
    new-instance v26, Lorg/jfree/chart/ChartPanel;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->chart:Lorg/jfree/chart/JFreeChart;

    move-object/from16 v27, v0

    const/16 v30, 0x190

    const/16 v31, 0x190

    const/16 v32, 0x4b0

    const/16 v33, 0x4b0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    move/from16 v28, p2

    move/from16 v29, p2

    invoke-direct/range {v26 .. v39}, Lorg/jfree/chart/ChartPanel;-><init>(Lorg/jfree/chart/JFreeChart;IIIIIIZZZZZZ)V

    .line 155
    .local v26, "cp":Lorg/jfree/chart/ChartPanel;
    move-object/from16 v0, v44

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljavax/swing/JFrame;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 156
    invoke-virtual/range {v44 .. v44}, Ljavax/swing/JFrame;->pack()V

    .line 157
    const/4 v4, 0x0

    move-object/from16 v0, v44

    invoke-virtual {v0, v4}, Ljavax/swing/JFrame;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 160
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->chart:Lorg/jfree/chart/JFreeChart;

    return-object v4
.end method

.method public static generateComparisonChart(Ljava/lang/String;Ljava/util/Set;Ljava/lang/String;)Lorg/owasp/benchmark/score/report/ScatterVulns;
    .registers 10
    .param p0, "category"    # Ljava/lang/String;
    .param p2, "focus"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/owasp/benchmark/score/report/ScatterVulns;"
        }
    .end annotation

    .prologue
    .line 396
    .local p1, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OWASP Benchmark"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-boolean v2, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    if-eqz v2, :cond_6b

    const-string v2, " -"

    :goto_11
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Comparison"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 398
    .local v1, "scatterTitle":Ljava/lang/String;
    new-instance v0, Lorg/owasp/benchmark/score/report/ScatterVulns;

    const/16 v2, 0x320

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/owasp/benchmark/score/report/ScatterVulns;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Ljava/lang/String;)V

    .line 399
    .local v0, "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "scorecard/Benchmark_v"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_Scorecard_for_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x20

    const/16 v5, 0x5f

    .line 400
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x320

    .line 399
    invoke-virtual {v0, v2, v3}, Lorg/owasp/benchmark/score/report/ScatterVulns;->writeChartToFile(Ljava/io/File;I)V

    .line 405
    .end local v0    # "scatter":Lorg/owasp/benchmark/score/report/ScatterVulns;
    .end local v1    # "scatterTitle":Ljava/lang/String;
    :goto_6a
    return-object v0

    .line 396
    :cond_6b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " v"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v4, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7f} :catch_81

    move-result-object v2

    goto :goto_11

    .line 402
    :catch_81
    move-exception v6

    .line 403
    .local v6, "e":Ljava/io/IOException;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Couldn\'t generate Benchmark vulnerability chart for some reason."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 404
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 405
    const/4 v0, 0x0

    goto :goto_6a
.end method

.method private getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/awt/geom/Point2D;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/awt/geom/Point2D;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/awt/geom/Point2D;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    .local p1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .local p2, "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_76

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 266
    .local v1, "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/awt/geom/Point2D;

    invoke-virtual {v4}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/awt/geom/Point2D;

    invoke-virtual {v4}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v8

    sub-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 267
    .local v2, "xd":Ljava/lang/Double;
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/awt/geom/Point2D;

    invoke-virtual {v4}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/awt/geom/Point2D;

    invoke-virtual {v4}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v8

    sub-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 268
    .local v3, "yd":Ljava/lang/Double;
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-wide/high16 v8, 0x3ff0000000000000L

    cmpg-double v4, v6, v8

    if-gez v4, :cond_74

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-wide/high16 v8, 0x4008000000000000L

    cmpg-double v4, v6, v8

    if-gez v4, :cond_74

    const/4 v0, 0x1

    .line 269
    .local v0, "close":Z
    :goto_63
    if-eq p2, v1, :cond_8

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8

    if-eqz v0, :cond_8

    .line 273
    .end local v0    # "close":Z
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "xd":Ljava/lang/Double;
    .end local v3    # "yd":Ljava/lang/Double;
    :goto_73
    return-object v1

    .line 268
    .restart local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .restart local v2    # "xd":Ljava/lang/Double;
    .restart local v3    # "yd":Ljava/lang/Double;
    :cond_74
    const/4 v0, 0x0

    goto :goto_63

    .line 273
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "xd":Ljava/lang/Double;
    .end local v3    # "yd":Ljava/lang/Double;
    :cond_76
    const/4 v1, 0x0

    goto :goto_73
.end method

.method private makeDataLabels(Ljava/lang/String;Ljava/util/Set;Lorg/jfree/chart/plot/XYPlot;)V
    .registers 14
    .param p1, "category"    # Ljava/lang/String;
    .param p3, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Lorg/jfree/chart/plot/XYPlot;",
            ")V"
        }
    .end annotation

    .prologue
    .line 164
    .local p2, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    invoke-direct {p0, p1, p2}, Lorg/owasp/benchmark/score/report/ScatterVulns;->makePointList(Ljava/lang/String;Ljava/util/Set;)Ljava/util/HashMap;

    move-result-object v7

    .line 165
    .local v7, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_c
    :goto_c
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_75

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 166
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_c

    .line 167
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/awt/geom/Point2D;

    .line 168
    .local v8, "p":Ljava/awt/geom/Point2D;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/report/ScatterVulns;->sort(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "label":Ljava/lang/String;
    new-instance v0, Lorg/jfree/chart/annotations/XYTextAnnotation;

    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v2

    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 170
    .local v0, "annotation":Lorg/jfree/chart/annotations/XYTextAnnotation;
    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v2

    const-wide/high16 v4, 0x4008000000000000L

    cmpg-double v2, v2, v4

    if-gez v2, :cond_6c

    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    :goto_47
    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 171
    sget-object v2, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 172
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    const/4 v3, 0x0

    aget-char v2, v2, v3

    iget-char v3, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->averageLabel:C

    if-ne v2, v3, :cond_6f

    .line 173
    sget-object v2, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 177
    :goto_5f
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v2}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 178
    invoke-virtual {p3, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    goto :goto_c

    .line 170
    :cond_6c
    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_CENTER:Lorg/jfree/ui/TextAnchor;

    goto :goto_47

    .line 175
    :cond_6f
    sget-object v2, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    goto :goto_5f

    .line 181
    .end local v0    # "annotation":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v1    # "label":Ljava/lang/String;
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    :cond_75
    return-void
.end method

.method private makeLegend(Ljava/lang/String;Ljava/util/Set;DDLorg/jfree/data/xy/XYSeriesCollection;Lorg/jfree/chart/plot/XYPlot;)V
    .registers 44
    .param p1, "category"    # Ljava/lang/String;
    .param p3, "x"    # D
    .param p5, "y"    # D
    .param p7, "dataset"    # Lorg/jfree/data/xy/XYSeriesCollection;
    .param p8, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;DD",
            "Lorg/jfree/data/xy/XYSeriesCollection;",
            "Lorg/jfree/chart/plot/XYPlot;",
            ")V"
        }
    .end annotation

    .prologue
    .line 279
    .local p2, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    const/16 v17, 0x41

    .line 280
    .local v17, "ch":C
    const/16 v22, -0x2

    .line 283
    .local v22, "i":I
    const/16 v27, 0x0

    .line 285
    .local v27, "printedNonCommercialLabel":Z
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_a
    :goto_a
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_131

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/owasp/benchmark/score/report/Report;

    .line 286
    .local v28, "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v5

    if-nez v5, :cond_a

    .line 289
    if-nez v27, :cond_54

    .line 290
    new-instance v4, Lorg/jfree/chart/annotations/XYTextAnnotation;

    const-string v5, "Non-Commercial"

    move/from16 v0, v22

    int-to-double v14, v0

    const-wide v32, -0x3ff599999999999aL

    mul-double v14, v14, v32

    add-double v8, p5, v14

    move-wide/from16 v6, p3

    invoke-direct/range {v4 .. v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 291
    .local v4, "stroketext1":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v5, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 292
    sget-object v5, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 293
    sget-object v5, Ljava/awt/Color;->black:Ljava/awt/Color;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 294
    sget-object v5, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v5}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 295
    move-object/from16 v0, p8

    invoke-virtual {v0, v4}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 296
    add-int/lit8 v22, v22, 0x1

    .line 297
    const/16 v27, 0x1

    .line 300
    .end local v4    # "stroketext1":Lorg/jfree/chart/annotations/XYTextAnnotation;
    :cond_54
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v24

    .line 302
    .local v24, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    const/16 v5, 0x49

    move/from16 v0, v17

    if-eq v0, v5, :cond_64

    const/16 v5, 0x69

    move/from16 v0, v17

    if-ne v0, v5, :cond_10a

    :cond_64
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, ":  "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 303
    .local v23, "label":Ljava/lang/String;
    :goto_79
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v5

    iget-wide v14, v5, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    const-wide/high16 v32, 0x4059000000000000L

    mul-double v30, v14, v32

    .line 304
    .local v30, "score":D
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u25a0 "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " ("

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    invoke-virtual {v5, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "%)"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 305
    .local v7, "msg":Ljava/lang/String;
    new-instance v6, Lorg/jfree/chart/annotations/XYTextAnnotation;

    move/from16 v0, v22

    int-to-double v14, v0

    const-wide v32, -0x3ff599999999999aL

    mul-double v14, v14, v32

    add-double v10, p5, v14

    move-wide/from16 v8, p3

    invoke-direct/range {v6 .. v11}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 306
    .local v6, "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v5, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 307
    sget-object v5, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 308
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getToolName()Ljava/lang/String;

    move-result-object v5

    const/16 v9, 0x20

    const/16 v11, 0x5f

    invoke-virtual {v5, v9, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->focus:Ljava/lang/String;

    invoke-virtual {v5, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_127

    sget-object v5, Ljava/awt/Color;->green:Ljava/awt/Color;

    :goto_ed
    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 310
    sget-object v5, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v5}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 311
    move-object/from16 v0, p8

    invoke-virtual {v0, v6}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 312
    add-int/lit8 v22, v22, 0x1

    .line 314
    const/16 v5, 0x5a

    move/from16 v0, v17

    if-ne v0, v5, :cond_12a

    const/16 v17, 0x61

    goto/16 :goto_a

    .line 302
    .end local v6    # "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v7    # "msg":Ljava/lang/String;
    .end local v23    # "label":Ljava/lang/String;
    .end local v30    # "score":D
    :cond_10a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, ": "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    goto/16 :goto_79

    .line 308
    .restart local v6    # "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v23    # "label":Ljava/lang/String;
    .restart local v30    # "score":D
    :cond_127
    sget-object v5, Ljava/awt/Color;->blue:Ljava/awt/Color;

    goto :goto_ed

    .line 314
    :cond_12a
    add-int/lit8 v5, v17, 0x1

    int-to-char v0, v5

    move/from16 v17, v0

    goto/16 :goto_a

    .line 319
    .end local v6    # "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v7    # "msg":Ljava/lang/String;
    .end local v23    # "label":Ljava/lang/String;
    .end local v24    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v28    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v30    # "score":D
    :cond_131
    const/16 v26, 0x0

    .line 320
    .local v26, "printedCommercialLabel":Z
    const-wide/16 v18, 0x0

    .line 322
    .local v18, "commercialTotal":D
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_139
    :goto_139
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2d0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/owasp/benchmark/score/report/Report;

    .line 323
    .restart local v28    # "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v24

    .line 324
    .restart local v24    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v9

    if-eqz v9, :cond_25c

    .line 328
    if-nez v26, :cond_186

    .line 329
    new-instance v8, Lorg/jfree/chart/annotations/XYTextAnnotation;

    const-string v9, "Commercial"

    move/from16 v0, v22

    int-to-double v12, v0

    const-wide v14, -0x3ff599999999999aL

    mul-double/2addr v12, v14

    add-double v12, v12, p5

    move-wide/from16 v10, p3

    invoke-direct/range {v8 .. v13}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 330
    .local v8, "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v9, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 331
    sget-object v9, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 332
    sget-object v9, Ljava/awt/Color;->black:Ljava/awt/Color;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 333
    sget-object v9, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v9}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 334
    move-object/from16 v0, p8

    invoke-virtual {v0, v8}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 335
    add-int/lit8 v22, v22, 0x1

    .line 336
    const/16 v26, 0x1

    .line 339
    .end local v8    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    :cond_186
    move-object/from16 v0, p0

    iget v9, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    iput v9, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    .line 340
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v9

    iget-wide v12, v9, Lorg/owasp/benchmark/score/parsers/OverallResult;->score:D

    const-wide/high16 v14, 0x4059000000000000L

    mul-double v30, v12, v14

    .line 342
    .restart local v30    # "score":D
    sget-boolean v9, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-nez v9, :cond_22e

    .line 344
    const/16 v9, 0x49

    move/from16 v0, v17

    if-eq v0, v9, :cond_1ae

    const/16 v9, 0x69

    move/from16 v0, v17

    if-ne v0, v9, :cond_2ac

    :cond_1ae
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ":  "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 345
    .restart local v23    # "label":Ljava/lang/String;
    :goto_1c3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u25a0 "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, " ("

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->round(D)J

    move-result-wide v12

    invoke-virtual {v9, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "%)"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 346
    .restart local v7    # "msg":Ljava/lang/String;
    new-instance v8, Lorg/jfree/chart/annotations/XYTextAnnotation;

    move/from16 v0, v22

    int-to-double v12, v0

    const-wide v14, -0x3ff599999999999aL

    mul-double/2addr v12, v14

    add-double v12, v12, p5

    move-object v9, v7

    move-wide/from16 v10, p3

    invoke-direct/range {v8 .. v13}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 347
    .restart local v8    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v9, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 348
    sget-object v9, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 349
    sget-object v9, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 350
    sget-object v9, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v9}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 351
    move-object/from16 v0, p8

    invoke-virtual {v0, v8}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 352
    add-int/lit8 v22, v22, 0x1

    .line 354
    const/16 v9, 0x5a

    move/from16 v0, v17

    if-ne v0, v9, :cond_2c9

    const/16 v17, 0x61

    .line 356
    .end local v7    # "msg":Ljava/lang/String;
    .end local v8    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v23    # "label":Ljava/lang/String;
    :cond_22e
    :goto_22e
    add-double v18, v18, v30

    .line 358
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLow:D

    cmpg-double v9, v30, v12

    if-gez v9, :cond_246

    .line 359
    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLow:D

    .line 360
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-result-object v9

    move-object/from16 v0, p0

    iput-object v9, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLowToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 362
    :cond_246
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHigh:D

    cmpl-double v9, v30, v12

    if-lez v9, :cond_25c

    .line 363
    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHigh:D

    .line 364
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    move-result-object v9

    move-object/from16 v0, p0

    iput-object v9, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHighToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    .line 369
    .end local v30    # "score":D
    :cond_25c
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getToolName()Ljava/lang/String;

    move-result-object v9

    const/16 v11, 0x20

    const/16 v12, 0x5f

    invoke-virtual {v9, v11, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->focus:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_139

    .line 370
    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v9

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v25

    .line 371
    .local v25, "orc":Lorg/owasp/benchmark/score/parsers/OverallResult;
    new-instance v20, Ljava/awt/geom/Point2D$Double;

    move-object/from16 v0, v25

    iget-wide v12, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    const-wide/high16 v14, 0x4059000000000000L

    mul-double/2addr v12, v14

    move-object/from16 v0, v25

    iget-wide v14, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    const-wide/high16 v32, 0x4059000000000000L

    mul-double v14, v14, v32

    move-object/from16 v0, v20

    invoke-direct {v0, v12, v13, v14, v15}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 372
    .local v20, "focusPoint":Ljava/awt/geom/Point2D;
    new-instance v21, Ljava/awt/Color;

    const/4 v9, 0x0

    const/high16 v11, 0x3f800000

    const/4 v12, 0x0

    const/high16 v13, 0x3f000000

    move-object/from16 v0, v21

    invoke-direct {v0, v9, v11, v12, v13}, Ljava/awt/Color;-><init>(FFFF)V

    .line 373
    .local v21, "green":Ljava/awt/Color;
    const-wide/high16 v12, 0x4008000000000000L

    move-object/from16 v0, p8

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v12, v13, v2}, Lorg/owasp/benchmark/score/report/ScatterVulns;->makePoint(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DLjava/awt/Color;)V

    goto/16 :goto_139

    .line 344
    .end local v20    # "focusPoint":Ljava/awt/geom/Point2D;
    .end local v21    # "green":Ljava/awt/Color;
    .end local v25    # "orc":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .restart local v30    # "score":D
    :cond_2ac
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, ""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ": "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    goto/16 :goto_1c3

    .line 354
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v8    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .restart local v23    # "label":Ljava/lang/String;
    :cond_2c9
    add-int/lit8 v9, v17, 0x1

    int-to-char v0, v9

    move/from16 v17, v0

    goto/16 :goto_22e

    .line 378
    .end local v7    # "msg":Ljava/lang/String;
    .end local v8    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v23    # "label":Ljava/lang/String;
    .end local v24    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v28    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v30    # "score":D
    :cond_2d0
    move-object/from16 v0, p0

    iget v5, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    const/4 v9, 0x1

    if-gt v5, v9, :cond_2e2

    sget-boolean v5, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v5, :cond_377

    move-object/from16 v0, p0

    iget v5, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    const/4 v9, 0x1

    if-ne v5, v9, :cond_377

    .line 379
    :cond_2e2
    move-object/from16 v0, p0

    iget v5, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    int-to-double v12, v5

    div-double v12, v18, v12

    move-object/from16 v0, p0

    iput-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialAve:D

    .line 380
    new-instance v10, Lorg/jfree/chart/annotations/XYTextAnnotation;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u25a0 "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, ": Commercial Average ("

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialAve:D

    .line 381
    invoke-static {v12, v13}, Ljava/lang/Math;->round(D)J

    move-result-wide v12

    invoke-virtual {v5, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "%)"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    move/from16 v0, v22

    int-to-double v12, v0

    const-wide v14, -0x3ff599999999999aL

    mul-double/2addr v12, v14

    add-double v14, p5, v12

    move-wide/from16 v12, p3

    invoke-direct/range {v10 .. v15}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 382
    .local v10, "stroketext2":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v5, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v10, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 383
    sget-object v5, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v10, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 384
    sget-object v5, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    invoke-virtual {v10, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 385
    sget-object v5, Lorg/owasp/benchmark/score/report/ScatterVulns;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v5}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v5

    invoke-virtual {v10, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 386
    move-object/from16 v0, p8

    invoke-virtual {v0, v10}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 388
    new-instance v16, Ljava/awt/geom/Point2D$Double;

    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    const-wide/high16 v14, 0x4059000000000000L

    mul-double/2addr v12, v14

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    const-wide/high16 v32, 0x4059000000000000L

    mul-double v14, v14, v32

    move-object/from16 v0, v16

    invoke-direct {v0, v12, v13, v14, v15}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 389
    .local v16, "averagePoint":Ljava/awt/geom/Point2D;
    new-instance v29, Ljava/awt/Color;

    const/high16 v5, 0x3f800000

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/high16 v12, 0x3f000000

    move-object/from16 v0, v29

    invoke-direct {v0, v5, v9, v11, v12}, Ljava/awt/Color;-><init>(FFFF)V

    .line 390
    .local v29, "red":Ljava/awt/Color;
    const-wide/high16 v12, 0x4008000000000000L

    move-object/from16 v0, p8

    move-object/from16 v1, v16

    move-object/from16 v2, v29

    invoke-static {v0, v1, v12, v13, v2}, Lorg/owasp/benchmark/score/report/ScatterVulns;->makePoint(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DLjava/awt/Color;)V

    .line 392
    .end local v10    # "stroketext2":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v16    # "averagePoint":Ljava/awt/geom/Point2D;
    .end local v29    # "red":Ljava/awt/Color;
    :cond_377
    return-void
.end method

.method private makePointList(Ljava/lang/String;Ljava/util/Set;)Ljava/util/HashMap;
    .registers 25
    .param p1, "category"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/awt/geom/Point2D;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 198
    .local p2, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 199
    .local v6, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    const/16 v3, 0x41

    .line 203
    .local v3, "ch":C
    const/4 v4, 0x0

    .line 205
    .local v4, "commercialToolCount":I
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_c
    :goto_c
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_84

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/owasp/benchmark/score/report/Report;

    .line 206
    .local v9, "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v15

    if-nez v15, :cond_c

    .line 207
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v7

    .line 209
    .local v7, "or":Lorg/owasp/benchmark/score/parsers/OverallResult;
    iget-wide v0, v7, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v10, v16, v18

    .line 210
    .local v10, "x":D
    iget-wide v0, v7, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v16, v16, v18

    const-wide/high16 v18, 0x3ff0000000000000L

    sub-double v12, v16, v18

    .line 211
    .local v12, "y":D
    new-instance v8, Ljava/awt/geom/Point2D$Double;

    invoke-direct {v8, v10, v11, v12, v13}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 212
    .local v8, "p":Ljava/awt/geom/Point2D;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 213
    .local v5, "label":Ljava/lang/String;
    invoke-virtual {v6, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    const/16 v15, 0x5a

    if-ne v3, v15, :cond_80

    const/16 v3, 0x61

    goto :goto_c

    :cond_80
    add-int/lit8 v15, v3, 0x1

    int-to-char v3, v15

    goto :goto_c

    .line 219
    .end local v5    # "label":Ljava/lang/String;
    .end local v7    # "or":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    .end local v9    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v10    # "x":D
    .end local v12    # "y":D
    :cond_84
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_88
    :goto_88
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_106

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/owasp/benchmark/score/report/Report;

    .line 220
    .restart local v9    # "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v15

    if-eqz v15, :cond_88

    .line 221
    add-int/lit8 v4, v4, 0x1

    .line 222
    sget-boolean v15, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-nez v15, :cond_88

    .line 223
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults(Ljava/lang/String;)Lorg/owasp/benchmark/score/parsers/OverallResult;

    move-result-object v7

    .line 225
    .restart local v7    # "or":Lorg/owasp/benchmark/score/parsers/OverallResult;
    iget-wide v0, v7, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v10, v16, v18

    .line 226
    .restart local v10    # "x":D
    iget-wide v0, v7, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v16, v16, v18

    const-wide/high16 v18, 0x3ff0000000000000L

    sub-double v12, v16, v18

    .line 227
    .restart local v12    # "y":D
    new-instance v8, Ljava/awt/geom/Point2D$Double;

    invoke-direct {v8, v10, v11, v12, v13}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 228
    .restart local v8    # "p":Ljava/awt/geom/Point2D;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 229
    .restart local v5    # "label":Ljava/lang/String;
    invoke-virtual {v6, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    const/16 v15, 0x5a

    if-ne v3, v15, :cond_102

    const/16 v3, 0x61

    goto :goto_88

    :cond_102
    add-int/lit8 v15, v3, 0x1

    int-to-char v3, v15

    goto :goto_88

    .line 236
    .end local v5    # "label":Ljava/lang/String;
    .end local v7    # "or":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    .end local v9    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v10    # "x":D
    .end local v12    # "y":D
    :cond_106
    const/4 v14, 0x1

    if-gt v4, v14, :cond_110

    sget-boolean v14, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v14, :cond_16d

    const/4 v14, 0x1

    if-ne v4, v14, :cond_16d

    .line 237
    :cond_110
    new-instance v2, Ljava/awt/geom/Point2D$Double;

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->afr:D

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v14, v14, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v16

    const-wide v18, 0x3eb0c6f7a0b5ed8dL

    mul-double v16, v16, v18

    add-double v14, v14, v16

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->atr:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->sr:Ljava/security/SecureRandom;

    move-object/from16 v18, v0

    .line 238
    invoke-virtual/range {v18 .. v18}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v16, v16, v18

    const-wide/high16 v18, 0x3ff0000000000000L

    sub-double v16, v16, v18

    move-wide/from16 v0, v16

    invoke-direct {v2, v14, v15, v0, v1}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 239
    .local v2, "ap":Ljava/awt/geom/Point2D;
    move-object/from16 v0, p0

    iput-char v3, v0, Lorg/owasp/benchmark/score/report/ScatterVulns;->averageLabel:C

    .line 240
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v2, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .end local v2    # "ap":Ljava/awt/geom/Point2D;
    :cond_16d
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/owasp/benchmark/score/report/ScatterVulns;->dedupify(Ljava/util/HashMap;)V

    .line 243
    return-object v6
.end method

.method private sort(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 184
    const-string v3, ","

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 185
    .local v1, "parts":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 186
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    array-length v3, v1

    if-ge v0, v3, :cond_24

    .line 188
    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_21

    .line 190
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 192
    :cond_24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public getCommercialAve()I
    .registers 3

    .prologue
    .line 424
    iget-wide v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialAve:D

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getCommercialHigh()I
    .registers 3

    .prologue
    .line 428
    iget-wide v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHigh:D

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getCommercialHighToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .registers 2

    .prologue
    .line 432
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialHighToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-object v0
.end method

.method public getCommercialLow()I
    .registers 3

    .prologue
    .line 416
    iget-wide v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLow:D

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getCommercialLowToolType()Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;
    .registers 2

    .prologue
    .line 420
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialLowToolType:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    return-object v0
.end method

.method public getCommercialToolCount()I
    .registers 2

    .prologue
    .line 412
    iget v0, p0, Lorg/owasp/benchmark/score/report/ScatterVulns;->commercialToolCount:I

    return v0
.end method
