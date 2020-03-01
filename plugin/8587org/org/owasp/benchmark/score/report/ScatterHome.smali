.class public Lorg/owasp/benchmark/score/report/ScatterHome;
.super Lorg/owasp/benchmark/score/report/ScatterPlot;
.source "ScatterHome.java"


# static fields
.field public static final INITIAL_LABEL:C = 'A'

.field private static averageLabel:C

.field static sr:Ljava/security/SecureRandom;


# instance fields
.field private afr:D

.field private atr:D

.field public final focus:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 183
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I
    .param p4, "focus"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p3, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    const-wide/16 v0, 0x0

    .line 64
    invoke-direct {p0}, Lorg/owasp/benchmark/score/report/ScatterPlot;-><init>()V

    .line 51
    iput-wide v0, p0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    .line 52
    iput-wide v0, p0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    .line 65
    iput-object p4, p0, Lorg/owasp/benchmark/score/report/ScatterHome;->focus:Ljava/lang/String;

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "          "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/owasp/benchmark/score/report/ScatterHome;->display(Ljava/lang/String;ILjava/util/Set;)Lorg/jfree/chart/JFreeChart;

    .line 67
    return-void
.end method

.method private static dedupify(Ljava/util/HashMap;)V
    .registers 6
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
    .line 232
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

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

    .line 233
    .local v0, "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-static {p0, v0}, Lorg/owasp/benchmark/score/report/ScatterHome;->getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 234
    .local v1, "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    :goto_18
    if-eqz v1, :cond_8

    .line 235
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .local v2, "label":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2e

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    :cond_2e
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    :cond_3f
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4e

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    :cond_4e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    invoke-static {p0, v0}, Lorg/owasp/benchmark/score/report/ScatterHome;->getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 242
    goto :goto_18

    .line 244
    .end local v0    # "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "label":Ljava/lang/StringBuilder;
    :cond_5e
    return-void
.end method

