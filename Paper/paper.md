---
title: 'wktmo: Converting Weekly Data to Monthly Data'
authors:
- affiliation: 1
  name: You Li
  orcid: 0000-0002-8506-8439
date: "4 Jun 2017"
output:
  pdf_document: default
bibliography: paper.bib
tags:
- example
- tags
- for the paper
affiliations:
- index: 1
  name: Centre for Global Health Research, Usher Institute of Population Health Sciences and Informatics, The University of Edinburgh
---

# Summary

Researchers working with weekly time series data often have the need to convert the data from weekly basis to monthly basis. However, it is challenging to allocate weeks to months since the dates of weeks are not fixed in different calendar years, especially when a week has dates in two months.

The goal of wktmo is to convert weekly data to monthly data. For weeks that have dates in two months, the input value will be allocated evenly to the the dates. For example, if a week contains four days in January and three days in February, then four sevenths will be aggregated into January and three sevens will be aggregated into February. For weekly data, three types of week formats are accepted: ISO week, epi week (also referred to as CDC week) and calendar date. Additionally, three types of firstday of epi week are accepted: Sunday, Monday and Saturday. 

As a real-world example, wktmo includes a dataset derived from FluNet [@FluNet], weeklyFlu. weeklyFlu is a dataset containing weekly influenza cases, including influenza A, influenza B and influenza A+B, in 18 countries during 2010-2015. wktmo also contains a useful function that returns calendar dates from ISO week and epi week.

# References
