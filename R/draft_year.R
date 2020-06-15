#' draft_year
#' 
#' This is general function that scrapes the pro-football-reference website for the year that you specify.
#' Will return all of the draft picks of that year with round, pick number, team, name, position, age, and college.
#'
#' @param year A year.
#'
#' @importFrom rvest html_table
#' @importFrom xml2 read_html
#'
#' @return All draft picks in provided year.
#' @export
#'
#' @examples draft_year(year = "2020")
#' 
draft_year <- function(year) {
  
  V1 <- V2 <- V3 <- V4 <- V5 <- V6 <- V13 <- NULL
  
  url <- paste0("https://www.pro-football-reference.com/years/", year, "/draft.htm")
  page <- rvest::html_table(xml2::read_html(url)
                            , header = TRUE
                            , fill = TRUE
                            )
  df_page <- data.frame(page[1])
  df_page$YEAR <- as.numeric(year)
  df_page_subset <- df_page[!df_page$Var.1 == "Rnd", c(30, 1, 2, 3, 4, 5, 6, 28, 7, 8, 9, 10, 13)]
  names(df_page_subset) <- c("YEAR", "ROUND", "OVERALL_PICK", "TEAM", "PLAYER", "POSITION", "AGE", "COLLEGE", "LAST_YEAR_PLAYED", "ALL_PROS", "PRO_BOWLS", "YEARS_STARTER", "GAMES_PLAYED")
  df_page_subset$ROUND <- as.numeric(df_page_subset$ROUND)
  df_page_subset$OVERALL_PICK <- as.numeric(df_page_subset$OVERALL_PICK)
  df_page_subset$AGE <- as.numeric(df_page_subset$AGE)
  df_page_subset$LAST_YEAR_PLAYED <- as.numeric(df_page_subset$LAST_YEAR_PLAYED)
  df_page_subset$ALL_PROS <- as.numeric(df_page_subset$ALL_PROS)
  df_page_subset$PRO_BOWLS <- as.numeric(df_page_subset$PRO_BOWLS)
  df_page_subset$YEARS_STARTER <- as.numeric(df_page_subset$YEARS_STARTER)
  df_page_subset$GAMES_PLAYED <- as.numeric(df_page_subset$GAMES_PLAYED)
  
  return(df_page_subset)
  
}