.method private display(Ljava/lang/String;ILjava/util/Set;)Lorg/jfree/chart/JFreeChart;
    .registers 49
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;)",
            "Lorg/jfree/chart/JFreeChart;"
        }
    .end annotation

    .prologue
    .line 70
    .local p3, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    new-instance v40, Ljavax/swing/JFrame;

    move-object/from16 v0, v40

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 71
    .local v40, "f":Ljavax/swing/JFrame;
    const/4 v2, 0x3

    move-object/from16 v0, v40

    invoke-virtual {v0, v2}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    .line 74
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .local v14, "averageCommercialFalseRates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Double;>;"
    new-instance v36, Ljava/util/ArrayList;

    invoke-direct/range {v36 .. v36}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .local v36, "averageCommercialTrueRates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Double;>;"
    new-instance v5, Lorg/jfree/data/xy/XYSeriesCollection;

    invoke-direct {v5}, Lorg/jfree/data/xy/XYSeriesCollection;-><init>()V

    .line 78
    .local v5, "dataset":Lorg/jfree/data/xy/XYSeriesCollection;
    new-instance v43, Lorg/jfree/data/xy/XYSeries;

    const-string v2, "Scores"

    move-object/from16 v0, v43

    invoke-direct {v0, v2}, Lorg/jfree/data/xy/XYSeries;-><init>(Ljava/lang/Comparable;)V

    .line 79
    .local v43, "series":Lorg/jfree/data/xy/XYSeries;
    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2b
    :goto_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_73

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v44

    check-cast v44, Lorg/owasp/benchmark/score/report/Report;

    .line 80
    .local v44, "toolReport":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v44 .. v44}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v3

    if-nez v3, :cond_2b

    .line 81
    invoke-virtual/range {v44 .. v44}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v42

    .line 82
    .local v42, "overallResults":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v6

    const-wide/high16 v8, 0x4059000000000000L

    mul-double/2addr v6, v8

    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v8

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    move-object/from16 v0, v43

    invoke-virtual {v0, v6, v7, v8, v9}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 83
    invoke-virtual/range {v44 .. v44}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 84
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    .line 90
    .end local v42    # "overallResults":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v44    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    :cond_73
    const/16 v37, 0x0

    .line 91
    .local v37, "commercialToolCount":I
    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_79
    :goto_79
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v44

    check-cast v44, Lorg/owasp/benchmark/score/report/Report;

    .line 92
    .restart local v44    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v44 .. v44}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v3

    if-eqz v3, :cond_79

    .line 93
    add-int/lit8 v37, v37, 0x1

    .line 94
    invoke-virtual/range {v44 .. v44}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v42

    .line 95
    .restart local v42    # "overallResults":Lorg/owasp/benchmark/score/parsers/OverallResults;
    sget-boolean v3, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-nez v3, :cond_a8

    .line 96
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v6

    const-wide/high16 v8, 0x4059000000000000L

    mul-double/2addr v6, v8

    .line 97
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v8

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    .line 96
    move-object/from16 v0, v43

    invoke-virtual {v0, v6, v7, v8, v9}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 99
    :cond_a8
    invoke-virtual/range {v44 .. v44}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v3

    if-eqz v3, :cond_79

    .line 100
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    invoke-virtual/range {v42 .. v42}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_79

    .line 106
    .end local v42    # "overallResults":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v44    # "toolReport":Lorg/owasp/benchmark/score/report/Report;
    :cond_c7
    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_cb
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v38

    .line 107
    .local v38, "d":D
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    add-double v6, v6, v38

    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    goto :goto_cb

    .line 109
    .end local v38    # "d":D
    :cond_e6
    move-object/from16 v0, p0

    iget-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-double v6, v4

    div-double/2addr v2, v6

    move-object/from16 v0, p0

    iput-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    .line 111
    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_f8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_113

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v38

    .line 112
    .restart local v38    # "d":D
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    add-double v6, v6, v38

    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    goto :goto_f8

    .line 114
    .end local v38    # "d":D
    :cond_113
    move-object/from16 v0, p0

    iget-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-double v6, v4

    div-double/2addr v2, v6

    move-object/from16 v0, p0

    iput-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    .line 116
    const/4 v2, 0x1

    move/from16 v0, v37

    if-gt v0, v2, :cond_12f

    sget-boolean v2, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v2, :cond_142

    const/4 v2, 0x1

    move/from16 v0, v37

    if-ne v0, v2, :cond_142

    .line 117
    :cond_12f
    move-object/from16 v0, p0

    iget-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    const-wide/high16 v6, 0x4059000000000000L

    mul-double/2addr v2, v6

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    const-wide/high16 v8, 0x4059000000000000L

    mul-double/2addr v6, v8

    move-object/from16 v0, v43

    invoke-virtual {v0, v2, v3, v6, v7}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 120
    :cond_142
    move-object/from16 v0, v43

    invoke-virtual {v5, v0}, Lorg/jfree/data/xy/XYSeriesCollection;->addSeries(Lorg/jfree/data/xy/XYSeries;)V

    .line 122
    const-string v3, "False Positive Rate"

    const-string v4, "True Positive Rate"

    sget-object v6, Lorg/jfree/chart/plot/PlotOrientation;->VERTICAL:Lorg/jfree/chart/plot/PlotOrientation;

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x0

    move-object/from16 v2, p1

    invoke-static/range {v2 .. v9}, Lorg/jfree/chart/ChartFactory;->createScatterPlot(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jfree/data/xy/XYDataset;Lorg/jfree/chart/plot/PlotOrientation;ZZZ)Lorg/jfree/chart/JFreeChart;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->chart:Lorg/jfree/chart/JFreeChart;

    .line 123
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v2, v3}, Lorg/jfree/chart/StandardChartTheme;->apply(Lorg/jfree/chart/JFreeChart;)V

    .line 125
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v2}, Lorg/jfree/chart/JFreeChart;->getXYPlot()Lorg/jfree/chart/plot/XYPlot;

    move-result-object v13

    .line 126
    .local v13, "xyplot":Lorg/jfree/chart/plot/XYPlot;
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/owasp/benchmark/score/report/ScatterHome;->initializePlot(Lorg/jfree/chart/plot/XYPlot;)V

    .line 127
    invoke-static {v13}, Lorg/owasp/benchmark/score/report/ScatterHome;->addGenerationDate(Lorg/jfree/chart/plot/XYPlot;)V

    .line 129
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v13}, Lorg/owasp/benchmark/score/report/ScatterHome;->makeDataLabels(Ljava/util/Set;Lorg/jfree/chart/plot/XYPlot;)V

    .line 130
    const-wide v8, 0x4059c00000000000L

    const-wide v10, 0x4059200000000000L

    move-object/from16 v6, p0

    move-object/from16 v7, p3

    move-object v12, v5

    invoke-direct/range {v6 .. v13}, Lorg/owasp/benchmark/score/report/ScatterHome;->makeLegend(Ljava/util/Set;DDLorg/jfree/data/xy/XYSeriesCollection;Lorg/jfree/chart/plot/XYPlot;)V

    .line 132
    invoke-virtual/range {v43 .. v43}, Lorg/jfree/data/xy/XYSeries;->getItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_194
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lorg/jfree/data/xy/XYDataItem;

    .line 133
    .local v41, "item":Lorg/jfree/data/xy/XYDataItem;
    invoke-virtual/range {v41 .. v41}, Lorg/jfree/data/xy/XYDataItem;->getX()Ljava/lang/Number;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v16

    .line 134
    .local v16, "x":D
    invoke-virtual/range {v41 .. v41}, Lorg/jfree/data/xy/XYDataItem;->getY()Ljava/lang/Number;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v18

    .line 135
    .local v18, "y":D
    add-double v6, v16, v18

    const-wide/high16 v8, 0x4000000000000000L

    div-double v20, v6, v8

    .line 136
    .local v20, "z":D
    new-instance v15, Lorg/jfree/chart/annotations/XYLineAnnotation;

    sget-object v24, Lorg/owasp/benchmark/score/report/ScatterHome;->dashed:Ljava/awt/Stroke;

    sget-object v25, Ljava/awt/Color;->blue:Ljava/awt/Color;

    move-wide/from16 v22, v20

    invoke-direct/range {v15 .. v25}, Lorg/jfree/chart/annotations/XYLineAnnotation;-><init>(DDDDLjava/awt/Stroke;Ljava/awt/Paint;)V

    .line 137
    .local v15, "score":Lorg/jfree/chart/annotations/XYLineAnnotation;
    invoke-virtual {v13, v15}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    goto :goto_194

    .line 140
    .end local v15    # "score":Lorg/jfree/chart/annotations/XYLineAnnotation;
    .end local v16    # "x":D
    .end local v18    # "y":D
    .end local v20    # "z":D
    .end local v41    # "item":Lorg/jfree/data/xy/XYDataItem;
    :cond_1c5
    new-instance v22, Lorg/jfree/chart/ChartPanel;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->chart:Lorg/jfree/chart/JFreeChart;

    move-object/from16 v23, v0

    const/16 v26, 0x190

    const/16 v27, 0x190

    const/16 v28, 0x4b0

    const/16 v29, 0x4b0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    move/from16 v24, p2

    move/from16 v25, p2

    invoke-direct/range {v22 .. v35}, Lorg/jfree/chart/ChartPanel;-><init>(Lorg/jfree/chart/JFreeChart;IIIIIIZZZZZZ)V

    .line 141
    .local v22, "cp":Lorg/jfree/chart/ChartPanel;
    move-object/from16 v0, v40

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljavax/swing/JFrame;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 142
    invoke-virtual/range {v40 .. v40}, Ljavax/swing/JFrame;->pack()V

    .line 143
    const/4 v2, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v2}, Ljavax/swing/JFrame;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 145
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->chart:Lorg/jfree/chart/JFreeChart;

    return-object v2
