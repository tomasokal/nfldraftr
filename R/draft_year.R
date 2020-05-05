#' draft_year
#' 
#' This is general function that scrapes the pro-football-reference website for the year that you specify.
#' Will return all of the draft picks of that year with round, pick number, team, name, position, age, and college.
#'
#' @param year A year.
#'
#' @importFrom rvest html_table
#' @importFrom xml2 read_html
#' @import data.table
#'
#' @return All draft picks provided year.
#' @export
#'
#' @examples draft_year(year = "2020")
draft_year <- function(year) {
  
  V1 <- V2 <- V3 <- V4 <- V5 <- V6 <- V13 <- NULL
  
  url <- paste0("https://www.pro-football-reference.com/years/", year, "/draft.htm")
  page <- rvest::html_table(xml2::read_html(url)
                            , header = TRUE
                            , fill = TRUE
                            )
  dt_page <- data.table::data.table(page[[1]])[!V1 == "Rnd"
                                               , list(YEAR = as.numeric(year)
                                                      , ROUND = as.numeric(V1)
                                                      , OVERALL_PICK = as.numeric(V2)
                                                      , TEAM = V3
                                                      , PLAYER = V4
                                                      , POSITION = V5
                                                      , AGE = as.numeric(V6)
                                                      , COLLEGE = V13
                                                      )
                                               ]
  
  
  return(dt_page)
  
}