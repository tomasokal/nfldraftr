
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nfldraftr

<!-- [![Travis build status](https://travis-ci.org/tomasokal/rtist.svg?branch=master)](https://travis-ci.org/tomasokal/rtist) -->

<!-- [![Dependencies](https://tinyverse.netlify.com/badge/rtist)](https://cran.r-project.org/package=rtist) -->

<!-- [![CRAN status](http://www.r-pkg.org/badges/version/rtist)](https://cran.r-project.org/package=rtist) -->

<!-- [![Downloads](http://cranlogs.r-pkg.org/badges/rtist?color=brightgreen)](http://www.r-pkg.org/pkg/rtist) -->

## Overview

Can use to pull historical draft data from [Pro Football
Reference](https://www.pro-football-reference.com/).

## Installation

Install from Github.

``` r
# Install remotes to download.
install.packages("remotes")

# And then install from github.
remotes::install_github("tomasokal/nfldraftr")
```

## Draft Years

`nfldraftr` provides historical draft data that can be accessed one year
at a time or through a range of years.

``` r
# Load package
library(nfldraftr)

# Draft data from 2020
draft2020 <- nfldraftr::draft_year(year = "2020")
head(draft2020) %>% 
  kable(row.names = FALSE) 
```

<table>

<thead>

<tr>

<th style="text-align:right;">

YEAR

</th>

<th style="text-align:right;">

ROUND

</th>

<th style="text-align:right;">

OVERALL\_PICK

</th>

<th style="text-align:left;">

TEAM

</th>

<th style="text-align:left;">

PLAYER

</th>

<th style="text-align:left;">

POSITION

</th>

<th style="text-align:right;">

AGE

</th>

<th style="text-align:left;">

COLLEGE

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

CIN

</td>

<td style="text-align:left;">

Joe Burrow

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

23

</td>

<td style="text-align:left;">

LSU

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:left;">

WAS

</td>

<td style="text-align:left;">

Chase Young

</td>

<td style="text-align:left;">

DE

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

Ohio St. 

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:left;">

DET

</td>

<td style="text-align:left;">

Jeff Okudah

</td>

<td style="text-align:left;">

CB

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

Ohio St. 

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

4

</td>

<td style="text-align:left;">

NYG

</td>

<td style="text-align:left;">

Andrew Thomas

</td>

<td style="text-align:left;">

OT

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

Georgia

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

5

</td>

<td style="text-align:left;">

MIA

</td>

<td style="text-align:left;">

Tua Tagovailoa

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

22

</td>

<td style="text-align:left;">

Alabama

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

6

</td>

<td style="text-align:left;">

LAC

</td>

<td style="text-align:left;">

Justin Herbert

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

22

</td>

<td style="text-align:left;">

Oregon

</td>

</tr>

</tbody>

</table>

``` r
# Draft data from 2020
df_draft_range <- nfldraftr::draft_range(min = "2015", max = "2020")
df_draft_range <- df_draft_range[order(df_draft_range$OVERALL_PICK), ]
head(df_draft_range) %>% 
  kable(row.names = FALSE) 
```

<table>

<thead>

<tr>

<th style="text-align:right;">

YEAR

</th>

<th style="text-align:right;">

ROUND

</th>

<th style="text-align:right;">

OVERALL\_PICK

</th>

<th style="text-align:left;">

TEAM

</th>

<th style="text-align:left;">

PLAYER

</th>

<th style="text-align:left;">

POSITION

</th>

<th style="text-align:right;">

AGE

</th>

<th style="text-align:left;">

COLLEGE

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

2015

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

TAM

</td>

<td style="text-align:left;">

Jameis Winston

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

Florida St. 

</td>

</tr>

<tr>

<td style="text-align:right;">

2016

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

LAR

</td>

<td style="text-align:left;">

Jared Goff

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

California

</td>

</tr>

<tr>

<td style="text-align:right;">

2017

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

CLE

</td>

<td style="text-align:left;">

Myles Garrett

</td>

<td style="text-align:left;">

DE

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

Texas A\&M

</td>

</tr>

<tr>

<td style="text-align:right;">

2018

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

CLE

</td>

<td style="text-align:left;">

Baker Mayfield

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

23

</td>

<td style="text-align:left;">

Oklahoma

</td>

</tr>

<tr>

<td style="text-align:right;">

2019

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

ARI

</td>

<td style="text-align:left;">

Kyler Murray

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

22

</td>

<td style="text-align:left;">

Oklahoma

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

CIN

</td>

<td style="text-align:left;">

Joe Burrow

</td>

<td style="text-align:left;">

QB

</td>

<td style="text-align:right;">

23

</td>

<td style="text-align:left;">

LSU

</td>

</tr>

</tbody>

</table>

Data is pulled in to feature draft year, pick round, overall pick
number, team, player, position, age, and college.

## Credits

All data is pulled from [Pro Football
Reference](https://www.pro-football-reference.com/). Accuracy of this
data is dependent on the source.
