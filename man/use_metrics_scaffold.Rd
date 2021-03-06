% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/use-metrics-scaffold.R
\name{use_metrics_scaffold}
\alias{use_metrics_scaffold}
\title{Create a scaffold for documentating metrics}
\usage{
use_metrics_scaffold(tbl)
}
\arguments{
\item{tbl}{A wide metric tbl, including \code{date}, \code{period}, optionally one or
more dimensions, and one or more calculated metrics.}
}
\description{
Use this to generate a YAML scaffold for documenting metrics, just prior to running
\code{\link{create_metrics}}. You can place this into the header of an Rmd and
fill in the names and descriptions.
}
\examples{

library(dplyr)

flights <- nycflights13::flights \%>\%
  mutate(date = as.Date(ISOdate(year, month, day)))

# find flight delays by week, month, and quarter
flight_summary <- flights \%>\%
  cross_by_dimensions(origin) \%>\%
  cross_by_periods() \%>\%
  summarize(nb_flights = n(),
            avg_arr_delay = mean(arr_delay, na.rm = TRUE))

use_metrics_scaffold(flight_summary)

}
