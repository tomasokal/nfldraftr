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
  dt_page <- data.table::data.table(page[[1]])[!V1 == "Rnd", .(V1, V2, V3, V4, V5, V6, V13)]
  setnames(dt_page, colnames(dt_page), c("ROUND", "OVERALL_PICK", "TEAM", "PLAYER", "POSITION", "AGE", "COLLEGE"))
  
  return(dt_page)
  
}