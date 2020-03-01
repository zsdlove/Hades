.class public Lorg/owasp/benchmark/score/report/ScatterInterpretation;
.super Lorg/owasp/benchmark/score/report/ScatterPlot;
.source "ScatterInterpretation.java"


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/owasp/benchmark/score/report/ScatterPlot;-><init>()V

    .line 37
    const-string v0, "          OWASP Benchmark Results Interpretation Guide"

    invoke-direct {p0, v0, p1}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->display(Ljava/lang/String;I)Lorg/jfree/chart/JFreeChart;

    .line 38
    return-void
.end method

.method private display(Ljava/lang/String;I)Lorg/jfree/chart/JFreeChart;
    .registers 26
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "height"    # I

    .prologue
    .line 41
    new-instance v22, Ljavax/swing/JFrame;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 42
    .local v22, "f":Ljavax/swing/JFrame;
    const/4 v2, 0x3

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    .line 44
    new-instance v5, Lorg/jfree/data/xy/XYSeriesCollection;

    invoke-direct {v5}, Lorg/jfree/data/xy/XYSeriesCollection;-><init>()V

    .line 45
    .local v5, "dataset":Lorg/jfree/data/xy/XYSeriesCollection;
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

    iput-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->chart:Lorg/jfree/chart/JFreeChart;

    .line 46
    sget-object v2, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->theme:Lorg/jfree/chart/StandardChartTheme;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v2, v3}, Lorg/jfree/chart/StandardChartTheme;->apply(Lorg/jfree/chart/JFreeChart;)V

    .line 48
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v2}, Lorg/jfree/chart/JFreeChart;->getXYPlot()Lorg/jfree/chart/plot/XYPlot;

    move-result-object v7

    .line 49
    .local v7, "xyplot":Lorg/jfree/chart/plot/XYPlot;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->initializePlot(Lorg/jfree/chart/plot/XYPlot;)V

    .line 51
    const-wide/high16 v8, 0x401c000000000000L

    const-wide v10, 0x4057400000000000L

    const-string v12, " Ideal vulnerability detection"

    sget-object v13, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    const/16 v14, 0x2d

    invoke-static/range {v7 .. v14}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makePointer(Lorg/jfree/chart/plot/XYPlot;DDLjava/lang/String;Lorg/jfree/ui/TextAnchor;I)V

    .line 52
    const-wide/high16 v8, 0x4024000000000000L

    const-wide/high16 v10, 0x4024000000000000L

    const-string v12, " Tool reports nothing is vulnerable"

    sget-object v13, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    const/16 v14, 0x2d

    invoke-static/range {v7 .. v14}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makePointer(Lorg/jfree/chart/plot/XYPlot;DDLjava/lang/String;Lorg/jfree/ui/TextAnchor;I)V

    .line 54
    const-wide v8, 0x4056800000000000L

    const-wide v10, 0x4056800000000000L

    const-string v12, "Tool reports everything is vulnerable "

    sget-object v13, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    const/16 v14, 0x2d

    invoke-static/range {v7 .. v14}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makePointer(Lorg/jfree/chart/plot/XYPlot;DDLjava/lang/String;Lorg/jfree/ui/TextAnchor;I)V

    .line 56
    const-wide/high16 v8, 0x4049000000000000L

    const-wide/high16 v10, 0x4049000000000000L

    const-string v12, "Tool reports vulnerabilities randomly "

    sget-object v13, Lorg/jfree/ui/TextAnchor;->TOP_LEFT:Lorg/jfree/ui/TextAnchor;

    const/16 v14, 0x2d

    invoke-static/range {v7 .. v14}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makePointer(Lorg/jfree/chart/plot/XYPlot;DDLjava/lang/String;Lorg/jfree/ui/TextAnchor;I)V

    .line 58
    const-wide/16 v8, 0x0

    const-wide/high16 v10, 0x4008000000000000L

    const-wide/high16 v12, 0x4034000000000000L

    const/16 v14, 0xa

    const/16 v15, 0x2d

    invoke-static/range {v7 .. v15}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makeOval(Lorg/jfree/chart/plot/XYPlot;DDDII)V

    .line 59
    const-wide/high16 v8, 0x4045000000000000L

    const-wide/high16 v10, 0x4008000000000000L

    const-wide/high16 v12, 0x4034000000000000L

    const/16 v14, 0xa

    const/16 v15, 0x2d

    invoke-static/range {v7 .. v15}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makeOval(Lorg/jfree/chart/plot/XYPlot;DDDII)V

    .line 60
    const-wide/high16 v8, 0x4055000000000000L

    const-wide/high16 v10, 0x4008000000000000L

    const-wide/high16 v12, 0x4034000000000000L

    const/16 v14, 0xa

    const/16 v15, 0x2d

    invoke-static/range {v7 .. v15}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makeOval(Lorg/jfree/chart/plot/XYPlot;DDDII)V

    .line 61
    const-wide v8, 0x4045800000000000L

    const-wide/high16 v10, 0x4050000000000000L

    const-wide/high16 v12, 0x4034000000000000L

    const/16 v14, 0xa

    const/16 v15, 0x2d

    invoke-static/range {v7 .. v15}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->makeOval(Lorg/jfree/chart/plot/XYPlot;DDDII)V

    .line 63
    new-instance v8, Lorg/jfree/chart/ChartPanel;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->chart:Lorg/jfree/chart/JFreeChart;

    const/16 v12, 0x190

    const/16 v13, 0x190

    const/16 v14, 0x4b0

    const/16 v15, 0x4b0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move/from16 v10, p2

    move/from16 v11, p2

    invoke-direct/range {v8 .. v21}, Lorg/jfree/chart/ChartPanel;-><init>(Lorg/jfree/chart/JFreeChart;IIIIIIZZZZZZ)V

    .line 64
    .local v8, "cp":Lorg/jfree/chart/ChartPanel;
    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljavax/swing/JFrame;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 65
    invoke-virtual/range {v22 .. v22}, Ljavax/swing/JFrame;->pack()V

    .line 66
    const/4 v2, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljavax/swing/JFrame;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 68
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->chart:Lorg/jfree/chart/JFreeChart;

    return-object v2
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x320

    .line 72
    new-instance v0, Lorg/owasp/benchmark/score/report/ScatterInterpretation;

    invoke-direct {v0, v3}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;-><init>(I)V

    .line 73
    .local v0, "scatter":Lorg/owasp/benchmark/score/report/ScatterInterpretation;
    new-instance v1, Ljava/io/File;

    const-string v2, "benchmark_guide.png"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v3}, Lorg/owasp/benchmark/score/report/ScatterInterpretation;->writeChartToFile(Ljava/io/File;I)V

    .line 74
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 75
    return-void
.end method