.end method

.method public static generateComparisonChart(Ljava/util/Set;Ljava/lang/String;)V
    .registers 8
    .param p1, "focus"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 364
    .local p0, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OWASP Benchmark"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v3, Lorg/owasp/benchmark/score/BenchmarkScore;->mixedMode:Z

    if-eqz v3, :cond_33

    const-string v3, ""

    :goto_11
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Results Comparison"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 367
    .local v2, "scatterTitle":Ljava/lang/String;
    new-instance v1, Lorg/owasp/benchmark/score/report/ScatterHome;

    const/16 v3, 0x320

    invoke-direct {v1, v2, v3, p0, p1}, Lorg/owasp/benchmark/score/report/ScatterHome;-><init>(Ljava/lang/String;ILjava/util/Set;Ljava/lang/String;)V

    .line 368
    .local v1, "scatter":Lorg/owasp/benchmark/score/report/ScatterHome;
    new-instance v3, Ljava/io/File;

    const-string v4, "scorecard/benchmark_comparison.png"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x320

    invoke-virtual {v1, v3, v4}, Lorg/owasp/benchmark/score/report/ScatterHome;->writeChartToFile(Ljava/io/File;I)V

    .line 373
    .end local v1    # "scatter":Lorg/owasp/benchmark/score/report/ScatterHome;
    .end local v2    # "scatterTitle":Ljava/lang/String;
    :goto_32
    return-void

    .line 364
    :cond_33
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " v"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Lorg/owasp/benchmark/score/BenchmarkScore;->benchmarkVersion:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_47} :catch_49

    move-result-object v3

    goto :goto_11

    .line 369
    :catch_49
    move-exception v0

    .line 370
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Couldn\'t generate Benchmark comparison chart for some reason."

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 371
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_32
.end method

