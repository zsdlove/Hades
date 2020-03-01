.class public Lorg/owasp/benchmark/score/report/LegendXYItemLabelGenerator;
.super Lorg/jfree/chart/labels/StandardXYItemLabelGenerator;
.source "LegendXYItemLabelGenerator.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/jfree/chart/labels/XYItemLabelGenerator;
.implements Lorg/jfree/util/PublicCloneable;


# instance fields
.field private legendItems:Lorg/jfree/chart/LegendItemCollection;


# direct methods
.method public constructor <init>(Lorg/jfree/chart/LegendItemCollection;)V
    .registers 2
    .param p1, "legendItems"    # Lorg/jfree/chart/LegendItemCollection;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jfree/chart/labels/StandardXYItemLabelGenerator;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/owasp/benchmark/score/report/LegendXYItemLabelGenerator;->legendItems:Lorg/jfree/chart/LegendItemCollection;

    .line 35
    return-void
.end method


# virtual methods
.method public generateLabel(Lorg/jfree/data/xy/XYDataset;II)Ljava/lang/String;
    .registers 6
    .param p1, "dataset"    # Lorg/jfree/data/xy/XYDataset;
    .param p2, "series"    # I
    .param p3, "item"    # I

    .prologue
    .line 39
    iget-object v1, p0, Lorg/owasp/benchmark/score/report/LegendXYItemLabelGenerator;->legendItems:Lorg/jfree/chart/LegendItemCollection;

    invoke-virtual {v1, p3}, Lorg/jfree/chart/LegendItemCollection;->get(I)Lorg/jfree/chart/LegendItem;

    move-result-object v0

    .line 40
    .local v0, "legendItem":Lorg/jfree/chart/LegendItem;
    invoke-virtual {v0}, Lorg/jfree/chart/LegendItem;->getLabel()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
