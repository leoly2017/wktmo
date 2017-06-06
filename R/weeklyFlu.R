#' Weekly influenza cases in 18 countries, 2010-2015
#'
#' A dataset containing weekly influenza cases, including influenza A, influenza B
#'   and influenza A+B, in 18 countries during 2010-2015. Data are from FluNet,
#'   a global web-based tool for influenza virological surveillance.
#'
#' @format a data frame containing 5616 rows and 10 variables.
#' \describe{
#'   \item{country}{country: Argentina, Australia, Brazil, Chile, China, Egypt,
#'   Germany, Ghana, Indonesia, Iran, Japan, Mongolia, Niger, Peru, Singapore,
#'   Thailand, Tanzania, Zambia}
#'   \item{whoRegion}{WHO region}
#'   \item{fluRegion}{influenza region}
#'   \item{year}{year of data}
#'   \item{isoWeek}{index of ISO week}
#'   \item{startDat}{start date of the week}
#'   \item{endDat}{end date of the week}
#'   \item{fluA}{number of influenza A cases}
#'   \item{fluB}{number of influenza B cases}
#'   \item{fluAll}{number of influenza A+B cases}
#' }
#' @source \url{http://www.who.int/influenza/gisrs_laboratory/flunet/en/}
"weeklyFlu"
