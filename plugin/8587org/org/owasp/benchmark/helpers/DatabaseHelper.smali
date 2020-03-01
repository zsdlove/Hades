.class public Lorg/owasp/benchmark/helpers/DatabaseHelper;
.super Ljava/lang/Object;
.source "DatabaseHelper.java"


# static fields
.field public static JDBCtemplate:Lorg/springframework/jdbc/core/JdbcTemplate;

.field private static conn:Ljava/sql/Connection;

.field public static final hideSQLErrors:Z

.field private static stmt:Ljava/sql/Statement;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 46
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->initDataBase()V

    .line 47
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Spring context init() "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 49
    new-instance v0, Lorg/springframework/context/support/ClassPathXmlApplicationContext;

    const-string v2, "/context.xml"

    const-class v3, Lorg/owasp/benchmark/helpers/DatabaseHelper;

    invoke-direct {v0, v2, v3}, Lorg/springframework/context/support/ClassPathXmlApplicationContext;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 51
    .local v0, "ac":Lorg/springframework/context/ApplicationContext;
    const-string v2, "dataSource"

    invoke-interface {v0, v2}, Lorg/springframework/context/ApplicationContext;->getBean(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/sql/DataSource;

    .line 52
    .local v1, "data":Ljavax/sql/DataSource;
    new-instance v2, Lorg/springframework/jdbc/core/JdbcTemplate;

    invoke-direct {v2, v1}, Lorg/springframework/jdbc/core/JdbcTemplate;-><init>(Ljavax/sql/DataSource;)V

    sput-object v2, Lorg/owasp/benchmark/helpers/DatabaseHelper;->JDBCtemplate:Lorg/springframework/jdbc/core/JdbcTemplate;

    .line 53
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Spring context loaded!"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static executeSQLCommand(Ljava/lang/String;)V
    .registers 2
    .param p0, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 158
    sget-object v0, Lorg/owasp/benchmark/helpers/DatabaseHelper;->stmt:Ljava/sql/Statement;

    if-nez v0, :cond_7

    .line 159
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlStatement()Ljava/sql/Statement;

    .line 161
    :cond_7
    sget-object v0, Lorg/owasp/benchmark/helpers/DatabaseHelper;->stmt:Ljava/sql/Statement;

    invoke-interface {v0, p0}, Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I

    .line 162
    return-void
.end method

.method public static getSqlConnection()Ljava/sql/Connection;
    .registers 5

    .prologue
    .line 143
    sget-object v3, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    if-nez v3, :cond_1d

    .line 145
    :try_start_4
    new-instance v0, Ljavax/naming/InitialContext;

    invoke-direct {v0}, Ljavax/naming/InitialContext;-><init>()V

    .line 146
    .local v0, "ctx":Ljavax/naming/InitialContext;
    const-string v3, "java:comp/env/jdbc/BenchmarkDB"

    invoke-virtual {v0, v3}, Ljavax/naming/InitialContext;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/sql/DataSource;

    .line 147
    .local v1, "datasource":Ljavax/sql/DataSource;
    invoke-interface {v1}, Ljavax/sql/DataSource;->getConnection()Ljava/sql/Connection;

    move-result-object v3

    sput-object v3, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    .line 148
    sget-object v3, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/sql/Connection;->setAutoCommit(Z)V
    :try_end_1d
    .catch Ljava/sql/SQLException; {:try_start_4 .. :try_end_1d} :catch_2c
    .catch Ljavax/naming/NamingException; {:try_start_4 .. :try_end_1d} :catch_20

    .line 154
    .end local v1    # "datasource":Ljavax/sql/DataSource;
    :cond_1d
    :goto_1d
    sget-object v3, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    return-object v3

    .line 149
    :catch_20
    move-exception v2

    .line 150
    .local v2, "e":Ljava/lang/Exception;
    :goto_21
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Problem with getSqlConnection."

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 151
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1d

    .line 149
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_2c
    move-exception v2

    goto :goto_21
.end method

.method public static getSqlStatement()Ljava/sql/Statement;
    .registers 3

    .prologue
    .line 106
    sget-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    if-nez v1, :cond_7

    .line 107
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->getSqlConnection()Ljava/sql/Connection;

    .line 110
    :cond_7
    sget-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->stmt:Ljava/sql/Statement;

    if-nez v1, :cond_13

    .line 112
    :try_start_b
    sget-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    invoke-interface {v1}, Ljava/sql/Connection;->createStatement()Ljava/sql/Statement;

    move-result-object v1

    sput-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->stmt:Ljava/sql/Statement;
    :try_end_13
    .catch Ljava/sql/SQLException; {:try_start_b .. :try_end_13} :catch_16

    .line 118
    .local v0, "e":Ljava/sql/SQLException;
    :cond_13
    :goto_13
    sget-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->stmt:Ljava/sql/Statement;

    return-object v1

    .line 113
    .end local v0    # "e":Ljava/sql/SQLException;
    :catch_16
    move-exception v0

    .line 114
    .restart local v0    # "e":Ljava/sql/SQLException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Problem with database init."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_13
.end method

.method private static initData()V
    .registers 4

    .prologue
    .line 127
    :try_start_0
    const-string v1, "INSERT INTO USERS (username, password) VALUES(\'User01\', \'P455w0rd\')"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 128
    const-string v1, "INSERT INTO USERS (username, password) VALUES(\'User02\', \'B3nchM3rk\')"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 129
    const-string v1, "INSERT INTO USERS (username, password) VALUES(\'User03\', \'a$c11\')"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 130
    const-string v1, "INSERT INTO USERS (username, password) VALUES(\'foo\', \'bar\')"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 132
    const-string v1, "INSERT INTO SCORE (nick, score) VALUES(\'User03\', 155)"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 133
    const-string v1, "INSERT INTO SCORE (nick, score) VALUES(\'foo\', 40)"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 135
    const-string v1, "INSERT INTO EMPLOYEE (first_name, last_name, salary) VALUES(\'foo\', \'bar\', 100)"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 136
    sget-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    invoke-interface {v1}, Ljava/sql/Connection;->commit()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    .line 140
    .local v0, "e1":Ljava/lang/Exception;
    :goto_28
    return-void

    .line 137
    .end local v0    # "e1":Ljava/lang/Exception;
    :catch_29
    move-exception v0

    .line 138
    .restart local v0    # "e1":Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Problem with database init/reset: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_28
.end method

.method public static initDataBase()V
    .registers 4

    .prologue
    .line 58
    :try_start_0
    const-string v1, "DROP PROCEDURE IF EXISTS verifyUserPassword"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 59
    const-string v1, "DROP PROCEDURE IF EXISTS verifyEmployeeSalary"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 60
    const-string v1, "DROP TABLE IF EXISTS USERS"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 61
    const-string v1, "DROP TABLE IF EXISTS EMPLOYEE"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 62
    const-string v1, "DROP TABLE IF EXISTS CERTIFICATE"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 63
    const-string v1, "DROP TABLE IF EXISTS SCORE"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 65
    const-string v1, "CREATE TABLE USERS (userid int NOT NULL GENERATED BY DEFAULT AS IDENTITY, username varchar(50), password varchar(50),PRIMARY KEY (userid));"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 66
    const-string v1, "CREATE TABLE SCORE (userid int NOT NULL GENERATED BY DEFAULT AS IDENTITY, nick varchar(50), score INTEGER,PRIMARY KEY (userid));"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 67
    const-string v1, "CREATE PROCEDURE verifyUserPassword(IN username_ varchar(50), IN password_ varchar(50)) READS SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC DECLARE resultSet SCROLL CURSOR WITH HOLD WITH RETURN FOR SELECT * FROM USERS WHERE USERNAME = username_ AND PASSWORD = password_; OPEN resultSet;END;"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 75
    const-string v1, "create table EMPLOYEE (\t   id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY,\t   first_name VARCHAR(20) default NULL,   last_name  VARCHAR(20) default NULL, salary     INT  default NULL, PRIMARY KEY (id)\t);"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 82
    const-string v1, "create table CERTIFICATE (\t   id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY, certificate_name VARCHAR(30) default NULL, employee_id INT default NULL, PRIMARY KEY (id));"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 88
    const-string v1, "CREATE PROCEDURE verifyEmployeeSalary(IN user_ varchar(50)) READS SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC DECLARE resultSet SCROLL CURSOR WITH RETURN FOR SELECT * FROM EMPLOYEE WHERE FIRST_NAME = user_; OPEN resultSet;END;"

    invoke-static {v1}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->executeSQLCommand(Ljava/lang/String;)V

    .line 95
    sget-object v1, Lorg/owasp/benchmark/helpers/DatabaseHelper;->conn:Ljava/sql/Connection;

    invoke-interface {v1}, Ljava/sql/Connection;->commit()V

    .line 96
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->initData()V

    .line 98
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "DataBase tables/procedures created."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4b} :catch_4c

    .line 102
    .local v0, "e1":Ljava/lang/Exception;
    :goto_4b
    return-void

    .line 99
    .end local v0    # "e1":Ljava/lang/Exception;
    :catch_4c
    move-exception v0

    .line 100
    .restart local v0    # "e1":Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Problem with database table/procedure creations: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4b
