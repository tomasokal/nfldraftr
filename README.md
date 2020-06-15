
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nfldraftr

<!-- badges: start -->

[![R build
status](https://github.com/tomasokal/nfldraftr/workflows/R-CMD-check/badge.svg)](https://github.com/tomasokal/nfldraftr/actions)
<!-- badges: end -->

## Overview

Can use to pull historical draft data from [Pro Football
Reference](https://www.pro-football-reference.com/).

`nfldraftr` currently provides the following information:

  - YEAR: Year drafted
  - ROUND: Round drafted
  - OVERALL\_PICK: Overall pick in draft
  - TEAM: Name of team drafted by
  - PLAYER: Name of player
  - POSITION: Position drafted for
  - AGE: Age when drafted
  - COLLEGE: Name of college
  - LAST\_YEAR\_PLAYED: Last year played in NFL
  - ALL\_PROS: Number of First Team ALL-PRO selections
  - PRO\_BOWLS: Number of Pro-Bowl selections
  - YEARS\_STARTED: Number of years as primary starter for his team at
    his position
  - GAMES\_PLAYED: Games played in NFL

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
head(draft2020[, 1:8]) %>% 
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
head(df_draft_range[, c(1, 3, 4, 5, 6, 12, 13)]) %>% 
  kable(row.names = FALSE) 
```

<table>

<thead>

<tr>

<th style="text-align:right;">

YEAR

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

YEARS\_STARTER

</th>

<th style="text-align:right;">

GAMES\_PLAYED

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

5

</td>

<td style="text-align:right;">

72

</td>

</tr>

<tr>

<td style="text-align:right;">

2016

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

4

</td>

<td style="text-align:right;">

54

</td>

</tr>

<tr>

<td style="text-align:right;">

2017

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

3

</td>

<td style="text-align:right;">

37

</td>

</tr>

<tr>

<td style="text-align:right;">

2018

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

2

</td>

<td style="text-align:right;">

30

</td>

</tr>

<tr>

<td style="text-align:right;">

2019

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

1

</td>

<td style="text-align:right;">

16

</td>

</tr>

<tr>

<td style="text-align:right;">

2020

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

0

</td>

<td style="text-align:right;">

NA

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
