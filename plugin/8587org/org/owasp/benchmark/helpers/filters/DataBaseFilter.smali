.class public Lorg/owasp/benchmark/helpers/filters/DataBaseFilter;
.super Ljava/lang/Object;
.source "DataBaseFilter.java"

# interfaces
.implements Ljavax/servlet/Filter;


# instance fields
.field protected config:Ljavax/servlet/FilterConfig;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public destroy()V
    .registers 1

    .prologue
    .line 44
    return-void
.end method

.method public doFilter(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;Ljavax/servlet/FilterChain;)V
    .registers 6
    .param p1, "request"    # Ljavax/servlet/ServletRequest;
    .param p2, "response"    # Ljavax/servlet/ServletResponse;
    .param p3, "filterChain"    # Ljavax/servlet/FilterChain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-interface {p3, p1, p2}, Ljavax/servlet/FilterChain;->doFilter(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V

    .line 31
    :try_start_3
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlConnection()Ljava/sql/Connection;

    move-result-object v1

    invoke-interface {v1}, Ljava/sql/Connection;->rollback()V
    :try_end_a
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_a} :catch_b

    .line 40
    return-void

    .line 32
    :catch_b
    move-exception v0

    .line 37
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljavax/servlet/ServletException;

    invoke-direct {v1, v0}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public init(Ljavax/servlet/FilterConfig;)V
    .registers 2
    .param p1, "config"    # Ljavax/servlet/FilterConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .prologue
    .line 18
    iput-object p1, p0, Lorg/owasp/benchmark/helpers/filters/DataBaseFilter;->config:Ljavax/servlet/FilterConfig;

    .line 19
    return-void
.end method
