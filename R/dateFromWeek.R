
#' Return the dates of a particular week
#' @description Returns the dates of a particular week.
#'   The week can be defined by ISO week or epi week.
#' @param year a value for the year.
#' @param wkIndex a value for the week index of the year.
#' @param wkMethod a character string for the week-counting method.
#'   Default is "ISO" for ISO-week;
#'   other options are "epiSat", "epiSun" and "epiMon" for epi-week method
#'   defining Saturday, Sunday and Monday as the firstday in a week, respectively.
#' @return a vector of length 7, containing all the dates in the week, with the format
#'   of yyyy-mm-dd.
#' @author You Li
#' @examples
#' dateFromWeek(year = 2000, wkIndex = 20)
#' dateFromWeek(year = 2009, wkIndex = 53)
#' dateFromWeek(year = 2015, wkIndex = 1, wkMethod = "epiSun")
#' @seealso weekToMonth
#' @export
dateFromWeek <- function(year, wkIndex, wkMethod = "ISO") {
  # check input
  if (wkMethod != "ISO" & wkMethod != "epiSat" & wkMethod != "epiSun" &
      wkMethod != "epiMon") {
    warning("Please check the week method. Should be 'ISO', 'epiSat', 'epiSun' or
'epiMon'.")
    stop()
  }
  if (class(year) != "numeric") {
    warning("Please check 'year'. Should be a numeric value")
    stop()
  }
  if (class(wkIndex) != "numeric") {
    warning("Please check 'wkIndex'. Should be a numeric value")
    stop()
  }
  if (wkMethod != "ISO") {
    if (wkIndex < 0.50 | wkIndex > 52.49) {
      warning("wkIndex should be between 1 and 52.")
      stop()
    }
  } else {
    if (wkIndex <0.50 | wkIndex > 53.49) {
      warning("wkIndex should be between 1 and 53.")
    }
  }
  # wkIndex for ISO will be checked later
  year <- round(year[1],0); wkIndex = round(wkIndex[1],0)
  day1 <- strptime(paste(1, 1, year, sep = "-"), format = "%d-%m-%Y")
  day1w <- day1$wday
  dayStep <- 0
  if (wkMethod == "ISO") {
    if (day1w == 1 | day1w == 2 | day1w == 3 | day1w == 4) {
      dayStep <- 1 - day1w
    } else {
      if (day1w == 0) {
        dayStep <- 1
      } else {
        dayStep <- 8 - day1w
      }
    }
    w1 <- day1 + dayStep * 86400
    # check if there is week 53 for the given year
    w53d4 <- w1 + 86400 * 52 * 7 + 3 * 86400
    if (wkIndex == 53) {
      if (as.numeric(substr(w53d4, 1, 4)) != year) {
        warning("This year doesn't have week 53.")
        stop()
      }
    }
  }
  if (wkMethod == "epiSat") {
    if (day1w == 0 | day1w == 1 | day1w == 2) {
      dayStep <- -1 - day1w
    }
    if (day1w == 3 | day1w == 4 | day1w == 5) {
      dayStep <- 6 - day1w
    }
  }
  if (wkMethod == "epiSun") {
    if (day1w == 0 | day1w == 1 | day1w == 2) {
      dayStep <- -day1w
    } else {
      dayStep <- 7 - day1w
    }
  }
  if (wkMethod == "epiMon") {
    if (day1w == 1 | day1w == 2 | day1w == 3 | day1w == 4) {
      dayStep <- 1 - day1w
    } else {
      if (day1w == 0) {
        dayStep <- 1
      } else {
        dayStep <- 8 - day1w
      }
    }
  }
  w1 <- day1 + dayStep * 86400
  wxd1 <- w1 + 86400 * 7 * (wkIndex - 1)
  return(as.Date(wxd1 + 86400 * (0:6)))
}
