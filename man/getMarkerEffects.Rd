% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getMarkerEffects.R
\name{getMarkerEffects}
\alias{getMarkerEffects}
\title{Get marker effect sizes}
\usage{
getMarkerEffects(x, prefix = "logFC", strip = TRUE, remove.na.col = FALSE)
}
\arguments{
\item{x}{A \linkS4class{DataFrame} containing marker statistics for a given group/cluster,
usually one element of the List returned by \code{\link{findMarkers}}.}

\item{prefix}{String containing the prefix for the columns containing the effect size.}

\item{strip}{Logical scalar indicating whether the prefix should be removed from the output column names.}

\item{remove.na.col}{Logical scalar indicating whether to remove columns containing any \code{NA}s.}
}
\value{
A numeric matrix containing the effect sizes for the comparison to every other group/cluster.
}
\description{
Utility function to extract the marker effect sizes as a matrix from the output of \code{\link{findMarkers}}.
}
\details{
Setting \code{remove.na.col=TRUE} may be desirable in applications involving blocked comparisons,
where some pairwise comparisons are not possible if the relevant levels occur in different blocks.
In such cases, the resulting column is filled with \code{NA}s that may interfere with downstream steps like clustering.
}
\examples{
library(scuttle)
sce <- mockSCE()
sce <- logNormCounts(sce)
                                                                     
kout <- kmeans(t(logcounts(sce)), centers=4) 
out <- findMarkers(sce, groups=kout$cluster)

eff1 <- getMarkerEffects(out[[1]])
str(eff1)

}
\seealso{
\code{\link{findMarkers}} and \code{\link{combineMarkers}}, to generate the DataFrames.
}
\author{
Aaron Lun
}
