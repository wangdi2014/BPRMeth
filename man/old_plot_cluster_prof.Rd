% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprecated_functions.R
\name{old_plot_cluster_prof}
\alias{old_plot_cluster_prof}
\title{(DEPRECATED) Plot of clustered methylation profiles}
\usage{
old_plot_cluster_prof(bpr_cluster_obj,
  main_lab = "Clustered methylation profiles")
}
\arguments{
\item{bpr_cluster_obj}{The output of the \code{bpr_cluster_wrap} function.}

\item{main_lab}{The title of the plot}
}
\value{
The figure to be plotted in the device.
}
\description{
(DEPRECATED) \code{plot_cluster_prof} creates a plot of cluster
  methylation profiles, where each colour denotes a different cluster.
}
\examples{
# Cluster methylation profiles using 4 RBFs
obs <- meth_data
basis <- create_rbf_object(M = 4)
res   <- bpr_cluster_wrap(x = obs, K = 3, em_max_iter = 2, opt_itnmax = 3,
                          init_opt_itnmax = 2, is_parallel = FALSE)

# Create the plot
old_plot_cluster_prof(bpr_cluster_obj = res)

}
\seealso{
\code{\link{old_plot_fitted_profiles}},
  \code{\link{old_boxplot_cluster_gex}}
}
\author{
C.A.Kapourani \email{C.A.Kapourani@ed.ac.uk}
}