.method private static getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .registers 12
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
    .line 247
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .local p1, "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

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

    .line 248
    .local v1, "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

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

    .line 249
    .local v2, "xd":Ljava/lang/Double;
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

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

    .line 250
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

    .line 251
    .local v0, "close":Z
    :goto_63
    if-eq p1, v1, :cond_8

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8

    if-eqz v0, :cond_8

    .line 255
    .end local v0    # "close":Z
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "xd":Ljava/lang/Double;
    .end local v3    # "yd":Ljava/lang/Double;
    :goto_73
    return-object v1

    .line 250
    .restart local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .restart local v2    # "xd":Ljava/lang/Double;
    .restart local v3    # "yd":Ljava/lang/Double;
    :cond_74
    const/4 v0, 0x0

    goto :goto_63

    .line 255
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "xd":Ljava/lang/Double;
    .end local v3    # "yd":Ljava/lang/Double;
    :cond_76
    const/4 v1, 0x0

    goto :goto_73
.end method

.method private makeDataLabels(Ljava/util/Set;Lorg/jfree/chart/plot/XYPlot;)V
    .registers 13
    .param p2, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/owasp/benchmark/score/report/Report;",
            ">;",
            "Lorg/jfree/chart/plot/XYPlot;",
            ")V"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    invoke-direct {p0, p1}, Lorg/owasp/benchmark/score/report/ScatterHome;->makePointList(Ljava/util/Set;)Ljava/util/HashMap;

    move-result-object v7

    .line 151
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

    .line 152
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_c

    .line 153
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/awt/geom/Point2D;

    .line 154
    .local v8, "p":Ljava/awt/geom/Point2D;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lorg/owasp/benchmark/score/report/ScatterHome;->sort(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, "label":Ljava/lang/String;
    new-instance v0, Lorg/jfree/chart/annotations/XYTextAnnotation;

    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v2

    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 156
    .local v0, "annotation":Lorg/jfree/chart/annotations/XYTextAnnotation;
    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v2

    const-wide/high16 v4, 0x4008000000000000L

    cmpg-double v2, v2, v4

    if-gez v2, :cond_6c

    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    :goto_47
    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 157
    sget-object v2, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 158
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    const/4 v3, 0x0

    aget-char v2, v2, v3

    sget-char v3, Lorg/owasp/benchmark/score/report/ScatterHome;->averageLabel:C

    if-ne v2, v3, :cond_6f

    .line 160
    sget-object v2, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 164
    :goto_5f
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v2}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 165
    invoke-virtual {p2, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    goto :goto_c

    .line 156
    :cond_6c
    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_CENTER:Lorg/jfree/ui/TextAnchor;

    goto :goto_47

    .line 162
    :cond_6f
    sget-object v2, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    goto :goto_5f

    .line 168
    .end local v0    # "annotation":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v1    # "label":Ljava/lang/String;
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    :cond_75
    return-void
.end method

.method private makeLegend(Ljava/util/Set;DDLorg/jfree/data/xy/XYSeriesCollection;Lorg/jfree/chart/plot/XYPlot;)V
    .registers 46
    .param p2, "x"    # D
    .param p4, "y"    # D
    .param p6, "dataset"    # Lorg/jfree/data/xy/XYSeriesCollection;
    .param p7, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 260
    .local p1, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    const/16 v19, 0x41

    .line 261
    .local v19, "ch":C
    const/16 v25, -0x2

    .line 264
    .local v25, "i":I
    const/16 v30, 0x0

    .line 267
    .local v30, "printedNonCommercialLabel":Z
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_a
    :goto_a
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_112

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lorg/owasp/benchmark/score/report/Report;

    .line 268
    .local v31, "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v27

    .line 269
    .local v27, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v5

    if-nez v5, :cond_a

    .line 271
    if-nez v30, :cond_58

    .line 272
    new-instance v4, Lorg/jfree/chart/annotations/XYTextAnnotation;

    const-string v5, "Non-Commercial"

    move/from16 v0, v25

    int-to-double v14, v0

    const-wide v16, -0x3ff599999999999aL

    mul-double v14, v14, v16

    add-double v8, p4, v14

    move-wide/from16 v6, p2

    invoke-direct/range {v4 .. v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 273
    .local v4, "stroketext1":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v5, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 274
    sget-object v5, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 275
    sget-object v5, Ljava/awt/Color;->black:Ljava/awt/Color;

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 276
    sget-object v5, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v5}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 277
    move-object/from16 v0, p7

    invoke-virtual {v0, v4}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 278
    add-int/lit8 v25, v25, 0x1

    .line 279
    const/16 v30, 0x1

    .line 283
    .end local v4    # "stroketext1":Lorg/jfree/chart/annotations/XYTextAnnotation;
    :cond_58
    const/16 v5, 0x49

    move/from16 v0, v19

    if-eq v0, v5, :cond_64

    const/16 v5, 0x69

    move/from16 v0, v19

    if-ne v0, v5, :cond_ee

    :cond_64
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, ":  "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .line 284
    .local v26, "label":Ljava/lang/String;
    :goto_79
    invoke-virtual/range {v27 .. v27}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getScore()D

    move-result-wide v14

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v32, v14, v16

    .line 285
    .local v32, "score":D
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u25a0 "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " ("

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    invoke-virtual {v5, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "%)"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 286
    .local v7, "msg":Ljava/lang/String;
    new-instance v6, Lorg/jfree/chart/annotations/XYTextAnnotation;

    move/from16 v0, v25

    int-to-double v14, v0

    const-wide v16, -0x3ff599999999999aL

    mul-double v14, v14, v16

    add-double v10, p4, v14

    move-wide/from16 v8, p2

    invoke-direct/range {v6 .. v11}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 287
    .local v6, "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v5, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 288
    sget-object v5, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 289
    sget-object v5, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 290
    sget-object v5, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v5}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 291
    move-object/from16 v0, p7

    invoke-virtual {v0, v6}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 292
    add-int/lit8 v25, v25, 0x1

    .line 294
    const/16 v5, 0x5a

    move/from16 v0, v19

    if-ne v0, v5, :cond_10b

    const/16 v19, 0x61

    goto/16 :goto_a

    .line 283
    .end local v6    # "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v7    # "msg":Ljava/lang/String;
    .end local v26    # "label":Ljava/lang/String;
    .end local v32    # "score":D
    :cond_ee
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, ": "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_79

    .line 294
    .restart local v6    # "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v26    # "label":Ljava/lang/String;
    .restart local v32    # "score":D
    :cond_10b
    add-int/lit8 v5, v19, 0x1

    int-to-char v0, v5

    move/from16 v19, v0

    goto/16 :goto_a

    .line 299
    .end local v6    # "stroketext3":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v7    # "msg":Ljava/lang/String;
    .end local v26    # "label":Ljava/lang/String;
    .end local v27    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v31    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v32    # "score":D
    :cond_112
    const-wide/16 v34, 0x0

    .line 300
    .local v34, "totalScore":D
    const/16 v29, 0x0

    .line 301
    .local v29, "printedCommercialLabel":Z
    const/16 v22, 0x0

    .line 303
    .local v22, "commercialToolCount":I
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_11c
    :goto_11c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_277

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lorg/owasp/benchmark/score/report/Report;

    .line 305
    .restart local v31    # "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v27

    .line 306
    .restart local v27    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v9

    if-eqz v9, :cond_207

    .line 309
    if-nez v29, :cond_16a

    .line 310
    new-instance v8, Lorg/jfree/chart/annotations/XYTextAnnotation;

    const-string v9, "Commercial"

    move/from16 v0, v25

    int-to-double v14, v0

    const-wide v16, -0x3ff599999999999aL

    mul-double v14, v14, v16

    add-double v12, p4, v14

    move-wide/from16 v10, p2

    invoke-direct/range {v8 .. v13}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 311
    .local v8, "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v9, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 312
    sget-object v9, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 313
    sget-object v9, Ljava/awt/Color;->black:Ljava/awt/Color;

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 314
    sget-object v9, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v9}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 315
    move-object/from16 v0, p7

    invoke-virtual {v0, v8}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 316
    add-int/lit8 v25, v25, 0x1

    .line 317
    const/16 v29, 0x1

    .line 320
    .end local v8    # "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    :cond_16a
    add-int/lit8 v22, v22, 0x1

    .line 322
    const/16 v9, 0x49

    move/from16 v0, v19

    if-eq v0, v9, :cond_178

    const/16 v9, 0x69

    move/from16 v0, v19

    if-ne v0, v9, :cond_254

    :cond_178
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ":  "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .line 323
    .restart local v26    # "label":Ljava/lang/String;
    :goto_18d
    invoke-virtual/range {v27 .. v27}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getScore()D

    move-result-wide v14

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v32, v14, v16

    .line 324
    .restart local v32    # "score":D
    sget-boolean v9, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-nez v9, :cond_205

    .line 325
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u25a0 "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->getToolNameAndVersion()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, " ("

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    invoke-virtual {v9, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "%)"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 326
    .restart local v7    # "msg":Ljava/lang/String;
    new-instance v10, Lorg/jfree/chart/annotations/XYTextAnnotation;

    move/from16 v0, v25

    int-to-double v14, v0

    const-wide v16, -0x3ff599999999999aL

    mul-double v14, v14, v16

    add-double v14, v14, p4

    move-object v11, v7

    move-wide/from16 v12, p2

    invoke-direct/range {v10 .. v15}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 327
    .local v10, "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v9, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v10, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 328
    sget-object v9, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v10, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 329
    sget-object v9, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v10, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 330
    sget-object v9, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v9}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v9

    invoke-virtual {v10, v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 331
    move-object/from16 v0, p7

    invoke-virtual {v0, v10}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 332
    add-int/lit8 v25, v25, 0x1

    .line 334
    const/16 v9, 0x5a

    move/from16 v0, v19

    if-ne v0, v9, :cond_271

    const/16 v19, 0x61

    .line 336
    .end local v7    # "msg":Ljava/lang/String;
    .end local v10    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    :cond_205
    :goto_205
    add-double v34, v34, v32

    .line 338
    .end local v26    # "label":Ljava/lang/String;
    .end local v32    # "score":D
    :cond_207
    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->getToolName()Ljava/lang/String;

    move-result-object v9

    const/16 v11, 0x20

    const/16 v13, 0x5f

    invoke-virtual {v9, v11, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->focus:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_11c

    .line 339
    invoke-virtual/range {v31 .. v31}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v28

    .line 340
    .local v28, "orc":Lorg/owasp/benchmark/score/parsers/OverallResults;
    new-instance v23, Ljava/awt/geom/Point2D$Double;

    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v14

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v14, v14, v16

    invoke-virtual/range {v28 .. v28}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v16

    const-wide/high16 v36, 0x4059000000000000L

    mul-double v16, v16, v36

    move-object/from16 v0, v23

    move-wide/from16 v1, v16

    invoke-direct {v0, v14, v15, v1, v2}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 341
    .local v23, "focusPoint":Ljava/awt/geom/Point2D;
    new-instance v24, Ljava/awt/Color;

    const/4 v9, 0x0

    const/high16 v11, 0x3f800000

    const/4 v13, 0x0

    const/high16 v14, 0x3f000000

    move-object/from16 v0, v24

    invoke-direct {v0, v9, v11, v13, v14}, Ljava/awt/Color;-><init>(FFFF)V

    .line 342
    .local v24, "green":Ljava/awt/Color;
    const-wide/high16 v14, 0x4008000000000000L

    move-object/from16 v0, p7

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v14, v15, v2}, Lorg/owasp/benchmark/score/report/ScatterHome;->makePoint(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DLjava/awt/Color;)V

    goto/16 :goto_11c

    .line 322
    .end local v23    # "focusPoint":Ljava/awt/geom/Point2D;
    .end local v24    # "green":Ljava/awt/Color;
    .end local v28    # "orc":Lorg/owasp/benchmark/score/parsers/OverallResults;
    :cond_254
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, ""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, ": "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_18d

    .line 334
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v10    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .restart local v26    # "label":Ljava/lang/String;
    .restart local v32    # "score":D
    :cond_271
    add-int/lit8 v9, v19, 0x1

    int-to-char v0, v9

    move/from16 v19, v0

    goto :goto_205

    .line 347
    .end local v7    # "msg":Ljava/lang/String;
    .end local v10    # "stroketext4":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v26    # "label":Ljava/lang/String;
    .end local v27    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v31    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v32    # "score":D
    :cond_277
    const/4 v5, 0x1

    move/from16 v0, v22

    if-gt v0, v5, :cond_285

    sget-boolean v5, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v5, :cond_309

    const/4 v5, 0x1

    move/from16 v0, v22

    if-ne v0, v5, :cond_309

    .line 348
    :cond_285
    move/from16 v0, v22

    int-to-double v14, v0

    div-double v20, v34, v14

    .line 349
    .local v20, "averageScore":D
    new-instance v12, Lorg/jfree/chart/annotations/XYTextAnnotation;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u25a0 "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, ": Commercial Average ("

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 350
    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    invoke-virtual {v5, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "%)"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move/from16 v0, v25

    int-to-double v14, v0

    const-wide v16, -0x3ff599999999999aL

    mul-double v14, v14, v16

    add-double v16, p4, v14

    move-wide/from16 v14, p2

    invoke-direct/range {v12 .. v17}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 351
    .local v12, "stroketext2":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v5, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v12, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 352
    sget-object v5, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v12, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 353
    sget-object v5, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    invoke-virtual {v12, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 354
    sget-object v5, Lorg/owasp/benchmark/score/report/ScatterHome;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v5}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v5

    invoke-virtual {v12, v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 355
    move-object/from16 v0, p7

    invoke-virtual {v0, v12}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 357
    new-instance v18, Ljava/awt/geom/Point2D$Double;

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v14, v14, v16

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    move-wide/from16 v16, v0

    const-wide/high16 v36, 0x4059000000000000L

    mul-double v16, v16, v36

    move-object/from16 v0, v18

    move-wide/from16 v1, v16

    invoke-direct {v0, v14, v15, v1, v2}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 358
    .local v18, "averagePoint":Ljava/awt/geom/Point2D;
    const-wide/high16 v14, 0x4008000000000000L

    sget-object v5, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    move-object/from16 v0, p7

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14, v15, v5}, Lorg/owasp/benchmark/score/report/ScatterHome;->makePoint(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DLjava/awt/Color;)V

    .line 360
    .end local v12    # "stroketext2":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v18    # "averagePoint":Ljava/awt/geom/Point2D;
    .end local v20    # "averageScore":D
    :cond_309
    return-void
.end method

.method private makePointList(Ljava/util/Set;)Ljava/util/HashMap;
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 186
    .local p1, "toolResults":Ljava/util/Set;, "Ljava/util/Set<Lorg/owasp/benchmark/score/report/Report;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 187
    .local v6, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    const/16 v3, 0x41

    .line 190
    .local v3, "ch":C
    const/4 v4, 0x0

    .line 191
    .local v4, "commercialToolCount":I
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_c
    :goto_c
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_7a

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/owasp/benchmark/score/report/Report;

    .line 192
    .local v9, "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v15

    if-nez v15, :cond_c

    .line 193
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v7

    .line 194
    .local v7, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v16

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    sget-object v15, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v10, v16, v18

    .line 195
    .local v10, "x":D
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v16

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    sget-object v15, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v16, v16, v18

    const-wide/high16 v18, 0x3ff0000000000000L

    sub-double v12, v16, v18

    .line 196
    .local v12, "y":D
    new-instance v8, Ljava/awt/geom/Point2D$Double;

    invoke-direct {v8, v10, v11, v12, v13}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 197
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

    .line 198
    .local v5, "label":Ljava/lang/String;
    invoke-virtual {v6, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    const/16 v15, 0x5a

    if-ne v3, v15, :cond_76

    const/16 v3, 0x61

    goto :goto_c

    :cond_76
    add-int/lit8 v15, v3, 0x1

    int-to-char v3, v15

    goto :goto_c

    .line 204
    .end local v5    # "label":Ljava/lang/String;
    .end local v7    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    .end local v9    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v10    # "x":D
    .end local v12    # "y":D
    :cond_7a
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_7e
    :goto_7e
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_f2

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/owasp/benchmark/score/report/Report;

    .line 205
    .restart local v9    # "r":Lorg/owasp/benchmark/score/report/Report;
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->isCommercial()Z

    move-result v15

    if-eqz v15, :cond_7e

    .line 206
    add-int/lit8 v4, v4, 0x1

    .line 207
    sget-boolean v15, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-nez v15, :cond_7e

    .line 208
    invoke-virtual {v9}, Lorg/owasp/benchmark/score/report/Report;->getOverallResults()Lorg/owasp/benchmark/score/parsers/OverallResults;

    move-result-object v7

    .line 209
    .restart local v7    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getFalsePositiveRate()D

    move-result-wide v16

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    sget-object v15, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v10, v16, v18

    .line 210
    .restart local v10    # "x":D
    invoke-virtual {v7}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTruePositiveRate()D

    move-result-wide v16

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    sget-object v15, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v15}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v16, v16, v18

    const-wide/high16 v18, 0x3ff0000000000000L

    sub-double v12, v16, v18

    .line 211
    .restart local v12    # "y":D
    new-instance v8, Ljava/awt/geom/Point2D$Double;

    invoke-direct {v8, v10, v11, v12, v13}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 212
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

    .line 213
    .restart local v5    # "label":Ljava/lang/String;
    invoke-virtual {v6, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    const/16 v15, 0x5a

    if-ne v3, v15, :cond_ee

    const/16 v3, 0x61

    goto :goto_7e

    :cond_ee
    add-int/lit8 v15, v3, 0x1

    int-to-char v3, v15

    goto :goto_7e

    .line 220
    .end local v5    # "label":Ljava/lang/String;
    .end local v7    # "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    .end local v9    # "r":Lorg/owasp/benchmark/score/report/Report;
    .end local v10    # "x":D
    .end local v12    # "y":D
    :cond_f2
    const/4 v14, 0x1

    if-gt v4, v14, :cond_fc

    sget-boolean v14, Lorg/owasp/benchmark/score/BenchmarkScore;->showAveOnlyMode:Z

    if-eqz v14, :cond_14f

    const/4 v14, 0x1

    if-ne v4, v14, :cond_14f

    .line 221
    :cond_fc
    new-instance v2, Ljava/awt/geom/Point2D$Double;

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->afr:D

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v14, v14, v16

    sget-object v16, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    invoke-virtual/range {v16 .. v16}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v16

    const-wide v18, 0x3eb0c6f7a0b5ed8dL

    mul-double v16, v16, v18

    add-double v14, v14, v16

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/owasp/benchmark/score/report/ScatterHome;->atr:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4059000000000000L

    mul-double v16, v16, v18

    sget-object v18, Lorg/owasp/benchmark/score/report/ScatterHome;->sr:Ljava/security/SecureRandom;

    invoke-virtual/range {v18 .. v18}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v18

    const-wide v20, 0x3eb0c6f7a0b5ed8dL

    mul-double v18, v18, v20

    add-double v16, v16, v18

    const-wide/high16 v18, 0x3ff0000000000000L

    sub-double v16, v16, v18

    move-wide/from16 v0, v16

    invoke-direct {v2, v14, v15, v0, v1}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 222
    .local v2, "ap":Ljava/awt/geom/Point2D;
    sput-char v3, Lorg/owasp/benchmark/score/report/ScatterHome;->averageLabel:C

    .line 223
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

    .line 226
    .end local v2    # "ap":Ljava/awt/geom/Point2D;
    :cond_14f
    invoke-static {v6}, Lorg/owasp/benchmark/score/report/ScatterHome;->dedupify(Ljava/util/HashMap;)V

    .line 227
    return-object v6
.end method

.method private static sort(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 172
    const-string v3, ","

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 173
    .local v1, "parts":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 174
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    array-length v3, v1

    if-ge v0, v3, :cond_24

    .line 176
    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_21

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 179
    :cond_24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
