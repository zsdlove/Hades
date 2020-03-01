.class public Lorg/owasp/benchmark/score/report/ScatterPlot;
.super Ljava/lang/Object;
.source "ScatterPlot.java"


# static fields
.field static final dashed:Ljava/awt/Stroke;

.field static final pctFormat:Ljava/text/DecimalFormat;

.field static final theme:Lorg/jfree/chart/StandardChartTheme;


# instance fields
.field chart:Lorg/jfree/chart/JFreeChart;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v3, 0x2

    const/4 v4, 0x0

    .line 39
    invoke-static {}, Lorg/owasp/benchmark/score/report/ScatterPlot;->initializeTheme()Lorg/jfree/chart/StandardChartTheme;

    move-result-object v0

    sput-object v0, Lorg/owasp/benchmark/score/report/ScatterPlot;->theme:Lorg/jfree/chart/StandardChartTheme;

    .line 40
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0\'%\'"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/owasp/benchmark/score/report/ScatterPlot;->pctFormat:Ljava/text/DecimalFormat;

    .line 41
    new-instance v0, Ljava/awt/BasicStroke;

    const/high16 v1, 0x3f800000

    const/4 v2, 0x0

    new-array v5, v3, [F

    fill-array-data v5, :array_22

    move v6, v4

    invoke-direct/range {v0 .. v6}, Ljava/awt/BasicStroke;-><init>(FIIF[FF)V

    sput-object v0, Lorg/owasp/benchmark/score/report/ScatterPlot;->dashed:Ljava/awt/Stroke;

    return-void

    :array_22
    .array-data 4
        0x40c00000
        0x40400000
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterPlot;->chart:Lorg/jfree/chart/JFreeChart;

    return-void
.end method

.method public static addGenerationDate(Lorg/jfree/chart/plot/XYPlot;)V
    .registers 10
    .param p0, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;

    .prologue
    .line 134
    const-string v7, "dd MMM yyyy h:mm a"

    .line 135
    .local v7, "pattern":Ljava/lang/String;
    new-instance v8, Ljava/text/SimpleDateFormat;

    const-string v1, "dd MMM yyyy h:mm a"

    invoke-direct {v8, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 136
    .local v8, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v8, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .line 137
    .local v6, "date":Ljava/lang/String;
    new-instance v0, Lorg/jfree/chart/annotations/XYTextAnnotation;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Scorecard Generated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-wide/high16 v2, 0x3fe0000000000000L

    const-wide/high16 v4, -0x3fe2000000000000L

    invoke-direct/range {v0 .. v5}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 138
    .local v0, "gendate":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v1, Lorg/jfree/ui/TextAnchor;->CENTER_LEFT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 139
    sget-object v1, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 140
    sget-object v1, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 141
    sget-object v1, Lorg/owasp/benchmark/score/report/ScatterPlot;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v1}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 142
    invoke-virtual {p0, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 143
    return-void
.end method

.method public static initializeTheme()Lorg/jfree/chart/StandardChartTheme;
    .registers 11

    .prologue
    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    .line 44
    const-string v0, "Arial"

    .line 45
    .local v0, "fontName":Ljava/lang/String;
    invoke-static {}, Lorg/jfree/chart/StandardChartTheme;->createJFreeTheme()Lorg/jfree/chart/ChartTheme;

    move-result-object v10

    check-cast v10, Lorg/jfree/chart/StandardChartTheme;

    .line 46
    .local v10, "theme":Lorg/jfree/chart/StandardChartTheme;
    new-instance v1, Ljava/awt/Font;

    const/16 v4, 0x18

    invoke-direct {v1, v0, v5, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setExtraLargeFont(Ljava/awt/Font;)V

    .line 47
    new-instance v1, Ljava/awt/Font;

    const/16 v4, 0x14

    invoke-direct {v1, v0, v5, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setLargeFont(Ljava/awt/Font;)V

    .line 48
    new-instance v1, Ljava/awt/Font;

    const/16 v4, 0x10

    invoke-direct {v1, v0, v5, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setRegularFont(Ljava/awt/Font;)V

    .line 49
    new-instance v1, Ljava/awt/Font;

    const/16 v4, 0xc

    invoke-direct {v1, v0, v5, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setSmallFont(Ljava/awt/Font;)V

    .line 50
    const-string v1, "#C0C0C0"

    invoke-static {v1}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v1

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setRangeGridlinePaint(Ljava/awt/Paint;)V

    .line 51
    sget-object v1, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setPlotBackgroundPaint(Ljava/awt/Paint;)V

    .line 52
    sget-object v1, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setChartBackgroundPaint(Ljava/awt/Paint;)V

    .line 53
    sget-object v1, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setGridBandPaint(Ljava/awt/Paint;)V

    .line 54
    new-instance v1, Lorg/jfree/ui/RectangleInsets;

    move-wide v4, v2

    move-wide v6, v2

    move-wide v8, v2

    invoke-direct/range {v1 .. v9}, Lorg/jfree/ui/RectangleInsets;-><init>(DDDD)V

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setAxisOffset(Lorg/jfree/ui/RectangleInsets;)V

    .line 55
    new-instance v1, Lorg/jfree/chart/renderer/category/StandardBarPainter;

    invoke-direct {v1}, Lorg/jfree/chart/renderer/category/StandardBarPainter;-><init>()V

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setBarPainter(Lorg/jfree/chart/renderer/category/BarPainter;)V

    .line 56
    const-string v1, "#666666"

    invoke-static {v1}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v1

    invoke-virtual {v10, v1}, Lorg/jfree/chart/StandardChartTheme;->setAxisLabelPaint(Ljava/awt/Paint;)V

    .line 57
    return-object v10
.end method

.method public static makeGuessingLine(Lorg/jfree/chart/plot/XYPlot;)V
    .registers 16
    .param p0, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;

    .prologue
    .line 170
    new-instance v1, Lorg/jfree/chart/annotations/XYLineAnnotation;

    const-wide/high16 v2, -0x3fec000000000000L

    const-wide/high16 v4, -0x3fec000000000000L

    const-wide/high16 v6, 0x4059000000000000L

    const-wide/high16 v8, 0x4059000000000000L

    sget-object v10, Lorg/owasp/benchmark/score/report/ScatterPlot;->dashed:Ljava/awt/Stroke;

    sget-object v11, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-direct/range {v1 .. v11}, Lorg/jfree/chart/annotations/XYLineAnnotation;-><init>(DDDDLjava/awt/Stroke;Ljava/awt/Paint;)V

    .line 171
    .local v1, "guessing":Lorg/jfree/chart/annotations/XYLineAnnotation;
    invoke-virtual {p0, v1}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 173
    const/16 v4, 0x50

    const/4 v5, 0x0

    const-string v6, "Worse than guessing"

    sget-object v7, Lorg/jfree/ui/TextAnchor;->TOP_CENTER:Lorg/jfree/ui/TextAnchor;

    const/16 v8, 0x5a

    invoke-static {v4, v5, v6, v7, v8}, Lorg/owasp/benchmark/score/report/ScatterPlot;->makePointer(IILjava/lang/String;Lorg/jfree/ui/TextAnchor;I)Lorg/jfree/chart/annotations/XYPointerAnnotation;

    move-result-object v14

    .line 174
    .local v14, "worse":Lorg/jfree/chart/annotations/XYPointerAnnotation;
    invoke-virtual {p0, v14}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 176
    const/16 v4, 0x19

    const/16 v5, 0x64

    const-string v6, "Better than guessing"

    sget-object v7, Lorg/jfree/ui/TextAnchor;->BOTTOM_CENTER:Lorg/jfree/ui/TextAnchor;

    const/16 v8, 0x10e

    invoke-static {v4, v5, v6, v7, v8}, Lorg/owasp/benchmark/score/report/ScatterPlot;->makePointer(IILjava/lang/String;Lorg/jfree/ui/TextAnchor;I)Lorg/jfree/chart/annotations/XYPointerAnnotation;

    move-result-object v0

    .line 177
    .local v0, "better":Lorg/jfree/chart/annotations/XYPointerAnnotation;
    invoke-virtual {p0, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 179
    new-instance v2, Lorg/jfree/chart/annotations/XYTextAnnotation;

    const-string v3, "                     Random Guess"

    const-wide/high16 v4, 0x4056000000000000L

    const-wide v6, 0x405ac00000000000L

    invoke-direct/range {v2 .. v7}, Lorg/jfree/chart/annotations/XYTextAnnotation;-><init>(Ljava/lang/String;DD)V

    .line 180
    .local v2, "stroketext":Lorg/jfree/chart/annotations/XYTextAnnotation;
    sget-object v4, Lorg/jfree/ui/TextAnchor;->CENTER_RIGHT:Lorg/jfree/ui/TextAnchor;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 181
    sget-object v4, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 182
    sget-object v4, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 183
    sget-object v4, Lorg/owasp/benchmark/score/report/ScatterPlot;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v4}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jfree/chart/annotations/XYTextAnnotation;->setFont(Ljava/awt/Font;)V

    .line 184
    invoke-virtual {p0, v2}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 186
    new-instance v3, Lorg/jfree/chart/annotations/XYLineAnnotation;

    const-wide/high16 v4, 0x404d000000000000L

    const-wide v6, 0x405ac00000000000L

    const-wide/high16 v8, 0x4051000000000000L

    const-wide v10, 0x405ac00000000000L

    sget-object v12, Lorg/owasp/benchmark/score/report/ScatterPlot;->dashed:Ljava/awt/Stroke;

    sget-object v13, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-direct/range {v3 .. v13}, Lorg/jfree/chart/annotations/XYLineAnnotation;-><init>(DDDDLjava/awt/Stroke;Ljava/awt/Paint;)V

    .line 187
    .local v3, "strokekey":Lorg/jfree/chart/annotations/XYLineAnnotation;
    sget-object v4, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {p0, v4}, Lorg/jfree/chart/plot/XYPlot;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 188
    invoke-virtual {p0, v3}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 189
    return-void
.end method

.method public static makeOval(Lorg/jfree/chart/plot/XYPlot;DDDII)V
    .registers 22
    .param p0, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "w"    # D
    .param p7, "h"    # I
    .param p8, "angle"    # I

    .prologue
    .line 193
    const-wide/high16 v4, 0x4000000000000000L

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    mul-double/2addr p1, v4

    .line 194
    new-instance v3, Ljava/awt/geom/Ellipse2D$Double;

    move/from16 v0, p7

    int-to-double v10, v0

    move-wide v4, p1

    move-wide/from16 v6, p3

    move-wide/from16 v8, p5

    invoke-direct/range {v3 .. v11}, Ljava/awt/geom/Ellipse2D$Double;-><init>(DDDD)V

    .line 195
    .local v3, "oval":Ljava/awt/Shape;
    move/from16 v0, p8

    invoke-static {v3, v0}, Lorg/owasp/benchmark/score/report/ScatterPlot;->rotate(Ljava/awt/Shape;I)Ljava/awt/Shape;

    move-result-object v12

    .line 196
    .local v12, "diag":Ljava/awt/Shape;
    new-instance v2, Lorg/jfree/chart/annotations/XYShapeAnnotation;

    new-instance v4, Ljava/awt/BasicStroke;

    invoke-direct {v4}, Ljava/awt/BasicStroke;-><init>()V

    sget-object v5, Ljava/awt/Color;->gray:Ljava/awt/Color;

    invoke-direct {v2, v12, v4, v5}, Lorg/jfree/chart/annotations/XYShapeAnnotation;-><init>(Ljava/awt/Shape;Ljava/awt/Stroke;Ljava/awt/Paint;)V

    .line 197
    .local v2, "area":Lorg/jfree/chart/annotations/XYShapeAnnotation;
    invoke-virtual {p0, v2}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 198
    return-void
.end method

.method public static makePoint(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DLjava/awt/Color;)V
    .registers 15
    .param p0, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .param p1, "location"    # Ljava/awt/geom/Point2D;
    .param p2, "radius"    # D
    .param p4, "color"    # Ljava/awt/Color;

    .prologue
    .line 146
    invoke-virtual {p1}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v6

    const-wide/high16 v8, 0x4000000000000000L

    div-double v8, p2, v8

    sub-double v2, v6, v8

    .line 147
    .local v2, "x":D
    invoke-virtual {p1}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v6

    const-wide/high16 v8, 0x4000000000000000L

    div-double v8, p2, v8

    sub-double v4, v6, v8

    .line 148
    .local v4, "y":D
    new-instance v1, Ljava/awt/geom/Ellipse2D$Double;

    move-wide v6, p2

    move-wide v8, p2

    invoke-direct/range {v1 .. v9}, Ljava/awt/geom/Ellipse2D$Double;-><init>(DDDD)V

    .line 149
    .local v1, "dot":Ljava/awt/Shape;
    new-instance v0, Lorg/jfree/chart/annotations/XYShapeAnnotation;

    new-instance v6, Ljava/awt/BasicStroke;

    invoke-direct {v6}, Ljava/awt/BasicStroke;-><init>()V

    invoke-direct {v0, v1, v6, p4, p4}, Lorg/jfree/chart/annotations/XYShapeAnnotation;-><init>(Ljava/awt/Shape;Ljava/awt/Stroke;Ljava/awt/Paint;Ljava/awt/Paint;)V

    .line 150
    .local v0, "area":Lorg/jfree/chart/annotations/XYShapeAnnotation;
    invoke-virtual {p0, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 151
    return-void
.end method

.method public static makePointer(IILjava/lang/String;Lorg/jfree/ui/TextAnchor;I)Lorg/jfree/chart/annotations/XYPointerAnnotation;
    .registers 13
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "anchor"    # Lorg/jfree/ui/TextAnchor;
    .param p4, "angle"    # I

    .prologue
    .line 114
    new-instance v0, Lorg/jfree/chart/annotations/XYPointerAnnotation;

    int-to-double v2, p0

    int-to-double v4, p1

    int-to-double v6, p4

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v6

    move-object v1, p2

    invoke-direct/range {v0 .. v7}, Lorg/jfree/chart/annotations/XYPointerAnnotation;-><init>(Ljava/lang/String;DDD)V

    .line 115
    .local v0, "pointer":Lorg/jfree/chart/annotations/XYPointerAnnotation;
    sget-object v1, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 116
    invoke-virtual {v0, p3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 117
    const-wide/high16 v2, 0x4010000000000000L

    invoke-virtual {v0, v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setArrowWidth(D)V

    .line 118
    const-wide/high16 v2, 0x4020000000000000L

    invoke-virtual {v0, v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setArrowLength(D)V

    .line 119
    sget-object v1, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setArrowPaint(Ljava/awt/Paint;)V

    .line 120
    const-wide/high16 v2, 0x4000000000000000L

    invoke-virtual {v0, v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setLabelOffset(D)V

    .line 121
    sget-object v1, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 122
    sget-object v1, Lorg/owasp/benchmark/score/report/ScatterPlot;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v1}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setFont(Ljava/awt/Font;)V

    .line 123
    return-object v0
.end method

.method public static makePointer(Lorg/jfree/chart/plot/XYPlot;DDLjava/lang/String;Lorg/jfree/ui/TextAnchor;I)V
    .registers 19
    .param p0, "plot"    # Lorg/jfree/chart/plot/XYPlot;
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "msg"    # Ljava/lang/String;
    .param p6, "anchor"    # Lorg/jfree/ui/TextAnchor;
    .param p7, "angle"    # I

    .prologue
    .line 216
    new-instance v2, Lorg/jfree/chart/annotations/XYPointerAnnotation;

    move/from16 v0, p7

    int-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v8

    move-object/from16 v3, p5

    move-wide v4, p1

    move-wide v6, p3

    invoke-direct/range {v2 .. v9}, Lorg/jfree/chart/annotations/XYPointerAnnotation;-><init>(Ljava/lang/String;DDD)V

    .line 217
    .local v2, "pointer":Lorg/jfree/chart/annotations/XYPointerAnnotation;
    sget-object v3, Ljava/awt/Color;->white:Ljava/awt/Color;

    invoke-virtual {v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setBackgroundPaint(Ljava/awt/Paint;)V

    .line 218
    move-object/from16 v0, p6

    invoke-virtual {v2, v0}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setTextAnchor(Lorg/jfree/ui/TextAnchor;)V

    .line 219
    const-wide/high16 v4, 0x4010000000000000L

    invoke-virtual {v2, v4, v5}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setArrowWidth(D)V

    .line 220
    const-wide/high16 v4, 0x4020000000000000L

    invoke-virtual {v2, v4, v5}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setArrowLength(D)V

    .line 221
    sget-object v3, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setArrowPaint(Ljava/awt/Paint;)V

    .line 222
    const-wide/high16 v4, 0x4000000000000000L

    invoke-virtual {v2, v4, v5}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setLabelOffset(D)V

    .line 223
    sget-object v3, Ljava/awt/Color;->red:Ljava/awt/Color;

    invoke-virtual {v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setPaint(Ljava/awt/Paint;)V

    .line 224
    sget-object v3, Lorg/owasp/benchmark/score/report/ScatterPlot;->theme:Lorg/jfree/chart/StandardChartTheme;

    invoke-virtual {v3}, Lorg/jfree/chart/StandardChartTheme;->getRegularFont()Ljava/awt/Font;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jfree/chart/annotations/XYPointerAnnotation;->setFont(Ljava/awt/Font;)V

    .line 225
    invoke-virtual {p0, v2}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 226
    return-void
.end method

.method public static makeRect(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DDLjava/awt/Color;)V
    .registers 19
    .param p0, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .param p1, "location"    # Ljava/awt/geom/Point2D;
    .param p2, "height"    # D
    .param p4, "width"    # D
    .param p6, "color"    # Ljava/awt/Color;

    .prologue
    .line 154
    new-instance v3, Ljava/awt/geom/Rectangle2D$Double;

    invoke-virtual {p1}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v4

    invoke-virtual {p1}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v6

    move-wide/from16 v8, p4

    move-wide v10, p2

    invoke-direct/range {v3 .. v11}, Ljava/awt/geom/Rectangle2D$Double;-><init>(DDDD)V

    .line 155
    .local v3, "rect":Ljava/awt/Shape;
    new-instance v2, Lorg/jfree/chart/annotations/XYShapeAnnotation;

    new-instance v4, Ljava/awt/BasicStroke;

    invoke-direct {v4}, Ljava/awt/BasicStroke;-><init>()V

    move-object/from16 v0, p6

    move-object/from16 v1, p6

    invoke-direct {v2, v3, v4, v0, v1}, Lorg/jfree/chart/annotations/XYShapeAnnotation;-><init>(Ljava/awt/Shape;Ljava/awt/Stroke;Ljava/awt/Paint;Ljava/awt/Paint;)V

    .line 156
    .local v2, "area":Lorg/jfree/chart/annotations/XYShapeAnnotation;
    invoke-virtual {p0, v2}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 157
    return-void
.end method

.method public static makeTriangle(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;Ljava/awt/Color;)V
    .registers 7
    .param p0, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;
    .param p1, "location"    # Ljava/awt/geom/Point2D;
    .param p2, "color"    # Ljava/awt/Color;

    .prologue
    const/16 v3, 0x64

    const/4 v2, 0x0

    .line 160
    new-instance v1, Ljava/awt/Polygon;

    invoke-direct {v1}, Ljava/awt/Polygon;-><init>()V

    .line 161
    .local v1, "p":Ljava/awt/Polygon;
    invoke-virtual {v1, v2, v2}, Ljava/awt/Polygon;->addPoint(II)V

    .line 162
    invoke-virtual {v1, v3, v2}, Ljava/awt/Polygon;->addPoint(II)V

    .line 163
    invoke-virtual {v1, v3, v3}, Ljava/awt/Polygon;->addPoint(II)V

    .line 164
    new-instance v0, Lorg/jfree/chart/annotations/XYShapeAnnotation;

    new-instance v2, Ljava/awt/BasicStroke;

    invoke-direct {v2}, Ljava/awt/BasicStroke;-><init>()V

    invoke-direct {v0, v1, v2, p2, p2}, Lorg/jfree/chart/annotations/XYShapeAnnotation;-><init>(Ljava/awt/Shape;Ljava/awt/Stroke;Ljava/awt/Paint;Ljava/awt/Paint;)V

    .line 165
    .local v0, "area":Lorg/jfree/chart/annotations/XYShapeAnnotation;
    invoke-virtual {p0, v0}, Lorg/jfree/chart/plot/XYPlot;->addAnnotation(Lorg/jfree/chart/annotations/XYAnnotation;)V

    .line 166
    return-void
.end method

.method public static rotate(Ljava/awt/Shape;I)Ljava/awt/Shape;
    .registers 14
    .param p0, "shape"    # Ljava/awt/Shape;
    .param p1, "angle"    # I

    .prologue
    .line 202
    invoke-interface {p0}, Ljava/awt/Shape;->getBounds()Ljava/awt/Rectangle;

    move-result-object v7

    .line 203
    .local v7, "bounds":Ljava/awt/Rectangle;
    int-to-double v10, p1

    invoke-static {v10, v11}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    .line 204
    .local v0, "radians":D
    iget v9, v7, Ljava/awt/Rectangle;->width:I

    div-int/lit8 v9, v9, 0x2

    int-to-double v2, v9

    .line 205
    .local v2, "anchorX":D
    iget v9, v7, Ljava/awt/Rectangle;->height:I

    div-int/lit8 v9, v9, 0x2

    int-to-double v4, v9

    .line 206
    .local v4, "anchorY":D
    invoke-static/range {v0 .. v5}, Ljava/awt/geom/AffineTransform;->getRotateInstance(DDD)Ljava/awt/geom/AffineTransform;

    move-result-object v6

    .line 207
    .local v6, "at":Ljava/awt/geom/AffineTransform;
    invoke-virtual {v6, p0}, Ljava/awt/geom/AffineTransform;->createTransformedShape(Ljava/awt/Shape;)Ljava/awt/Shape;

    move-result-object v8

    .line 208
    .local v8, "rotated":Ljava/awt/Shape;
    return-object v8
.end method


# virtual methods
.method public initializePlot(Lorg/jfree/chart/plot/XYPlot;)V
    .registers 16
    .param p1, "xyplot"    # Lorg/jfree/chart/plot/XYPlot;

    .prologue
    .line 61
    invoke-virtual {p1}, Lorg/jfree/chart/plot/XYPlot;->getRangeAxis()Lorg/jfree/chart/axis/ValueAxis;

    move-result-object v12

    check-cast v12, Lorg/jfree/chart/axis/NumberAxis;

    .line 62
    .local v12, "rangeAxis":Lorg/jfree/chart/axis/NumberAxis;
    invoke-virtual {p1}, Lorg/jfree/chart/plot/XYPlot;->getDomainAxis()Lorg/jfree/chart/axis/ValueAxis;

    move-result-object v10

    check-cast v10, Lorg/jfree/chart/axis/NumberAxis;

    .line 64
    .local v10, "domainAxis":Lorg/jfree/chart/axis/NumberAxis;
    const-wide v2, -0x3fdc051eb851eb85L

    const-wide v4, 0x405b7f5c28f5c28fL

    invoke-virtual {v12, v2, v3, v4, v5}, Lorg/jfree/chart/axis/NumberAxis;->setRange(DD)V

    .line 65
    sget-object v0, Lorg/owasp/benchmark/score/report/ScatterPlot;->pctFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setNumberFormatOverride(Ljava/text/NumberFormat;)V

    .line 66
    const-string v0, "#666666"

    invoke-static {v0}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setTickLabelPaint(Ljava/awt/Paint;)V

    .line 67
    const/4 v0, 0x5

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setMinorTickCount(I)V

    .line 68
    new-instance v0, Lorg/jfree/chart/axis/NumberTickUnit;

    const-wide/high16 v2, 0x4024000000000000L

    invoke-direct {v0, v2, v3}, Lorg/jfree/chart/axis/NumberTickUnit;-><init>(D)V

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setTickUnit(Lorg/jfree/chart/axis/NumberTickUnit;)V

    .line 69
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setAxisLineVisible(Z)V

    .line 70
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setMinorTickMarksVisible(Z)V

    .line 71
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Lorg/jfree/chart/axis/NumberAxis;->setTickMarksVisible(Z)V

    .line 72
    const-wide/high16 v2, 0x4024000000000000L

    invoke-virtual {v12, v2, v3}, Lorg/jfree/chart/axis/NumberAxis;->setLowerMargin(D)V

    .line 73
    const-wide/high16 v2, 0x4024000000000000L

    invoke-virtual {v12, v2, v3}, Lorg/jfree/chart/axis/NumberAxis;->setUpperMargin(D)V

    .line 75
    const-wide/high16 v2, -0x3fec000000000000L

    const-wide v4, 0x4065e00000000000L

    invoke-virtual {v10, v2, v3, v4, v5}, Lorg/jfree/chart/axis/NumberAxis;->setRange(DD)V

    .line 76
    sget-object v0, Lorg/owasp/benchmark/score/report/ScatterPlot;->pctFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setNumberFormatOverride(Ljava/text/NumberFormat;)V

    .line 77
    const-string v0, "#666666"

    invoke-static {v0}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setTickLabelPaint(Ljava/awt/Paint;)V

    .line 78
    const/4 v0, 0x5

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setMinorTickCount(I)V

    .line 79
    new-instance v0, Lorg/jfree/chart/axis/NumberTickUnit;

    const-wide/high16 v2, 0x4024000000000000L

    invoke-direct {v0, v2, v3}, Lorg/jfree/chart/axis/NumberTickUnit;-><init>(D)V

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setTickUnit(Lorg/jfree/chart/axis/NumberTickUnit;)V

    .line 80
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setAxisLineVisible(Z)V

    .line 81
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setTickMarksVisible(Z)V

    .line 82
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Lorg/jfree/chart/axis/NumberAxis;->setMinorTickMarksVisible(Z)V

    .line 83
    const-wide/high16 v2, 0x4024000000000000L

    invoke-virtual {v10, v2, v3}, Lorg/jfree/chart/axis/NumberAxis;->setLowerMargin(D)V

    .line 84
    const-wide/high16 v2, 0x4024000000000000L

    invoke-virtual {v10, v2, v3}, Lorg/jfree/chart/axis/NumberAxis;->setUpperMargin(D)V

    .line 86
    new-instance v0, Ljava/awt/BasicStroke;

    invoke-direct {v0}, Ljava/awt/BasicStroke;-><init>()V

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setRangeGridlineStroke(Ljava/awt/Stroke;)V

    .line 87
    sget-object v0, Ljava/awt/Color;->lightGray:Ljava/awt/Color;

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setRangeGridlinePaint(Ljava/awt/Paint;)V

    .line 88
    const-string v0, "#DDDDDD"

    invoke-static {v0}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setRangeMinorGridlinePaint(Ljava/awt/Paint;)V

    .line 89
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setRangeMinorGridlinesVisible(Z)V

    .line 90
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setOutlineVisible(Z)V

    .line 91
    new-instance v0, Ljava/awt/BasicStroke;

    invoke-direct {v0}, Ljava/awt/BasicStroke;-><init>()V

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setDomainGridlineStroke(Ljava/awt/Stroke;)V

    .line 92
    sget-object v0, Ljava/awt/Color;->lightGray:Ljava/awt/Color;

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setDomainGridlinePaint(Ljava/awt/Paint;)V

    .line 93
    const-string v0, "#DDDDDD"

    invoke-static {v0}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setDomainMinorGridlinePaint(Ljava/awt/Paint;)V

    .line 94
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/jfree/chart/plot/XYPlot;->setDomainMinorGridlinesVisible(Z)V

    .line 95
    invoke-virtual {p1}, Lorg/jfree/chart/plot/XYPlot;->getRenderer()Lorg/jfree/chart/renderer/xy/XYItemRenderer;

    move-result-object v0

    const/4 v2, 0x0

    const-string v3, "#4572a7"

    invoke-static {v3}, Ljava/awt/Color;->decode(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lorg/jfree/chart/renderer/xy/XYItemRenderer;->setSeriesPaint(ILjava/awt/Paint;)V

    .line 97
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterPlot;->chart:Lorg/jfree/chart/JFreeChart;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/jfree/chart/JFreeChart;->setTextAntiAlias(Z)V

    .line 98
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterPlot;->chart:Lorg/jfree/chart/JFreeChart;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/jfree/chart/JFreeChart;->setAntiAlias(Z)V

    .line 99
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterPlot;->chart:Lorg/jfree/chart/JFreeChart;

    invoke-virtual {v0}, Lorg/jfree/chart/JFreeChart;->removeLegend()V

    .line 100
    iget-object v0, p0, Lorg/owasp/benchmark/score/report/ScatterPlot;->chart:Lorg/jfree/chart/JFreeChart;

    new-instance v1, Lorg/jfree/ui/RectangleInsets;

    const-wide/high16 v2, 0x4034000000000000L

    const-wide/high16 v4, 0x4034000000000000L

    const-wide/high16 v6, 0x4034000000000000L

    const-wide/high16 v8, 0x4034000000000000L

    invoke-direct/range {v1 .. v9}, Lorg/jfree/ui/RectangleInsets;-><init>(DDDD)V

    invoke-virtual {v0, v1}, Lorg/jfree/chart/JFreeChart;->setPadding(Lorg/jfree/ui/RectangleInsets;)V

    .line 102
    new-instance v1, Ljava/awt/geom/Point2D$Double;

    const-wide v2, 0x4059400000000000L

    const-wide/high16 v4, -0x3fdc000000000000L

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 103
    .local v1, "legendLocation":Ljava/awt/geom/Point2D;
    const-wide/high16 v2, 0x405e000000000000L

    const-wide v4, 0x4052800000000000L

    sget-object v6, Ljava/awt/Color;->WHITE:Ljava/awt/Color;

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Lorg/owasp/benchmark/score/report/ScatterPlot;->makeRect(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;DDLjava/awt/Color;)V

    .line 105
    new-instance v13, Ljava/awt/geom/Point2D$Double;

    const-wide v2, 0x4059400000000000L

    const-wide/high16 v4, -0x3fdc000000000000L

    invoke-direct {v13, v2, v3, v4, v5}, Ljava/awt/geom/Point2D$Double;-><init>(DD)V

    .line 106
    .local v13, "triangleLocation":Ljava/awt/geom/Point2D;
    new-instance v11, Ljava/awt/Color;

    const v0, 0x3dcccccd

    const v2, 0x3dcccccd

    const v3, 0x3dcccccd

    const v4, 0x3dcccccd

    invoke-direct {v11, v0, v2, v3, v4}, Ljava/awt/Color;-><init>(FFFF)V

    .line 107
    .local v11, "grey":Ljava/awt/Color;
    invoke-static {p1, v13, v11}, Lorg/owasp/benchmark/score/report/ScatterPlot;->makeTriangle(Lorg/jfree/chart/plot/XYPlot;Ljava/awt/geom/Point2D;Ljava/awt/Color;)V

    .line 109
    invoke-static {p1}, Lorg/owasp/benchmark/score/report/ScatterPlot;->makeGuessingLine(Lorg/jfree/chart/plot/XYPlot;)V

    .line 110
    return-void
.end method

.method public writeChartToFile(Ljava/io/File;I)V
    .registers 9
    .param p1, "f"    # Ljava/io/File;
    .param p2, "height"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 128
    .local v0, "stream":Ljava/io/FileOutputStream;
    iget-object v1, p0, Lorg/owasp/benchmark/score/report/ScatterPlot;->chart:Lorg/jfree/chart/JFreeChart;

    int-to-double v2, p2

    const-wide v4, 0x3ff6666666666666L

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v0, v1, v2, p2}, Lorg/jfree/chart/ChartUtilities;->writeChartAsPNG(Ljava/io/OutputStream;Lorg/jfree/chart/JFreeChart;II)V

    .line 129
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 130
    return-void
.end method
