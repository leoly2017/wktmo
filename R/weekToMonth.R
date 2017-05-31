

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
#' @return a dataframe containing two column vectors: \code{yearMonth} and
#'   \code{value}.
#' @author You Li
#' @seealso dateFromWeek
#' @export
weekToMonth <- function(wkdata, year = NULL, wkIndex = NULL, wkMethod = "ISO",
                        datStart = NULL, format = "%d-%m-%Y") {
  # check input
  if (wkMethod != "ISO" & wkMethod != "epiSat" & wkMethod != "epiSun" &
      wkMethod != "epiMon" & wkMethod != "startDat") {
    warning("Please check the week method. Should be 'ISO', 'epiSat', 'epiSun',
'epiMon' or 'startDat'.")
    stop()
  }
  if (is.null(datStart)) {
    if (wkMethod == "startDat") {
      warning("Please input datStart.")
      stop()
    } else {
      if (class(year) != "numeric") {
        warning("Please check 'year'. Should be a numeric value")
        stop()
      }
      if (class(wkIndex) != "numeric") {
        warning("Please check 'wkIndex'. Should be a numeric value")
        stop()
      }
    }
  }
  if (is.numeric(wkdata) != TRUE) {
    warning("Please check wkdata. Should be a numeric vector")
    stop()
  }
  len <- length(wkdata)
  daydata <- rep(wkdata, each = 7)
  if (is.null(datStart)) {
    if (wkMethod == "epiSat" | wkMethod == "epiSun" | wkMethod == "epiMon") {
      dateSeq <- NULL
      if (wkIndex < 0.50 | wkIndex > 52.49) {
        warning("wkIndex should be between 1 and 52.")
        stop()
      }
      for (i in 1:len) {
        yearIndex <- floor((wkIndex - 1 + i - 1) / 52 )
        dateSeq <- c(dateSeq, dateFromWeek(wkMethod = wkMethod,
                                           year = year + yearIndex,
                                           wkIndex = wkIndex + i - 1 - yearIndex * 52 ))
      }
      dateSeq <- as.Date(dateSeq, origin = "1970-01-01")
    } else {
      dateSeqw1 <- dateFromWeek(wkMethod = wkMethod, year = year, wkIndex = wkIndex)
      dateSeq <- dateSeqw1[1] + 1:(7 * len) - 1
    }
  } else {
    dateSeqw1 <- as.Date(datStart, format = format)
    dateSeq <- dateSeqw1[1] + 1:(7 * len) -1
  }
  dfday <- data.frame(dateSeq, daydata)
  dfday$yearMonth = as.factor(paste(substr(dfday$dateSeq, 1, 4),
                              substr(dfday$dateSeq, 6, 7), sep = "-"))
  byRes <- by(dfday$daydata, dfday$yearMonth, sum)
  weekdata <- data.frame(yearMonth = attributes(byRes)$dimnames$`dfday$yearMonth`,
                         value = as.numeric(byRes))
  return(weekdata)
}
