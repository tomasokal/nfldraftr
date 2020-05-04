#' generate_table
#' 
#' This is general function that scrapes the pro-football-reference website for the year that you specify.
#' Will return all of the draft picks of that year with round, pick number, team, name, position, age, and college.
#'
#' @param year 
#'
#' @importFrom rvest html_table
#' @importFrom xml2 read_html
#' @import data.table
#'
#' @return
#' @export
#'
#' @examples generate_table(2020)
generate_tables <- function(year) {
  
  url <- paste0("https://www.pro-football-reference.com/years/", year, "/draft.htm")
  
  page <- rvest::html_table(xml2::read_html(url), header = TRUE, fill = TRUE)
  dt_page <- data.table::data.table(page[[1]])[!V1 == "Rnd", .(YEAR = as.numeric(year), 
                                                               ROUND = as.numeric(V1), 
                                                               OVERALL_PICK = as.numeric(V2), 
                                                               TEAM = V3, 
                                                               PLAYER = V4, 
                                                               POSITION = V5, 
                                                               AGE = as.numeric(V6), 
                                                               COLLEGE = V13
                                                               )
                                               ]
  
  
  return(dt_page)
  
}

generate_tables("2012")

draft_picks <- function(min, max) {
  
  year_range <- list(seq(min:max))
  year_range <- lapply(year_range, function(x) {as.character(as.numeric(as.character(x)) - 1 + as.numeric(as.character(min)))})
  year_range <- as.list(unlist(year_range))
  
  dt_pages <- lapply(year_range, generate_tables)
  
  dt_pages <- data.table::rbindlist(dt_pages)
  
  return(dt_pages)
  
}

also_check <- draft_picks("2010", "2020")

check <- list("2010", "2011")
lapply(check, generate_tables)
