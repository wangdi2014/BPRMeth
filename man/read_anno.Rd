% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_data.R
\name{read_anno}
\alias{read_anno}
\title{Read annotation file}
\usage{
read_anno(file, chrom_size_file = NULL, chr_discarded = NULL,
  is_centre = FALSE, is_window = TRUE, upstream = -5000,
  downstream = 5000, is_anno_region = TRUE, delimiter = "\\t")
}
\arguments{
\item{file}{File name.}

\item{chrom_size_file}{Optional file name to read genome chromosome sizes.}

\item{chr_discarded}{Optional vector with chromosomes to be discarded.}

\item{is_centre}{Logical, whether 'start' and 'end' locations are
pre-centred. If TRUE, the mean of the locations will be chosen as centre.
If FALSE, the 'start' will be chosen as the center; e.g. for genes the
'start' denotes the TSS and we use this as centre to obtain K-bp upstream
and downstream of TSS.}

\item{is_window}{Whether to consider a predefined window region around
centre. If TRUE, then 'upstream' and 'downstream' parameters are used,
otherwise we consider the whole region from start to end location.}

\item{upstream}{Integer defining the length of bp upstream of 'centre' for
creating the genomic region. If is_window = FALSE, this parameter is
ignored.}

\item{downstream}{Integer defining the length of bp downstream of 'centre'
for creating the genomic region. If is_window = FALSE, this parameter is
ignored.}

\item{is_anno_region}{Logical, whether or not to create genomic region. It
should be set to TRUE, if you want to use the object as input to
\code{\link{create_region_object}} function.}

\item{delimiter}{Delimiter format the columns are splitted. Default is tab.}
}
\value{
A \code{GRanges} object.

  The GRanges object contains two or three additional metadata columns:
  \itemize{ \item{ \code{id}: Feature ID, e.g. Ensembl IDs for each gene.}
  \item{ \code{centre}: The central (middle) location of the genomic region.
  This is required when transforming 'methylation regions' in the (-1, 1)
  interval, the 'centre' would be at 0.} \item{\code{name} (Optional) the
  feature name.} } These columns can be accessed as follows:
  \code{granges_obj$id}
}
\description{
\code{read_anno} reads a file containing annotation data, which
  will be used to select genomic regions of interest for downstream analysis.
  The annotation file format is the following: "chromosome", "start", "end",
  "strand", "id", "name" (optional). Read the Important section below for
  more details.
}
\section{Important}{
 \itemize{ \item{When having strand information, and we
  are in the antisense strand ("-"), the 'start' is automatically switched
  with the 'end' location.} \item{By default columns are considered in tab
  delimited format.} \item{ The "name" feature is optional.} \item{When there
  is no "strand" info, this can be set to "*".}}
}

\examples{
# Obtain the path to files
file <- system.file("extdata", "dummy_anno.bed", package = "BPRMeth")
anno_dt <- read_anno(file, chr_discarded = c("X"))

# Extract feature id
anno_ids <- anno_dt$id

}
\seealso{
\code{\link{read_met}}, \code{\link{create_anno_region}},
  \code{\link{create_region_object}}
}
\author{
C.A.Kapourani \email{C.A.Kapourani@ed.ac.uk}
}
