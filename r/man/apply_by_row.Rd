% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrix.R
\name{apply_by_row}
\alias{apply_by_row}
\alias{apply_by_col}
\title{Apply a function to summarize rows/cols}
\usage{
apply_by_row(mat, fun, ...)

apply_by_col(mat, fun, ...)
}
\arguments{
\item{mat}{IterableMatrix object}

\item{fun}{\verb{function(val, row, col)} that takes in a row/col of values and returns a summary output. Argument details:
\enumerate{
\item \code{val} - Vector length (# non-zero values) with the value for each non-zero matrix entry
\item \code{row} - one-based row index (\code{apply_by_col}: vector length (# non-zero values), \code{apply_by_row}: single integer)
\item \code{col} - one-based col index (\code{apply_by_col}: single integer, \code{apply_by_row}: vector length (# non-zero values))
\item \code{...} - Optional additional arguments (should not be named row, col, or val)
}}

\item{...}{Optional additional arguments passed to \code{fun}}
}
\value{
\strong{apply_by_row} - A list of length \code{nrow(matrix)} with the results returned by \code{fun()} on each row

\strong{apply_by_col} - A list of length \code{ncol(matrix)} with the results returned by \code{fun()} on each row
}
\description{
Apply a custom R function to each row/col of a BPCells matrix. This
will run slower than the builtin C++-backed functions, but will
keep most of the memory benefits from disk-backed operations.
}
\details{
These functions require row-major matrix storage for apply_by_row and col-major storage for apply_by_col,
so matrices stored in the wrong order may neeed a re-ordered copy created using \code{transpose_storage_order()} first.
This is required to be able to keep memory-usage low and allow calculating the result with a single streaming pass of the
input matrix.

If vector/matrix outputs are desired instead of lists, calling \code{unlist(x)} or \code{do.call(cbind, x)} or \code{do.call(rbind, x)}
can convert the list output.
}
\seealso{
For an interface more similar to \code{base::apply}, see the \href{https://github.com/Yunuuuu/BPCellsArray/}{BPCellsArray}
project. For calculating colMeans on a sparse single cell RNA matrix it is about 8x slower than \code{apply_by_col}, due to the
\code{base::apply} interface not being sparsity-aware. (See \href{https://github.com/bnprks/BPCells/pull/104}{pull request #104} for benchmarking.)
}
