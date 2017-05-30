
#' Return the start and the end date of a particular week
#' @description This function returns the start and the end date of a particular week.
#'   The week can be defined by ISO week or epi week.
#' @param year a value for the year.
#' @param wkIndex a value for the week index of the year.
#' @param wkMethod a character string for the week-counting method.
#'   Default is "ISO" for ISO-week;
#'   other options are "epiSat", "epiSun" and "epiMon" for epi-week method
#'   defining Saturday, Sunday and Monday as the firstday in a week, respectively.
#' @return a vector of length 2, containing the start and the end date.
#' @author You Li
dateFromWeek <- function(year, wkIndex, wkMethod = "ISO") {
  if (wkMethod != "ISO" & wkMethod != "epiSat" & wkMethod != "epiSun" &
      wkMethod != "epiMon") {
    warning("Please check the week method")
    return(NULL)
  }
}

#' Convert weekly data to monthly data
#' @description This function converts weekly data to monthly data.
#'   The start week or date is needed along with the data. The start week can be
#'   defined by ISO week or epi week.
#' @param wkdata a numeric vector for weekly data to be converted.
#' @param year a value for the year of the start of the data.
#' @param wkIndex a value for the week index of the start of the data if a week-counting
#'   method is used.
#' @param wkMethod a character string for the week-counting methods.
#'   Default is "ISO" for ISO-week;
#'   other options are "epiSat", "epiSun" and "epiMon" for epi-week method
#'   defining Saturday, Sunday and Monday as the firstday in a week, respectively.
#'   In addition, users also have the option of specifying the start date of
#'   the data by "startDat" method.
#' @param datStart a character string for the start date of the data.
#'   If left blank, the date generated from the week-counting method will be applied.
#' @param format a character string specifying the input formate for \code{datStart}.
#' @return a dataframe containing three column vectors: \code{year}, \code{month} and
#'   \code{value}.
#' @author You Li
weekToMonth <- function(wkdata, year, wkIndex = NULL, wkMethod = "ISO", datStart = NULL,
                  format = "%d-%m-%Y") {
  if (wkMethod != "ISO" & wkMethod != "epiSat" & wkMethod != "epiSun" &
      wkMethod != "epiMon" & wkMethod != "startDat") {
    warning("Please check the week method")
    return(NULL)
  }
}