.end method

.method public static outputUpdateComplete(Ljava/lang/String;Ljava/util/List;)V
    .registers 6
    .param p0, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    .local p1, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    new-instance v0, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v1, "Message"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Update complete for query: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 175
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v3

    invoke-interface {v3, p0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<br>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    return-void
.end method

.method public static outputUpdateComplete(Ljava/lang/String;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 5
    .param p0, "sql"    # Ljava/lang/String;
    .param p1, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v0

    .line 168
    .local v0, "out":Ljava/io/PrintWriter;
    const-string v1, "<!DOCTYPE html>\n<html>\n<body>\n<p>"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Update complete for query: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v2

    invoke-interface {v2, p0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<br>\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 170
    const-string v1, "</p>\n</body>\n</html>"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public static printColTypes(Ljava/sql/ResultSetMetaData;Ljava/io/PrintWriter;)V
    .registers 8
    .param p0, "rsmd"    # Ljava/sql/ResultSetMetaData;
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-interface {p0}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v0

    .line 388
    .local v0, "columns":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_5
    if-gt v1, v0, :cond_4e

    .line 389
    invoke-interface {p0, v1}, Ljava/sql/ResultSetMetaData;->getColumnType(I)I

    move-result v2

    .line 390
    .local v2, "jdbcType":I
    invoke-interface {p0, v1}, Ljava/sql/ResultSetMetaData;->getColumnTypeName(I)Ljava/lang/String;

    move-result-object v3

    .line 391
    .local v3, "name":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Column "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is JDBC type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 392
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", which the DBMS calls "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<br>\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 388
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 394
    .end local v2    # "jdbcType":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_4e
    return-void
.end method

.method public static printResults(Ljava/lang/String;[ILjava/util/List;)V
    .registers 7
    .param p0, "query"    # Ljava/lang/String;
    .param p1, "counts"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[I",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    .local p2, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    new-instance v0, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v1, "Message"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "For query: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 358
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v3

    invoke-interface {v3, p0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<br>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 361
    :try_start_2b
    array-length v0, p1

    if-lez v0, :cond_47

    .line 362
    const/4 v0, 0x0

    aget v0, p1, v0

    const/4 v1, -0x2

    if-ne v0, v1, :cond_54

    .line 363
    new-instance v0, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v1, "Message"

    const-string v2, "The SQL query was processed successfully but the number of rows affected is unknown."

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "The SQL query was processed successfully but the number of rows affected is unknown."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_47
    .catchall {:try_start_2b .. :try_end_47} :catchall_6e

    .line 380
    :cond_47
    :goto_47
    new-instance v0, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v1, "Message"

    const-string v2, "</p>\n</body>\n</html>"

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 384
    return-void

    .line 367
    :cond_54
    const/4 v0, 0x0

    :try_start_55
    aget v0, p1, v0

    const/4 v1, -0x3

    if-ne v0, v1, :cond_7c

    .line 368
    new-instance v0, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v1, "Message"

    const-string v2, "The SQL query failed to execute successfully and occurs only if a driver continues to process commands after a command fails"

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "The SQL query failed to execute successfully and occurs only if a driver continues to process commands after a command fails"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_6d
    .catchall {:try_start_55 .. :try_end_6d} :catchall_6e

    goto :goto_47

    .line 380
    :catchall_6e
    move-exception v0

    new-instance v1, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v2, "Message"

    const-string v3, "</p>\n</body>\n</html>"

    invoke-direct {v1, v2, v3}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    throw v0

    .line 373
    :cond_7c
    :try_start_7c
    new-instance v0, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v1, "Message"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The number of affected rows are: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    aget v3, p1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The number of affected rows are: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    aget v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_b7
    .catchall {:try_start_7c .. :try_end_b7} :catchall_6e

    goto :goto_47
.end method

.method public static printResults(Ljava/lang/String;[ILjavax/servlet/http/HttpServletResponse;)V
    .registers 7
    .param p0, "query"    # Ljava/lang/String;
    .param p1, "counts"    # [I
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v0

    .line 336
    .local v0, "out":Ljava/io/PrintWriter;
    const-string v1, "<!DOCTYPE html>\n<html>\n<body>\n<p>"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 337
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "For query: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v2

    invoke-interface {v2, p0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<br>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 339
    :try_start_2d
    array-length v1, p1

    if-lez v1, :cond_42

    .line 340
    const/4 v1, 0x0

    aget v1, p1, v1

    const/4 v2, -0x2

    if-ne v1, v2, :cond_48

    .line 341
    const-string v1, "The SQL query was processed successfully but the number of rows affected is unknown."

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 342
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "The SQL query was processed successfully but the number of rows affected is unknown."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_42
    .catchall {:try_start_2d .. :try_end_42} :catchall_5b

    .line 352
    :cond_42
    :goto_42
    const-string v1, "</p>\n</body>\n</html>"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 354
    return-void

    .line 343
    :cond_48
    const/4 v1, 0x0

    :try_start_49
    aget v1, p1, v1

    const/4 v2, -0x3

    if-ne v1, v2, :cond_62

    .line 344
    const-string v1, "The SQL query failed to execute successfully and occurs only if a driver continues to process commands after a command fails"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 345
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "The SQL query failed to execute successfully and occurs only if a driver continues to process commands after a command fails"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_5a
    .catchall {:try_start_49 .. :try_end_5a} :catchall_5b

    goto :goto_42

    .line 352
    :catchall_5b
    move-exception v1

    const-string v2, "</p>\n</body>\n</html>"

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 353
    throw v1

    .line 347
    :cond_62
    :try_start_62
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The number of affected rows are: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    aget v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 348
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The number of affected rows are: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    aget v3, p1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_96
    .catchall {:try_start_62 .. :try_end_96} :catchall_5b

    goto :goto_42
.end method

.method public static printResults(Ljava/sql/ResultSet;Ljava/lang/String;Ljava/util/List;)V
    .registers 11
    .param p0, "rs"    # Ljava/sql/ResultSet;
    .param p1, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/sql/ResultSet;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 303
    .local p2, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    if-nez p0, :cond_34

    .line 304
    :try_start_2
    new-instance v4, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v5, "Message"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Results set is empty for query: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 305
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v7

    invoke-interface {v7, p1}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_27
    .catchall {:try_start_2 .. :try_end_27} :catchall_77

    .line 328
    new-instance v4, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v5, "Message"

    const-string v6, "</p>\n</body>\n</html>"

    invoke-direct {v4, v5, v6}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    :goto_33
    return-void

    .line 309
    :cond_34
    :try_start_34
    invoke-interface {p0}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v3

    .line 310
    .local v3, "rsmd":Ljava/sql/ResultSetMetaData;
    invoke-interface {v3}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v2

    .line 311
    .local v2, "numberOfColumns":I
    new-instance v4, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v5, "Message"

    const-string v6, "Your results are:<br>\n"

    invoke-direct {v4, v5, v6}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    :goto_48
    invoke-interface {p0}, Ljava/sql/ResultSet;->next()Z

    move-result v4

    if-eqz v4, :cond_85

    .line 315
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_4f
    if-gt v1, v2, :cond_6a

    .line 317
    invoke-interface {p0, v1}, Ljava/sql/ResultSet;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "columnValue":Ljava/lang/String;
    new-instance v4, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v5, "Message"

    .line 319
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v6

    invoke-interface {v6, v0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    add-int/lit8 v1, v1, 0x1

    goto :goto_4f

    .line 322
    .end local v0    # "columnValue":Ljava/lang/String;
    :cond_6a
    new-instance v4, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v5, "Message"

    const-string v6, "<br>\n"

    invoke-direct {v4, v5, v6}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_76
    .catchall {:try_start_34 .. :try_end_76} :catchall_77

    goto :goto_48

    .line 328
    .end local v1    # "i":I
    .end local v2    # "numberOfColumns":I
    .end local v3    # "rsmd":Ljava/sql/ResultSetMetaData;
    :catchall_77
    move-exception v4

    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    const-string v7, "</p>\n</body>\n</html>"

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    throw v4

    .line 328
    .restart local v2    # "numberOfColumns":I
    .restart local v3    # "rsmd":Ljava/sql/ResultSetMetaData;
    :cond_85
    new-instance v4, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v5, "Message"

    const-string v6, "</p>\n</body>\n</html>"

    invoke-direct {v4, v5, v6}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_33
.end method

.method public static printResults(Ljava/sql/ResultSet;Ljava/lang/String;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 10
    .param p0, "rs"    # Ljava/sql/ResultSet;
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    .line 274
    .local v3, "out":Ljava/io/PrintWriter;
    const-string v5, "<!DOCTYPE html>\n<html>\n<body>\n<p>"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 277
    if-nez p0, :cond_2f

    .line 278
    :try_start_b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Results set is empty for query: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v6

    invoke-interface {v6, p1}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_29
    .catchall {:try_start_b .. :try_end_29} :catchall_5d

    .line 297
    const-string v5, "</p>\n</body>\n</html>"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 299
    :goto_2e
    return-void

    .line 281
    :cond_2f
    :try_start_2f
    invoke-interface {p0}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v4

    .line 282
    .local v4, "rsmd":Ljava/sql/ResultSetMetaData;
    invoke-interface {v4}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v2

    .line 283
    .local v2, "numberOfColumns":I
    const-string v5, "Your results are:<br>\n"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 285
    :goto_3c
    invoke-interface {p0}, Ljava/sql/ResultSet;->next()Z

    move-result v5

    if-eqz v5, :cond_64

    .line 286
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_43
    if-gt v1, v2, :cond_57

    .line 288
    invoke-interface {p0, v1}, Ljava/sql/ResultSet;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 289
    .local v0, "columnValue":Ljava/lang/String;
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v5

    invoke-interface {v5, v0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 286
    add-int/lit8 v1, v1, 0x1

    goto :goto_43

    .line 292
    .end local v0    # "columnValue":Ljava/lang/String;
    :cond_57
    const-string v5, "<br>\n"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_5c
    .catchall {:try_start_2f .. :try_end_5c} :catchall_5d

    goto :goto_3c

    .line 297
    .end local v1    # "i":I
    .end local v2    # "numberOfColumns":I
    .end local v4    # "rsmd":Ljava/sql/ResultSetMetaData;
    :catchall_5d
    move-exception v5

    const-string v6, "</p>\n</body>\n</html>"

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 298
    throw v5

    .line 297
    .restart local v2    # "numberOfColumns":I
    .restart local v4    # "rsmd":Ljava/sql/ResultSetMetaData;
    :cond_64
    const-string v5, "</p>\n</body>\n</html>"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    goto :goto_2e
.end method

.method public static printResults(Ljava/sql/Statement;Ljava/lang/String;Ljava/util/List;)V
    .registers 12
    .param p0, "statement"    # Ljava/sql/Statement;
    .param p1, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/sql/Statement;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/owasp/benchmark/service/pojo/StringMessage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    .local p2, "resp":Ljava/util/List;, "Ljava/util/List<Lorg/owasp/benchmark/service/pojo/StringMessage;>;"
    :try_start_0
    invoke-interface {p0}, Ljava/sql/Statement;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v3

    .line 234
    .local v3, "rs":Ljava/sql/ResultSet;
    if-nez v3, :cond_38

    .line 235
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Results set is empty for query: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 236
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v8

    invoke-interface {v8, p1}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2b
    .catchall {:try_start_0 .. :try_end_2b} :catchall_8a

    .line 264
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    const-string v7, "</p>\n</body>\n</html>"

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    :goto_37
    return-void

    .line 240
    :cond_38
    :try_start_38
    invoke-interface {v3}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v4

    .line 241
    .local v4, "rsmd":Ljava/sql/ResultSetMetaData;
    invoke-interface {v4}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v2

    .line 242
    .local v2, "numberOfColumns":I
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    const-string v7, "Your results are:<br>\n"

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    :goto_4c
    invoke-interface {v3}, Ljava/sql/ResultSet;->next()Z

    move-result v5

    if-eqz v5, :cond_98

    .line 246
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_53
    if-gt v1, v2, :cond_7d

    .line 247
    const/4 v5, 0x1

    if-le v1, v5, :cond_64

    .line 248
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    const-string v7, ",  "

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    :cond_64
    invoke-interface {v3, v1}, Ljava/sql/ResultSet;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "columnValue":Ljava/lang/String;
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    .line 255
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v7

    invoke-interface {v7, v0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_53

    .line 258
    .end local v0    # "columnValue":Ljava/lang/String;
    :cond_7d
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    const-string v7, "<br>\n"

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_89
    .catchall {:try_start_38 .. :try_end_89} :catchall_8a

    goto :goto_4c

    .line 264
    .end local v1    # "i":I
    .end local v2    # "numberOfColumns":I
    .end local v3    # "rs":Ljava/sql/ResultSet;
    .end local v4    # "rsmd":Ljava/sql/ResultSetMetaData;
    :catchall_8a
    move-exception v5

    new-instance v6, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v7, "Message"

    const-string v8, "</p>\n</body>\n</html>"

    invoke-direct {v6, v7, v8}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    throw v5

    .line 264
    .restart local v2    # "numberOfColumns":I
    .restart local v3    # "rs":Ljava/sql/ResultSet;
    .restart local v4    # "rsmd":Ljava/sql/ResultSetMetaData;
    :cond_98
    new-instance v5, Lorg/owasp/benchmark/service/pojo/StringMessage;

    const-string v6, "Message"

    const-string v7, "</p>\n</body>\n</html>"

    invoke-direct {v5, v6, v7}, Lorg/owasp/benchmark/service/pojo/StringMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_37
.end method

.method public static printResults(Ljava/sql/Statement;Ljava/lang/String;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 11
    .param p0, "statement"    # Ljava/sql/Statement;
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    .line 182
    .local v3, "out":Ljava/io/PrintWriter;
    const-string v6, "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n</head>\n<body>\n<p>\n"

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 191
    :try_start_9
    invoke-interface {p0}, Ljava/sql/Statement;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v4

    .line 192
    .local v4, "rs":Ljava/sql/ResultSet;
    if-nez v4, :cond_33

    .line 193
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Results set is empty for query: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v7

    invoke-interface {v7, p1}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_2d
    .catchall {:try_start_9 .. :try_end_2d} :catchall_69

    .line 226
    const-string v6, "</p>\n</body>\n</html>"

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 229
    :goto_32
    return-void

    .line 196
    :cond_33
    :try_start_33
    invoke-interface {v4}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v5

    .line 201
    .local v5, "rsmd":Ljava/sql/ResultSetMetaData;
    invoke-interface {v5}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v2

    .line 210
    .local v2, "numberOfColumns":I
    const-string v6, "Your results are:<br>\n"

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 212
    :goto_40
    invoke-interface {v4}, Ljava/sql/ResultSet;->next()Z

    move-result v6

    if-eqz v6, :cond_70

    .line 213
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_47
    if-gt v1, v2, :cond_63

    .line 214
    const/4 v6, 0x1

    if-le v1, v6, :cond_51

    const-string v6, ",  "

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 217
    :cond_51
    invoke-interface {v4, v1}, Ljava/sql/ResultSet;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "columnValue":Ljava/lang/String;
    invoke-static {}, Lorg/owasp/esapi/ESAPI;->encoder()Lorg/owasp/esapi/Encoder;

    move-result-object v6

    invoke-interface {v6, v0}, Lorg/owasp/esapi/Encoder;->encodeForHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 213
    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    .line 221
    .end local v0    # "columnValue":Ljava/lang/String;
    :cond_63
    const-string v6, "<br>\n"

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_68
    .catchall {:try_start_33 .. :try_end_68} :catchall_69

    goto :goto_40

    .line 226
    .end local v1    # "i":I
    .end local v2    # "numberOfColumns":I
    .end local v4    # "rs":Ljava/sql/ResultSet;
    .end local v5    # "rsmd":Ljava/sql/ResultSetMetaData;
    :catchall_69
    move-exception v6

    const-string v7, "</p>\n</body>\n</html>"

    invoke-virtual {v3, v7}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 227
    throw v6

    .line 226
    .restart local v2    # "numberOfColumns":I
    .restart local v4    # "rs":Ljava/sql/ResultSet;
    .restart local v5    # "rsmd":Ljava/sql/ResultSetMetaData;
    :cond_70
    const-string v6, "</p>\n</body>\n</html>"

    invoke-virtual {v3, v6}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    goto :goto_32
.end method

.method public static reset()V
    .registers 0

    .prologue
    .line 122
    invoke-static {}, Lorg/owasp/benchmark/helpers/DatabaseHelper;->initData()V

    .line 123
    return-void
.end method
