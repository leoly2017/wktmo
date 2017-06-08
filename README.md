
<!-- README.md is generated from README.Rmd. Please edit that file -->
wktmo
=====

Introduction
------------

Researchers working with weekly time series data may have the need to convert the data from weekly basis to monthly basis. However, it is challenging to allocate weeks to months since the dates of weeks are not fixed in different calendar years, especially when a week has dates in two months.

The goal of wktmo is to convert weekly data to monthly data. For weeks that have dates in two months, the input value will be allocated evenly to the the dates. For example, if a week contains four days in January and three days in February, then four sevenths will go to January and three sevens will go to February. For weekly data, three types of week formats are accepted: ISO week, epi week and calendar date.

Installation
------------

wktmo is built under R 3.4.0. For a stable version, you can install wktmo from CRAN with:

``` r
install.packages("wktmo")
```

For a development version, you can install wktmo from Github with:

``` r
install.packages("devtools")
devtools::install_github("leoly2017/wktmo")
```

Example
-------

This is a basic example which shows you how to convert real-world weekly data to monthly data. `weeklyFlu` is a dataset containing weekly influenza cases, including influenza A, influenza B and influenza A+B, of 18 countries during 2010-2015; data are from FluNet, a global web-based tool for influenza virological surveillance. Use `help(weeklyFlu)` for more information.

``` r
library(wktmo)
# extract data
data(weeklyFlu)
# subset data of interest, e.g. to convert weekly influenza A cases in China
weeklyData <- weeklyFlu$fluA[weeklyFlu$country == "China"]
# convert weekly data to monthly data;
# these two input methods below will return the same results.
# input 1: the start year and wkIndex
monthlyData <- weekToMonth(weeklyData, year = 2010, wkIndex = 1, wkMethod = "ISO")
# display only first 15 rows of the results
```

| yearMonth |  value|
|:----------|------:|
| 2010-01   |  27559|
| 2010-02   |   6783|
| 2010-03   |   7656|
| 2010-04   |   2539|
| 2010-05   |   2068|
| 2010-06   |   1662|
| 2010-07   |   6150|
| 2010-08   |  22130|
| 2010-09   |  37055|
| 2010-10   |  19664|
| 2010-11   |   9041|
| 2010-12   |  12398|
| 2011-01   |  39581|
| 2011-02   |  33775|
| 2011-03   |   9409|

``` r
# input 2: the start date, same results
monthlyData <- weekToMonth(weeklyData, datStart = "04-01-2010", wkMethod = "startDat")
```

| yearMonth |  value|
|:----------|------:|
| 2010-01   |  27559|
| 2010-02   |   6783|
| 2010-03   |   7656|
| 2010-04   |   2539|
| 2010-05   |   2068|
| 2010-06   |   1662|
| 2010-07   |   6150|
| 2010-08   |  22130|
| 2010-09   |  37055|
| 2010-10   |  19664|
| 2010-11   |   9041|
| 2010-12   |  12398|
| 2011-01   |  39581|
| 2011-02   |  33775|
| 2011-03   |   9409|

Suggestions and reports of bugs
-------------------------------

Suggestions and reports of bugs are always welcome. If there are any, contact You Li (<You.Li2@ed.ac.uk>).

Updates
-------

### wktmo 1.0.4

#### Minor changes

Small changes in README file.

### wktmo 1.0.3

#### Major Changes

Add a real-world dataset, `weeklyFlu`.

Replace examples with new examples using data in `weeklyFlu`.

### wktmo 1.0.2

#### Minor Changes

Improvement on formmatting of examples.

### wktmo 1.0.1

First published on CRAN.

#### Minor Changes

Revisions of DESCRIPTION file.

### wktmo 1.0.0

First submission to CRAN.
