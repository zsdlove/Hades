.class public Lorg/owasp/benchmark/score/parsers/CoverityReader;
.super Lorg/owasp/benchmark/score/parsers/Reader;
.source "CoverityReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/owasp/benchmark/score/parsers/Reader;-><init>()V

    return-void
.end method

.method private fixCWE(Ljava/lang/String;)I
    .registers 4
    .param p1, "cweNumber"    # Ljava/lang/String;

    .prologue
    .line 185
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 186
    .local v0, "cwe":I
    const/16 v1, 0x5e

    if-ne v0, v1, :cond_a

    const/16 v0, 0x283

    .line 187
    :cond_a
    const/16 v1, 0x24

    if-ne v0, v1, :cond_10

    const/16 v0, 0x16

    .line 188
    :cond_10
    const/16 v1, 0x17

    if-ne v0, v1, :cond_16

    const/16 v0, 0x16

    .line 189
    :cond_16
    return v0
.end method

.method private parseCoverityFinding(Lorg/json/JSONObject;I)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 13
    .param p1, "finding"    # Lorg/json/JSONObject;
    .param p2, "version"    # I

    .prologue
    const/4 v7, 0x0

    .line 58
    :try_start_1
    new-instance v5, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 59
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const/4 v3, 0x0

    .line 61
    .local v3, "filename":Ljava/lang/String;
    const/4 v8, 0x3

    if-ne p2, v8, :cond_7b

    .line 62
    const-string v8, "mainEventFilePathname"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 63
    const-string v8, "\\\\"

    const-string v9, "/"

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 64
    const/16 v8, 0x2f

    invoke-virtual {v3, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 65
    const-string v8, "BenchmarkTest"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5a

    .line 66
    const-string v8, "BenchmarkTest"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x5

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 67
    .local v6, "testNumber":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 68
    const-string v8, "checkerProperties"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 69
    .local v4, "props":Lorg/json/JSONObject;
    const-string v8, "cweCategory"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "cweNumber":Ljava/lang/String;
    if-eqz v1, :cond_59

    const-string v8, "none"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5b

    :cond_59
    move-object v5, v7

    .line 106
    .end local v1    # "cweNumber":Ljava/lang/String;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v4    # "props":Lorg/json/JSONObject;
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "testNumber":Ljava/lang/String;
    :cond_5a
    :goto_5a
    return-object v5

    .line 73
    .restart local v1    # "cweNumber":Ljava/lang/String;
    .restart local v3    # "filename":Ljava/lang/String;
    .restart local v4    # "props":Lorg/json/JSONObject;
    .restart local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v6    # "testNumber":Ljava/lang/String;
    :cond_5b
    invoke-direct {p0, v1}, Lorg/owasp/benchmark/score/parsers/CoverityReader;->fixCWE(Ljava/lang/String;)I

    move-result v0

    .line 74
    .local v0, "cwe":I
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 75
    const-string v8, "subcategoryShortDescription"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 76
    const-string v8, "subcategoryLongDescription"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_74} :catch_75

    goto :goto_5a

    .line 103
    .end local v0    # "cwe":I
    .end local v1    # "cweNumber":Ljava/lang/String;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v4    # "props":Lorg/json/JSONObject;
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "testNumber":Ljava/lang/String;
    :catch_75
    move-exception v2

    .line 104
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v5, v7

    .line 106
    goto :goto_5a

    .line 78
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "filename":Ljava/lang/String;
    .restart local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    :cond_7b
    const/4 v8, 0x2

    if-ne p2, v8, :cond_83

    .line 83
    :try_start_7e
    invoke-direct {p0, p1}, Lorg/owasp/benchmark/score/parsers/CoverityReader;->parseCoverityFindingV2(Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v5

    goto :goto_5a

    .line 86
    :cond_83
    const-string v8, "occurrences"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "mainEventFilePathname"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 87
    const-string v8, "\\\\"

    const-string v9, "/"

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 88
    const/16 v8, 0x2f

    invoke-virtual {v3, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 89
    const-string v8, "BenchmarkTest"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5a

    .line 90
    const-string v8, "BenchmarkTest"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x5

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 91
    .restart local v6    # "testNumber":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 92
    const-string v8, "cweNumber"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d1

    move-object v5, v7

    .line 93
    goto :goto_5a

    .line 95
    :cond_d1
    const-string v8, "cweNumber"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 96
    .restart local v1    # "cweNumber":Ljava/lang/String;
    invoke-direct {p0, v1}, Lorg/owasp/benchmark/score/parsers/CoverityReader;->fixCWE(Ljava/lang/String;)I

    move-result v0

    .line 97
    .restart local v0    # "cwe":I
    invoke-virtual {v5, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 98
    const-string v8, "categoryDescription"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 99
    const-string v8, "longDescription"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V
    :try_end_f0
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_f0} :catch_75

    goto/16 :goto_5a
.end method

.method private parseCoverityFindingV2(Lorg/json/JSONObject;)Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .registers 13
    .param p1, "finding"    # Lorg/json/JSONObject;

    .prologue
    const/4 v8, 0x0

    .line 124
    :try_start_1
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    invoke-direct {v6}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;-><init>()V

    .line 125
    .local v6, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    const/4 v4, 0x0

    .line 127
    .local v4, "filename":Ljava/lang/String;
    const-string v9, "mainEventFilePathname"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 128
    const-string v9, "\\\\"

    const-string v10, "/"

    invoke-virtual {v4, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 129
    const/16 v9, 0x2f

    invoke-virtual {v4, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 130
    const-string v9, "BenchmarkTest"

    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_ce

    .line 131
    const-string v9, "BenchmarkTest"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x5

    invoke-virtual {v4, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 132
    .local v7, "testNumber":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v6, v9}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setNumber(I)V

    .line 150
    const-string v9, "checkerName"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "checker_name":Ljava/lang/String;
    const-string v9, "subcategory"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 152
    .local v5, "subcategory":Ljava/lang/String;
    const-string v2, "0"

    .line 153
    .local v2, "cwe_string":Ljava/lang/String;
    const-string v9, "risky_crypto"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_73

    .line 154
    const-string v9, "hashing"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_70

    const-string v2, "328"

    .line 170
    :cond_68
    :goto_68
    invoke-direct {p0, v2}, Lorg/owasp/benchmark/score/parsers/CoverityReader;->fixCWE(Ljava/lang/String;)I

    move-result v1

    .line 171
    .local v1, "cwe":I
    if-gtz v1, :cond_c0

    move-object v6, v8

    .line 182
    .end local v0    # "checker_name":Ljava/lang/String;
    .end local v1    # "cwe":I
    .end local v2    # "cwe_string":Ljava/lang/String;
    .end local v4    # "filename":Ljava/lang/String;
    .end local v5    # "subcategory":Ljava/lang/String;
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "testNumber":Ljava/lang/String;
    :goto_6f
    return-object v6

    .line 154
    .restart local v0    # "checker_name":Ljava/lang/String;
    .restart local v2    # "cwe_string":Ljava/lang/String;
    .restart local v4    # "filename":Ljava/lang/String;
    .restart local v5    # "subcategory":Ljava/lang/String;
    .restart local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .restart local v7    # "testNumber":Ljava/lang/String;
    :cond_70
    const-string v2, "327"

    goto :goto_68

    .line 155
    :cond_73
    const-string v9, "path_manipulation"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7e

    .line 156
    const-string v2, "22"

    goto :goto_68

    .line 157
    :cond_7e
    const-string v9, "insecure_random"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_89

    .line 158
    const-string v2, "330"

    goto :goto_68

    .line 159
    :cond_89
    const-string v9, "xpath_injection"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_94

    .line 160
    const-string v2, "94"

    goto :goto_68

    .line 161
    :cond_94
    const-string v9, "os_cmd_injection"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9f

    .line 162
    const-string v2, "78"

    goto :goto_68

    .line 163
    :cond_9f
    const-string v9, "xss"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_aa

    .line 164
    const-string v2, "79"

    goto :goto_68

    .line 165
    :cond_aa
    const-string v9, "sqli"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b5

    .line 166
    const-string v2, "89"

    goto :goto_68

    .line 167
    :cond_b5
    const-string v9, "ldap_injection"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_68

    .line 168
    const-string v2, "90"

    goto :goto_68

    .line 174
    .restart local v1    # "cwe":I
    :cond_c0
    invoke-virtual {v6, v1}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCWE(I)V

    .line 175
    invoke-virtual {v6, v0}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setCategory(Ljava/lang/String;)V

    .line 176
    invoke-virtual {v6, v5}, Lorg/owasp/benchmark/score/parsers/TestCaseResult;->setEvidence(Ljava/lang/String;)V
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_c9} :catch_ca

    goto :goto_6f

    .line 179
    .end local v0    # "checker_name":Ljava/lang/String;
    .end local v1    # "cwe":I
    .end local v2    # "cwe_string":Ljava/lang/String;
    .end local v4    # "filename":Ljava/lang/String;
    .end local v5    # "subcategory":Ljava/lang/String;
    .end local v6    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v7    # "testNumber":Ljava/lang/String;
    :catch_ca
    move-exception v3

    .line 180
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .end local v3    # "e":Ljava/lang/Exception;
    :cond_ce
    move-object v6, v8

    .line 182
    goto :goto_6f
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/owasp/benchmark/score/parsers/TestResults;
    .registers 13
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 32
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/String;

    invoke-static {v8, v9}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v8

    invoke-static {v8}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v8

    invoke-direct {v1, v8}, Ljava/lang/String;-><init>([B)V

    .line 34
    .local v1, "content":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 35
    .local v4, "obj":Lorg/json/JSONObject;
    const-string v8, "formatVersion"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 37
    .local v7, "version":I
    if-le v7, v10, :cond_4b

    const-string v3, "issues"

    .line 38
    .local v3, "key":Ljava/lang/String;
    :goto_24
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 40
    .local v0, "arr":Lorg/json/JSONArray;
    new-instance v6, Lorg/owasp/benchmark/score/parsers/TestResults;

    const-string v8, "Coverity Code Advisor"

    sget-object v9, Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;->SAST:Lorg/owasp/benchmark/score/parsers/TestResults$ToolType;

    invoke-direct {v6, v8, v10, v9}, Lorg/owasp/benchmark/score/parsers/TestResults;-><init>(Ljava/lang/String;ZLorg/owasp/benchmark/score/parsers/TestResults$ToolType;)V

    .line 42
    .local v6, "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    invoke-virtual {v6, p1}, Lorg/owasp/benchmark/score/parsers/TestResults;->setTime(Ljava/io/File;)V

    .line 44
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_35
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_4e

    .line 46
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-direct {p0, v8, v7}, Lorg/owasp/benchmark/score/parsers/CoverityReader;->parseCoverityFinding(Lorg/json/JSONObject;I)Lorg/owasp/benchmark/score/parsers/TestCaseResult;

    move-result-object v5

    .line 47
    .local v5, "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    if-eqz v5, :cond_48

    .line 48
    invoke-virtual {v6, v5}, Lorg/owasp/benchmark/score/parsers/TestResults;->put(Lorg/owasp/benchmark/score/parsers/TestCaseResult;)V

    .line 44
    :cond_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    .line 37
    .end local v0    # "arr":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "tcr":Lorg/owasp/benchmark/score/parsers/TestCaseResult;
    .end local v6    # "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    :cond_4b
    const-string v3, "mergedIssues"

    goto :goto_24

    .line 52
    .restart local v0    # "arr":Lorg/json/JSONArray;
    .restart local v2    # "i":I
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v6    # "tr":Lorg/owasp/benchmark/score/parsers/TestResults;
    :cond_4e
    return-object v6
.end method
