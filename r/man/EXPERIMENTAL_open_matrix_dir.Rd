% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrix.R
\name{EXPERIMENTAL_open_matrix_dir}
\alias{EXPERIMENTAL_open_matrix_dir}
\title{Open experimental sparse-column format integer matrix}
\usage{
EXPERIMENTAL_open_matrix_dir(dir, buffer_size = 8192L)
}
\arguments{
\item{dir}{Directory to load data from}

\item{buffer_size}{For performance tuning only. The number of items to be buffered
in memory before calling writes to disk.}
}
\description{
The experimental sparse-column format is designed to handle storage of matrices
with many columns of all-zero, and less than 2^32-1 non-zero entries.
}
\keyword{internal}
