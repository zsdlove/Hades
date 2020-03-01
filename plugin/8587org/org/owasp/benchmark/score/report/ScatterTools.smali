.class public Lorg/owasp/benchmark/score/report/ScatterTools;
.super Lorg/owasp/benchmark/score/report/ScatterPlot;
.source "ScatterTools.java"


# instance fields
.field public afpr:D

.field public atpr:D

.field public averageLabel:C

.field sr:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILorg/owasp/benchmark/score/parsers/OverallResults;)V
    .registers 6
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I
    .param p3, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/owasp/benchmark/score/report/ScatterPlot;-><init>()V

    .line 134
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    iput-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterTools;->sr:Ljava/security/SecureRandom;

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "          "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/owasp/benchmark/score/report/ScatterTools;->display(Ljava/lang/String;ILorg/owasp/benchmark/score/parsers/OverallResults;)Lorg/jfree/chart/JFreeChart;

    .line 50
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
    .line 167
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

    .line 168
    .local v0, "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-direct {p0, p1, v0}, Lorg/owasp/benchmark/score/report/ScatterTools;->getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 169
    .local v1, "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    :goto_18
    if-eqz v1, :cond_8

    .line 170
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .local v2, "label":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2e

    .line 172
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    :cond_2e
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f

    .line 174
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    :cond_3f
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4e

    .line 176
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_4e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    invoke-direct {p0, p1, v0}, Lorg/owasp/benchmark/score/report/ScatterTools;->getMatch(Ljava/util/HashMap;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 180
    goto :goto_18

    .line 182
    .end local v0    # "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "label":Ljava/lang/StringBuilder;
    :cond_5e
    return-void
.end method

.method private display(Ljava/lang/String;ILorg/owasp/benchmark/score/parsers/OverallResults;)Lorg/jfree/chart/JFreeChart;
    .registers 40
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I
    .param p3, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;

    .prologue
    .line 54
    new-instance v28, Ljavax/swing/JFrame;

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 55
    .local v28, "f":Ljavax/swing/JFrame;
    const/4 v2, 0x3

    move-object/from16 v0, v28

    invoke-virtual {v0, v2}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    .line 57
    new-instance v5, Lorg/jfree/data/xy/XYSeriesCollection;

    invoke-direct {v5}, Lorg/jfree/data/xy/XYSeriesCollection;-><init>()V

    .line 58
    .local v5, "dataset":Lorg/jfree/data/xy/XYSeriesCollection;
    new-instance v30, Lorg/jfree/data/xy/XYSeries;

    const-string v2, "Scores"

    move-object/from16 v0, v30

    invoke-direct {v0, v2}, Lorg/jfree/data/xy/XYSeries;-><init>(Ljava/lang/Comparable;)V

    .line 59
    .local v30, "series":Lorg/jfree/data/xy/XYSeries;
    const/16 v31, 0x0

    .line 60
    .local v31, "totalTools":I
    const-wide/16 v34, 0x0

    .line 61
    .local v34, "totalToolTPR":D
    const-wide/16 v32, 0x0

    .line 62
    .local v32, "totalToolFPR":D
    invoke-virtual/range {p3 .. p3}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lorg/owasp/benchmark/score/parsers/OverallResult;

    .line 63
    .local v29, "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    move-object/from16 v0, v29

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    move-object/from16 v0, v29

    iget-wide v10, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v10, v10, v16

    move-object/from16 v0, v30

    invoke-virtual {v0, v8, v9, v10, v11}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 64
    add-int/lit8 v31, v31, 0x1

    .line 65
    move-object/from16 v0, v29

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    add-double v34, v34, v8

    .line 66
    move-object/from16 v0, v29

    iget-wide v8, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    add-double v32, v32, v8

    .line 67
    goto :goto_2b

    .line 68
    .end local v29    # "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    :cond_5a
    move/from16 v0, v31

    int-to-double v2, v0

    div-double v2, v34, v2

    move-object/from16 v0, p0

    iput-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->atpr:D

    .line 69
    move/from16 v0, v31

    int-to-double v2, v0

    div-double v2, v32, v2

    move-object/from16 v0, p0

    iput-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->afpr:D

    .line 71
    invoke-virtual/range {p3 .. p3}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_8a

    .line 72
    move-object/from16 v0, p0

    iget-wide v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->afpr:D

    const-wide/high16 v8, 0x4059000000000000L

    mul-double/2addr v2, v8

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->atpr:D

    const-wide/high16 v10, 0x4059000000000000L

    mul-double/2addr v8, v10

    move-object/from16 v0, v30

    invoke-virtual {v0, v2, v3, v8, v9}, Lorg/jfree/data/xy/XYSeries;->add(DD)V

    .line 75
    :cond_8a
    move-object/from16 v0, v30

    invoke-virtual {v5, v0}, Lorg/jfree/data/xy/XYSeriesCollection;->addSeries(Lorg/jfree/data/xy/XYSeries;)V

    .line 77
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

    iput-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->chart:Lorg/jfree/chart/JFreeChart;

    .line 78
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterTools;->theme:Lorg/jfree/chart/StandardChartTheme;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v2, v3}, Lorg/jfree/chart/StandardChartTheme;->apply(Lorg/jfree/chart/JFreeChart;)V

    .line 80
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v2}, Lorg/jfree/chart/JFreeChart;->getXYPlot()Lorg/jfree/chart/plot/XYPlot;

    move-result-object v13

    .line 82
    .local v13, "xyplot":Lorg/jfree/chart/plot/XYPlot;
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/owasp/benchmark/score/report/ScatterTools;->initializePlot(Lorg/jfree/chart/plot/XYPlot;)V

    .line 84
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v13}, Lorg/owasp/benchmark/score/report/ScatterTools;->makeDataLabels(Lorg/owasp/benchmark/score/parsers/OverallResults;Lorg/jfree/chart/plot/XYPlot;)V

    .line 85
    const-wide v8, 0x4059c00000000000L

    const-wide v10, 0x4057400000000000L

    move-object/from16 v6, p0

    move-object/from16 v7, p3

    move-object v12, v5

    invoke-direct/range {v6 .. v13}, Lorg/owasp/benchmark/score/report/ScatterTools;->makeLegend(Lorg/owasp/benchmark/score/parsers/OverallResults;DDLorg/jfree/data/xy/XYSeriesCollection;Lorg/jfree/chart/plot/XYPlot;)V

    .line 87
    new-instance v6, Lorg/jfree/chart/annotations/XYTextAnnotation;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Tool run time: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p3 .. p3}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getTime()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-wide/high16 v8, 0x4028000000000000L

    const-wide v10, -0x3fe999999999999aL

    invoke-direct/range {v6 .. v11}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 88
    .local v6, "time":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v6, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 89
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterTools;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v2}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v2

    invoke-virtual {v6, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 90
    sget-object v2, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v6, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 91
    invoke-virtual {v13, v6}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 93
    new-instance v14, Lorg/jfree/chart/ChartPanel;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->chart:Lorg/jfree/chart/JFreeChart;

    const/16 v18, 0x190

    const/16 v19, 0x190

    const/16 v20, 0x4b0

    const/16 v21, 0x4b0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move/from16 v16, p2

    move/from16 v17, p2

    invoke-direct/range {v14 .. v27}, Lorg/jfree/chart/ChartPanel;-><init>(Lorg/jfree/chart/JFreeChart;IIIIIIZZZZZZ)V

    .line 94
    .local v14, "cp":Lorg/jfree/chart/ChartPanel;
    move-object/from16 v0, v28

    invoke-virtual {v0, v14}, Ljavax/swing/JFrame;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 95
    invoke-virtual/range {v28 .. v28}, Ljavax/swing/JFrame;->pack()V

    .line 96
    const/4 v2, 0x0

    move-object/from16 v0, v28

    invoke-virtual {v0, v2}, Ljavax/swing/JFrame;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 98
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->chart:Lorg/jfree/chart/JFreeChart;

    return-object v2
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
    .line 185
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

    .line 186
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

    .line 187
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

    .line 188
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

    .line 189
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

    .line 193
    .end local v0    # "close":Z
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "xd":Ljava/lang/Double;
    .end local v3    # "yd":Ljava/lang/Double;
    :goto_73
    return-object v1

    .line 188
    .restart local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .restart local v2    # "xd":Ljava/lang/Double;
    .restart local v3    # "yd":Ljava/lang/Double;
    :cond_74
    const/4 v0, 0x0

    goto :goto_63

    .line 193
    .end local v1    # "e2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v2    # "xd":Ljava/lang/Double;
    .end local v3    # "yd":Ljava/lang/Double;
    :cond_76
    const/4 v1, 0x0

    goto :goto_73
.end method

.method public static main([Ljava/lang/String;)V
    .registers 11
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    new-instance v0, Lorg/owasp/benchmark/score/parsers/OverallResults;

    invoke-direct {v0}, Lorg/owasp/benchmark/score/parsers/OverallResults;-><init>()V

    .line 235
    .local v0, "or":Lorg/owasp/benchmark/score/parsers/OverallResults;
    const-string v1, "XSS1"

    const-wide v2, 0x3fe3d70a3d70a3d7L

    const-wide v4, 0x3fc999999999999aL

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 236
    const-string v1, "XSS2"

    const-wide v2, 0x3fe47ae147ae147bL

    const-wide v4, 0x3fc999999999999aL

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 238
    const-string v1, "XSS25"

    const-wide/high16 v2, 0x3fe0000000000000L

    const-wide v4, 0x3fd3333333333333L

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 239
    const-string v1, "XSS26"

    const-wide/high16 v2, 0x3fe0000000000000L

    const-wide v4, 0x3fd3333333333333L

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 241
    const-string v1, "XSS31"

    const-wide v2, 0x3fd5c28f5c28f5c3L

    const-wide v4, 0x3fc999999999999aL

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 242
    const-string v1, "XSS32"

    const-wide v2, 0x3fd70a3d70a3d70aL

    const-wide v4, 0x3fc999999999999aL

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 243
    const-string v1, "XSS33"

    const-wide v2, 0x3fd851eb851eb852L

    const-wide v4, 0x3fc999999999999aL

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 245
    const-string v1, "XSS4"

    const-wide v2, 0x3fe70a3d70a3d70aL

    const-wide v4, 0x3fcc28f5c28f5c29L

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 246
    const-string v1, "XSS5"

    const-wide v2, 0x3fe70a3d70a3d70aL

    const-wide v4, 0x3fc70a3d70a3d70aL

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 247
    const-string v1, "XSS6"

    const-wide v2, 0x3fd1eb851eb851ecL

    const-wide v4, 0x3fc851eb851eb852L

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 248
    const-string v1, "XSS7"

    const-wide v2, 0x3fd1eb851eb851ecL

    const-wide v4, 0x3fcae147ae147ae1L

    const/16 v6, 0xc

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 249
    const-string v1, "SQL Injection"

    const-wide/high16 v2, 0x3ff0000000000000L

    const-wide/high16 v4, 0x3fe0000000000000L

    const/16 v6, 0x3e8

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 250
    const-string v1, "Header Injection"

    const-wide/16 v2, 0x0

    const-wide/high16 v4, 0x3fe0000000000000L

    const/4 v6, 0x4

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 251
    const-string v1, "Reflection Injection"

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    const/16 v6, 0x12c

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 252
    const-string v1, "LDAP Injection"

    const-wide/high16 v2, 0x3fe0000000000000L

    const-wide/high16 v4, 0x3ff0000000000000L

    const/4 v6, 0x6

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 253
    const-string v1, "Weak Encryption"

    const-wide v2, 0x3fc999999999999aL

    const-wide v4, 0x3feccccccccccccdL

    const/16 v6, 0x258

    const-wide/high16 v7, 0x4014000000000000L

    invoke-virtual/range {v0 .. v8}, Lorg/owasp/benchmark/score/parsers/OverallResults;->add(Ljava/lang/String;DDID)V

    .line 254
    new-instance v9, Lorg/owasp/benchmark/score/report/ScatterTools;

    const-string v1, "OWASP Benchmark Results for SomeTool"

    const/16 v2, 0x320

    invoke-direct {v9, v1, v2, v0}, Lorg/owasp/benchmark/score/report/ScatterTools;-><init>(Ljava/lang/String;ILorg/owasp/benchmark/score/parsers/OverallResults;)V

    .line 255
    .local v9, "scatter":Lorg/owasp/benchmark/score/report/ScatterTools;
    new-instance v1, Ljava/io/File;

    const-string v2, "test.png"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x320

    invoke-virtual {v9, v1, v2}, Lorg/owasp/benchmark/score/report/ScatterTools;->writeChartToFile(Ljava/io/File;I)V

    .line 256
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 257
    return-void
.end method

.method private makeDataLabels(Lorg/owasp/benchmark/score/parsers/OverallResults;Lorg/jfree/chart/plot/XYPlot;)V
    .registers 13
    .param p1, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;
    .param p2, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lorg/owasp/benchmark/score/report/ScatterTools;->makePointList(Lorg/owasp/benchmark/score/parsers/OverallResults;)Ljava/util/HashMap;

    move-result-object v7

    .line 103
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

    .line 104
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_c

    .line 105
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/awt/geom/Point2D;

    .line 106
    .local v8, "p":Ljava/awt/geom/Point2D;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/report/ScatterTools;->sort(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "label":Ljava/lang/String;
    new-instance v0, Lorg/jfree/chart/annotations/XYTextAnnotation;

    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v2

    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 108
    .local v0, "annotation":Lorg/jfree/chart/annotations/XYTextAnnotation;
    invoke-virtual {v8}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v2

    const-wide/high16 v4, 0x4008000000000000L

    cmpg-double v2, v2, v4

    if-gez v2, :cond_6c

    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    :goto_47
    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 109
    sget-object v2, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 111
    iget-char v2, p0, Lorg/owasp/benchmark/score/report/ScatterTools;->averageLabel:C

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    const/4 v4, 0x0

    aget-char v3, v3, v4

    if-ne v2, v3, :cond_6f

    .line 112
    sget-object v2, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 116
    :goto_5f
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterTools;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v2}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 117
    invoke-virtual {p2, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    goto :goto_c

    .line 108
    :cond_6c
    sget-object v2, Lorg/jfree/ui/TextAnchor;->TOP_CENTER:Lorg/jfree/ui/TextAnchor;

    goto :goto_47

    .line 114
    :cond_6f
    sget-object v2, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v0, v2}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    goto :goto_5f

    .line 120
    .end local v0    # "annotation":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v1    # "label":Ljava/lang/String;
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    .end local v8    # "p":Ljava/awt/geom/Point2D;
    :cond_75
    return-void
.end method

.method private makeLegend(Lorg/owasp/benchmark/score/parsers/OverallResults;DDLorg/jfree/data/xy/XYSeriesCollection;Lorg/jfree/chart/plot/XYPlot;)V
    .registers 32
    .param p1, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;
    .param p2, "x"    # D
    .param p4, "y"    # D
    .param p6, "dataset"    # Lorg/jfree/data/xy/XYSeriesCollection;
    .param p7, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;

    .prologue
    .line 197
    const/16 v11, 0x41

    .line 198
    .local v11, "ch":C
    const/4 v14, 0x0

    .line 199
    .local v14, "i":I
    const/16 v17, 0x0

    .line 200
    .local v17, "toolCount":I
    const-wide/16 v20, 0x0

    .line 201
    .local v20, "totalScore":D
    invoke-virtual/range {p1 .. p1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/owasp/benchmark/score/parsers/OverallResult;

    .line 202
    .local v16, "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    add-int/lit8 v17, v17, 0x1

    .line 204
    const/16 v4, 0x49

    if-eq v11, v4, :cond_25

    const/16 v4, 0x69

    if-ne v11, v4, :cond_b0

    :cond_25
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 205
    .local v15, "label":Ljava/lang/String;
    :goto_38
    const-wide/high16 v4, 0x4059000000000000L

    move-object/from16 v0, v16

    iget-wide v6, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    move-object/from16 v0, v16

    iget-wide v0, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    move-wide/from16 v22, v0

    sub-double v6, v6, v22

    mul-double v18, v4, v6

    .line 206
    .local v18, "score":D
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u25a0 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    iget-object v5, v0, Lorg/owasp/benchmark/score/parsers/OverallResult;->category:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 207
    .local v3, "msg":Ljava/lang/String;
    add-double v20, v20, v18

    .line 208
    new-instance v2, Lorg/jfree/chart/annotations/XYTextAnnotation;

    int-to-double v4, v14

    const-wide v6, -0x3ff599999999999aL

    mul-double/2addr v4, v6

    add-double v6, p4, v4

    move-wide/from16 v4, p2

    invoke-direct/range {v2 .. v7}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 209
    .local v2, "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v4, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 210
    sget-object v4, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 211
    sget-object v4, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 212
    sget-object v4, Lorg/owasp/benchmark/score/report/ScatterTools;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v4}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 213
    move-object/from16 v0, p7

    invoke-virtual {v0, v2}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 214
    add-int/lit8 v14, v14, 0x1

    .line 216
    const/16 v4, 0x5a

    if-ne v11, v4, :cond_cb

    const/16 v11, 0x61

    goto/16 :goto_f

    .line 204
    .end local v2    # "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v3    # "msg":Ljava/lang/String;
    .end local v15    # "label":Ljava/lang/String;
    .end local v18    # "score":D
    :cond_b0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_38

    .line 216
    .restart local v2    # "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .restart local v3    # "msg":Ljava/lang/String;
    .restart local v15    # "label":Ljava/lang/String;
    .restart local v18    # "score":D
    :cond_cb
    add-int/lit8 v4, v11, 0x1

    int-to-char v11, v4

    goto/16 :goto_f

    .line 219
    .end local v2    # "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v3    # "msg":Ljava/lang/String;
    .end local v15    # "label":Ljava/lang/String;
    .end local v16    # "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v18    # "score":D
    :cond_d0
    const/4 v4, 0x1

    move/from16 v0, v17

    if-le v0, v4, :cond_14b

    .line 220
    move/from16 v0, v17

    int-to-double v4, v0

    div-double v12, v20, v4

    .line 221
    .local v12, "averageScore":D
    new-instance v2, Lorg/jfree/chart/annotations/XYTextAnnotation;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u25a0 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Average Score for this Tool ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v12, v13}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    int-to-double v6, v14

    const-wide v8, -0x3ff599999999999aL

    mul-double/2addr v6, v8

    add-double v8, p4, v6

    move-object v4, v2

    move-wide/from16 v6, p2

    invoke-direct/range {v4 .. v9}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 222
    .restart local v2    # "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v4, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 223
    sget-object v4, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 224
    sget-object v4, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 225
    sget-object v4, Lorg/owasp/benchmark/score/report/ScatterTools;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v4}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 226
    move-object/from16 v0, p7

    invoke-virtual {v0, v2}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 228
    new-instance v10, Ljava/awt/geom/Point2D$Double;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->afpr:D

    const-wide/high16 v6, 0x4059000000000000L

    mul-double/2addr v4, v6

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->atpr:D

    const-wide/high16 v8, 0x4059000000000000L

    mul-double/2addr v6, v8

    invoke-direct {v10, v4, v5, v6, v7}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 229
    .local v10, "averagePoint":Ljava/awt/geom/Point2D;
    const-wide/high16 v4, 0x4008000000000000L

    sget-object v6, Ljava/awt/Color;->magenta:Ljava/awt/Color;

    move-object/from16 v0, p7

    invoke-static {v0, v10, v4, v5, v6}, Lorg/owasp/benchmark/score/report/ScatterTools;->makePoint(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DLjava/awt/Color;)V

    .line 231
    .end local v2    # "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    .end local v10    # "averagePoint":Ljava/awt/geom/Point2D;
    .end local v12    # "averageScore":D
    :cond_14b
    return-void
