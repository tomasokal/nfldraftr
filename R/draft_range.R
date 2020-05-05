#' draft_range
#' 
#' This is general function that scrapes the pro-football-reference website for the year that you specify.
#' Will return all of the draft picks of that year with round, pick number, team, name, position, age, and college.
#'
#' @param year 
#'
#' @importFrom data.table rbindlist
#'
#' @return
#' @export
#'
#' @examples draft_range(min = "2010", max = "2020")
draft_range <- function(min, max) {
  
  year_range <- list(seq(min:max))
  year_range <- lapply(year_range, function(x) {as.character(as.numeric(as.character(x)) - 1 + as.numeric(as.character(min)))})
  year_range <- as.list(unlist(year_range))
  dt_pages <- lapply(year_range, generate_tables)
  dt_pages <- data.table::rbindlist(dt_pages)
  
  return(dt_pages)
  
}