
<!-- README.md is generated from README.Rmd. Please edit that file -->
wktmo
=====

The goal of wktmo is to convert weekly data to monthly data.

Installation
------------

You can install wktmo from CRAN with:

``` r
install.packages("wktmo")
```

Example
-------

This is a basic example which shows you how to convert real-world weekly data to monthly data.

``` r
library(wktmo)
# extract data
data(weeklyFlu)
#'subset data of interest, e.g. to convert weekly influenza A cases in China
weeklyData <- weeklyFlu$fluA[weeklyFlu$country == "China"]
# convert weekly data to monthly data;
# these two input methods below will return the same results.
# input 1: the start year and wkIndex
monthlyData <- weekToMonth(weeklyData, year = 2010, wkIndex = 1, wkMethod = "ISO")
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