.end method

.method private makePointList(Lorg/owasp/benchmark/score/parsers/OverallResults;)Ljava/util/HashMap;
    .registers 22
    .param p1, "or"    # Lorg/owasp/benchmark/score/parsers/OverallResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/owasp/benchmark/score/parsers/OverallResults;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/awt/geom/Point2D;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 137
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 138
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/awt/geom/Point2D;Ljava/lang/String;>;"
    const/16 v2, 0x41

    .line 139
    .local v2, "ch":C
    const/4 v7, 0x0

    .line 142
    .local v7, "size":I
    invoke-virtual/range {p1 .. p1}, Lorg/owasp/benchmark/score/parsers/OverallResults;->getResults()Ljava/util/Collection;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_10
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_76

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/owasp/benchmark/score/parsers/OverallResult;

    .line 143
    .local v6, "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    add-int/lit8 v7, v7, 0x1

    .line 144
    iget-wide v14, v6, Lorg/owasp/benchmark/score/parsers/OverallResult;->falsePositiveRate:D

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v14, v14, v16

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v13}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v16

    const-wide v18, 0x3eb0c6f7a0b5ed8dL

    mul-double v16, v16, v18

    add-double v8, v14, v16

    .line 146
    .local v8, "x":D
    iget-wide v14, v6, Lorg/owasp/benchmark/score/parsers/OverallResult;->truePositiveRate:D

    const-wide/high16 v16, 0x4059000000000000L

    mul-double v14, v14, v16

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v13}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v16

    const-wide v18, 0x3eb0c6f7a0b5ed8dL

    mul-double v16, v16, v18

    add-double v14, v14, v16

    const-wide/high16 v16, 0x3ff0000000000000L

    sub-double v10, v14, v16

    .line 147
    .local v10, "y":D
    new-instance v5, Ljava/awt/geom/Point2D$Double;

    invoke-direct {v5, v8, v9, v10, v11}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 148
    .local v5, "p":Ljava/awt/geom/Point2D;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, ""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, "label":Ljava/lang/String;
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    const/16 v13, 0x5a

    if-ne v2, v13, :cond_72

    const/16 v2, 0x61

    goto :goto_10

    :cond_72
    add-int/lit8 v13, v2, 0x1

    int-to-char v2, v13

    goto :goto_10

    .line 154
    .end local v3    # "label":Ljava/lang/String;
    .end local v5    # "p":Ljava/awt/geom/Point2D;
    .end local v6    # "r":Lorg/owasp/benchmark/score/parsers/OverallResult;
    .end local v8    # "x":D
    .end local v10    # "y":D
    :cond_76
    const/4 v12, 0x1

    if-le v7, v12, :cond_cb

    .line 155
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->afpr:D

    const-wide/high16 v14, 0x4059000000000000L

    mul-double/2addr v12, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v14}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v14

    const-wide v16, 0x3eb0c6f7a0b5ed8dL

    mul-double v14, v14, v16

    add-double v8, v12, v14

    .line 156
    .restart local v8    # "x":D
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->atpr:D

    const-wide/high16 v14, 0x4059000000000000L

    mul-double/2addr v12, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->sr:Ljava/security/SecureRandom;

    invoke-virtual {v14}, Ljava/security/SecureRandom;->nextDouble()D

    move-result-wide v14

    const-wide v16, 0x3eb0c6f7a0b5ed8dL

    mul-double v14, v14, v16

    add-double/2addr v12, v14

    const-wide/high16 v14, 0x3ff0000000000000L

    sub-double v10, v12, v14

    .line 157
    .restart local v10    # "y":D
    new-instance v5, Ljava/awt/geom/Point2D$Double;

    invoke-direct {v5, v8, v9, v10, v11}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 158
    .restart local v5    # "p":Ljava/awt/geom/Point2D;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 159
    .restart local v3    # "label":Ljava/lang/String;
    move-object/from16 v0, p0

    iput-char v2, v0, Lorg/owasp/benchmark/score/report/ScatterTools;->averageLabel:C

    .line 160
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .end local v3    # "label":Ljava/lang/String;
    .end local v5    # "p":Ljava/awt/geom/Point2D;
    .end local v8    # "x":D
    .end local v10    # "y":D
    :cond_cb
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/owasp/benchmark/score/report/ScatterTools;->dedupify(Ljava/util/HashMap;)V

    .line 163
    return-object v4
.end method

.method private sort(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 123
    const-string v3, ","

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "parts":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 125
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    array-length v3, v1

    if-ge v0, v3, :cond_24

    .line 127
    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_21

    .line 129
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 131
    :cond_24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
