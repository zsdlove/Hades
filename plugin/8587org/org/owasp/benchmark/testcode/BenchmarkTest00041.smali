.class public Lorg/owasp/benchmark/testcode/BenchmarkTest00041;
.super Ljavax/servlet/http/HttpServlet;
.source "BenchmarkTest00041.java"


# annotations
.annotation runtime Ljavax/servlet/annotation/WebServlet;
    value = {
        "/xss-00/BenchmarkTest00041"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    return-void
.end method


# virtual methods
.method public doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0, p1, p2}, Lorg/owasp/benchmark/testcode/BenchmarkTest00041;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 37
    return-void
.end method

.method public doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 8
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    const-string v3, "text/html;charset=UTF-8"

    invoke-interface {p2, v3}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 45
    new-instance v2, Lorg/owasp/benchmark/helpers/SeparateClassRequest;

    invoke-direct {v2, p1}, Lorg/owasp/benchmark/helpers/SeparateClassRequest;-><init>(Ljavax/servlet/http/HttpServletRequest;)V

    .line 46
    .local v2, "scr":Lorg/owasp/benchmark/helpers/SeparateClassRequest;
    const-string v3, "BenchmarkTest00041"

    invoke-virtual {v2, v3}, Lorg/owasp/benchmark/helpers/SeparateClassRequest;->getTheParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, "param":Ljava/lang/String;
    if-nez v1, :cond_14

    const-string v1, ""

    .line 50
    :cond_14
    const-string v3, "X-XSS-Protection"

    const-string v4, "0"

    invoke-interface {p2, v3, v4}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    const/4 v0, 0x1

    .line 52
    .local v0, "length":I
    if-eqz v1, :cond_2a

    .line 53
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 54
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, v0}, Ljava/io/PrintWriter;->write(Ljava/lang/String;II)V

    .line 56
    :cond_2a
    return-void
.end method
